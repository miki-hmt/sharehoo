package com.sharehoo.controller.blog;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sharehoo.config.lang.Consts;
import com.sharehoo.entity.blog.Tag;
import com.sharehoo.entity.forum.User;
import com.sharehoo.service.blog.TagService;
import com.sharehoo.util.forum.E3Result;

@Controller
public class TagController {
	@Autowired
	private TagService tagService;
	
	@RequestMapping("/tag/add/{userId}")
	public String add(HttpServletRequest request,Model model,@PathVariable("userId") int userId) {
		User user = (User)request.getSession().getAttribute(Consts.CURRENTUSER);
		model.addAttribute("user", user);
		Tag tag = tagService.getTagByUserId(userId);
		model.addAttribute("tag", tag);
		
		return "blog/manage/tag";
	}
	
	
	@RequestMapping("/blog/tag/save")
	@ResponseBody
	public E3Result save(HttpServletRequest request,@RequestParam(value="tagId",required=false) String tagId,
			@RequestBody Tag tag) {
		User user = (User)request.getSession().getAttribute(Consts.CURRENTUSER);
		if(user!=null) {
			tag.setNotice("blog");
			//tag.setContent(params.get("content"));
			tag.setUser(user);
			if(StringUtils.isNotEmpty(tagId)) {
				tag.setId(Integer.parseInt(tagId));
			}
			tagService.save(tag);
		}else {
			return E3Result.build(401, "您尚未登录..");
		}	
		return E3Result.ok();
	}
}
