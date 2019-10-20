package com.sharehoo.controller.shop.manage;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.sharehoo.entity.shop.Collect;
import com.sharehoo.entity.shop.Focus;
import com.sharehoo.entity.shop.Message;
import com.sharehoo.entity.shop.Operate;
import com.sharehoo.entity.shop.Shop;
import com.sharehoo.entity.shop.Source;
import com.sharehoo.service.LogService;
import com.sharehoo.service.MessageService;
import com.sharehoo.service.forum.CommentService;
import com.sharehoo.service.shop.CollectService;
import com.sharehoo.service.shop.FocusService;
import com.sharehoo.service.shop.OperateService;
import com.sharehoo.service.shop.ShopService;
import com.sharehoo.service.shop.SourceService;
import com.sharehoo.util.BootPathUtil;
import com.sharehoo.util.forum.DateUtil;
import com.sharehoo.util.forum.E3Result;
import com.sharehoo.util.forum.PageUtil;
import com.sharehoo.util.forum.StringUtil;

@Controller
public class ShopManageController {
	
	@Autowired
	private ShopService shopService;
	@Autowired
	private LogService logService;
	@Autowired
	private OperateService operateService;
	@Autowired
	private MessageService messageService;
	@Autowired
	private CommentService commentService;
	@Autowired
	private CollectService collectService;
	@Autowired
	private FocusService focusService;
	@Autowired
	private SourceService sourceService;
	
	@RequestMapping("/shop/admin/log")
	public String operatelog(HttpServletRequest request,Model model,@RequestParam(value="page",required=false) String page)throws Exception{
		HttpSession session=request.getSession();

		User user=(User) session.getAttribute(Consts.CURRENTUSER);
		model.addAttribute("user", user);
		if(user!=null){
			Shop shop=shopService.getShopByuserId(user.getId());
			if(shop==null){
				return "shop/5bug";
			}
			model.addAttribute("shop", shop);
			long dayVisit=logService.getLogCountByShopId(shop.getId());
			long allVisit=logService.getAllLogCountByShopId(shop.getId());
			model.addAttribute("DV", dayVisit);
			model.addAttribute("AV", allVisit);
			if (StringUtil.isEmpty(page)) {
				page="1";
			}
			PageBean pageBean=new PageBean(Integer.parseInt(page), 6);
			List<Operate> operateList=operateService.getOperatesByShopId(shop.getId(), pageBean);
			model.addAttribute("operateList", operateList);
			long total=operateService.getOperateCountByShopId(shop.getId());
			String pageCode=PageUtil.genPagination(request.getContextPath()+"/shop/admin/log", total,
					Integer.parseInt(page), 6,null);
			model.addAttribute("pageCode", pageCode);
			List<Message> messageList=messageService.getAdminMesList(shop.getId());
			model.addAttribute("messageList", messageList);
		}
		return "shop/manage/shop_huDou";
	}
	
	//店铺评价 	2017.08.11 miik
	@RequestMapping("/shop/admin/comment")
	public String comment(HttpServletRequest request,Model model)throws Exception{
		HttpSession session=request.getSession();
		
		User user=(User) session.getAttribute(Consts.CURRENTUSER);
		model.addAttribute("user", user);
		if(user!=null){
			Shop shop=shopService.getShopByuserId(user.getId());
			if(shop==null){
				return "bug";
			}
			long dayVisit=logService.getLogCountByShopId(shop.getId());
			long allVisit=logService.getAllLogCountByShopId(shop.getId());
			model.addAttribute("DV", dayVisit);
			model.addAttribute("AV", allVisit);
			long downTotal=commentService.getCountByShopId(shop.getId());	//店铺总评论数
			long goodComment=commentService.getGoodCommentCountByshopId(shop.getId());
			double percent=(double)goodComment/(double)downTotal;
			
			//精确小数位类，精确到两位小数
			 BigDecimal b = new BigDecimal(percent);  
		     double per = b.setScale(2,BigDecimal.ROUND_HALF_UP).doubleValue();
			//System.out.print("总评价："+downTotal+"好评人数"+goodComment+"好评率："+per);
		     model.addAttribute("totalComment", downTotal);
		     model.addAttribute("percent", per);
		     model.addAttribute("goodComment", goodComment);
			List<Message> messageList=messageService.getAdminMesList(shop.getId());
			model.addAttribute("messageList", messageList);
		}
		
		return "shop/manage/shop_comment";
	}
	
	//店铺收藏列表	2017.08.12 miki
	@RequestMapping("/shop/admin/collect")
	public String collect(HttpServletRequest request,Model model,@RequestParam(value="page",required=false) String page)throws Exception{
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute(Consts.CURRENTUSER);
		model.addAttribute("user", user);
		if(user!=null){
			Shop shop=shopService.getShopByuserId(user.getId());
			if(shop==null){
				return "shop/5bug";
			}
			model.addAttribute("shop", shop);
			long dayVisit=logService.getLogCountByShopId(shop.getId());
			long allVisit=logService.getAllLogCountByShopId(shop.getId());
			model.addAttribute("DV", dayVisit);
			model.addAttribute("AV", allVisit);
			if (StringUtil.isEmpty(page)) {
				page="1";
			}
			PageBean pageBean=new PageBean(Integer.parseInt(page), 6);
			List<Collect> collectList=collectService.getCollectsByUserId(user.getId(), pageBean);
			model.addAttribute("collectList", collectList);
			long total=collectService.getCountByuserId(user.getId());
			String pageCode=PageUtil.genPagination(request.getContextPath()+"/shop/admin/collect", total,
					Integer.parseInt(page), 6,null);
			model.addAttribute("pageCode", pageCode);
			List<Message> messageList=messageService.getAdminMesList(shop.getId());
			model.addAttribute("messageList", messageList);
		}
		return "shop/manage/shop_collect";
	}
	
	//店铺关注列表 2017.08.12 miki
	@RequestMapping("/shop/admin/focus")
	public String focus(HttpServletRequest request,Model model,@RequestParam(value="page",required=false) String page)throws Exception{
		HttpSession session=request.getSession();

		User user=(User) session.getAttribute(Consts.CURRENTUSER);
		if(user!=null){
			model.addAttribute("user", user);
			Shop shop=shopService.getShopByuserId(user.getId());
			if(shop==null){
				return "shop/5bug";
			}
			model.addAttribute("shop", shop);
			long dayVisit=logService.getLogCountByShopId(shop.getId());
			long allVisit=logService.getAllLogCountByShopId(shop.getId());
			model.addAttribute("DV", dayVisit);
			model.addAttribute("AV", allVisit);
			if (StringUtil.isEmpty(page)) {
				page="1";
			}
			PageBean pageBean=new PageBean(Integer.parseInt(page), 6);
			List<Focus> focusList=focusService.getFocusesByUserId(user.getId(), pageBean);
			model.addAttribute("focusList", focusList);
			/*
			 * 2017.08.12 miki 遍历focusList列表，分别选出每一个店铺的最新上架资源
			 */
			Source source = null;
			Map<Focus, Source> good=new HashMap<Focus, Source>();
			for (Focus focus : focusList) {
				//要用Source类new一个新的对象	  2017.08.12 miki
				source =sourceService.getnewSourceByShopId(focus.getShop().getId());
				good.put(focus, source);
			}
			model.addAttribute("good", good);
			long total=focusService.getFocusCountByUserId(user.getId());
			String pageCode=PageUtil.genPagination(request.getContextPath()+"/shop/admin/focus",
					total, Integer.parseInt(page), 6,null);
			model.addAttribute("pageCode", pageCode);
			List<Message> messageList=messageService.getAdminMesList(shop.getId());
			model.addAttribute("messageList", messageList);
		}	
		return "shop/manage/shop_focus";
	}
	
	@RequestMapping("/admin/shop")
	public String list(HttpServletRequest request,Model model,@RequestParam(value="page",required=false) String page)throws Exception{
		HttpSession sessiom=request.getSession();
		User user=(User)sessiom.getAttribute(Consts.CURRENTUSER);
		model.addAttribute("user", user);
		if (user!=null&&user.getType()==2) {
			if (StringUtil.isEmpty(page)) {
				page="1";
			}
			PageBean pageBean=new PageBean(Integer.parseInt(page), 7);
			List<Shop> shopList=shopService.allShops(pageBean);
			model.addAttribute("shopList", shopList);
			long total=shopService.getAllShopCount();
			String pageCode=PageUtil.genPagination(request.getContextPath()+"/admin/shop",
					total, Integer.parseInt(page), 7,null);
			model.addAttribute("pageCode", pageCode);
		}else {
			String error="系统已定位你的ip，再乱来你就死定了！";
			model.addAttribute("error", error);
			return "admin/login";
		}
		String mainPage="shoplist.jsp";
		model.addAttribute("mainPage", mainPage);
		String crumb1="店铺管理";
		model.addAttribute("crumb1", crumb1);
		//************** 添加父级菜单自动展开样式	2019.09.11 miki
		model.addAttribute("ul", "download");	
		
		return "admin/main";
	}
	
	/*
	 * 2017.08.19 miki 后台修改店铺方法实现
	 */
	@RequestMapping("/admin/shop/update")
	@ResponseBody
	public E3Result saveShop(HttpServletRequest request,@RequestParam(value="shopId",required=false) int shopId,Shop shop)throws Exception{
		HttpSession sessiom=request.getSession();
		User user=(User)sessiom.getAttribute(Consts.CURRENTUSER);
		if (user!=null&&user.getType()==2) {			
			if(shopId>0){
				Shop shop1=shopService.getShopById(shopId);
				shop.setFace(shop1.getFace());	//防止图片路径丢失，重新赋值
				shop.setUser(shop1.getUser());
				shop.setRegisterTime(shop1.getRegisterTime());
				shopService.save(shop);			
				return E3Result.ok();
			}
		}
		return E3Result.build(401, "请登录后，操作");
	}
	
	/*
	 * 2017.08.19 miki 管理员执行删除操作
	 */
	@RequestMapping("/admin/shop/delete")
	@ResponseBody
	public E3Result delete(HttpServletRequest request,@RequestParam(value="shopId",required=false) int shopId)throws Exception{
		HttpSession sessiom=request.getSession();
		User user=(User)sessiom.getAttribute(Consts.CURRENTUSER);
		if (user!=null&&user.getType()==2) {
			if(shopId>0){
				Shop shop=shopService.getShopById(shopId);
				shopService.delete(shop);
				return E3Result.ok();
			}
		}
		return E3Result.build(401, "请登录后，操作");
	}
	
	@RequestMapping("/shop/admin/update/go")
	public String update(HttpServletRequest request,Model model)throws Exception{
		HttpSession sessiom=request.getSession();
		User user=(User)sessiom.getAttribute(Consts.CURRENTUSER);
		if(user!=null){
			model.addAttribute("user", user);
			Shop shop=shopService.getShopByuserId(user.getId());
			model.addAttribute("shop", shop);
		}
		return "shop/manage/shop_update";
	}
	
	/*
	 * 2017.08.19 miki 前台用户修改店铺方法实现
	 */
	@RequestMapping("/shop/admin/update")
	@ResponseBody
	public E3Result save(HttpServletRequest request,@RequestParam(value="shopId",required=false) int shopId,Shop shop,
			@RequestParam(value="image",required=false) MultipartFile image)throws Exception{
		if(shopId>0){
			Shop shop1=shopService.getShopById(shopId);
			if (image!=null && image.getSize()>0) {
				
				 //获取项目的static根路径  
		    	String staticPath = BootPathUtil.getStaticPath();
			
				String imageName=DateUtil.getCurrentDateStr();
				String realPath = staticPath +"/images/shop/face/"+Consts.SDF_YYYYMM.format(new Date());  

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
				shop.setFace("images/shop/face/"+Consts.SDF_YYYYMM.format(new Date())+"/"+imageFile);	//原来为"images/user/"   2016.10.12
			}else{
				shop.setFace(shop1.getFace());
			}
			shop.setRegisterTime(shop1.getRegisterTime());
			shop.setDouNum(shop1.getDouNum());
			shop.setDownNum(shop1.getDownNum());
			shop.setId(shopId);
			shop.setMaxNum(shop1.getMaxNum());
			shop.setSourceNum(shop1.getSourceNum());
			shop.setStatus(shop1.getStatus());
			shop.setUser(shop1.getUser());
			shopService.save(shop);
			return E3Result.ok();
		}else{
			return E3Result.build(401, "保存失败");
		}
	}
}
