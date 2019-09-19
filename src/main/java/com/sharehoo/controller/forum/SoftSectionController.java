package com.sharehoo.controller.forum;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.forum.Soft;
import com.sharehoo.entity.forum.SoftSection;
import com.sharehoo.service.forum.SoftSectionService;
import com.sharehoo.service.forum.SoftService;
import com.sharehoo.util.forum.E3Result;
import com.sharehoo.util.forum.PageUtil;
import com.sharehoo.util.forum.ResponseUtil;
import com.sharehoo.util.forum.StringUtil;

import net.sf.json.JSONObject;

@Controller
public class SoftSectionController {
	@Autowired
	private SoftSectionService softSectionService;
	@Autowired
	private SoftService softService;
	
	@RequestMapping("/admin/softsection/list")
	public String list(HttpServletRequest request,@RequestParam(value="page",required=false) String page,Model model)throws Exception{
		if (StringUtil.isEmpty(page)) {
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), 6);
		List<SoftSection> softSectionList=softSectionService.findSoftSectionsList(null, pageBean);
		model.addAttribute("softSectionList", softSectionList);
		long total=softSectionService.getSoftSectionCount(null);
		model.addAttribute("total", total);
		String pageCode=PageUtil.genPagination(request.getContextPath()+"/admin/softsection/list", total, Integer.parseInt(page), 6,null);
		model.addAttribute("pageCode", pageCode);
		String mainPage="softSection.jsp";
		model.addAttribute("mainPage", mainPage);
		String crumb1="软件版块管理";
		model.addAttribute("crumb1", crumb1);
		
		//************** 添加父级菜单自动展开样式	2019.09.11 miki
		model.addAttribute("ul", "forum");
		
		return "admin/main";
	}
	
	@RequestMapping("/softsection/list")
	public String listpr(HttpServletRequest request,@RequestParam(value="page",required=false) String page,Model model)throws Exception{
		if (StringUtil.isEmpty(page)) {
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), 8);
		List<SoftSection> softSectionList=softSectionService.findSoftSectionsList(null, pageBean);
		model.addAttribute("softSectionList", softSectionList);
		Map<SoftSection, List<Soft>> good=new HashMap<SoftSection, List<Soft>>();
		
		for (SoftSection softSection : softSectionList) {
			PageBean pageBean1=new PageBean(Integer.parseInt(page), 9);
			List<Soft> softList=softService.goodListBySoftSectionId(softSection.getId(), pageBean1);
			good.put(softSection, softList);
		}
		model.addAttribute("good", good);
		long total=softSectionService.getSoftSectionCount(null);
		
		String pageCode=PageUtil.genPagination(request.getContextPath()+"/softsection/list", total, Integer.parseInt(page), 8,null);	
		model.addAttribute("pageCode", pageCode);
		return "source";
	}
	
	@RequestMapping("/admin/softsection/add")
	@ResponseBody
	public E3Result save(SoftSection softSection)throws Exception{
		softSectionService.saveSoftSection(softSection);
		return E3Result.ok();
	}
	
	@RequestMapping("/admin/softsection/delete/{softSectionId}")
	@ResponseBody
	public JSONObject delete(@PathVariable("softSectionId") int softSectionId)throws Exception{
		JSONObject result=new JSONObject();
		SoftSection e=softSectionService.findSoftSectionById(softSectionId);
		softSectionService.deleteSoftSection(e);
		result.put("info", true);
		
		return result;
	}
}
