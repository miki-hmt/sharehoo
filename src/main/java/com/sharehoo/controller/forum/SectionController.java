package com.sharehoo.controller.forum;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sharehoo.config.lang.Consts;
import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.forum.Section;
import com.sharehoo.entity.forum.User;
import com.sharehoo.entity.forum.Zone;
import com.sharehoo.service.forum.SectionService;
import com.sharehoo.service.forum.UserService;
import com.sharehoo.service.forum.ZoneService;
import com.sharehoo.util.BootPathUtil;
import com.sharehoo.util.CxCacheUtil;
import com.sharehoo.util.forum.DateUtil;
import com.sharehoo.util.forum.E3Result;
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
	
	@RequestMapping("/admin/sections")
	public String list(HttpServletRequest request,@RequestParam(value="page") String page,Model model)throws Exception{
		if (StringUtil.isEmpty(page)) {
			page="1";
		}
		
		Section s_section = new Section();
		model.addAttribute("s_section", s_section);
		
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
		String pageCode=PageUtil.genPagination(request.getContextPath()+"/admin/sections", total, Integer.parseInt(page), 6,null);
		model.addAttribute("pageCode", pageCode);
		String mainPage="section.jsp";
		model.addAttribute("mainPage", mainPage);
		String crumb1="小板块管理";
		model.addAttribute("crumb1", crumb1);
		
		//************** 添加父级菜单自动展开样式	2019.09.11 miki
		model.addAttribute("ul", "forum");
		
		return "admin/main";
	}
                  
	   
	
	//上传logo文件保存方法实现
	@PostMapping("/admin/section/add")
	@ResponseBody
	public E3Result save(Section section,@RequestParam("logoFile") MultipartFile logoFile)throws Exception{
		if (logoFile != null && logoFile.getSize()>0) {
			
			//获取项目的static根路径  
	    	String staticPath = BootPathUtil.getStaticPath();
	    	if(logoFile.getSize()>600*1024*3) {
	    		return E3Result.build(401, "上传文件限制在3M以内哦");
	    	}
	    	String logoFileName = logoFile.getOriginalFilename();
			String imageName=DateUtil.getCurrentDateStr();
			String realPath = staticPath +"/images/logo/"+Consts.SDF_YYYYMM.format(new Date()); 
			String imageFile=imageName+"."+logoFileName.split("\\.")[1];
			
			File savePath=new File(realPath);
			if(!savePath.exists()) {
				savePath.mkdirs();
			}		
			InputStream is = logoFile.getInputStream();    	    
	          
	        File toFile = new File(realPath, imageFile);    
	        OutputStream os = new FileOutputStream(toFile);       
	        byte[] buffer = new byte[1024];       
	        int length = 0;    
	        while ((length = is.read(buffer)) > 0) {       
	            os.write(buffer, 0, length);       
	        }       
	        is.close();    
	        os.close();
			
			section.setLogo("images/logo/" +Consts.SDF_YYYYMM.format(new Date())+"/"+ imageFile);
		} else {
			section.setLogo("");
		}
		section.setId(section.getId());
		sectionService.saveSection(section);
		
		return E3Result.ok();
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
