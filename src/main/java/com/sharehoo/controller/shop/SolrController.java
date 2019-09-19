package com.sharehoo.controller.shop;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sharehoo.config.lang.Consts;
import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.forum.User;
import com.sharehoo.entity.shop.Category;
import com.sharehoo.entity.shop.Menu;
import com.sharehoo.entity.shop.SearchItem;
import com.sharehoo.entity.shop.SearchResult;
import com.sharehoo.entity.shop.Source;
import com.sharehoo.entity.shop.Type;
import com.sharehoo.service.MenuService;
import com.sharehoo.service.SolrJService;
import com.sharehoo.service.TypeService;
import com.sharehoo.service.forum.CategoryService;
import com.sharehoo.service.shop.SourceService;
import com.sharehoo.util.forum.E3Result;
import com.sharehoo.util.forum.PageUtil;
import com.sharehoo.util.forum.StringUtil;
@Configuration
@Controller
public class SolrController {
	
	@Value("${forum.topic.SEARCH_RESULT_ROWS}")
	private String SEARCH_RESULT_ROWS;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private TypeService typeService;
	@Autowired
	private SolrJService solrJService;
	
	@Autowired
	private MenuService menuService;
	@Autowired
	private SourceService sourceService;

	
	@RequestMapping("shop/source/serach")
	public String searchItemList(Model model,@RequestParam(value="keyword",required=false) String keyword,
			@RequestParam(value="category_name",required=false) String category_name,
			@RequestParam(value="menu_name",required=false) String menu_name,@RequestParam(value="type",required=false) String type,
			@RequestParam(value="page",required=false) String pages,HttpServletRequest request)throws Exception{
			
		List<Category> categories = categoryService.getCategoryList(null, null);
		model.addAttribute("categories", categories);
		
		List<Type> types = typeService.getTypeList();
		model.addAttribute("types", types);
		int count = Integer.parseInt(SEARCH_RESULT_ROWS);
		
		int page = 0;
		if(null!=pages) {
			page = Integer.parseInt(pages);
		}
		// 前台关键字乱码问题
		if (StringUtil.isNotEmpty(keyword)) {
			keyword = java.net.URLDecoder.decode(keyword, "UTF-8"); 			// 2017.08.16 将url中文参数进行转码
		}
		if (StringUtil.isNotEmpty(category_name)) {
			category_name = java.net.URLDecoder.decode(category_name, "UTF-8"); // 2017.08.16 将url中文参数进行转码
		}
		if (StringUtil.isNotEmpty(menu_name)) {
			menu_name = java.net.URLDecoder.decode(menu_name, "UTF-8"); 		// 2017.08.16 将url中文参数进行转码
		}
		if (StringUtil.isNotEmpty(type)) {
			type = java.net.URLDecoder.decode(type, "UTF-8"); 					// 2017.08.16 将url中文参数进行转码
		}

		// 组织搜索字段为0而显示到前台的情况
		if (!"0".equals(category_name)) {
			List<Category> categoriesByName = categoryService.getCategoryByName(category_name);
			
			if(categoriesByName.size()>0) {
				model.addAttribute("curCategory", categoriesByName.get(0));
				
				List<Menu> menuListBycategoryId = menuService.getMenuListBycategoryId(categoriesByName.get(0).getId());
				model.addAttribute("menus", menuListBycategoryId);
			}		
		}
		if (!"0".equals(menu_name)) {
			List<Menu> list = menuService.getMenuByName(menu_name);
			if(list.size()>0) {
				model.addAttribute("curMenu", list.get(0));
			}
			
		}
		if (!"0".equals(type)) {
			List<Type> typelist = typeService.getTypeByName(type);
			if(typelist.size()>0) {
				model.addAttribute("curType", typelist.get(0));
			}			
		}
		model.addAttribute("search", keyword);

		// 得到查询列表
		SearchResult result = solrJService.search(keyword, category_name, menu_name, type, page, count);

		// 查询关键字回显
		String query = keyword;
		model.addAttribute("query", query);
		long recordCount = result.getRecordCount();

		List<SearchItem> itemList = result.getItemList();
		model.addAttribute("itemList", itemList);
		if (page <= 0) {
			page = 1;
		}
		
		StringBuffer param = new StringBuffer();
		if (null == category_name) {
			category_name = "";
		}if (null == type) {
			type = "";
		}if (null == keyword) {
			keyword = "";
		}
		param.append("category_name=" + category_name + "&type=" + type + "&keyword=" + keyword);
		String pageCode = PageUtil.genPagination(request.getContextPath() + "/shop/source/serach", recordCount,
				page, count, param.toString());
		model.addAttribute("pageCode", pageCode);

		return "shop/solrJ_search";			
	}
	
	
	
	//资源分类页搜索结果显示  	2017.08.15 miki
	@RequestMapping("/shop/source/categories")
	public String result(Model model,@RequestParam(value="categoryId",required=false) String categoryId,@RequestParam(value="typeId",required=false) String typeId,
			@RequestParam(value="menuId",required=false) String menuId,@RequestParam(value="page",required=false) String page,
			HttpServletRequest request)throws Exception{
		List<Category> categories=categoryService.getCategoryList(null, null);
		model.addAttribute("categories", categories);
		List<Type> types=typeService.getTypeList();
		model.addAttribute("types", types);
		
		if(null!=categoryId){
			Category curCategory=categoryService.getCategoryById(Integer.parseInt(categoryId));
			model.addAttribute("curCategory", curCategory);
			List<Menu> menus=menuService.getMenuListBycategoryId(Integer.parseInt(categoryId));
			model.addAttribute("menus", menus);
		}
		if(null!=typeId){
			Type curType=typeService.getTypeById(Integer.parseInt(typeId));
			model.addAttribute("curType", curType);
		}	
		
		if(null!=menuId){
			int menId = Integer.parseInt(menuId);
			Menu curMenu=menuService.getMenuById(menId);
			model.addAttribute("curMenu", curMenu);
			if (StringUtil.isEmpty(page)) {
				page="1";
			}
			PageBean pageBean=new PageBean(Integer.parseInt(page), 7);
			List<Source> sourceList=sourceService.getSourceListByMenuId(menId, pageBean);
			model.addAttribute("sourceList", sourceList);
			long total=sourceService.getCountByMenuId(menId);
			StringBuffer param=new StringBuffer();
			param.append("menuId="+menuId);
			String pageCode=PageUtil.genPagination(request.getContextPath()+"/shop/source/categories", total, Integer.parseInt(page), 7,param.toString());
			model.addAttribute("pageCode", pageCode);
		}else{
			if (StringUtil.isEmpty(page)) {
				page="1";
			}
			PageBean pageBean=new PageBean(Integer.parseInt(page), 7);
			List<Source> sourceList=sourceService.getSourceListByCategoryId(Integer.parseInt(categoryId==null ? "0":categoryId), pageBean);
			model.addAttribute("sourceList", sourceList);
			long total=sourceService.getCountByCategoryId(Integer.parseInt(categoryId==null ? "0":categoryId));
			StringBuffer param=new StringBuffer();
			param.append("categoryId="+categoryId);
			String pageCode=PageUtil.genPagination(request.getContextPath()+"/shop/source/categories", total, Integer.parseInt(page), 10,param.toString());
			model.addAttribute("pageCode", pageCode);
		}
		
		return "shop/solrJ_search_result";
	}

	@RequestMapping("admin/shop/solr/import")
	public E3Result importItenList()throws Exception{
		
		E3Result result=solrJService.importAllItems();
		
		return result;
		
	}
	
	@RequestMapping("admin/solr")
	public String show(HttpServletRequest request,Model model)throws Exception{
		HttpSession sessiom=request.getSession();
		User user=(User)sessiom.getAttribute(Consts.CURRENTUSER);
		if (user!=null&&user.getType()==2) {
			
		}else {
			String error="我已经记录你的ip了，再乱来，你就死定了！";
			model.addAttribute("error", error);
			return "admin/login";
		}
		String mainPage="solr_analysis.jsp";
		model.addAttribute("mainPage", mainPage);
		String crumb1="solr管理";
		model.addAttribute("crumb1", crumb1);
		
		//************** 添加父级菜单自动展开样式	2019.09.11 miki
		model.addAttribute("ul", "index");
		
		return "admin/main";
	}
}
