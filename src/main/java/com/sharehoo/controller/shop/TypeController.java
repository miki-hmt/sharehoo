package com.sharehoo.controller.shop;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sharehoo.config.lang.Consts;
import com.sharehoo.entity.forum.User;
import com.sharehoo.entity.shop.Type;
import com.sharehoo.service.TypeService;
import com.sharehoo.util.forum.E3Result;

@Controller
public class TypeController {
	
	@Autowired
	private TypeService typeService;
	
	@RequestMapping("/admin/shop/types")
	public String list( HttpServletRequest request,Model model) {
		
		HttpSession sessiom=request.getSession();
		User user=(User)sessiom.getAttribute(Consts.CURRENTUSER);
		model.addAttribute("user", user);
		if (user!=null&&user.getType()==2) {
			
			List<Type> typeList=typeService.getTypeList();
			model.addAttribute("typeList", typeList);
			
			//2020.08.15 miki 移除旧版本代码
			/*String mainPage="shop_type.jsp";
			model.addAttribute("mainPage", mainPage);
			String crumb1="资源类型管理";
			model.addAttribute("crumb1", crumb1);			
			//************** 添加父级菜单自动展开样式	2019.09.11 miki
			model.addAttribute("ul", "download");*/
			
			return "admin/shop_type";
		}else {
			String error="系统已记录你的ip，再乱来你就死定了！";
			model.addAttribute("error", error);
			return "admin/login";
		}
	}
	
	@PostMapping("/admin/shop/type/save")
	@ResponseBody
	public E3Result saveType(Type type) {
		typeService.save(type);
		return E3Result.ok();		
	}
}
