package com.sharehoo.controller.shop;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.Banner;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.code.kaptcha.Constants;
import com.sharehoo.base.ipseek.IpGet;
import com.sharehoo.base.ipseek.IpSeekUtils;
import com.sharehoo.config.lang.Consts;
import com.sharehoo.entity.forum.Notice;
import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.forum.User;
import com.sharehoo.entity.shop.Category;
import com.sharehoo.entity.shop.Focus;
import com.sharehoo.entity.shop.Log;
import com.sharehoo.entity.shop.Message;
import com.sharehoo.entity.shop.NewsBanner;
import com.sharehoo.entity.shop.Shop;
import com.sharehoo.entity.shop.Source;
import com.sharehoo.entity.shop.Type;
import com.sharehoo.service.LogService;
import com.sharehoo.service.MessageService;
import com.sharehoo.service.TypeService;
import com.sharehoo.service.forum.CategoryService;
import com.sharehoo.service.forum.NewsBannerService;
import com.sharehoo.service.forum.NoticeService;
import com.sharehoo.service.shop.FocusService;
import com.sharehoo.service.shop.ShopService;
import com.sharehoo.service.shop.SourceService;
import com.sharehoo.util.CxCacheUtil;
import com.sharehoo.util.forum.E3Result;
import com.sharehoo.util.forum.GaoDeUtil;
import com.sharehoo.util.forum.PageUtil;
import com.sharehoo.util.forum.StringUtil;

@Controller
public class ShopController {
	
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private TypeService typeService;
	@Autowired
	private NewsBannerService newsBannerService;
	@Autowired
	private SourceService sourceService;
	@Autowired
	private ShopService shopService;
	@Autowired
	private LogService logService;
	@Autowired
	private MessageService messageService;
	@Autowired
	private FocusService focusService;
	@Autowired
	private NoticeService noticeService;
	
	
	@RequestMapping("/shop/index.htm")
	public String home(Model model)throws Exception{
		List<Category> categories=categoryService.getCategoryList(null, null);
		model.addAttribute("categories", categories);
		List<Type> types=typeService.getTypeList();
		model.addAttribute("types", types);
		List<NewsBanner> bannerList=newsBannerService.findNewsBannerListByType();
		model.addAttribute("bannerList", bannerList);
		List<Source> goodList=sourceService.getGoodSources();
		model.addAttribute("goodList", goodList);
		List<Source> newSources=sourceService.getNewSources();
		model.addAttribute("newSources", newSources);
		List<Shop> richList=shopService.getRichShops();
		model.addAttribute("richList", richList);
		return "shop/home";
	}
	
	/****************
	 * 2019.09.09	miki 注意：ajax异步上传文件，另外一个ajax获取进度条，
	 * 				这两个接口不能在同一个controller中，否则上传接口会阻塞另一个获取进度条的接口
	 * ***********************************************************************/
	@RequestMapping("/shop/upload/status")
	@ResponseBody
	public String getProgress(@RequestParam("shopId") String shopId,@RequestParam("length") String length,HttpServletRequest request) {
		//System.out.println("缓存的key值："+"total_"+shopId);
		Object total = CxCacheUtil.getIntance().getValue("total_"+request.getSession().getId());
		String value = "";
		if(null!=total) {
			Object progress = CxCacheUtil.getIntance().getValue("progress_"+request.getSession().getId());
			//创造json格式参数
			value ="var info={read:"+progress+",total:"+total+",items:"+1+"}";		//items:"+arg2+"	d多文件上传的时候，使用arg2
			if(progress.equals(total)) {
				 // 清除上传过后的进度条session
		        System.out.println("上传完毕，准备清楚内存中的上传进度..."+"---结束时间："+System.currentTimeMillis());
				CxCacheUtil.getIntance().unSetValue("total_"+request.getSession().getId());
				CxCacheUtil.getIntance().unSetValue("progress_"+request.getSession().getId());
			}
		}else {
			Object read = CxCacheUtil.getIntance().getValue("read_"+request.getSession().getId());
			if(read!=null) {
				int readlength = Integer.parseInt(String.valueOf(read));
				if(readlength>=Integer.parseInt(length)) {
					value ="var info={read:"+length+",total:"+length+",items:"+1+"}";		//items:"+arg2+"	d多文件上传的时候，使用arg2
				}else {
					readlength =readlength + 100*1024;
					value ="var info={read:"+readlength+",total:"+length+",items:"+1+"}";		//items:"+arg2+"	d多文件上传的时候，使用arg2
				}								
				CxCacheUtil.getIntance().setValue("read_"+request.getSession().getId(),readlength);				
			}else {
				value ="var info={read:"+0+",total:"+length+",items:"+1+"}";		//items:"+arg2+"	d多文件上传的时候，使用arg2
				CxCacheUtil.getIntance().setValue("read_"+request.getSession().getId(),100*1024);
			}			
		}
		return value;
		
	}
	
	/*
	 * 2017.08.02 miki 完善店铺中心模块功能
	 */
	@RequestMapping("/shop/center")
	public String userCenter(HttpServletRequest request,Model model,@RequestParam(value="page",required=false) String page)throws Exception{
		HttpSession session=request.getSession();
		
		User user=(User) session.getAttribute(Consts.CURRENTUSER);
		model.addAttribute("user", user);
		if(user!=null){
			Shop shop=shopService.getShopByuserId(user.getId());
			model.addAttribute("shop", shop);
			if(shop==null){
				model.addAttribute("error", "您尚未开通店铺..");
				return "shop/5bug";
			}
			long dayVisit=logService.getLogCountByShopId(shop.getId());
			long allVisit=logService.getAllLogCountByShopId(shop.getId());
			
			model.addAttribute("DV", dayVisit);
			model.addAttribute("AV", allVisit);
			if (StringUtil.isEmpty(page)) {
				page="1";
			}
			PageBean pageBean=new PageBean(Integer.parseInt(page), 6);
			List<Source> sourceList=sourceService.getSourcesByShopId(shop.getId(), pageBean);
			model.addAttribute("sourceList", sourceList);
			long total=sourceService.getSourceCountByuserId(user.getId());
			String pageCode=PageUtil.genPagination(request.getContextPath()+"/shop/center", total, Integer.parseInt(page), 6,null);
			model.addAttribute("pageCode", pageCode);
			List<Message> messageList=messageService.getAdminMesList(shop.getId());
			model.addAttribute("messageList", messageList);
		}
		return "shop/shop_center";
	}
	
	/*
	 * 2017.07.19 miki 店铺激活功能	为了增加使用量可以先不增加用户积分验证(即用户积分达到100才能行使店铺功能)
	 */
	@RequestMapping("/shop/active")
	@ResponseBody
	public E3Result active(HttpServletRequest request)throws Exception{

		HttpSession session=request.getSession();
		User user=(User) session.getAttribute(Consts.CURRENTUSER);
		if(user==null) {
			return E3Result.build(401, "您尚未登录...");
		}
		
		//********** 防止非法操作，先判断用户存在不存在，用户存在的话，判断该用户是否已经激活过，激活过就不能二次激活，没激活，执行激活操作
		if(user!=null){
			Shop shop=shopService.getShopByuserId(user.getId());
			if(shop!=null){
				return E3Result.build(401, "店铺已经激活过了哦");
			}else{
			Shop shop1=new Shop();
			shop1.setDouNum(5);
			shop1.setDownNum(0);
			shop1.setRegisterTime(new Date());
			shop1.setStatus(1);
			shop1.setUser(user);
			shop1.setShop_name(user.getNickName());
			shop1.setFace("images/user/mo.jpg");
			shop1.setTag("javaweb");
			shopService.save(shop1);
			}
		}
		return E3Result.ok();
	}
	
	@RequestMapping("/shop/validate")
	@ResponseBody
	public E3Result validateStatus(HttpServletRequest request)throws Exception{
			
			HttpSession session=request.getSession();
			User user=(User) session.getAttribute(Consts.CURRENTUSER);
			if(user==null) {
				return E3Result.build(401, "您尚未登录...");
			}
			Shop shop=shopService.getShopByuserId(user.getId());
			if(shop!=null){
				return E3Result.ok();
			}
			return E3Result.build(401, "店铺服务尚未开通哦");
	}
	
	/*
	 * 2017.07.28 miki 上传文件页面的跳转
	 */
	@RequestMapping("/shop/upload.htm")
	public String upload(HttpServletRequest request,HttpServletResponse response,Model model)throws Exception{
		HttpSession session=request.getSession();

		User user=(User) session.getAttribute(Consts.CURRENTUSER);
		if (user==null) {
			//response.sendRedirect(request.getContextPath()+"/login.jsp");
			request.getRequestDispatcher("${pageContext.request.contextPath}/bug/error.jsp").forward(request, response);
		}
		Shop shop=shopService.getShopByuserId(user.getId());
		model.addAttribute("shop", shop);
		List<Category> categoryList=categoryService.getCategoryList(null, null);
		model.addAttribute("categoryList", categoryList);
		List<Type> types=typeService.getTypeList();
		model.addAttribute("types", types);
		Source source1=sourceService.getLastUploadByShopId(shop.getId());
		model.addAttribute("source1", source1);
		return "shop/shop_upload";
	}
	
	/*
	 * 2017.08.01 miki 检查验证码是否正确
	 */
	@RequestMapping("/shop/exitCode")
	@ResponseBody
	public E3Result valImageCode(HttpServletRequest request,@RequestParam("imageCode") String imageCode)throws Exception {
		HttpSession session=request.getSession();
		String attribute =String.valueOf(session.getAttribute(Constants.KAPTCHA_SESSION_KEY));
		if(!imageCode.equals(attribute)){
			return E3Result.build(401, "验证码错误");
		}else {
			return E3Result.ok();
		}
	}
	
	/*
	 * 2017.08.09 miki 访问者店铺首页得到相关数据
	 */
	@RequestMapping("/shop/{shopId}")
	public String view(HttpServletRequest request,Model model,@PathVariable("shopId") int shopId,
			@RequestParam(value="page",required=false) String page)throws Exception{

		HttpSession session=request.getSession();
		Focus focus = null;
		User user=(User) session.getAttribute(Consts.CURRENTUSER);	//关注者，
		model.addAttribute("user", user);
		if(shopId>0){
			Shop shop=shopService.getShopById(shopId);			//	关注对象店铺
			model.addAttribute("shop", shop);
			if (StringUtil.isEmpty(page)) {
				page="1";
			}
			if(user!=null){
				focus=focusService.getFocusByShopId(shopId,user.getId());
				Log log1=new Log();
				String ip=IpGet.getIp2(request);
				String address=GaoDeUtil.getAddress(ip);	//2018.01.27运用高德api得到当前地址
				if(address.equals("[]")){
					String provence=IpSeekUtils.getIpProvinceByBaidu(ip);
					log1.setAddress(provence+">>"+"手机IP访问");
				}else{
					String provence=IpSeekUtils.getIpProvinceByBaidu(ip);
					if(address!=null && address!=""){
						log1.setAddress(provence+">>"+address);
					}
				}	
				log1.setIp(ip);
				log1.setTime(new Date());
				log1.setType("visitor");
				log1.setOperation_log("店铺访问");
				log1.setUser(user);
				log1.setShop(shop);
				logService.save(log1);
			}
			model.addAttribute("focus", focus);
			
			PageBean pageBean=new PageBean(Integer.parseInt(page), 6);
			List<Source> sourceList=sourceService.getSourcesByShopId(shop.getId(), pageBean);
			model.addAttribute("sourceList", sourceList);
			
			//获取标签列表
			List<String> tags = sourceService.getSourceTagsByShop(shopId);
			model.addAttribute("tagsByShop", tags);
			
			long total=sourceService.getSourceCountByuserId(shop.getUser().getId());
			StringBuffer param=new StringBuffer();	
			param.append("shopId="+shopId);
			String pageCode=PageUtil.genPagination(request.getContextPath()+"/shop/"+shopId, 
					total, Integer.parseInt(page), 6,param.toString());
			model.addAttribute("pageCode", pageCode);
		}
			return "shop/shop_home";
	}
	
	/*
	 * 2017.08.17 miki 店铺排行
	 */
	@RequestMapping("/shop/rank")
	public String rank(HttpServletRequest request,Model model,@RequestParam(value="page",required=false) String page)throws Exception{
		List<Category> categories=categoryService.getCategoryList(null, null);
		model.addAttribute("categories", categories);
		
		if (StringUtil.isEmpty(page)) {
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), 12);
		long total=shopService.getAllShopCount();
		List<Shop> shopList=shopService.allShops(pageBean);
		model.addAttribute("shopList", shopList);
		List<Shop> rankList=shopService.getShopListByDownNum();
		model.addAttribute("rankList", rankList);
		List<Notice> noticeList=noticeService.findDownLoadNoticeList();
		model.addAttribute("noticeList", noticeList);
		String pageCode=PageUtil.genPagination(request.getContextPath()+"/shop/rank", total, Integer.parseInt(page), 12,null);
		model.addAttribute("pageCode", pageCode);
		return "shop/shoplist";
	}
	
	
	/*
	 * 2017.08.18 miki	店铺分类
	 */
	@RequestMapping("/shop/category")
	public String category(HttpServletRequest request,@RequestParam("categoryId") int categoryId,Model model,@RequestParam("page") String page)throws Exception{
		List<Category> categories=categoryService.getCategoryList(null, null);
		model.addAttribute("categories", categories);	
		if(categoryId>0){
			Category curCategory=categoryService.getCategoryById(categoryId);
			model.addAttribute("curCategory", curCategory);
			if (StringUtil.isEmpty(page)) {
				page="1";
			}
			PageBean pageBean=new PageBean(Integer.parseInt(page), 12);
			List<Shop> shopList=shopService.getShopListByCategory(curCategory.getName(), pageBean);
			model.addAttribute("shopList", shopList);
			long total=shopService.getShopCountBycategory(curCategory.getName());
			StringBuffer param=new StringBuffer();
			param.append("categoryId="+categoryId);
			String pageCode=PageUtil.genPagination(request.getContextPath()+"/shop/category", total,
					Integer.parseInt(page), 12,param.toString());
			model.addAttribute("pageCode", pageCode);
		}
		return "category";
	}
	
}
