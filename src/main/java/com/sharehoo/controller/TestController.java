package com.sharehoo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sharehoo.entity.forum.User;
import com.sharehoo.service.forum.UserService;

@Controller
public class TestController {
	
	@Value("${spring.site.store.root}")
	private String root;
	@Autowired
	private UserService userService;
	@RequestMapping("/test")
	public String index(HttpServletRequest request,HttpServletResponse response,Model model) {
		model.addAttribute("root",root);
		User user = userService.getUserById(1);
		model.addAttribute("user",user);
		System.out.println(root);
		return "index";		
	}
}
