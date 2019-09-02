package com.sharehoo.controller.blog.manage;

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
import com.sharehoo.entity.forum.Album;
import com.sharehoo.entity.forum.Article;
import com.sharehoo.entity.forum.Critique;
import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.forum.Photo;
import com.sharehoo.entity.forum.User;
import com.sharehoo.service.forum.AlbumService;
import com.sharehoo.service.forum.ArticleService;
import com.sharehoo.service.forum.CritiqueService;
import com.sharehoo.service.forum.PhotoService;
import com.sharehoo.util.BootPathUtil;
import com.sharehoo.util.forum.DateUtil;
import com.sharehoo.util.forum.E3Result;
import com.sharehoo.util.forum.StringUtil;

@Controller
public class AlbumManageController {
	@Autowired
	private AlbumService albumService;
	@Autowired 
	private ArticleService articleService;
	@Autowired 
	private CritiqueService critiqueService;
	@Autowired
	private PhotoService photoService;
	
	@RequestMapping("/blog/manage/album/add")
	@ResponseBody
	public E3Result save(HttpServletRequest request,@RequestParam("aid") int aid,@RequestParam(value="photoFile",required=false) MultipartFile file,
			@RequestParam("faceFileName") String faceFileName,Album album){
		
		try {
			if(null!=file) {
				//获取项目的static根路径  
		    	String staticPath = BootPathUtil.getStaticPath();
		    	if(file.getSize()>600*1024*3) {
		    		return E3Result.build(401, "上传文件限制在3M以内哦");
		    	}
				String imageName=DateUtil.getCurrentDateStr();
				String realPath = staticPath +"/image_upload/file/"+Consts.SDF_YYYYMM.format(new Date()); 
				String imageFile=imageName+"."+faceFileName.split("\\.")[1];
				
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
		        album.setImage("image_upload/album/"+imageFile);//原来为"images/user/"   2016.10.12
			}else {
				album.setImage("images/user/timg1.jpg");
			}
			
			album.setTime(new Date());
			albumService.save(album);
		} catch (Exception e) {
			return E3Result.build(401, "相册添加失败...",e.getMessage());
		}	
		
		return E3Result.ok();
	}
	
	/*
	 * miki
	 * 2017.06.03
	 * 得到相册列表
	 */
	@RequestMapping("/blog/manage/album/list")
	public String list(HttpServletRequest request,Model model,@RequestParam(value="page",required=false) String page)throws Exception{
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute(Consts.CURRENTUSER);
			if(StringUtil.isEmpty(page)){
				page="1";
			}
			PageBean pageBean=new PageBean(Integer.parseInt(page), 20);
			List<Album> albumList=albumService.getAlbumListByUserId(user.getId(), pageBean);
			model.addAttribute("albumList", albumList);
			List<Article> countList=articleService.getHotByUserId(user.getId());
			model.addAttribute("countList", countList);
			List<Article> recommendList=articleService.getRecommendsByUserId(user.getId());
			model.addAttribute("recommendList", recommendList);
			List<Critique> critiques=critiqueService.getPhListByUserId(user.getId());
			model.addAttribute("critiques", critiques);
			return "blog/manage/album_manage";
	}
	
	@RequestMapping("/blog/manage/album/delete")
	@ResponseBody
	public E3Result delete(HttpServletRequest request,@RequestParam(value="aid",required=false) int aid)throws Exception{
		
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute(Consts.CURRENTUSER);
		if(user==null) {
			return E3Result.build(401, "请先登录再删除..");
		}
		if(aid>0){
			List<Photo> photoList=photoService.getPhotosByAlbumId(aid);
			if(photoList.size()>0){
				return E3Result.build(401, "请先删除相册里的照片..");
			}
			Album album=albumService.getAlbumById(aid);
			albumService.delete(album);
		}
		return E3Result.ok();
	}
	
	@RequestMapping("/blog/manage/album/detail")
	public String detail(HttpServletRequest request,@RequestParam(value="aid",required=false) int aid,Model model)throws Exception{
		
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute(Consts.CURRENTUSER);	
		model.addAttribute("user", user);
		if(aid>0){
		Album album=albumService.getAlbumById(aid);
		model.addAttribute("album", album);
		List<Photo> photoList=photoService.getPhotosByAlbumId(aid);
		model.addAttribute("photoList", photoList);
		}
		return "blog/manage/album_detail";
	}
	
	@RequestMapping("/blog/manage/album/go")
	public String add(HttpServletRequest request,Model model)throws Exception{
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute(Consts.CURRENTUSER);
		model.addAttribute("user", user);
		return "blog/manage/album_add";
	}
}
