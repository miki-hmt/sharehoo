package com.sharehoo.controller.shop.manage;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sharehoo.config.lang.Consts;
import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.forum.User;
import com.sharehoo.entity.shop.NewsBanner;
import com.sharehoo.service.forum.NewsBannerService;
import com.sharehoo.util.BootPathUtil;
import com.sharehoo.util.forum.DateUtil;
import com.sharehoo.util.forum.E3Result;
import com.sharehoo.util.forum.PageUtil;
import com.sharehoo.util.forum.StringUtil;

@Controller
public class NewsBannerController {
	
	@Autowired
	private NewsBannerService newsBannerService;
	
	@RequestMapping("/admin/newsBanner/save")
	@ResponseBody
	public E3Result save(HttpServletRequest request,@RequestParam(value="image",required=false) MultipartFile image,NewsBanner banner )throws Exception{
		HttpSession sessiom=request.getSession();
		User user=(User)sessiom.getAttribute(Consts.CURRENTUSER);
		if (user!=null&&user.getType()==2) {	
			if (image!=null && image.getSize()>0) {
				
				 //获取项目的static根路径  
		    	String staticPath = BootPathUtil.getStaticPath();
			
				String imageName=DateUtil.getCurrentDateStr();
				String realPath = staticPath +"/images/shop/banner/"+Consts.SDF_YYYYMM.format(new Date());
				
				String imageFile=imageName+"."+image.getOriginalFilename().split("\\.")[1];
				File savePath=new File(realPath);
				if(!savePath.exists()) {
					savePath.mkdirs();
				}
				
				InputStream is = image.getInputStream();    	    
		          
		        File toFile = new File(realPath, imageFile);    
		        OutputStream os = new FileOutputStream(toFile);       
		        byte[] buffer = new byte[1024];       
		        int length = 0;    
		        while ((length = is.read(buffer)) > 0) {       
		            os.write(buffer, 0, length);       
		        }       
		        is.close();    
		        os.close();
				banner.setNews_img("images/shop/banner/"+Consts.SDF_YYYYMM.format(new Date()) + "/" +imageFile);//原来为"images/user/"   2016.10.12
			}else{
				banner.setNews_img("images/article/timg1.jpg");
			}
			banner.setNews_time(new Date());
			newsBannerService.saveNewsBanner(banner);
			return E3Result.ok();
		}else{
			String error="我已经记录你的ip了，再乱来，你就死定了！";
			return E3Result.build(401, error);
		}
	}
	
	@RequestMapping("/admin/newsBanner/update")
	@ResponseBody
	public E3Result update(HttpServletRequest request,@RequestParam(value="bannerId",required=false) int bannerId,NewsBanner banner )throws Exception{

		if(bannerId>0){
			NewsBanner banner1=newsBannerService.getNewsBannerById(bannerId);
			banner.setNews_img(banner1.getNews_img());
		}
		banner.setNews_time(new Date());
		newsBannerService.saveNewsBanner(banner);
		
		return E3Result.ok();
	}
	
	@RequestMapping("/admin/newsBanner")
	public String listAdmin(HttpServletRequest request,Model model,@RequestParam("page") String page)throws Exception{
		HttpSession sessiom=request.getSession();
		User user=(User)sessiom.getAttribute(Consts.CURRENTUSER);
		model.addAttribute("user", user);
		if (user!=null&&user.getType()==2) {
			if (StringUtil.isEmpty(page)) {
				page="1";
			}
			PageBean pageBean=new PageBean(Integer.parseInt(page), 6);
			List<NewsBanner> bannerList=newsBannerService.getAllBanners(pageBean);
			model.addAttribute("bannerList", bannerList);
			long total=newsBannerService.getCount();
			String pageCode=PageUtil.genPagination(request.getContextPath()+"/admin/newsBanner", total, Integer.parseInt(page), 6,null);
			model.addAttribute("pageCode", pageCode);
			
			//2020.08.15 miki 移除旧版本代码
			/*String mainPage="shop_banner.jsp";
			model.addAttribute("mainPage", mainPage);
			String crumb1="小板块管理";
			model.addAttribute("crumb1", crumb1);		
			//************** 添加父级菜单自动展开样式	2019.09.11 miki
			model.addAttribute("ul", "download");*/
			
			return "admin/shop_banner";
		}else {
			String error="系统已记录你的ip，再乱来你就死定了！";
			model.addAttribute("error", error);
			return "admin/login";
		}
	}
	
	/*
	 * 2017.08.19 miki 管理员执行删除操作
	 */
	@RequestMapping("/admin/newsBanner/delete")
	@ResponseBody
	public E3Result delete(HttpServletRequest request,Model model,@RequestParam("bannerId") int bannerId)throws Exception{

		HttpSession sessiom=request.getSession();
		User user=(User)sessiom.getAttribute(Consts.CURRENTUSER);
		if (user!=null&&user.getType()==2) {			
			if(bannerId>0){
				NewsBanner banner=newsBannerService.getNewsBannerById(bannerId);
				newsBannerService.deleteMessage(banner);
				return E3Result.ok();
			}
		}String error="我已经记录你的ip了，再乱来，你就死定了！";
		return E3Result.build(401, error);
	}
}
