package com.sharehoo.controller.shop;

import java.io.FileInputStream;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sharehoo.base.download.MikiUtil;
import com.sharehoo.base.fencisys.CnUtil;
import com.sharehoo.base.fencisys.EnUtil;
import com.sharehoo.base.ipseek.IpGet;
import com.sharehoo.base.ipseek.IpSeekUtils;
import com.sharehoo.config.lang.Consts;
import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.forum.User;
import com.sharehoo.entity.shop.Category;
import com.sharehoo.entity.shop.Collect;
import com.sharehoo.entity.shop.Comment;
import com.sharehoo.entity.shop.Focus;
import com.sharehoo.entity.shop.Log;
import com.sharehoo.entity.shop.Menu;
import com.sharehoo.entity.shop.NewsBanner;
import com.sharehoo.entity.shop.Operate;
import com.sharehoo.entity.shop.Search;
import com.sharehoo.entity.shop.Shop;
import com.sharehoo.entity.shop.Source;
import com.sharehoo.entity.shop.Type;
import com.sharehoo.service.LogService;
import com.sharehoo.service.MenuService;
import com.sharehoo.service.TypeService;
import com.sharehoo.service.forum.CategoryService;
import com.sharehoo.service.forum.CommentService;
import com.sharehoo.service.forum.NewsBannerService;
import com.sharehoo.service.shop.CollectService;
import com.sharehoo.service.shop.FocusService;
import com.sharehoo.service.shop.OperateService;
import com.sharehoo.service.shop.SearchService;
import com.sharehoo.service.shop.ShopService;
import com.sharehoo.service.shop.SourceService;
import com.sharehoo.util.BootPathUtil;
import com.sharehoo.util.forum.E3Result;
import com.sharehoo.util.forum.GaoDeUtil;
import com.sharehoo.util.forum.PageUtil;
import com.sharehoo.util.forum.RadomUtil;
import com.sharehoo.util.forum.StringUtil;

@Controller
public class SourceController {
	@Autowired
	private CollectService collectService;
	@Autowired
	private ShopService shopService;
	@Autowired
	private NewsBannerService newsBannerService;
	@Autowired
	private SourceService sourceService;
	@Autowired
	private FocusService focusService;
	@Autowired
	private LogService logService;
	@Autowired
	private CommentService commentService;
	@Autowired
	private OperateService operateService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private TypeService typeService;
	@Autowired
	private MenuService menuService;
	@Autowired
	private SearchService searchService;
	
	
	@RequestMapping("/shop/source/{sourceId}")
	public String detail(HttpServletRequest request,@PathVariable("sourceId") int source_id,Model model,
			@RequestParam(value="page",required=false) String page)throws Exception{
		
		HttpSession session=request.getSession();
		User currentUser=(User) session.getAttribute(Consts.CURRENTUSER);	//下载者
		
		long totalCollect=collectService.getCollectCountBySourceId(source_id);
		model.addAttribute("collectTotal", totalCollect);
		
		List<Shop> newShopList=shopService.getNewShops();
		model.addAttribute("newShopList", newShopList);
		
		List<NewsBanner> bannerList=newsBannerService.findRecommendBannerListByType();		//大神推荐版块图文下载
		model.addAttribute("bannerList", bannerList);
		
		List<Collect> collectSources=collectService.getCollectsByCollectCount();
		model.addAttribute("collectSources", collectSources);
		
		if(source_id>0){
		Source source=sourceService.getSourceById(source_id);	//资源
		model.addAttribute("source", source);
		
		User user=source.getUser();	//资源上传者
		model.addAttribute("user", user);
		
		Shop shop=source.getShop();	//资源店铺
		model.addAttribute("shop", shop);
		
		List<Source> ohterSources=sourceService.getSourcesByshopId(shop.getId());
		model.addAttribute("ohterSources", ohterSources);
		
		List<String> tagsByShop = sourceService.getSourceTagsByShop(shop.getId());
		model.addAttribute("tags", tagsByShop);
		
		if(currentUser!=null){
			model.addAttribute("currentUser", currentUser);
			
			Focus focus=focusService.getFocusByShopId(shop.getId(),currentUser.getId());
			model.addAttribute("focus", focus);
			
			Collect collect=collectService.getCollectByuserId(currentUser.getId(), source_id);
			model.addAttribute("collect", collect);
			
			Shop currentShop=shopService.getShopByuserId(currentUser.getId());	//下载者店铺
			model.addAttribute("currentShop", currentShop);
			
			//执行访问操作，必须要有用户登录才行 	2017.08.25 miki
			String ip=IpGet.getIp2(request);
			String address=GaoDeUtil.getAddress(ip);	//2018.01.27运用高德api得到当前地址
			if(address.equals("[]")){
				String provence=IpSeekUtils.getIpProvinceByBaidu(ip);
				address = provence+">>"+"手机IP访问";
			}else{
				String provence=IpSeekUtils.getIpProvinceByBaidu(ip);
				if(address!=null && address!=""){
					address = provence+">"+address;
				}
			}
			Log log1 = new Log(ip, new Date(), "visitor", "店铺访问", currentUser, shop,address);		
			logService.save(log1);
		}	
		String signature=RadomUtil.getUUID();	//产生伪下载令牌，迷惑盗链者
		model.addAttribute("signal", signature);
				
		if (StringUtil.isEmpty(page)) {
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), 7);
		List<Comment> commentList=commentService.getCommentsBySourceId(source_id, pageBean);
		model.addAttribute("commentList", commentList);
			
		long commentTotal=commentService.getCommentCountBysourceId(source_id);
		
		//************** 计算资源的平均分  2019.09.20	miki
		DecimalFormat df = new DecimalFormat("0.0");		//格式化小数
		model.addAttribute("average", 0.0);
		if(commentTotal>0) {
			long commentScores=commentService.getCommentTotalScoreBysourceId(source_id);
			String average = df.format((float)commentScores / commentTotal);
			model.addAttribute("average", average);
		}
		
		model.addAttribute("commentTotal", commentTotal);
	
		String pageCode=PageUtil.genPagination(request.getContextPath()+"/shop/source/"+source_id, commentTotal, Integer.parseInt(page), 6,null);
		model.addAttribute("pageCode", pageCode);
	}
		return "shop/source_detail";
	}
	
	/*
	 * 2017.08.05	用户下载资源方法，当前用户下载豆数减少，资源店铺增加豆数，
	 * bug》》》暂时没能解决同一用户注册多个小号，为自己店铺增加豆数
	 */
	@RequestMapping("/shop/score/change")
	@ResponseBody
	public E3Result download(HttpServletRequest request,@RequestParam("sourceId") int sourceId)throws Exception {

		HttpSession session=request.getSession();
		User currentUser=(User) session.getAttribute(Consts.CURRENTUSER);
		if(currentUser!=null){
		if(sourceId>0){
			Source source=sourceService.getSourceById(sourceId);
			if(source!=null){
				User user=source.getUser();
				//*********** 自己下载自己的东西不扣除积分，只有别人下载才扣除
				if(user.getId()!=currentUser.getId()){	
					Shop currentShop=source.getShop();
					Shop shop=shopService.getShopByuserId(currentUser.getId());	//买家店铺	;
					Operate operate = null;
					Operate sell = null;
					try {																							
						currentShop.setDouNum(currentShop.getDouNum()+source.getDouNum());	//卖家店铺	
						shop.setDouNum(shop.getDouNum()-source.getDouNum());
						currentShop.setDownNum(currentShop.getDownNum()+1);
						
						 // 2017.08.11 miki 保存下载者操作记录				
						operate=new Operate("download", shop, currentUser, source, "下载（"+source.getName()+"）扣除虎豆", new Date());
						operateService.save(operate);
						
						 // 2017.08.11 miki 保存出售者出售记录		   
						sell=new Operate("sell", source.getShop(), currentUser, source, "出售（"+source.getName()+"）获得虎豆", new Date());			
						operateService.save(sell);					
					} catch (Exception e) {}
					shopService.save(currentShop);
					shopService.save(shop);
				}
				
				String signature=RadomUtil.getUUID();	// 2017.08.06  miki	扣豆成功，产生一个真正的随机下载令牌，
				session.setAttribute("signal", signature);	//并存到session中，下载的时候，取session中的令牌，如果取到，证明扣豆成功，执行下载
				return E3Result.ok();
				}
			}
		
		}
		return E3Result.build(401, "请先登录...");
	}
	
	/*
	 * 2017.08.06	miki 二次下载验证，防止不法分子盗窃会员信息，此页面先验证用户是否登录，登录之后，是否执行了扣豆操作，如果没执行
	 * 则不返回下载
	 */
	@RequestMapping("/shop/source/{source_id}/download")
	public String kiss(HttpServletRequest request,Model model,@PathVariable("source_id") int source_id,
			@RequestParam(value="page",required=false) String page)throws Exception{
		HttpSession session=request.getSession();
		User currentUser=(User) session.getAttribute(Consts.CURRENTUSER);
		model.addAttribute(Consts.CURRENTUSER, currentUser);

		long totalCollect=collectService.getCollectCountBySourceId(source_id);
		List<Shop> newShopList=shopService.getNewShops();
		model.addAttribute("newShopList", newShopList);
		List<NewsBanner> bannerList=newsBannerService.findRecommendBannerListByType();		//大神推荐版块图文下载
		model.addAttribute("bannerList", bannerList);
		List<Collect> collectSources=collectService.getCollectsByCollectCount();
		model.addAttribute("collectSources", collectSources);
		model.addAttribute("collectTotal", totalCollect);

		if(currentUser!=null){
			String sign=(String)session.getAttribute("signal");
			if(sign!=null){
				if(source_id>0){
					Source source=sourceService.getSourceById(source_id);	//资源
					model.addAttribute("source", source);
					User user=source.getUser();	//资源上传者
					model.addAttribute("user", user);
					Shop shop=source.getShop();
					model.addAttribute("shop", shop);
					List<Source> ohterSources=sourceService.getSourcesByshopId(shop.getId());
					model.addAttribute("ohterSources", ohterSources);
					Focus focus=focusService.getFocusByShopId(shop.getId(),currentUser.getId());
					model.addAttribute("focus", focus);
					Collect collect=collectService.getCollectByuserId(currentUser.getId(), source_id);
					model.addAttribute("collect", collect);
					if (StringUtil.isEmpty(page)) {
						page="1";
					}
					PageBean pageBean=new PageBean(Integer.parseInt(page), 7);
					List<Comment> commentList=commentService.getCommentsBySourceId(source_id, pageBean);
					model.addAttribute("commentList", commentList);
					long commentTotal=commentService.getCommentCountBysourceId(source_id);
					model.addAttribute("commentTotal", commentTotal);
					String pageCode=PageUtil.genPagination(request.getContextPath()+"/shop/Source_kiss.action", commentTotal, Integer.parseInt(page), 6,null);	
					model.addAttribute("pageCode", pageCode);
				}
			}
		}
		return "shop/source_download";
	}
	
	/**
	* @Title: downKiss  
	* @Description: TODO(最终的下载功能)  
	* @author miki 
	* @date 2019年9月20日 下午4:17:22   
	* @throws
	 */
	@RequestMapping("/shop/source/download")
	public String downKiss(HttpServletRequest request,HttpServletResponse response, @RequestParam("source_id") int source_id,Model model){
		HttpSession session=request.getSession();
        String sign=(String)session.getAttribute("signal");  
        if(sign!=null){
        	if(source_id>0){
	        	Source source=sourceService.getSourceById(source_id);
	        	
	        	// CKEditor提交的很重要的一个参数    
	        	String staticPath = BootPathUtil.getStaticPath();
	        	//这样能够组织一个文件流  
	            String filePath= staticPath +Consts.SHOP_UPLOAD_PATH +"/file/"+ source.getPath();		////"\\image_upload\\source_upload\\file\\"
	            
	            //下载的文件携带这个名称
	            response.setHeader("Content-Disposition", "attachment;filename=" + source.getPath());
	            //文件下载类型--二进制文件
	            response.setContentType("application/octet-stream");        
	            //result= ServletActionContext.getServletContext().getResourceAsStream(filePath);
	            
	            try {
	                FileInputStream fis = new FileInputStream(filePath);
	                byte[] content = new byte[fis.available()];
	                fis.read(content);
	                fis.close();
	         
	                ServletOutputStream sos = response.getOutputStream();
	                sos.write(content);
	         
	                sos.flush();
	                sos.close();
	                long fileLength=MikiUtil.GetFileSize(filePath);
	                model.addAttribute("fileLength", fileLength);
	            } catch (Exception e) {
	                e.printStackTrace();
	                return "error";
	            }
	
	            /*
	             *  2017.08.11 miki	用于浏览器弹出框显示文件大小，要使用绝对路径，不然会报错，找不到文件
	             *  这是本地测试路径E:\\eclipse与项目文件\\Soft\\apache-tomcat-7.0.55\\webapps\\Forum\\image_upload\\source_upload\\file\\
	             *  代码里的是服务器路径，本地测试需要改为本地路径		2017.08.26 miki
	             */   
	            source.setDownNum(source.getDownNum()+1);
	            sourceService.save(source);	                    	
	            //下载完，移除下载令牌，防止二次下载	2017.08.10 miki
	            //session.removeAttribute("signal");
	            return null;  
        	}else{
        		return "error";
        	}
        } else{  
            //不符合要求，返回一个跳转到error.jsp的地址给用户，不返回文件流  
            return "error";  
      }  
   }  
  
    // eclipse自动生成  
    // 输入流Result只出不进，其setter也是可以不要的，但是系统一次性生成getter与setter  
    // 为何要手贱删除呢  
	
	/*
	 * 2017.08.15 搜索功能，实现根据最新下载，最多下载列表两个功能
	 */
	@RequestMapping("/shop/source/search/go")
	public String search(Model model,@RequestParam(value="page",required=false) String page,
			@RequestParam(value="type",required=false) String type,HttpServletRequest request)throws Exception{
		List<Category> categories=categoryService.getCategoryList(null, null);
		model.addAttribute("categories", categories);
	
		List<Type> types=typeService.getTypeList();
		model.addAttribute("types", types);
		if (StringUtil.isEmpty(page)) {
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), 10);
		if(type!=null){
			List<Source> sourceList=sourceService.allSourceListByDownNum(pageBean);
			model.addAttribute("sourceList", sourceList);

			StringBuffer param=new StringBuffer();
			param.append("type="+type);
			long total=sourceService.getAllCount(null);
			String pageCode=PageUtil.genPagination(request.getContextPath()+"/shop/source/search/go", total, Integer.parseInt(page), 10,param.toString());
			model.addAttribute("pageCode", pageCode);
		}else{
		List<Source> sourceList=sourceService.allSourceList(pageBean,null);
		model.addAttribute("sourceList", sourceList);
		long total=sourceService.getAllCount(null);
		String pageCode=PageUtil.genPagination(request.getContextPath()+"/shop/source/search/go", total, Integer.parseInt(page), 10,null);
		model.addAttribute("pageCode", pageCode);
		}
		
		//HttpServletRequest req=ServletActionContext.getRequest();	//新建request对象，action中属性，因为为null
		//执行访问操作，必须要有用户登录才行 	2017.08.25 miki		
		String ip=IpGet.getIp2(request);
		String address=GaoDeUtil.getAddress(ip);	//2018.01.27运用高德api得到当前地址
		if(address.equals("[]")){
			String provence=IpSeekUtils.getIpProvinceByBaidu(ip);
			address = provence+">>"+"手机IP访问";
		}else{
			String provence=IpSeekUtils.getIpProvinceByBaidu(ip);
			if(address!=null && address!=""){
				address = provence+">"+address;
			}
		}
		Log log = new Log(ip, new Date(), "search", "搜索资源", null, null, address);
		logService.save(log);
		
		return "shop/source_search";
	}
	
	//搜索结果显示  	2017.08.15 miki
	@RequestMapping("/shop/source/search")
	public String result(Model model,HttpServletRequest request,@RequestParam(value="categoryId",required=false) int categoryId,
			@RequestParam(value="typeId",required=false) int typeId,@RequestParam(value="menuId",required=false) int menuId,
			@RequestParam(value="page",required=false) String page)throws Exception{
		
		Category curCategory=null;
		Type curType = null;
		Menu curMenu = null;
		List<Category> categories=categoryService.getCategoryList(null, null);
		model.addAttribute("categories", categories);
		List<Type> types=typeService.getTypeList();
		model.addAttribute("types", types);

		if(categoryId>0){
			curCategory=categoryService.getCategoryById(categoryId);
			model.addAttribute("curCategory", curCategory);
			List<Menu> menus=menuService.getMenuListBycategoryId(categoryId);
			model.addAttribute("menus", menus);
		}
		if(typeId>0){
			curType=typeService.getTypeById(typeId);
			model.addAttribute("curType", curType);
		}	
		
		if(menuId>0){
			curMenu=menuService.getMenuById(menuId);
			model.addAttribute("curMenu", curMenu);
			if (StringUtil.isEmpty(page)) {
				page="1";
			}
			PageBean pageBean=new PageBean(Integer.parseInt(page), 7);
			List<Source> sourceList=sourceService.getSourceListByMenuId(menuId, pageBean);
			model.addAttribute("sourceList", sourceList);
			long total=sourceService.getCountByMenuId(menuId);
			StringBuffer param=new StringBuffer();
			param.append("menuId="+menuId);
			String pageCode=PageUtil.genPagination(request.getContextPath()+"/shop/source/search",
					total, Integer.parseInt(page), 7,param.toString());
			model.addAttribute("pageCode", pageCode);
		}else{
			if (StringUtil.isEmpty(page)) {
				page="1";
			}
			PageBean pageBean=new PageBean(Integer.parseInt(page), 7);
			List<Source> sourceList=sourceService.getSourceListByCategoryId(categoryId, pageBean);
			model.addAttribute("sourceList", sourceList);
			long total=sourceService.getCountByCategoryId(categoryId);
			StringBuffer param=new StringBuffer();
			param.append("categoryId="+categoryId);
			String pageCode=PageUtil.genPagination(request.getContextPath()+"/shop/source/search", total,
					Integer.parseInt(page), 10,param.toString());
			model.addAttribute("pageCode", pageCode);
		}
		//2017.12.28 miki 判断是否二次保存同一个搜索操作
		//执行访问操作，必须要有用户登录才行 	2017.08.25 miki
		
		String ip=IpGet.getIp2(request);
		String address=GaoDeUtil.getAddress(ip);	//2018.01.27运用高德api得到当前地址
		if(address.equals("[]")){
			String provence=IpSeekUtils.getIpProvinceByBaidu(ip);
			address = provence+">>"+"手机IP访问";
		}else{
			String provence=IpSeekUtils.getIpProvinceByBaidu(ip);
			if(address!=null && address!=""){
				address = provence+">"+address;
			}
		}
		Log log1=new Log(ip, new Date(), "search", "搜索资源", null, null, address);
		logService.save(log1);
		
		return "shop/solrJ_search_result";
	}
	
	/*
	 * 2017.08.15 关键字搜索算法  miki
	 */
	@RequestMapping("/shop/search")
	public String searchKey(Model model,HttpServletRequest request,@RequestParam(value="categoryId",required=false) int categoryId,
			@RequestParam(value="typeId",required=false) int typeId,@RequestParam(value="page",required=false) String page,
			@RequestParam("keyword")String keyword)throws Exception{
		
		List<Category> categories=categoryService.getCategoryList(null, null);
		model.addAttribute("categories", categories);
		List<Type> types=typeService.getTypeList();
		model.addAttribute("types", types);
	
		if(!StringUtil.isEmpty(keyword)){
		 String search=java.net.URLDecoder.decode(keyword,"UTF-8");	//2017.08.16 将url中文参数进行转码
			 List cnList=null;
			 List enList=null;
			 String keyword1=null;
			 String keyword2=null;
			 cnList= CnUtil.EnFnCi(search);
			 enList=EnUtil.EnFnCi(search);
			 if(cnList.size()>0){
				 keyword1=(String)cnList.get(0);
			 }
			 if(enList.size()>0){
				 keyword2=(String)enList.get(0);
			 }
		 model.addAttribute("search", search);
		if(categoryId>0){
			Category curCategory=categoryService.getCategoryById(categoryId);
			model.addAttribute("curCategory", curCategory);
		}
		if(typeId>0){
			Type curType=typeService.getTypeById(typeId);
			model.addAttribute("curType", curType);
		}
		Search se=searchService.getlast();
		model.addAttribute("se", se);
		if (StringUtil.isEmpty(page)) {
			page="1";
		}

		PageBean pageBean=new PageBean(Integer.parseInt(page), 10);
		List<Source> sourceList=sourceService.getSourceListByKeyword(categoryId, typeId, search,keyword1,keyword2,keyword2, pageBean);
		model.addAttribute("sourceList", sourceList);
		long total=sourceService.getCountByCateTypeKeyword(categoryId, typeId,search,keyword1,keyword2,keyword2);
		StringBuffer param=new StringBuffer();
		param.append("categoryId="+categoryId+"&typeId="+typeId+"&keyword="+keyword);
		String pageCode=PageUtil.genPagination(request.getContextPath()+"/shop/source/search/"+keyword, total,
				Integer.parseInt(page), 10,param.toString());
		model.addAttribute("pageCode", pageCode);
		
	}else{
		if(categoryId>0){
			Category curCategory=categoryService.getCategoryById(categoryId);
			model.addAttribute("curCategory", curCategory);
		}
		if(typeId>0){
			Type curType=typeService.getTypeById(typeId);
			model.addAttribute("curType", curType);
		}
				
		if (StringUtil.isEmpty(page)) {
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), 7);
		List<Source> sourceList=sourceService.getSourcesBycategoryType(categoryId, typeId, pageBean);
		model.addAttribute("sourceList", sourceList);
		long total=sourceService.getCountByCateType(categoryId, typeId);
		StringBuffer param=new StringBuffer();
		param.append("categoryId="+categoryId+"&typeId="+typeId);
		String pageCode=PageUtil.genPagination(request.getContextPath()+"/shop/source/search/"+keyword, total,
				Integer.parseInt(page), 7,param.toString());
		model.addAttribute("pageCode", pageCode);
	}
	
		//执行访问操作，必须要有用户登录才行 	2017.08.25 miki		
		String ip=IpGet.getIp2(request);
		String address=GaoDeUtil.getAddress(ip);	//2018.01.27运用高德api得到当前地址
		if(address.equals("[]")){
			String provence=IpSeekUtils.getIpProvinceByBaidu(ip);
			address = provence+">>"+"手机IP访问";
		}else{
			String provence=IpSeekUtils.getIpProvinceByBaidu(ip);
			if(address!=null && address!=""){
				address = provence+">"+address;
			}
		}
		Log log1=new Log(ip, new Date(), "search", "搜索资源", null, null, address);
		logService.save(log1);
	
	
	return "shop/source_search";
}
	
}
