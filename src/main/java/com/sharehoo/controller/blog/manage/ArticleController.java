package com.sharehoo.controller.blog.manage;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.sharehoo.base.exception.UserException;
import com.sharehoo.config.RedisLock;
import com.sharehoo.config.RedisUtil;
import com.sharehoo.config.SessionUtil;
import com.sharehoo.config.annotation.HasLogin;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sharehoo.config.lang.Consts;
import com.sharehoo.entity.blog.Tag;
import com.sharehoo.entity.forum.Article;
import com.sharehoo.entity.forum.Critique;
import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.forum.User;
import com.sharehoo.service.blog.TagService;
import com.sharehoo.service.forum.ArticleService;
import com.sharehoo.service.forum.CritiqueService;
import com.sharehoo.service.forum.UserService;
import com.sharehoo.util.BootPathUtil;
import com.sharehoo.util.forum.DateUtil;
import com.sharehoo.util.forum.E3Result;
import com.sharehoo.util.forum.PageUtil;
import com.sharehoo.util.forum.StringUtil;

@Controller
public class ArticleController {
	@Autowired
	private ArticleService articleService;
	@Autowired
	private UserService userService;
	@Autowired
	private CritiqueService critiqueService;
	@Autowired
	private TagService tagService;

	@Resource
	private RedisUtil redisUtil;
	@Resource
	private RedisLock redisLock;

	private static final String ARTICLE_PREFIX = "lock:article:";
	private static final int TIMEOUT = 5 * 1000;


	/*
	 * 前台用户文章保存方法  2017.04.25
	 */
	@RequestMapping(value="blog/manage/article/save",method= RequestMethod.POST)
	@ResponseBody
	public E3Result save(HttpServletRequest request,@RequestParam(value="articleImage",required=false) MultipartFile articleImage,@RequestParam(value="faceFileName",required=false) String faceFileName,
			Article article){

		User user = SessionUtil.getUser();
		if(user==null) {
			return E3Result.build(401, "请登录后再发表...");
		}

		checkPublishLimit();
		try {
			if (articleImage!=null && articleImage.getSize()>0) {
				//获取项目的static根路径  
		    	String staticPath = BootPathUtil.getStaticPath();
		    	faceFileName = articleImage.getOriginalFilename();
		    	
				String imageName=DateUtil.getCurrentDateStr();
				String realPath = staticPath +"/image_upload/article/"+Consts.SDF_YYYYMM.format(new Date()); 
				String imageFile=imageName+"."+faceFileName.split("\\.")[1];
				
				File savePath=new File(realPath);
				if(!savePath.exists()) {
					savePath.mkdirs();
				}		
				InputStream is = articleImage.getInputStream();    	    
		          
		        File toFile = new File(realPath, imageFile);    
		        OutputStream os = new FileOutputStream(toFile);       
		        byte[] buffer = new byte[1024];       
		        int length = 0;    
		        while ((length = is.read(buffer)) > 0) {       
		            os.write(buffer, 0, length);       
		        }       
		        is.close();    
		        os.close();
				
				article.setImage("image_upload/article/"+Consts.SDF_YYYYMM.format(new Date())+"/"+imageFile);//原来为"images/user/"   2016.10.12
			}else{
				article.setImage("images/article/timg1.jpg");
			}
			if(article.getNotice().equals("1")){
				article.setNotice("recommendArticles");
			}else{
				article.setNotice("");
			}
			article.setCount(0);
			article.setCount1(0);
			article.setTime(new Date());
			articleService.saveArticle(article);
			
			user.setScore(user.getScore()+3);
			userService.saveUser(user);
		} catch (Exception e) {
			return E3Result.build(401, "文章发表失败", e.getMessage());
		}

		return E3Result.ok();
	}


	public void checkPublishLimit() {
		Integer userId = SessionUtil.getUser().getId();
		Object publicCount = redisUtil.get(ARTICLE_PREFIX + userId);
		long time = System.currentTimeMillis() + TIMEOUT;

		if (ObjectUtils.isEmpty(publicCount)) {
			//上锁
			if (!redisLock.lock(userId.toString(), String.valueOf(time))) {
				//获取锁失败，不执行操作
				throw new UserException(402, "发布失败，请稍后重试...");
			}
			redisUtil.set(ARTICLE_PREFIX + userId, "1");
			return;
		}

		//获取发布的数量
		int count = Integer.parseInt(String.valueOf(publicCount));
		Long expire = redisUtil.getExpire(ARTICLE_PREFIX + userId);
		//没过期，且发布数量超过5
		if (expire > -1 && count > 3) {
			throw new UserException(403, "狗东西，操你老婆，再搞我网站出门被车撞死，你儿子生了没鸡巴，你女儿代代为奴，为鸡被操；你老婆天天被野男人搞，赶紧去验dna吧，看看你孩子是不是百家姓干出来的");
		}

		//上锁
		if (!redisLock.lock(userId.toString(), String.valueOf(time))) {
			//获取锁失败，不执行操作
			throw new UserException(402, "操作太频繁，发布失败，请稍后重试...");
		}

		//更新发布数量
		redisUtil.setEx(ARTICLE_PREFIX + userId, count + 1, 1, TimeUnit.DAYS);
		if (expire <= -1) {
			redisUtil.setEx(ARTICLE_PREFIX + userId, 1, 1, TimeUnit.DAYS);
		}

		//释放锁
		redisLock.release(userId.toString(), String.valueOf(time));
		//logger.info("####### 释放锁成功....");
	}
	
	/*
	 * 前台文章的删除方法 2017.04.25
	 * 存在文章评论则提示删除评论	2017.06.20
	 */
	@RequestMapping("blog/manage/article/delete")
	@ResponseBody
	public E3Result delete(@RequestParam("articleId")int articleId,Model model,HttpServletRequest request)throws Exception{

		SessionUtil.getUser();

		if(articleId>0){
		Article article=articleService.getArticleById(articleId);
		List<Critique> replyList=critiqueService.getArticleCritiquesByAid(articleId);
		if(replyList.size()>0){
			return E3Result.build(401, "删除失败，请先删除文章的评论信息..");
		}
		articleService.deleteArticle(article);	
		}
		return E3Result.ok();
	}
	
	/*
	 * miki
	 * 2017.05.17
	 * 根据用户id得到文章列表
	 */
	@HasLogin
	@RequestMapping("blog/manage/article/list")
	public String list(HttpServletRequest request,@RequestParam(value="page",required=false) String page,Model model)throws Exception{

		User user = SessionUtil.getUser();

		model.addAttribute("user", user);
		if (StringUtil.isEmpty(page)) {
			page="1";
		}
		long total=articleService.getArticleCountByUserId(user.getId());
		PageBean pageBean=new PageBean(Integer.parseInt(page),9);
		List<Article> articleList=articleService.getArticleListByUserId(user.getId(),pageBean);
		model.addAttribute("articleList", articleList);
		List<Article> recommendList=articleService.getRecommendsByUserId(user.getId());
		model.addAttribute("recommendList", recommendList);
		List<Article> countList=articleService.getHotByUserId(user.getId());
		model.addAttribute("countList", countList);
		List<Critique> critiques=critiqueService.getListByUserId(user.getId());
		model.addAttribute("critiques", critiques);
		Article article=articleService.getArticleById(20);
		model.addAttribute("article", article);
		
		Tag tag = tagService.getTagByUserId(user.getId());
		if(tag!=null) {
			String[] tags = tag.getContent().split(" ");
			model.addAttribute("tags", tags);
		}	
		
		StringBuffer param=new StringBuffer();
		if (user.getId()>0) {
			param.append("userId="+user.getId());
		}		
		String pageCode=PageUtil.genPagination(request.getContextPath()+"/blog/manage/article/list", total, Integer.parseInt(page), 9,param.toString());
		model.addAttribute("pageCode", pageCode);
		return "blog/manage/article_manage";
	}
	
	/*
	 * miki
	 * 2017.05.24
	 * 根据用户Id添加博客
	 */
	@HasLogin
	@RequestMapping("blog/manage/article/go")
	public String add(HttpServletRequest request,Model model)throws Exception{

		User user = SessionUtil.getUser();
		model.addAttribute("user", user);
		
		Tag tag = tagService.getTagByUserId(user.getId());
		if(tag!=null) {
			String[] tags = tag.getContent().split(" ");
			model.addAttribute("tags", tags);
		}	
		return "blog/manage/article_add";
	}
	
	/*
	 * miki
	 * 2017.05.24
	 * 根据文章id更新文章
	 */
	@HasLogin
	@RequestMapping("blog/manage/article/preview")
	public String update(HttpServletRequest request,Model model,@RequestParam("articleId") int articleId)throws Exception{

		User user = SessionUtil.getUser();
		model.addAttribute("user", user);
		if(articleId>0){
			Article article=articleService.getArticleById(articleId);
			model.addAttribute("article", article);
		}
		
		Tag tag = tagService.getTagByUserId(user.getId());
		if(tag!=null) {
			String[] tags = tag.getContent().split(" ");
			model.addAttribute("tags", tags);
		}	
		return "blog/manage/article_update";
	}


	@RequestMapping("blog/manage/article/update")
	@ResponseBody
	public E3Result modify(HttpServletRequest request,@RequestParam(value="articleImage",required=false) MultipartFile image,@RequestParam(value="faceFileName",required=false) String faceFileName,
			Article article){
		//进行登录验证，没登录会抛出异常	2020.12.07 miki
		SessionUtil.getUser();

		checkPublishLimit();

		if(null!=article){
			Article updateArticle=articleService.getArticleById(article.getId());
			
			try {
				if (image!=null && image.getSize()>0) {
					//获取项目的static根路径  
			    	String staticPath = BootPathUtil.getStaticPath();
			    	faceFileName = image.getOriginalFilename();
			    	
					String imageName=DateUtil.getCurrentDateStr();
					String realPath = staticPath +"/images/article/"+Consts.SDF_YYYYMM.format(new Date()); 
					String imageFile=imageName+"."+faceFileName.split("\\.")[1];
					
					File savePath=new File(realPath);
					if(!savePath.exists()) {
						savePath.mkdirs();
					}		
					InputStream is = image.getInputStream();    	    
			          
			        File toFile = new File(realPath, imageFile);    
			        OutputStream os = new FileOutputStream(toFile);       
			        byte[] buffer = new byte[1024];       
			        int length = 0;    
			        while ((length = is.read(buffer)) > 0) {       
			            os.write(buffer, 0, length);       
			        }       
			        is.close();    
			        os.close();
					
					article.setImage("images/article/"+Consts.SDF_YYYYMM.format(new Date())+"/"+imageFile);//原来为"images/user/"   2016.10.12
				}else{
					if(!StringUtils.isNotEmpty(article.getImage())){
						article.setImage(updateArticle.getImage());
					}
				}
				
				if(!StringUtils.isNotEmpty(article.getTitle())){
					article.setTitle(updateArticle.getTitle());
				}
				if(null==article.getTime()){
					article.setTime(updateArticle.getTime());
				}
				if(!StringUtils.isNotEmpty(article.getContent())){
					article.setContent(updateArticle.getContent());
				}
				if(!StringUtils.isNotEmpty(article.getEditer())){
					article.setEditer(updateArticle.getEditer());
				}
				if(!StringUtils.isNotEmpty(article.getKeywords())){
					article.setKeywords(updateArticle.getKeywords());
				}
				if(!StringUtils.isNotEmpty(article.getType())){
					article.setType(updateArticle.getType());
				}
				article.setCount(updateArticle.getCount());
				article.setTime(new Date());
				
				if(null==article.getUser()){
					article.setUser(updateArticle.getUser());
				}
				article.setId(updateArticle.getId());
				articleService.saveArticle(article);
			} catch (Exception e) {
				return E3Result.build(401, "文章修改失败...",e.getMessage());
			}
		}
		return E3Result.ok();
	}
	/*
	 * miki
	 * 2017.05.25
	 * 设为推荐文章
	 */
	@RequestMapping("blog/manage/article/recommend")
	@ResponseBody
	public E3Result recommend(@RequestParam("articleId")int articleId,HttpServletRequest request)throws Exception{

		//进行登录验证，没登录会抛出异常	2020.12.07 miki
		SessionUtil.getUser();
		if(articleId>0){
			Article article=articleService.getArticleById(articleId);
			article.setNotice("recommendArticles");
			articleService.saveArticle(article);
		}
		return E3Result.ok();
	}
	
	
	/*
	 * miki
	 * 2017.05.25
	 * 取消推荐文章
	 */
	@RequestMapping("blog/manage/article/unRecommend")
	@ResponseBody
	public E3Result unRecommend(@RequestParam("articleId")int articleId,Model model,HttpServletRequest request)throws Exception{

		//进行登录验证，没登录会抛出异常	2020.12.07 miki
		SessionUtil.getUser();
		if(articleId>0){
			Article article=articleService.getArticleById(articleId);
			article.setNotice("recommendArticles");
			articleService.saveArticle(article);
		}
		return E3Result.ok();
	}
	
	/*
	 */
	@HasLogin
	@RequestMapping("blog/manage/article/details")
	public String detail(@RequestParam("id")int id,Model model,HttpServletRequest request)throws Exception{

		if(id>0){
			Article article=articleService.getArticleById(id);
			model.addAttribute("article", article);
			User user=article.getUser();
			model.addAttribute("user", user);
			List<Article> recommendList=articleService.getRecommendsByUserId(article.getUser().getId());
			model.addAttribute("recommendList", recommendList);
			List<Article> countList=articleService.getHotByUserId(article.getUser().getId());
			model.addAttribute("countList", countList);
			Article before=articleService.getBefore(id, article.getUser().getId());	//用户Id
			model.addAttribute("before", before);
			Article next=articleService.getAfter(id, article.getUser().getId());
			model.addAttribute("next", next);
			List<Critique> critiques=critiqueService.getArticleCritiquesByAid(id);
			model.addAttribute("critiques", critiques);
			List<Critique> replyList=critiqueService.getReplyListByAid(id);
			model.addAttribute("replyList", replyList);
		}
		return "blog/manage/article_detail_manage";
	}
	
}
