package com.sharehoo.controller.forum;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sharehoo.config.lang.Consts;
import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.forum.Soft;
import com.sharehoo.entity.forum.SoftSection;
import com.sharehoo.service.forum.SoftSectionService;
import com.sharehoo.service.forum.SoftService;
import com.sharehoo.util.CxCacheUtil;
import com.sharehoo.util.forum.DateUtil;
import com.sharehoo.util.forum.PageUtil;
import com.sharehoo.util.forum.StringUtil;

import net.sf.json.JSONObject;

@Controller
public class SoftController {
	
	@Autowired
	private SoftService softService;
	@Autowired SoftSectionService softSectionService;
	//后台soft.jsp页面删除功能实现
	@RequestMapping("/admin/soft/delete/{softId}")
	public String delete2(@PathVariable("softId") int softId,Model model)throws Exception{
		JSONObject result=new JSONObject();
		Soft soft=softService.findSoftById(softId);
		softService.deleteSoft(soft);
		result.put("success", true);
		//ResponseUtil.write(ServletActionContext.getResponse(), result);
		String mainPage="source.jsp";
		model.addAttribute("mainPage", mainPage);
		return "admin/main";    //原来为null,strust.xml里的通配符匹配，会自动跳转到Topic_list.action
	}
	
	@RequestMapping("/admin/soft/update/{softId}")
	public String update(HttpServletRequest request,@PathVariable("softId") int softId,Model model)throws Exception{
		Soft soft=softService.findSoftById(softId);
		model.addAttribute("soft", soft);
		SoftSection softSection=soft.getSoftSection();
		model.addAttribute("softSection", softSection);
		List<SoftSection> softSectionList=softSectionService.findSoftSectionsList(null, null);
		model.addAttribute("softSectionList", softSectionList);
		String mainPage="updateSoft.jsp";
		model.addAttribute("mainPage", mainPage);
		String crumb1="软件修改";
		model.addAttribute("crumb1", crumb1);
		return "admin/main";
	}
	
	
	
	@RequestMapping("/admin/soft/upload")
	public String upload(Model model)throws Exception{
		List<SoftSection> softSectionList=softSectionService.findSoftSectionsList(null, null);
		model.addAttribute("softSectionList", softSectionList);
		String mainPage="addSoft.jsp";
		model.addAttribute("mainPage", mainPage);
		String crumb1="资源上传";
		model.addAttribute("crumb1", crumb1);
		return "admin/main";
	}
	
	@RequestMapping("/admin/soft/update")
	public String save1(@RequestParam("logo") File logo,@PathVariable("logoFileName") String logoFileName,@RequestBody Soft soft,
			Model model)throws Exception{
		
		if (logo!=null) {
			String imageName=DateUtil.getCurrentDateStr();
			String basePath = (String)CxCacheUtil.getIntance().getValue(Consts.ROOT_PATH);
			String realPath = basePath + Consts.FORUM_UPLOAD_PATH + Consts.FORUM_UPLOAD_SOFT_FOLDER +"/"+
					Consts.SDF_YYYYMM.format(new Date()) +"/images/soft/";
			String imageFile=imageName+"."+logoFileName.split("\\.")[1];
			File saveFile=new File(realPath,imageFile);
			FileUtils.copyFile(logo, saveFile);
			soft.setLogo("images/soft/"+imageFile);//原来为"images/user/"   2017.04.12
		}else{
			soft.setLogo("images/soft/timg1.jpg");
		}		
		softService.saveSoft(soft);	
		String mainPage="updateSoft.jsp";
		model.addAttribute("mainPage", mainPage);
		String crumb1="资源上传";
		model.addAttribute("crumb1", crumb1);
		return "admin/main";	
	}
	
	
	@RequestMapping("/admin/soft/add")	
	public String save(@RequestParam("logo") File logo,@PathVariable("logoFileName") String logoFileName,@RequestBody Soft soft,
			Model model)throws Exception{
		
		if (logo!=null) {
			String imageName=DateUtil.getCurrentDateStr();
			String basePath = (String)CxCacheUtil.getIntance().getValue(Consts.ROOT_PATH);
			String realPath = basePath + Consts.FORUM_UPLOAD_PATH + Consts.FORUM_UPLOAD_SOFT_FOLDER +"/"+
					Consts.SDF_YYYYMM.format(new Date())+"/images/soft/";
			//String realPath=ServletActionContext.getServletContext().getRealPath("/images/soft/");
			String imageFile=imageName+"."+logoFileName.split("\\.")[1];
			File saveFile=new File(realPath,imageFile);
			FileUtils.copyFile(logo, saveFile);
			soft.setLogo("images/soft/"+imageFile);//原来为"images/user/"   2017.04.12
		}else{
			soft.setLogo("images/soft/timg1.jpg");
		}
		soft.setPublishDate(new Date());
		softService.saveSoft(soft);	
		String mainPage="addSoft.jsp";
		model.addAttribute("mainPage", mainPage);
		String crumb1="资源上传";
		model.addAttribute("crumb1", crumb1);
		return "admin/main";	
	}
	
	
	/**
	 * miki
	 * 2017.04.04
	 * @return
	 * @throws Exception
	 *遍历soft表
	 */
	@RequestMapping("/admin/soft/list")	
	public String list(@PathVariable("page") String page,Model model,HttpServletRequest request)throws Exception{

		if (StringUtil.isEmpty(page)) {
			page="1";
		}
					
		PageBean pageBean=new PageBean(Integer.parseInt(page), 10);
		List<Soft> softList=softService.findSoftList(null, pageBean);
		model.addAttribute("softList", softList);
		
		List<SoftSection> softSectionList=softSectionService.findSoftSectionsList(null, pageBean);
		model.addAttribute("softSectionList", softSectionList);
		
		long total=softService.getSoftCount(null);
		model.addAttribute("total", total);
		String pageCode=PageUtil.genPagination(request.getContextPath()+"/admin/Soft_list.action", total, Integer.parseInt(page), 10,null);
		model.addAttribute("pageCode", pageCode);
		String mainPage="soft.jsp";
		model.addAttribute("mainPage", mainPage);
		String crumb1="小板块管理";
		model.addAttribute("crumb1", crumb1);
		return "admin/main";
	}
	
	/**
	 * miki
	 * 2017.04.09
	 * @return
	 * @throws Exception
	 * 根据softId获取当前soft，然后获取列表，实现sectionDetail.jsp的数据遍历
	 */
	@RequestMapping("/softsection/detail")	
	public String listpr(HttpServletRequest request,@PathVariable("page") String page,@PathVariable("sectionId") int sectionId,Model model)throws Exception{
								
		if (StringUtil.isEmpty(page)) {
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page),10);
		PageBean pageBean1=new PageBean(Integer.parseInt(page),9);
		PageBean pageBean2=new PageBean(Integer.parseInt(page),16);
		SoftSection softSection=softSectionService.findSoftSectionById(sectionId);
		model.addAttribute("softSection", softSection);
		List<Soft> softList=softService.findSoftListBySoftSectionId(sectionId, pageBean);
		model.addAttribute("softList", softList);
		List<Soft> goodSoftList=softService.goodListBySoftSectionId(sectionId, pageBean1);
		model.addAttribute("goodSoftList", goodSoftList);
		List<Soft> hotSoftList=softService.hotListByHot(1, pageBean2);
		model.addAttribute("hotSoftList", hotSoftList);
		long total=softService.getSoftCountBySoftSectionId(sectionId);
		String pageCode=PageUtil.genPagination(request.getContextPath()+"/Soft_listpr.action", total, Integer.parseInt(page), 10,null);
		model.addAttribute("pageCode", pageCode);
		return "soft/sectionDetail";
	}
	
	@RequestMapping("/soft/detail")	
	public String softDetail(HttpServletRequest request,@PathVariable("page") String page,@PathVariable("softId") int softId,Model model)throws Exception{
		if (StringUtil.isEmpty(page)) {
			page="1";
		}
		PageBean pageBean2=new PageBean(Integer.parseInt(page),16);
		Soft soft=softService.findSoftById(softId);
		model.addAttribute("soft", soft);
		List<Soft> hotSoftList=softService.hotListByHot(1, pageBean2);
		model.addAttribute("hotSoftList", hotSoftList);
		System.out.println(softId);
		return "soft/softDetail";
	}
}
