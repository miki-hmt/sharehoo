package com.sharehoo.controller.blog.manage;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sharehoo.config.lang.Consts;
import com.sharehoo.entity.forum.Article;
import com.sharehoo.entity.forum.Critique;
import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.forum.User;
import com.sharehoo.service.forum.ArticleService;
import com.sharehoo.service.forum.CritiqueService;
import com.sharehoo.util.forum.E3Result;
import com.sharehoo.util.forum.PageUtil;
import com.sharehoo.util.forum.StringUtil;

@Controller
public class CritiqueManageController {
	@Autowired
	private ArticleService articleService;
	@Autowired
	private CritiqueService critiqueService;
	
	@RequestMapping("/blog/manage/critique")
	public String list(HttpServletRequest request,@RequestParam(value="page",required=false) String page,Model model)throws Exception{
			
			HttpSession session=request.getSession();
			User user=(User) session.getAttribute(Consts.CURRENTUSER);
			model.addAttribute("user", user);
				if(StringUtil.isEmpty(page)){
					page="1";
				}
				List<Article> recommendList=articleService.getRecommendsByUserId(user.getId());
				model.addAttribute("recommendList", recommendList);
				List<Article> countList=articleService.getHotByUserId(user.getId());
				model.addAttribute("countList", countList);
				long total=critiqueService.getCountByUserId(user.getId());
				PageBean pageBean=new PageBean(Integer.parseInt(page), 10);
				List<Critique> critiques=critiqueService.getAllListByUserId(user.getId(), pageBean);//换个分页留言
				model.addAttribute("critiques", critiques);
				String pageCode=PageUtil.genPagination(request.getContextPath()+"/blog/manage/critique", total, Integer.parseInt(page), 12,null);
				model.addAttribute("pageCode", pageCode);
				
			return "blog/manage/critique";
		}
	
	/**
	* @Title: deletePhc  
	* @Description: TODO(删除相册的评论)  
	* @author miki 
	* @date 2019年9月2日 下午9:24:32   
	* @throws
	 */
	@RequestMapping("/blog/manage/pc/delete")
	@ResponseBody
	public E3Result deletePhc(HttpServletRequest request,@RequestParam(value="id",required=false) int id)throws Exception{
		
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute(Consts.CURRENTUSER);
		if(null==user) {
			return E3Result.build(401, "登录超时..");
		}
		if(id>0){
			Critique critique=critiqueService.getCritiqueById(id);
			critiqueService.delete(critique);
		}
		return E3Result.ok();
	}
	
	/**
	* @Title: deleteArc  
	* @Description: TODO(删除文章的评论)  
	* @author miki 
	* @date 2019年9月2日 下午9:24:47   
	* @throws
	 */
	@RequestMapping("/blog/manage/ac/delete")
	@ResponseBody
	public E3Result deleteArc(HttpServletRequest request,@RequestParam(value="id",required=false) int id)throws Exception{
		
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute(Consts.CURRENTUSER);
		if(null==user) {
			return E3Result.build(401, "登录超时..");
		}
		if(id>0){
			Critique critique=critiqueService.getCritiqueById(id);
			critiqueService.delete(critique);
		}
		return E3Result.ok();
	}
	
	/**
	* @Title: deleteArc  
	* @Description: TODO(删除留言)  
	* @author miki 
	* @date 2019年9月2日 下午9:24:47   
	* @throws
	 */
	@RequestMapping("/blog/manage/critique/delete")
	@ResponseBody
	public E3Result delete(HttpServletRequest request,@RequestParam(value="id",required=false) int id)throws Exception{
		
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute(Consts.CURRENTUSER);
		if(null==user) {
			return E3Result.build(401, "登录超时..");
		}
		if(id>0){
			Critique critique=critiqueService.getCritiqueById(id);
			critiqueService.delete(critique);
		}
		return E3Result.ok();
	}
	
	/**
	* @Title: saveAr  
	* @Description: TODO(回复文章的评论)  
	* @author miki 
	* @date 2019年9月2日 下午9:32:23   
	* @throws
	 */
	@RequestMapping("/blog/manage/ar/reply")
	@ResponseBody
	public E3Result saveAr(HttpServletRequest request,@RequestParam(value="id",required=false) int id,Critique critique)throws Exception{
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute(Consts.CURRENTUSER);
		if(null==user) {
			return E3Result.build(401, "登录超时..");
		}
		critique.setTime(new Date());
		critique.setNotice("4");
		critiqueService.save(critique);
		return E3Result.ok();
	}
}
