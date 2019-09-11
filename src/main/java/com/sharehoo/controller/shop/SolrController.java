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
import com.sharehoo.entity.forum.User;
import com.sharehoo.entity.shop.Category;
import com.sharehoo.entity.shop.SearchItem;
import com.sharehoo.entity.shop.SearchResult;
import com.sharehoo.entity.shop.Type;
import com.sharehoo.service.SolrJService;
import com.sharehoo.service.TypeService;
import com.sharehoo.service.forum.CategoryService;
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
	
	@RequestMapping("shop/source/serach")
	public String searchItemList(Model model,@RequestParam(value="keyword",required=false) String keyword,
			@RequestParam(value="category_name",required=false) String category_name,
			@RequestParam(value="menu_name",required=false) String menu_name,@RequestParam(value="type",required=false) String type,
			@RequestParam(value="page",required=false) int page,HttpServletRequest request)throws Exception{
			
		List<Category> categories = categoryService.getCategoryList(null, null);
		model.addAttribute("categories", categories);
		List<Type> types = typeService.getTypeList();
		model.addAttribute("types", types);
		int count = Integer.parseInt(SEARCH_RESULT_ROWS);

		// 前台关键字乱码问题
		if (StringUtil.isNotEmpty(keyword)) {
			// keyword=new String(keyword.getBytes("iso-8859-1"), "utf-8");
			keyword = java.net.URLDecoder.decode(keyword, "UTF-8"); // 2017.08.16 将url中文参数进行转码
		}
		if (StringUtil.isNotEmpty(category_name)) {

			category_name = java.net.URLDecoder.decode(category_name, "UTF-8"); // 2017.08.16 将url中文参数进行转码
		}
		if (StringUtil.isNotEmpty(menu_name)) {

			menu_name = java.net.URLDecoder.decode(menu_name, "UTF-8"); // 2017.08.16 将url中文参数进行转码
		}
		if (StringUtil.isNotEmpty(type)) {

			type = java.net.URLDecoder.decode(type, "UTF-8"); // 2017.08.16 将url中文参数进行转码
		}

		// 组织搜索字段为0而显示到前台的情况
		if (!"0".equals(category_name)) {
			model.addAttribute("curCategory", category_name);
		}
		if (!"0".equals(menu_name)) {
			model.addAttribute("curMenu", menu_name);
		}
		if (!"0".equals(type)) {
			model.addAttribute("curType", type);
		}
		model.addAttribute("search", keyword);

		// 得到查询列表
		SearchResult result = solrJService.search(keyword, category_name, menu_name, type, page, count);

		// 查询关键字回显
		String query = keyword;
		model.addAttribute("query", query);
		long totalPages = result.getTotalPages();
		model.addAttribute("totalPages", totalPages);
		long recordCount = result.getRecordCount();
		model.addAttribute("recordCount", recordCount);
		List<SearchItem> itemList = result.getItemList();
		model.addAttribute("itemList", itemList);
		// 分页
		if (page <= 0) {
			page = 1;
		}
		StringBuffer param = new StringBuffer();
		if (null == category_name) {
			category_name = "";
		}
		if (null == type) {
			type = "";
		}
		if (null == keyword) {
			keyword = "";
		}
		param.append("category_name=" + category_name + "&type=" + type + "&keyword=" + keyword);

		String pageCode = PageUtil.genPagination(request.getContextPath() + "/shop/source/serach", recordCount,
				page, count, param.toString());
		model.addAttribute("pageCode", pageCode);
		// 返回逻辑视图search.jsp
		return "shop/solrJ_search";
			
		}
	
	
	
	//资源分类页搜索结果显示  	2017.08.15 miki
	@RequestMapping("shop/source/serach/go")
	public String result(Model model)throws Exception{
		List<Category> categories=categoryService.getCategoryList(null, null);
		model.addAttribute("categories", categories);
		List<Type> types=typeService.getTypeList();
		model.addAttribute("types", types);
		return "too";
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
