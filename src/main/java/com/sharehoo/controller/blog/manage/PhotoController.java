package com.sharehoo.controller.blog.manage;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.sharehoo.config.SessionUtil;
import com.sharehoo.config.annotation.HasLogin;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sharehoo.config.lang.Consts;
import com.sharehoo.entity.forum.Album;
import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.forum.Photo;
import com.sharehoo.entity.forum.User;
import com.sharehoo.service.forum.AlbumService;
import com.sharehoo.service.forum.PhotoService;
import com.sharehoo.service.forum.UserService;
import com.sharehoo.util.BootPathUtil;
import com.sharehoo.util.forum.DateUtil;
import com.sharehoo.util.forum.E3Result;
import com.sharehoo.util.forum.IOUtils;
import com.sharehoo.util.forum.PageUtil;
import com.sharehoo.util.forum.StringUtil;

@Controller
public class PhotoController {
	@Autowired
	private PhotoService photoService;
	@Autowired
	private AlbumService albumService;
	@Autowired
	private UserService userService;
	/**
	* @Title: add  
	* @Description: TODO(跳转到添加照片页面)  
	* @author miki 
	* @date 2019年9月2日 下午6:43:31   
	* @throws
	 */
	@HasLogin(value="相册管理")
	@RequestMapping("/blog/manage/ablum/go")
	public String add(HttpServletRequest request,Model model,@RequestParam("aid") int aid)throws Exception{

		User user = SessionUtil.getUser();
		model.addAttribute("user", user);

		if(aid>0){
			Album album=albumService.getAlbumById(aid);
			model.addAttribute("album", album);
		}
		return "blog/manage/album_photo_add";
	}
	
	/*
	 * miki	2017.06.05	添加照片
	 */
	@RequestMapping("/blog/manage/photo/add")
	@ResponseBody
	public E3Result save(HttpServletRequest request,@RequestParam(value="photoImage",required=false) MultipartFile image,
			@RequestParam("faceFileName") String faceFileName,Photo photo)throws Exception{

		User user = SessionUtil.getUser();
		if(null==user) {
			return E3Result.build(401, "请登录后，再保存..");
		}
		
		if (image!=null && image.getSize()>0) {			
			//获取项目的static根路径  
	    	String staticPath = BootPathUtil.getStaticPath();
	    	faceFileName = image.getOriginalFilename();
	    	
			String imageName=DateUtil.getCurrentDateStr();
			String realPath = staticPath +"/image_upload/album/photo/"+Consts.SDF_YYYYMM.format(new Date()); 
			String imageFile=imageName+"."+faceFileName.split("\\.")[1];
			
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
						
			photo.setImage("image_upload/album/photo/"+Consts.SDF_YYYYMM.format(new Date())+"/"+imageFile);//原来为"images/user/"   2016.10.12
		}else{
			photo.setImage("images/user/timg1.jpg");
		}
		photo.setTime(new Date());
		photo.setNotice("1");
		photoService.save(photo);
		user.setScore(user.getScore()+2);
		userService.saveUser(user);
		
		return E3Result.ok();
	}
	
	/*
	 * miki	2017.06.05	后台显示照片列表
	 */
	@HasLogin(value="相片管理")
	@RequestMapping("/blog/manage/photo/list")
	public String list(HttpServletRequest request,Model model,@RequestParam("aid") int aid)throws Exception{

		User user = SessionUtil.getUser();
		model.addAttribute("user", user);
		if(aid>0){
			List<Photo> photoList=photoService.getPhotosByAlbumId(aid);
			model.addAttribute("photoList", photoList);
		}
		return "blog/manage/album_detail";
	}
	
	/*
	 * miki	2017.06.05	文件列表 跳转到file_list.jsp
	  */
	@HasLogin
	@RequestMapping("/blog/manage/file")
	public String file(HttpServletRequest request,Model model,
			@RequestParam(value="page",required=false) String page)throws Exception{

		User user = SessionUtil.getUser();
		if(StringUtil.isEmpty(page)){
				page="1";
			}
			PageBean pageBean=new PageBean(Integer.parseInt(page), 16);
			List<Photo> fileList=photoService.getFileListByUserId(user.getId(), pageBean);
			model.addAttribute("fileList", fileList);
			long total=photoService.getFileCountByUserId(user.getId());
			String pageCode=PageUtil.genPagination(request.getContextPath()+"/blog/manage/file/list", total, Integer.parseInt(page), 16,null);
			model.addAttribute("pageCode", pageCode);
			
		return "blog/manage/file_list";
	}
	
	/*
	 * miki	2017.06.05	添加文件 跳转到file_list.jsp
	  */
	@HasLogin
	@RequestMapping("/blog/manage/file/go")
	public String addFile(HttpServletRequest request,Model model)throws Exception{
		User user = SessionUtil.getUser();
		if(null==user) {
			return "error";
		}
		return "blog/manage/file_add";
	}
	
	
	@RequestMapping("/blog/manage/file/add")
	@ResponseBody
	public E3Result saveFile(HttpServletRequest request,@RequestParam("aid") int aid,@RequestParam(value="photoFile",required=false) MultipartFile file,
			@RequestParam("faceFileName") String faceFileName,Photo photo){

		User user = SessionUtil.getUser();
		try {
			if(null!=file && file.getSize()>0) {
				//获取项目的static根路径  
		    	String staticPath = BootPathUtil.getStaticPath();
		    	if(file.getSize()>600*1024*3) {
		    		return E3Result.build(401, "上传文件限制在3M以内哦");
		    	}
				String imageName=DateUtil.getCurrentDateStr();
				String realPath = staticPath +"/image_upload/file/"+Consts.SDF_YYYYMM.format(new Date()); 
				String imageFile=imageName+"."+file.getOriginalFilename().split("\\.")[1];
				
				File savePath=new File(realPath);
				if(!savePath.exists()) {
					savePath.mkdirs();
				}		
				InputStream is = file.getInputStream();    	    
		          
		        File toFile = new File(realPath, imageFile);    
		        OutputStream os = new FileOutputStream(toFile);       
		        byte[] buffer = new byte[1024];       
		        int length = 0;    
		        while ((length = is.read(buffer)) > 0) {       
		            os.write(buffer, 0, length);       
		        }       
		        is.close();    
		        os.close();
		        photo.setImage(imageFile);
				photo.setUser(user);
				photo.setNotice("2");
				photo.setTime(new Date());
				photoService.save(photo);
				user.setScore(user.getScore()+2);
				userService.saveUser(user);
			}
		} catch (Exception e) {
			return E3Result.build(401, "收藏上传失败..",e.getMessage());
		}
		
		return E3Result.ok();
	}

	@HasLogin
	@RequestMapping("/blog/manage/file/delete")
	@ResponseBody
	public E3Result deleteFile(@RequestParam("id") int id)throws Exception{
		if(id>0){
			Photo photo=photoService.getPhotoById(id);
			if(null!=photo) {
				photoService.delete(photo);
			}			
		}else {
			return E3Result.build(401, "文件删除异常...");
		}
		return E3Result.ok();
	}
}
