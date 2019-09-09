package com.sharehoo.controller.shop;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sharehoo.config.lang.Consts;
import com.sharehoo.entity.forum.User;
import com.sharehoo.entity.shop.Comment;
import com.sharehoo.service.forum.CommentService;
import com.sharehoo.util.forum.E3Result;

@Controller
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	
	/*
	 * 2017.08.08 miki 评论保存功能，同时验证用户是否唯一评论，同一资源，同一个用户只能评论一次
	 */
	@RequestMapping("shop/source/{sourceId}/comment")
	public E3Result save(HttpServletRequest request,@PathVariable("sourceId") int sourceId,Comment comment)throws Exception{
		HttpSession session=request.getSession();
		User currentUser=(User) session.getAttribute(Consts.CURRENTUSER);

		if(currentUser!=null){		
			//查询数据库的该用户资源是否评论已存在
			Comment exitComment=commentService.getCommentByUserSourceId(sourceId, currentUser.getId());
			if(exitComment!=null){		
				
				return E3Result.build(401, "您已经参与过评论了");
			}else{
				comment.setPublishTime(new Date());
				commentService.save(comment);
				return E3Result.ok();
			}
		}
		return E3Result.build(401, "您尚未登录..");
	}
	
}
