package com.sharehoo.controller.shop.manage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sharehoo.config.lang.Consts;
import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.forum.User;
import com.sharehoo.entity.shop.Log;
import com.sharehoo.service.LogService;
import com.sharehoo.util.forum.PageUtil;
import com.sharehoo.util.forum.StringUtil;

@Controller
public class LogController {
	
	@Autowired
	private LogService logService;
	
	@RequestMapping("/admin/log")
	public String list(HttpServletRequest request,Model model,@RequestParam("page") String page)throws Exception{
		HttpSession sessiom=request.getSession();
		User user=(User)sessiom.getAttribute(Consts.CURRENTUSER);
		model.addAttribute("user", user);
		if (user!=null&&user.getType()==2) {
			if (StringUtil.isEmpty(page)) {
				page="1";
			}
			PageBean pageBean=new PageBean(Integer.parseInt(page), 12);
			List<Log> logList=logService.getLogs(pageBean);
			model.addAttribute("logList", logList);
			long total=logService.getAllCount();
			String pageCode=PageUtil.genPagination(request.getContextPath()+"/admin/Log_list.action", total, Integer.parseInt(page), 12,null);
			model.addAttribute("pageCode", pageCode);
		}else {
			String error="我已经记录你的ip了，再乱来，你就死定了！";
			model.addAttribute("error", error);
			return "admin/login";
		}
		String mainPage="shop_log.jsp";
		model.addAttribute("mainPage", mainPage);
		String crumb1="网站运行日志";
		model.addAttribute("crumb1", crumb1);
		return "admin/main";
	}
}
