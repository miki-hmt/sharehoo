package com.sharehoo.controller.blog;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
import com.sharehoo.service.forum.UserService;
import com.sharehoo.util.forum.PageUtil;
import com.sharehoo.util.forum.StringUtil;

@Controller
public class AlbumController {
	@Autowired
	private UserService userService;
	@Autowired
	private AlbumService albumService;
	@Autowired
	private ArticleService articleService;
	@Autowired
	private CritiqueService critiqueService;
	@Autowired
	private PhotoService photoService;
	/*
	 * miki
	 * 2017.06.04
	 * 得到相册列表
	 */
	@RequestMapping("/blog/{nicknameId}/album")
	public String list(@PathVariable(value="nicknameId",required=true)String nicknameId, @RequestParam(value="page",required=false) String page, Model model,
					   HttpServletRequest request, HttpServletResponse response)throws Exception{
		if(StringUtil.isNotEmpty(nicknameId)){
			User user=userService.getUserByNickNameId(nicknameId);
			if(user == null) {
				request.getRequestDispatcher("/errorlogin").forward(request, response);
			}

			model.addAttribute("user", user);
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
			
			List<Critique> phCritiques=critiqueService.getPhListByUserId(user.getId());
			model.addAttribute("phCritiques", phCritiques);
		}
		return "blog/album";
	}
			
	/*
	 * miki	2017.06.05 图片列表
	 */
	@RequestMapping("/blog/{nicknameId}/album/details/{aid}")
	public String photo(@PathVariable("aid") int aid,Model model)throws Exception{
		if(aid>0){
			Album album=albumService.getAlbumById(aid);
			model.addAttribute("album", album);
			User user=album.getUser();
			model.addAttribute("user", user);
			List<Photo> photoList=photoService.getPhotosByAlbumId(aid);
			model.addAttribute("photoList", photoList);
		}
		return "blog/album_detail";
	}
	
	/*
	 * miki	2017.06.05	文件列表
	 * */
	@RequestMapping("/blog/{nicknameId}/file")
	public String file(@PathVariable(value="nicknameId",required=true)String nicknameId,Model model,@RequestParam(value="page",required=false)String page,
			HttpServletRequest request, HttpServletResponse response)throws Exception{
		if(StringUtil.isNotEmpty(nicknameId)){
			User user=userService.getUserByNickNameId(nicknameId);

			if(user == null) {
				request.getRequestDispatcher("/errorlogin").forward(request, response);
			}
			model.addAttribute("user",user);
			if(StringUtil.isEmpty(page)){
				page="1";
			}
			PageBean pageBean=new PageBean(Integer.parseInt(page), 16);
			List<Photo> fileList=photoService.getFileListByUserId(user.getId(), pageBean);
			model.addAttribute("fileList",fileList);
			long total=photoService.getFileCountByUserId(user.getId());
			String pageCode=PageUtil.genPagination(request.getContextPath()+"/blog/"+nicknameId+"/file", total, Integer.parseInt(page), 16,null);
			model.addAttribute("pageCode",pageCode);
		}
		return "blog/file_list";
	}
}
