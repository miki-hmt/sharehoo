package com.sharehoo.controller.shop.manage;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sharehoo.config.lang.Consts;
import com.sharehoo.dao.jedis.JedisClient;
import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.forum.User;
import com.sharehoo.entity.shop.Shop;
import com.sharehoo.entity.shop.Source;
import com.sharehoo.service.forum.UserService;
import com.sharehoo.service.shop.ShopService;
import com.sharehoo.service.shop.SourceService;
import com.sharehoo.util.BootPathUtil;
import com.sharehoo.util.CxCacheUtil;
import com.sharehoo.util.forum.DateUtil;
import com.sharehoo.util.forum.E3Result;
import com.sharehoo.util.forum.PageUtil;
import com.sharehoo.util.forum.StringUtil;

@Controller
public class SourceManageController {
	private static Logger logegr = Logger.getLogger(SourceManageController.class); 
	@Autowired
	private ShopService shopService;
	@Autowired
	private SourceService sourceService;
	@Autowired
	private UserService userService;
	@Autowired
	private JedisClient jedisClient;
	
	@RequestMapping("/shop/source/upload")
	@ResponseBody
	public E3Result upload(HttpServletRequest request,HttpServletResponse response,Source source,
			@RequestParam(value="upload",required=false) MultipartFile upload){

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute(Consts.CURRENTUSER);
		try {
			if (user == null) {
				request.getRequestDispatcher("error.jsp").forward(request, response);
			}
			Shop shop = shopService.getShopByuserId(user.getId());
			source.setUpload_time(new Date());
			if(null!=upload) {
				
				//long total = upload.getSize();
				//*************** 记录上传文件的总大小
				//CxCacheUtil.getIntance().setValue("total_"+shop.getId(), total);
				System.out.println("开始统计文件总大小："+upload.getSize()+"---开始时间："+System.currentTimeMillis());
				 //获取项目的static根路径  
		    	String staticPath = BootPathUtil.getStaticPath();	
				String realPath = staticPath +Consts.SHOP_UPLOAD_PATH +"/file/"+Consts.SDF_YYYYMM.format(new Date());
				// 2017.08.05 miki 文件二次命名，作为下载url链接，采用uuid加密命名，并截取2-18位字符，二次加密，增加安全性
				String[] split = upload.getOriginalFilename().split("\\.");
				String imageName = "";
				//************** 2019.10.10 解决文件名出现多个.的情况
				if(split.length>2) {
					imageName = "file_" + DateUtil.getCurrentDateStr() +"."+ split[split.length-1];
				}else {
					imageName = "file_" + DateUtil.getCurrentDateStr() +"."+ split[1];
				}			
				File savePath=new File(realPath);
				if(!savePath.exists()) {
					savePath.mkdirs();
				}
				
				InputStream is = upload.getInputStream();    	    	          
		        File toFile = new File(realPath, imageName);    
		        OutputStream os = new FileOutputStream(toFile);       
		        byte[] buffer = new byte[1024];       
		        int length = 0;
		        //Long progress = 0L;		//进度条
		        
		        while ((length = is.read(buffer)) > 0) {       
		            os.write(buffer, 0, length);
//		            progress += length;
//		            CxCacheUtil.getIntance().setValue("progress_"+shop.getId(), progress);           
		        }       
		        is.close();    
		        os.close();
		        		   		        
		        source.setPath(Consts.SDF_YYYYMM.format(new Date())+"/"+imageName);
			}
			source.setUser(user);
			source.setShop(shop);
			sourceService.save(source);
			user.setScore(user.getScore() + 5);
			shop.setSourceNum(shop.getSourceNum() + 1);

			shopService.save(shop);
			userService.saveUser(user);
			
			//清空redis 店铺tags缓存
			jedisClient.hdel(Consts.TAGS+shop.getId(), shop.getId()+"");
			
		} catch (Exception e) {
			return E3Result.build(401, "资源发布失败..",e.getMessage());
		}
		
		return E3Result.ok();
	}
	
	
	/****************
	 * 2019.09.09	miki 注意：ajax异步上传文件，另外一个ajax获取进度条，
	 * 				这两个接口不能在同一个controller中，否则上传接口会阻塞另一个获取进度条的接口
	 * ***********************************************************************/
	/*@RequestMapping("/upload/status")
	@ResponseBody
	public String getProgress(@RequestParam("shopId") String shopId) {
		Object total = CxCacheUtil.getIntance().getValue("total_"+shopId);
		String value = "";
		if(null!=total) {
			Object progress = CxCacheUtil.getIntance().getValue("progress_"+shopId);
			//创造json格式参数
			value ="var info={read:"+progress+",total:"+total+",items:"+1+"}";		//items:"+arg2+"	d多文件上传的时候，使用arg2
			if(total.equals(progress)) {
				 // 清除上传过后的进度条session
				CxCacheUtil.getIntance().unSetValue("total_"+shopId);
				CxCacheUtil.getIntance().unSetValue("progress_"+shopId);
				System.out.println("缓存命中，被清理..");
			}
		}				
		return value;
		
	}*/
	
	/*
	 * 2017.08.21 miki 后台管理资源列表
	 */
	@RequestMapping("/admin/shop/source")
	public String list(HttpServletRequest request,@RequestParam(value="page",required=false) String page,Model model)throws Exception{
		HttpSession sessiom=request.getSession();
		User user=(User)sessiom.getAttribute(Consts.CURRENTUSER);
		model.addAttribute("user", user);
		if (user!=null&&user.getType()==2) {
			if (StringUtil.isEmpty(page)) {
				page="1";
			}
			PageBean pageBean=new PageBean(Integer.parseInt(page), 10);
			List<Source> sourceList=sourceService.allSourceList(pageBean);
			model.addAttribute("sourceList", sourceList);
			long total=sourceService.getAllCount();
			String pageCode=PageUtil.genPagination(request.getContextPath()+"/admin/shop/source", total, Integer.parseInt(page), 10,null);
			model.addAttribute("pageCode", pageCode);
		}else {
			String error="我已经记录你的ip了，再乱来，你就死定了！";
			model.addAttribute("error", error);
			return "admin/login";
		}
		String mainPage="shop_source.jsp";
		model.addAttribute("mainPage", mainPage);
		String crumb1="资源管理";
		model.addAttribute("crumb1", crumb1);
		
		//************** 添加父级菜单自动展开样式	2019.09.11 miki
		model.addAttribute("ul", "download");
		return "admin/main";
	} 
	
	
	/*
	 * 2017.08.19 miki 后台修改店铺方法实现
	 */
	@RequestMapping("/admin/shop/sourceSave")
	@ResponseBody
	public E3Result saveSource(HttpServletRequest request,@RequestParam(value="sourceId",required=false) int sourceId,Source source)throws Exception{

		HttpSession sessiom=request.getSession();
		User user=(User)sessiom.getAttribute(Consts.CURRENTUSER);
		if (user!=null&&user.getType()==2) {
			if(sourceId>0){
				Source source1=sourceService.getSourceById(sourceId);
				source.setUpload_time(source1.getUpload_time());
				source.setShop(source1.getShop());
				source.setUser(source1.getUser());
				source.setCategory(source1.getCategory());
				source.setPath(source1.getPath());
				source.setType(source1.getType());
				source.setMenu(source1.getMenu());
				source.setDescription(source1.getDescription());
				source.setDownNum(source1.getDownNum());
				sourceService.save(source);
				
				return E3Result.ok();
			}
		}
		return E3Result.build(401, "修改失败！！");
	}
	
	/*
	 * 2017.08.19 miki 管理员执行删除操作
	 */
	@RequestMapping("/admin/shop/sourceDelete")
	@ResponseBody
	public E3Result delete(HttpServletRequest request,@RequestParam(value="sourceId",required=false) int sourceId)throws Exception{

		HttpSession sessiom=request.getSession();
		User user=(User)sessiom.getAttribute(Consts.CURRENTUSER);
		if (user!=null&&user.getType()==2) {		
			if(sourceId>0){
				Source source=sourceService.getSourceById(sourceId);
				sourceService.delete(source);
				
				return E3Result.ok();
			}
		}
		return E3Result.build(401, "请登录后再操作..");
	}
}
