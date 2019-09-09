package com.sharehoo.controller.shop;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sharehoo.config.lang.Consts;
import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.forum.User;
import com.sharehoo.entity.shop.Cdk;
import com.sharehoo.entity.shop.Exchange;
import com.sharehoo.entity.shop.Shop;
import com.sharehoo.service.ExchangeService;
import com.sharehoo.service.shop.CdkService;
import com.sharehoo.service.shop.ShopService;
import com.sharehoo.util.forum.E3Result;
import com.sharehoo.util.forum.PageUtil;
import com.sharehoo.util.forum.RadomUtil;
import com.sharehoo.util.forum.ResponseUtil;
import com.sharehoo.util.forum.StringUtil;

import net.sf.json.JSONObject;

@Controller
public class CDKController {
	
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private CdkService cdkService;
	@Autowired
	private ShopService shopService;
	@Autowired
	private ExchangeService exchangeService;
	
	
	/**
	* @Title: addCdk  
	* @Description: TODO(批量生成cdk)  
	* @author miki 
	* @date 2019年9月4日 下午4:41:17   
	* @throws
	 */
	@RequestMapping("/shop/cdk/batchAdd")
	@ResponseBody
	public E3Result addCdk(@RequestParam("total") int total,@RequestParam("num") int num)throws Exception{

		HttpSession sessiom=request.getSession();
		User user=(User)sessiom.getAttribute(Consts.CURRENTUSER);
		if (user!=null&&user.getType()==2) {
			for(int i=1;i<=total;i++){
				Cdk cdk=new Cdk();
				cdk.setCode(RadomUtil.getUUID().substring(0, 15));
				cdk.setDouNum(num);
				cdk.setMoney(num);
				cdkService.add(cdk);
			}
			E3Result.ok();
		}else{
			return E3Result.build(401, "未登录..", "我已经记录你的ip了，再乱来，你就死定了！");
	}
	return E3Result.ok();
	}
	
	/**
	* @Title: save  
	* @Description: TODO(更新cdk)  
	* @author miki 
	* @date 2019年9月4日 下午4:41:46   
	* @throws
	 */
	@RequestMapping("/shop/cdk/update")
	@ResponseBody
	public E3Result update(@RequestParam("cdkId") int cdkId,Cdk cdk)throws Exception{
		JSONObject result=new JSONObject();
		HttpSession sessiom=request.getSession();
		User user=(User)sessiom.getAttribute(Consts.CURRENTUSER);
		if (user!=null&&user.getType()==2) {
			if(cdkId>0){
				cdkService.add(cdk);
				result.put("success", true);
			}else{
				result.put("success", false);
			}
		}else {
			return E3Result.build(401, "未登录..", "我已经记录你的ip了，再乱来，你就死定了！");
		}
		return E3Result.ok();
	}
	
	/**
	* @Title: list  
	* @Description: TODO(后台获取cdk列表)  
	* @author miki 
	* @date 2019年9月4日 下午4:37:47   
	* @throws
	 */
	@RequestMapping("/shop/cdk")
	public String list(@RequestParam("page") String page,Model model,@RequestParam(value="error",required=false) String error)throws Exception{
		HttpSession sessiom=request.getSession();
		User user=(User)sessiom.getAttribute(Consts.CURRENTUSER);
		model.addAttribute("user", user);
		if (user!=null&&user.getType()==2) {
			if (StringUtil.isEmpty(page)) {
				page="1";
			}
			PageBean pageBean=new PageBean(Integer.parseInt(page), 10);
			List<Cdk> cdkList=cdkService.getCdkList(pageBean);
			model.addAttribute("cdkList", cdkList);
			long total=cdkService.getCdkTotal();
			String pageCode=PageUtil.genPagination(request.getContextPath()+"/admin/Cdk_list.action", total, Integer.parseInt(page), 10,null);
			model.addAttribute("pageCode", pageCode);
	}else {
		error="我已经记录你的ip了，再乱来，你就死定了！";
		model.addAttribute("error", error);
		return "errorAdmin";
	}
	String mainPage="shop_cdk.jsp";
	model.addAttribute("mainPage", mainPage);
	String crumb1="兑换码管理";
	model.addAttribute("crumb1", crumb1);
	return "admin/main";
	}
	
		
	/**
	* @Title: save  
	* @Description: TODO(更新cdk)  
	* @author miki 
	* @date 2019年9月4日 下午4:41:46   
	* @throws
	 */
	@RequestMapping("/shop/cdk/delete")
	@ResponseBody	
	public E3Result delete(@RequestParam("cdkId") int cdkId,Cdk cdk)throws Exception{
		JSONObject result=new JSONObject();
		HttpSession sessiom=request.getSession();
		User user=(User)sessiom.getAttribute(Consts.CURRENTUSER);
		if (user!=null&&user.getType()==2) {
			if(cdkId>0){
				cdk=cdkService.getCdk(cdkId);
				cdkService.delete(cdk);
				result.put("info", "删除成功");
			}else{
				result.put("info", "删除失败");
			}
		}else {
			return E3Result.build(401, "未登录..", "我已经记录你的ip了，再乱来，你就死定了！");
		}
		return E3Result.ok();
	}	
	
	@RequestMapping("/shop/cdk/exchange")
	@ResponseBody
	public E3Result exchange(@RequestParam("code") String code)throws Exception{
		HttpSession sessiom=request.getSession();
		User user=(User)sessiom.getAttribute(Consts.CURRENTUSER);
		Shop shop=shopService.getShopByuserId(user.getId());
		if (shop!=null) {
			if(!code.equals("")){
				Cdk cdk1=cdkService.getCdkByCode(code.trim());
				
				if(cdk1!=null){
					cdk1.setStatus(1);
					cdkService.add(cdk1);	//1.如果兑换码存在，首先将兑换码注销，保存
					shop.setDouNum(shop.getDouNum()+cdk1.getDouNum());	//2.将兑换码对应的豆数加到店铺内
					shopService.save(shop);		//3.保存对店铺的操作
					Exchange exchange=new Exchange();
					exchange.setDou(cdk1.getDouNum());	
					exchange.setEc_time(new Date());	
					exchange.setMoney(cdk1.getDouNum());
					exchange.setUser(shop.getUser());
					exchange.setStatus(1);
					exchangeService.addLog(exchange);	//4。保存充值记录表里
					return E3Result.ok();
					//result.put("info", "b");		//a.兑换码成功
				}else{
					return E3Result.build(401, "兑换码不存在");
					//result.put("info", "a");		//a.兑换码不存在，兑换失败
				}				
			}else{
				return E3Result.build(401, "兑换异常..,请联系客服");
				//result.put("info", "c");	//c.兑换失败
			}
		}else{
			return E3Result.build(401, "您尚未登录过注册店铺，无法兑换虎豆...");
			//result.put("info", "d");	//d.您尚未登录或注册店铺！无法购买虎豆
		}
	}
	
	@RequestMapping("/shop/cdk/buy")
	public String buy(Model model)throws Exception{
		HttpSession sessiom=request.getSession();
		User user=(User)sessiom.getAttribute(Consts.CURRENTUSER);
		model.addAttribute("user", user);
		Shop shop=shopService.getShopByuserId(user.getId());
		model.addAttribute("shop", shop);
		if (shop!=null) {
			return "shop/pay";
		}else{
			return "errorAdmin";
		}		
	}
}
