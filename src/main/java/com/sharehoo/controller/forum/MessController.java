package com.sharehoo.controller.forum;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sharehoo.entity.forum.User;
import com.sharehoo.service.forum.ReplyService;

import net.sf.json.JSONObject;

@Controller
public class MessController {
	
	@Autowired
	private ReplyService replyService;
	
	@RequestMapping("/user/news")
	@ResponseBody
	public JSONObject getNews(HttpServletRequest request)throws Exception{
		JSONObject result=new JSONObject();
		HttpSession session=request.getSession();
		User user = (User)session.getAttribute("currentUser");
		if(user!=null){
			Long count=replyService.getUnReplyCountByUserId(user.getId());
			if(count>0){
				result.put("mes", true);
			}else{
				result.put("mes", false);
			}
		}else{
			result.put("mes", false);
		}		
		return result;
		
	}
	
	@RequestMapping("/user/news/nums")
	@ResponseBody
	public JSONObject getNewsCount(HttpServletRequest request)throws Exception{
		JSONObject result=new JSONObject();
		HttpSession session=request.getSession();
		User user = (User)session.getAttribute("currentUser");
		if(user!=null){
			Long count=replyService.getUnReplyCountByUserId(user.getId());
			if(count>0){
				result.put("count", count);
			}else{
				result.put("mes", false);
			}
		}else{
			result.put("mes", false);
		}
		return result;
		
	}
}
