package com.sharehoo.controller.forum;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.sharehoo.config.lang.Consts;
import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.forum.Section;
import com.sharehoo.entity.forum.User;
import com.sharehoo.entity.forum.Zone;
import com.sharehoo.service.forum.SectionService;
import com.sharehoo.service.forum.UserService;
import com.sharehoo.service.forum.ZoneService;
import com.sharehoo.util.CxCacheUtil;
import com.sharehoo.util.forum.DateUtil;
import com.sharehoo.util.forum.PageUtil;
import com.sharehoo.util.forum.StringUtil;
import net.sf.json.JSONObject;

@Controller
public class SectionController {
	@Autowired
	private UserService userService;
	@Autowired
	private SectionService sectionService;
	@Autowired
	private ZoneService zoneService;
	
	@RequestMapping("/admin/section/list")
	public String list(HttpServletRequest request,@PathVariable("page") String page,Model model)throws Exception{
		if (StringUtil.isEmpty(page)) {
			page="1";
		}
		
		User master=new User();
		master.setType(2);
		List<User> masterList=userService.findUserList(master, null);
		model.addAttribute("masterList", masterList);
		PageBean pageBean=new PageBean(Integer.parseInt(page), 6);
		List<Section> sectionList=sectionService.findSectionList(null, pageBean);
		model.addAttribute("sectionList", sectionList);
		List<Zone> zoneList=zoneService.findZoneList(null, pageBean);
		model.addAttribute("zoneList", zoneList);
		long total=sectionService.getSectionCount(null);
		model.addAttribute("total", total);
		String pageCode=PageUtil.genPagination(request.getContextPath()+"/admin/Section_list.action", total, Integer.parseInt(page), 6,null);
		model.addAttribute("pageCode", pageCode);
		String mainPage="section.jsp";
		model.addAttribute("mainPage", mainPage);
		String crumb1="小板块管理";
		model.addAttribute("crumb1", crumb1);
		
		return "admin/main";
	}
                  
	   
	
	//上传logo文件保存方法实现
	@RequestMapping("/admin/section/add")
	public String save(@RequestBody Section section,@RequestParam("logo") File logo,@PathVariable("logoFileName") String logoFileName)throws Exception{
		String basePath = (String)CxCacheUtil.getIntance().getValue(Consts.ROOT_PATH);
		if (logo != null) {

			// 将上传图片名设置为日期类型201x.xx.xx.
			String imageName = DateUtil.getCurrentDateStr();
			/*
			 * 指定上传文件的保存地址,原地址为"/images/logo/"即默认地址为tomact服务器下的webapp里的工程，
			 * 由于每次重启tomact，都要重新加载eclipse工程里的项目，eclipse工程里的项目并没有上传进图片
			 * 所以每次上传到tomact服务器中的图片资源都被自动删除了，这里将路径改为eclipse工程里的项目路径
			 */
			String realPath = basePath + Consts.FORUM_UPLOAD_PATH + Consts.FORUM_UPLOAD_SECTION_FOLDER + "/images/logo/";

			String imageFile = imageName + "." + logoFileName.split("\\.")[1];
			File saveFile = new File(realPath, imageFile);
			FileUtils.copyFile(logo, saveFile);
			section.setLogo("images/logo/" + imageFile);
		} else {
			section.setLogo("");
		}
		section.setId(section.getId());
		sectionService.saveSection(section);
		
		return "redirect:";
	}
	
	@RequestMapping("/admin/section/delete/{sectionId}")
	@ResponseBody
	public JSONObject delete(@PathVariable("sectionId") int sectionId)throws Exception{
		JSONObject result=new JSONObject();
		Section e=sectionService.findSectionById(sectionId);
		sectionService.deleteSection(e);
		result.put("success", true);
		
		return result;
	}
	
	@RequestMapping("/admin/section/deletes/{ids}")
	@ResponseBody
	public JSONObject delete1(@PathVariable("ids") String ids)throws Exception{
		JSONObject result=new JSONObject();
		String[] idsStr=ids.split(",");
		for (int i = 0; i < idsStr.length; i++) {
			Section e=sectionService.findSectionById(Integer.parseInt(idsStr[i]));
			sectionService.deleteSection(e);
		}
		result.put("success", true);
		
		return result;
	}
	
	@RequestMapping("/user/lookup/{nickName}")
	@ResponseBody
	public JSONObject getUserByNickName(@PathVariable("nickName") String nickName) throws Exception{
		JSONObject result=new JSONObject();
		User user=userService.getUserByNickName(nickName);
		if (user!=null) {
			result.put("info", "用户id："+user.getId()+"用户昵称："+user.getNickName());
			result.put("masterId", user.getId());
		}else {
			result.put("info", "没有此用户！");
		}
		return result;
	}
}
