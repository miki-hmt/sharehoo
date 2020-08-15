package com.sharehoo.controller.shop;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import net.sf.json.JSONArray;

@Controller
public class MenuController {
	
	@Autowired
	private MenuService menuService;
	@Autowired
	private CategoryService categoryService;
	/*
	 * 利用ajax提交后台id，将二级菜单列表存储到json中		2017.08.13 miki
	 */
	@RequestMapping("/shop/source/menu")
	public String show(@RequestParam("categoryId") int categoryId,HttpServletResponse response)throws Exception{
		if(categoryId>0){
			 response.setContentType("text/json"); 			// 回传内容设为json格式 2017.08.13 miki		    
	         response.setCharacterEncoding("UTF-8");	    /*设置字符集为'UTF-8'，不然从数据库取中文数据时，会乱码*/
	         
	         //根据一级菜单选中的Id，得到对应的二级列表
			List<Menu> menuList=menuService.getMenuListBycategoryId(categoryId);
			
			//以jsonArray数据形式存入json中
			JSONArray menus=JSONArray.fromObject(menuList);	
			//**********response顾名思义就是服务器对浏览器的相应，PrintWriter它的实例就是向前台的JSP页面输出结果
			PrintWriter out=response.getWriter();								
			out.print(menus.toString());
			out.flush();
			out.close();
		}		
		return null;
	}
	
	
	//2017.11.11  miki  实现二级菜单添加
	@RequestMapping("/manage/source/saveMenu")
	@ResponseBody
	public E3Result save(HttpServletRequest request,@RequestParam("categoryId") int categoryId,Menu menu)throws Exception{
		HttpSession sessiom=request.getSession();
		User user=(User)sessiom.getAttribute(Consts.CURRENTUSER);
		if (user!=null&&user.getType()==2) {
		if(categoryId>0){
			Category category=categoryService.getCategoryById(categoryId);
			menu.setCategory(category);
			menuService.save(menu);
			return E3Result.ok();
		}else{
			return E3Result.build(401, "您没有权限..");
		}
			}else{
				String error="我已经记录你的ip了，再乱来，你就死定了！";
				return E3Result.build(401, error);
			}
	}
	
	//2017.11.11  miki  实现二级菜单添加
	@RequestMapping("/manage/source/updateMenu")
	@ResponseBody
	public E3Result update(HttpServletRequest request,@RequestParam("menuId") int menuId,Menu menu)throws Exception{
		HttpSession sessiom=request.getSession();
		User user=(User)sessiom.getAttribute(Consts.CURRENTUSER);
		if (user!=null&&user.getType()==2) {
		if(menuId>0){
			Category category1=menuService.getMenuById(menuId).getCategory();
			menu.setCategory(category1);
			menuService.save(menu);
			return E3Result.ok();
		}else{
			return E3Result.build(401, "您没有权限..");
		}
			}else{
				String error="我已经记录你的ip了，再乱来，你就死定了！";
				return E3Result.build(401, error);
			}
	}
	
	@RequestMapping("/manage/source/deleteMenu")
	@ResponseBody
	public E3Result delete(HttpServletRequest request,@RequestParam("menuId") int menuId)throws Exception{
		HttpSession sessiom=request.getSession();
		User user=(User)sessiom.getAttribute(Consts.CURRENTUSER);
		if (user!=null&&user.getType()==2) {		
		if(menuId>0){
			Menu menu=menuService.getMenuById(menuId);							
			menuService.delete(menu);
			return E3Result.ok();	
		}else{
			return E3Result.build(401, "您没有权限..");
		}
			}else{
				String error="我已经记录你的ip了，再乱来，你就死定了！";
				return E3Result.build(401, error);
			}
	}
		
	@RequestMapping("/admin/shop/menu")	
	public String list(HttpServletRequest request,@RequestParam("page") String page,Model model)throws Exception{
		HttpSession sessiom=request.getSession();
		User user=(User)sessiom.getAttribute(Consts.CURRENTUSER);
		model.addAttribute("user", user);
		if (user!=null&&user.getType()==2) {
			if (StringUtil.isEmpty(page)) {
				page="1";
			}
			PageBean pageBean=new PageBean(Integer.parseInt(page), 15);
			List<Menu> menuList=menuService.getAllMenuList(pageBean);
			model.addAttribute("menuList", menuList);
			long total=menuService.getCount();
			String pageCode=PageUtil.genPagination(request.getContextPath()+"/admin/shop/menu", total, Integer.parseInt(page), 15,null);
			model.addAttribute("pageCode", pageCode);
			
			//2020.08.15 miki 移除旧版本代码
			/*String mainPage="shop_menu.jsp";
			model.addAttribute("mainPage", mainPage);
			String crumb1="子模块管理";
			model.addAttribute("crumb1", crumb1);			
			//************** 添加父级菜单自动展开样式	2019.09.11 miki
			model.addAttribute("ul", "download");*/
			
			return "admin/shop_menu";
		}else{
			String error="我已经记录你的ip了，再乱来，你就死定了！";
			model.addAttribute("error", error);
			return "admin/login";
		}
	}
}
