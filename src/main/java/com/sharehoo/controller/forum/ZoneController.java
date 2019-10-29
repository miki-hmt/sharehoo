package com.sharehoo.controller.forum;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.forum.Zone;
import com.sharehoo.service.forum.ZoneService;
import com.sharehoo.util.forum.PageUtil;
import com.sharehoo.util.forum.StringUtil;

import net.sf.json.JSONObject;

@Controller
public class ZoneController {
	@Autowired
	private ZoneService zoneService;
	
	@RequestMapping("/admin/zones")
	public String list(@PathVariable("page") String page,Model model,HttpServletRequest request)throws Exception{
		if (StringUtil.isEmpty(page)) {
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), 6);
		List<Zone> zoneList=zoneService.findZoneList(null, pageBean);
		model.addAttribute("zoneList", zoneList);
		
		long total=zoneService.getZoneCount(null);
		model.addAttribute("total", total);
		String pageCode=PageUtil.genPagination(request.getContextPath()+"/admin/zones", total, Integer.parseInt(page), 6,null);
		model.addAttribute("pageCode", pageCode);
		String mainPage="zone.jsp";
		model.addAttribute("mainPage", mainPage);
		String crumb1="大板块管理";
		model.addAttribute("crumb1", crumb1);
		
		//************** 添加父级菜单自动展开样式	2019.09.11 miki
		model.addAttribute("ul", "forum");
		
		return "admin/main";
	}

	@RequestMapping("/admin/zone/add")
	public String save(@RequestBody Zone zone)throws Exception{
		zoneService.saveZone(zone);
		return "admin/main";
	}
	
	@RequestMapping("/admin/zone/delete/{zoneId}")
	public JSONObject delete(@PathVariable("zoneId") int zoneId)throws Exception{
		JSONObject result=new JSONObject();
		Zone e=zoneService.findZoneById(zoneId);
		zoneService.deleteZone(e);
		result.put("success", true);
		return result;
	}
}
