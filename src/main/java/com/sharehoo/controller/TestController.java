package com.sharehoo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sharehoo.config.lang.Consts;
import com.sharehoo.entity.forum.User;
import com.sharehoo.service.forum.UserService;
import com.sharehoo.util.CxCacheUtil;

@Controller
public class TestController {
	
	/***************
	 * 2019.08.16	miki 各种Controller类型整理
	 * *************************************************/
	
	@Value("${spring.site.store.root}")
	private String root;
	@Autowired
	private UserService userService;
	
	@RequestMapping("/test")
	public String index(HttpServletRequest request,HttpServletResponse response,Model model) {
		model.addAttribute("root",root);
		User user = userService.getUserById(1);
		model.addAttribute("user",user);
		for(int i = 0;i<2000000000;i++) {
			CxCacheUtil.getIntance().setValue("miki", "55"+i);
		}
		CxCacheUtil.getIntance().setValue("miki", "55");
		Object value = CxCacheUtil.getIntance().getValue(Consts.ROOT_PATH);
		System.out.println(root+value);
		return "test";		
	}
	
	/**
	* @Title: redirect  
	* @Description: TODO(页面重定向)  
	* @author miki 
	* @date 2019年8月19日 下午4:17:26   
	* @throws
	 */
	@RequestMapping("/test-redirect")
	public String redirect(HttpServletRequest request,HttpServletResponse response,Model model) {
		model.addAttribute("root",root);
		User user = userService.getUserById(1);
		model.addAttribute("user",user);
		System.out.println(root);
		return "redirect:test2";		
	}
	
	@RequestMapping("/test/{id}")
	public String find(HttpServletRequest request,HttpServletResponse response,Model model,@PathVariable("id") int id) {
		model.addAttribute("root",root);
		User user = userService.getUserById(id);
		model.addAttribute("user",user);
		Object value = CxCacheUtil.getIntance().getValue("miki");
		System.out.println(root+value);
		System.out.println(root);
		return "test";		
	}
	
	
	
}
