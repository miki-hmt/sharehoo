package com.sharehoo.controller.blog;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sharehoo.config.SessionUtil;
import com.sharehoo.manager.UserOperateManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.code.kaptcha.Constants;
import com.sharehoo.base.ipseek.IpGet;
import com.sharehoo.base.ipseek.IpSeekUtils;
import com.sharehoo.config.lang.Consts;
import com.sharehoo.entity.forum.Article;
import com.sharehoo.entity.forum.Critique;
import com.sharehoo.entity.forum.User;
import com.sharehoo.entity.shop.Log;
import com.sharehoo.service.LogService;
import com.sharehoo.service.forum.ArticleService;
import com.sharehoo.service.forum.CritiqueService;
import com.sharehoo.service.forum.MeService;
import com.sharehoo.service.forum.UserService;
import com.sharehoo.util.forum.E3Result;
import com.sharehoo.util.forum.GaoDeUtil;
import com.sharehoo.util.forum.StringUtil;

@Controller
public class CritiqueController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private ArticleService articleService;
	@Autowired
	private CritiqueService critiqueService;
	@Autowired
	private UserOperateManager userOperateManager;
	
	/*
	 * miik 2017.06.07	保存留言
	 */
	@RequestMapping("/blog/{nicknameId}/critique/add")
	@ResponseBody
	public E3Result save(HttpServletRequest req, @PathVariable("nicknameId") String nicknameId, Model model, Critique critique,
			@RequestParam(value="imageCode", required = true)String code)throws Exception{
		if(StringUtil.isNotEmpty(nicknameId)){
			Object imageCode = req.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);
			if(code.equals(String.valueOf(imageCode))) {
				User user=userService.getUserByNickNameId(nicknameId);
				model.addAttribute("user", user);

				//日志审计
				userOperateManager.asyncOperateCritiqueLog();

				if(user!=null){
					critique.setTime(new Date());
					critique.setNotice("1");
					critiqueService.save(critique);
				}
				return E3Result.ok();
			}
			return E3Result.build(401, "验证码错误..");
		}
		return E3Result.build(401, "您访问的博客不存在哦..");
	}
	
	@RequestMapping("/blog/{nicknameId}/critique/delete")
	@ResponseBody
	public E3Result delete(@PathVariable("nicknameId") String nicknameId, HttpServletRequest req,@RequestParam("id") int id)throws Exception{

		SessionUtil.getUser();
		if(id>0){
			Critique critique=critiqueService.getCritiqueById(id);
			critiqueService.delete(critique);
		}
		
		return E3Result.ok();
	}
	
	/*
	 * miki
	 * 2017.05.31
	 * 根据用户Id得到留言列表
	 */
	@RequestMapping("/blog/{nicknameId}/critiques")
	public String list(@PathVariable("nicknameId") String nicknameId, Model model,
					   HttpServletRequest request, HttpServletResponse response)throws Exception{
		if(StringUtil.isNotEmpty(nicknameId)){  
			User user=userService.getUserByNickNameId(nicknameId);
			if(user == null) {
				request.getRequestDispatcher("/errorlogin").forward(request, response);
				return null;
			}
			model.addAttribute("user", user);
			List<Critique> critiqueList=critiqueService.getListByUserId(user.getId());
			model.addAttribute("critiqueList", critiqueList);
		}
		return "blog/critique";
	}
	
	/*
	 * miki
	 * 2017.06.03
	 * 保存文章评论
	 */
	@RequestMapping("/blog/article/{id}/critiqueAdd")
	@ResponseBody
	public E3Result saveAr(@PathVariable("id") int id,@RequestParam(value="imageCode",required = true)String code, Model model,
						   Critique critique,HttpServletRequest request)throws Exception{
		if(id>0){
			Object imageCode = request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);
			if(code.equals(imageCode)) {
				Article article=articleService.getArticleById(id);
				article.setCount1(article.getCount1()+1);
				model.addAttribute("article", article);
				articleService.saveArticle(article);
				critique.setTime(new Date());
				critique.setNotice("2");
				critiqueService.save(critique);
				return E3Result.ok();
			}
			return E3Result.build(401, "验证码错误..");
		}
		return E3Result.build(401, "您要评论的资源不存在哦");
	}
	
	/*
	 * miki
	 * 2017.06.04
	 * 保存相册评论
	 */
	@RequestMapping("/blog/{nicknameId}/photo/critique")
	@ResponseBody
	public E3Result savePh(Critique critique, @PathVariable("nicknameId") String nicknameId,
						   @RequestParam(value="imageCode",required = true)String code,HttpServletRequest request)throws Exception{
		Object imageCode = request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);
		if(code.equals(imageCode)) {
			critique.setTime(new Date());
			critique.setNotice("3");
			critiqueService.save(critique);
			return E3Result.ok();
		}
		return E3Result.build(401, "验证码错误..");
	}
}
