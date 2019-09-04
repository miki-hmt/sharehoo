package com.sharehoo.controller.blog;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	private LogService logService;
	
	/*
	 * miik 2017.06.07	保存留言
	 */
	@RequestMapping("/blog/{nicknameId}/critique/add")
	@ResponseBody
	public E3Result save(HttpServletRequest req,@PathVariable("nicknameId") String nicknameId,Model model,Critique critique)throws Exception{
		if(StringUtil.isNotEmpty(nicknameId)){
		User user=userService.getUserByNickNameId(nicknameId);
		model.addAttribute("user", user);
		Log log1=new Log();
		String ip=IpGet.getIp2(req);
		
		String address=GaoDeUtil.getAddress(ip);	//2018.01.27运用高德api得到当前地址
		if(address.equals("[]")){
			String provence=IpSeekUtils.getIpProvinceByBaidu(ip);
			log1.setAddress(provence+">>"+"手机IP访问");
		}else{
			String provence=IpSeekUtils.getIpProvinceByBaidu(ip);
			if(address!=null && address!=""){
				log1.setAddress(provence+">>"+address);
			}
		}	
		
		log1.setIp(ip);
		log1.setTime(new Date());
		log1.setType("Blog_Critique");
		log1.setOperation_log("博客留言");
		logService.save(log1);
		
		
		if(user!=null){
			critique.setTime(new Date());
			critique.setNotice("1");
			critiqueService.save(critique);
			}	
		}
		return E3Result.ok();
	}
	
	@RequestMapping("/blog/{nicknameId}/critique/delete")
	@ResponseBody
	public E3Result delete(HttpServletRequest req,@RequestParam("id") int id)throws Exception{
		User user = (User)req.getSession().getAttribute(Consts.CURRENTUSER);
		if(null!=user) {
			if(id>0){
				Critique critique=critiqueService.getCritiqueById(id);
				critiqueService.delete(critique);
				}
		}else {
			//***** 无权限删除
		}
		
		return E3Result.ok();
	}
	
	/*
	 * miki
	 * 2017.05.31
	 * 根据用户Id得到留言列表
	 */
	@RequestMapping("/blog/{nicknameId}/critiques")
	public String list(@PathVariable("nicknameId") String nicknameId,Model model)throws Exception{
		if(StringUtil.isNotEmpty(nicknameId)){  
			User user=userService.getUserByNickNameId(nicknameId);
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
	public E3Result saveAr(@PathVariable("id") int id,Model model,Critique critique)throws Exception{
		if(id>0){
			Article article=articleService.getArticleById(id);
			article.setCount1(article.getCount1()+1);
			model.addAttribute("article", article);
			articleService.saveArticle(article);
			critique.setTime(new Date());
			critique.setNotice("2");
			critiqueService.save(critique);
		}
		return E3Result.ok();
	}
	
	/*
	 * miki
	 * 2017.06.04
	 * 保存相册评论
	 */
	@RequestMapping("/blog/{nicknameId}/photo/critique")
	@ResponseBody
	public E3Result savePh(Critique critique)throws Exception{
		critique.setTime(new Date());
		critique.setNotice("3");
		critiqueService.save(critique);
		return E3Result.ok();
	}
}
