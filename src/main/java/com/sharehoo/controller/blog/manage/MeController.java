package com.sharehoo.controller.blog.manage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.sharehoo.config.SessionUtil;
import com.sharehoo.config.annotation.HasLogin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sharehoo.config.lang.Consts;
import com.sharehoo.entity.forum.Me;
import com.sharehoo.entity.forum.User;
import com.sharehoo.service.forum.MeService;
import com.sharehoo.util.forum.E3Result;

@Controller
public class MeController {
	
	@Autowired
	private MeService meService;

	@HasLogin(value="修改自我介绍")
	@RequestMapping("/blog/manage/about")
	public String list(HttpServletRequest request,Model model)throws Exception{

		User user = SessionUtil.getUser();
		model.addAttribute("user", user);
		List<Me> listByUer=meService.getMeListByUserId(user.getId(), null);
		model.addAttribute("me", listByUer.get(0));
		return "blog/manage/about";
	}
	
	@RequestMapping("/blog/manage/about/save")
	@ResponseBody
	public E3Result save(HttpServletRequest request,Me me)throws Exception{

		User user = SessionUtil.getUser();
		if(null==user) {
			return E3Result.build(401, "请登录后，再添加");
		}
		meService.save(me);
		return E3Result.ok();
	}
}
