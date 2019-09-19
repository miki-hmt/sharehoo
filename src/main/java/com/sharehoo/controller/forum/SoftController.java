package com.sharehoo.controller.forum;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sharehoo.config.lang.Consts;
import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.forum.Soft;
import com.sharehoo.entity.forum.SoftSection;
import com.sharehoo.service.forum.SoftSectionService;
import com.sharehoo.service.forum.SoftService;
import com.sharehoo.util.BootPathUtil;
import com.sharehoo.util.CxCacheUtil;
import com.sharehoo.util.forum.DateUtil;
import com.sharehoo.util.forum.E3Result;
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
	@ResponseBody
	public E3Result delete2(@PathVariable("softId") int softId)throws Exception{
		Soft soft=softService.findSoftById(softId);
		softService.deleteSoft(soft);
		
		return E3Result.ok();    //原来为null,strust.xml里的通配符匹配，会自动跳转到Topic_list.action
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
	
	/**
	* @Title: save1  
	* @Description: TODO(软件修改)  
	* @author miki 
	* @date 2019年9月12日 下午9:56:25   
	* @throws
	 */
	@RequestMapping("/admin/soft/update")
	@ResponseBody
	public E3Result save1(HttpServletRequest request,Soft soft)throws Exception{
		
		Soft old = softService.findSoftById(soft.getId());
		if(null!=old) {
			soft.setLogo(old.getLogo());
			soft.setPublishDate(old.getPublishDate());
			
			softService.saveSoft(soft);
			return E3Result.ok();	
		}
			
		return E3Result.build(401, "更新失败..");	
	}
	
	/**
	* @Title: save  
	* @Description: TODO(添加软件)  
	* @author miki 
	* @date 2019年9月12日 下午10:05:04   
	* @throws
	 */
	@RequestMapping("/admin/soft/add")
	@ResponseBody
	public E3Result save(@RequestParam("slogo") MultipartFile logo,@RequestBody Soft soft){	
		try {
			if (logo!=null) {		
				 //获取项目的static根路径  
		    	String staticPath = BootPathUtil.getStaticPath();
			
				String imageName=DateUtil.getCurrentDateStr();
				String realPath = staticPath +"/images/soft/"+Consts.SDF_YYYYMM.format(new Date());  

				String imageFile=imageName+"."+logo.getOriginalFilename().split("\\.")[1];
				File savePath=new File(realPath);
				if(!savePath.exists()) {
					savePath.mkdirs();
				}			
				InputStream is = logo.getInputStream();    	    
		          
		        File toFile = new File(realPath, imageFile);    
		        OutputStream os = new FileOutputStream(toFile);       
		        byte[] buffer = new byte[1024];       
		        int length = 0;    
		        while ((length = is.read(buffer)) > 0) {       
		            os.write(buffer, 0, length);       
		        }       
		        is.close();    
		        os.close();
				
				soft.setLogo("images/soft/"+Consts.SDF_YYYYMM.format(new Date()) +"/"+imageFile);//原来为"images/user/"   2017.04.12
			}else{
				soft.setLogo("images/soft/timg1.jpg");
			}
			soft.setPublishDate(new Date());
			softService.saveSoft(soft);
		} catch (Exception e) {
			return E3Result.build(401, "软件资源添加失败..",e.getMessage());
		}	
		
		return E3Result.ok();	
	}
	
	
	/**
	 * miki
	 * 2017.04.04
	 * @return
	 * @throws Exception
	 *遍历soft表
	 */
	@RequestMapping("/admin/soft/list")	
	public String list(@RequestParam(value="page",required=false) String page,Model model,HttpServletRequest request)throws Exception{

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
		String pageCode=PageUtil.genPagination(request.getContextPath()+"/admin/soft/list", total, Integer.parseInt(page), 10,null);
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
	@RequestMapping("/softsection/detail/{sectionId}")	
	public String listpr(HttpServletRequest request,@RequestParam(value="page",required=false) String page,@PathVariable("sectionId") int sectionId,Model model)throws Exception{
								
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
		String pageCode=PageUtil.genPagination(request.getContextPath()+"/softsection/detail/"+sectionId, total, Integer.parseInt(page), 10,null);
		model.addAttribute("pageCode", pageCode);
		return "soft/sectionDetail";
	}
	
	@RequestMapping("/soft/detail/{softId}")	
	public String softDetail(HttpServletRequest request,@RequestParam(value="page",required=false) String page,@PathVariable("softId") int softId,Model model)throws Exception{
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
