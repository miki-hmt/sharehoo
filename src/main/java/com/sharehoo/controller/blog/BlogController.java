package com.sharehoo.controller.blog;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sharehoo.entity.blog.Tag;
import com.sharehoo.entity.forum.Article;
import com.sharehoo.entity.forum.Critique;
import com.sharehoo.entity.forum.Me;
import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.forum.User;
import com.sharehoo.service.blog.TagService;
import com.sharehoo.service.forum.ArticleService;
import com.sharehoo.service.forum.CritiqueService;
import com.sharehoo.service.forum.MeService;
import com.sharehoo.service.forum.UserService;
import com.sharehoo.util.forum.PageUtil;
import com.sharehoo.util.forum.StringUtil;

@Controller
public class BlogController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private ArticleService articleService;
	@Autowired
	private CritiqueService critiqueService;
	@Autowired
	private MeService meService;
	@Autowired
	private TagService tagService;
	/*
	 * miki
	 * 2017.06.01
	 * 前台显示主页内容
	 */
	@RequestMapping("/blog/{nicknameId}")
	public String show(@PathVariable("nicknameId") String nicknameId,@RequestParam(value="page",required=false) String page,Model model,HttpServletRequest request)throws Exception{
		
			User user=userService.getUserByNickNameId(nicknameId);
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
			StringBuffer param=new StringBuffer();
			if (user.getId()>0) {
				param.append("userId="+user.getId());
			}		
			String pageCode=PageUtil.genPagination(request.getContextPath()+"/blog/"+nicknameId, total, Integer.parseInt(page), 9,param.toString());
			model.addAttribute("pageCode", pageCode);
		return "blog/index";
	}
	
	/*
	 * miki
	 * 2017.06.01
	 * 得到前台自我介绍
	 */
	@RequestMapping("/blog/{nicknameId}/about")
	public String about(@PathVariable("nicknameId") String nicknameId,Model model)throws Exception{
		if(StringUtil.isNotEmpty(nicknameId)){
			User user=userService.getUserByNickNameId(nicknameId);
			model.addAttribute("user", user);
			List<Me> aboutList=meService.getMeListByUserId(user.getId(), null);
			model.addAttribute("aboutList", aboutList);
		}
		return "blog/about";
	}
	
	/*
	 * miki
	 * 2017.06.02
	 * 慢生活版块
	 */
	@RequestMapping("/blog/{nicknameId}/article")
	public String article(@PathVariable("nicknameId") String nicknameId,Model model,@RequestParam(value="page",required=false) String page,HttpServletRequest request)throws Exception{
		if(StringUtil.isNotEmpty(nicknameId)){
			User user=userService.getUserByNickNameId(nicknameId);
			model.addAttribute("user", user);
			if (StringUtil.isEmpty(page)) {
				page="1";
			}
			List<Article> recommendList=articleService.getRecommendsByUserId(user.getId());
			model.addAttribute("recommendList", recommendList);
			List<Article> countList=articleService.getHotByUserId(user.getId());
			model.addAttribute("countList", countList);
			PageBean pageBean=new PageBean(Integer.parseInt(page), 6);
			List<Article> articleList=articleService.getArticleListByUserId(user.getId(),pageBean);
			model.addAttribute("articleList", articleList);
			
			Tag tag = tagService.getTagByUserId(user.getId());
			if(null!=tag) {
				String[] split = tag.getContent().split(" ");
				model.addAttribute("tags", split);
			}
			
			long total=articleService.getArticleCountByUserId(user.getId());
			StringBuffer param=new StringBuffer();
			if (StringUtil.isNotEmpty(nicknameId)) {
				param.append("nicknameId="+nicknameId);
			}			
			String pageCode=PageUtil.genPagination(request.getContextPath()+"/blog/"+nicknameId+"/article", total, Integer.parseInt(page), 6,param.toString());
			model.addAttribute("pageCode", pageCode);
		}
		return "blog/article";
	}
	
	/*
	 * miki
	 * 2017.06.02
	 * 慢生活分类版块
	 */
	@RequestMapping("/blog/{nicknameId}/article/category/{type}")
	public String articleByCategory(@PathVariable("nicknameId") String nicknameId,Model model,@RequestParam(value="page",required=false) String page,
			HttpServletRequest request,@PathVariable(value="type",required=false) String type)throws Exception{
		if(StringUtil.isNotEmpty(nicknameId)){
			User user=userService.getUserByNickNameId(nicknameId);
			model.addAttribute("user", user);
			if (StringUtil.isEmpty(page)) {
				page="1";
			}
			List<Article> recommendList=articleService.getRecommendsByUserId(user.getId());
			model.addAttribute("recommendList", recommendList);
			List<Article> countList=articleService.getHotByUserId(user.getId());
			model.addAttribute("countList", countList);
			PageBean pageBean=new PageBean(Integer.parseInt(page), 6);
			List<Article> articleList=articleService.getArticleListByUserId(user.getId(),type,pageBean);
			model.addAttribute("articleList", articleList);
			
			Tag tag = tagService.getTagByUserId(user.getId());
			if(null!=tag) {
				String[] split = tag.getContent().split(" ");
				model.addAttribute("tags", split);
			}
			
			long total=articleService.getArticleCountByUserId(user.getId(),type);
			StringBuffer param=new StringBuffer();
			if (StringUtil.isNotEmpty(nicknameId)) {
				param.append("nicknameId="+nicknameId);
			}			
			String pageCode=PageUtil.genPagination(request.getContextPath()+"/blog/"+nicknameId+"/article/category/"+type, total, Integer.parseInt(page), 6,param.toString());
			model.addAttribute("pageCode", pageCode);
		}
		return "blog/article";
	}
	
	/**文章详情页
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/blog/{nicknameId}/article/{id}")
	public String detail(@PathVariable("nicknameId") String nicknameId,@PathVariable("id") int id,Model model)throws Exception{
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
			
			Tag tag = tagService.getTagByUserId(user.getId());
			if(null!=tag) {
				String[] split = tag.getContent().split(" ");
				model.addAttribute("tags", split);
			}
			
			List<Critique> replyList=critiqueService.getReplyListByAid(id);
			model.addAttribute("replyList", replyList);
			article.setCount(article.getCount()+1);
			articleService.saveArticle(article);		
		}
		return "blog/article_detail";
	}
}
