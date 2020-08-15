package com.sharehoo.controller.shop.manage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sharehoo.config.lang.Consts;
import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.forum.User;
import com.sharehoo.entity.shop.Category;
import com.sharehoo.entity.shop.Menu;
import com.sharehoo.service.MenuService;
import com.sharehoo.service.forum.CategoryService;
import com.sharehoo.util.forum.E3Result;
import com.sharehoo.util.forum.PageUtil;
import com.sharehoo.util.forum.StringUtil;

@Controller
public class CategoryManageController {
	
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private MenuService menuService;
	
	@RequestMapping("/amdin/shop/category")
	public String list(HttpServletRequest request,Model model,@RequestParam(value="page",required=false)String page)throws Exception{
		HttpSession sessiom=request.getSession();
		User user=(User)sessiom.getAttribute(Consts.CURRENTUSER);
		if (user!=null&&user.getType()==2) {
			if (StringUtil.isEmpty(page)) {
				page="1";
			}
			PageBean pageBean=new PageBean(Integer.parseInt(page), 15);
			List<Category> categoryList=categoryService.getCategoryList(null, pageBean);
			model.addAttribute("categoryList", categoryList);
			long total=categoryService.getCount();
			String pageCode=PageUtil.genPagination(request.getContextPath()+"/amdin/shop/category", total, Integer.parseInt(page), 15,null);
			model.addAttribute("pageCode", pageCode);
			
			//2020.08.15 miki 移除旧版本代码
			/*String mainPage="shop_category.jsp";
			model.addAttribute("mainPage", mainPage);
			String crumb1="模块管理";
			model.addAttribute("crumb1", crumb1);			
			//************** 添加父级菜单自动展开样式	2019.09.11 miki
			model.addAttribute("ul", "download");*/
			return "admin/shop_category";
			
		}else{
			String error="我已经记录你的ip了，再乱来，你就死定了！";
			model.addAttribute("error", error);
			return "admin/login";
		}
	}
	
	//2017.08.23 miki 删除操作
	@RequestMapping("/amdin/shop/categoryDelete")
	@ResponseBody
	public E3Result delete(HttpServletRequest request,@RequestParam("categoryId") int categoryId)throws Exception{
		HttpSession sessiom=request.getSession();
		User user=(User)sessiom.getAttribute(Consts.CURRENTUSER);
		if (user!=null&&user.getType()==2) {		
			if(categoryId>0){
				Category category=categoryService.getCategoryById(categoryId);
				List<Menu> menuList=menuService.getMenuListBycategoryId(categoryId);
				if(menuList.size()>0){
					return E3Result.build(401, "请先删除目录下的子目录");
				}else{			
				categoryService.delete(category);
				return E3Result.ok();
				}
			}
			}else{
				String error="我已经记录你的ip了，再乱来，你就死定了！";
				return E3Result.build(401, "登录异常",error);
			}
		return E3Result.build(401, "登录异常");
	}
	
	//2017.08.23 miki 删除操作
	@RequestMapping("/amdin/shop/categoryUpdate")
	@ResponseBody
	public E3Result update(HttpServletRequest request,@RequestParam("categoryId") int categoryId,Category category)throws Exception{
		HttpSession sessiom=request.getSession();
		User user=(User)sessiom.getAttribute(Consts.CURRENTUSER);
		if (user!=null&&user.getType()==2) {		
			if(categoryId>0){			
				category.setId(categoryId);
				categoryService.save(category);
				return E3Result.ok();
			}			
		}
		String error="我已经记录你的ip了，再乱来，你就死定了！";
		return E3Result.build(401, error);
	}
	
	//2017.08.23 miki 删除操作
	@RequestMapping("/amdin/shop/categorySave")
	@ResponseBody
	public E3Result save(HttpServletRequest request,Category category)throws Exception{
		HttpSession sessiom=request.getSession();
		User user=(User)sessiom.getAttribute(Consts.CURRENTUSER);
		if (user!=null&&user.getType()==2) {		
			categoryService.save(category);
			return E3Result.ok();			
		}
		String error="我已经记录你的ip了，再乱来，你就死定了！";
		return E3Result.build(401, error);
	}
}
