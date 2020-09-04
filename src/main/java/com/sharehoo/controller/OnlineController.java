package com.sharehoo.controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sharehoo.config.lang.Consts;
import com.sharehoo.listener.OnlineCounterListener;
import com.sharehoo.util.BootPathUtil;
import com.sharehoo.util.CxCacheUtil;
import com.sharehoo.util.forum.Counter;
import com.sharehoo.util.forum.E3Result;

@Controller
public class OnlineController {
	
	@Autowired
	private OnlineCounterListener sessionListener;
	
	@RequestMapping("/online")
	@ResponseBody
	private E3Result getOnline(HttpServletRequest request,HttpServletResponse response) {
		
		try { // 把sessionId记录在浏览器
			Cookie c = new Cookie("JSESSIONID", URLEncoder.encode(request.getSession().getId(), "utf-8"));
			c.setPath("/");
			// 先设置cookie有效期为2天，不用担心，session不会保存2天
			c.setMaxAge(48 * 60 * 60);
			response.addCookie(c);
		} catch (Exception e) {
			e.printStackTrace();
		}
		//HttpSession session = request.getSession();
		
		String staticPath = BootPathUtil.getStaticPath();
		//Object count=session.getServletContext().getAttribute(Consts.ONLINEUSER);
		Long count = sessionListener.getOnlineUserNumber();
		Object daycount=CxCacheUtil.getIntance().getValue(Consts.DAYONLINEUSER);
		long total = Counter.readFromFile(staticPath +"/count.txt");
			
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("online", count);
		data.put("total", total);
		data.put("daytotal", daycount);
		
		return E3Result.ok(data);
	}
}
