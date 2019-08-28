package com.sharehoo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorPageController {
	
	@RequestMapping("/errorlogin")
	public String ErrorPage() {
		
		return "bug/error";
	}
}
