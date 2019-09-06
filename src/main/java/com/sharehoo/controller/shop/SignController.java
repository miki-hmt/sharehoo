package com.sharehoo.controller.shop;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sharehoo.entity.forum.User;
import com.sharehoo.entity.shop.Operate;
import com.sharehoo.entity.shop.Shop;
import com.sharehoo.entity.shop.Sign;
import com.sharehoo.service.shop.OperateService;
import com.sharehoo.service.shop.ShopService;
import com.sharehoo.service.shop.SignService;
import com.sharehoo.util.forum.DateConvertUtils;
import com.sharehoo.util.forum.E3Result;
import com.sharehoo.util.forum.ResponseUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class SignController {
	
	@Autowired
	private ShopService shopService;
	@Autowired
	private SignService signService;
	@Autowired
	private OperateService operateService;
	
	//2018.02.02 先得到签到对象，若数据库不存在，则创建，若存在，则进行修改数据 
	@RequestMapping("/shop/sign")
	@ResponseBody
	public E3Result save(HttpServletRequest request)throws Exception{
		HttpSession session=request.getSession();
		User user=(User)session.getAttribute("currentUser");

		Operate operate=new Operate();
		if(user!=null){
			Shop shop=shopService.getShopByuserId(user.getId());
			if(shop!=null){
				Sign sign = signService.getSignByShopId(shop.getId());
				if(sign!=null){
					if(sign.getSign_continue()==6){
						sign.setDou_total(sign.getDou_total()+5);	//连续签到七天额外奖励4个豆
						shop.setDouNum(shop.getDouNum()+5);
						sign.setSign_continue(1);	//连续签到次数重置为1
						sign.setSign_last(new Date());
						sign.setSign_total(sign.getSign_total()+1);	//签到总次数+1
						sign.setNotice("连续签到七天获得额外奖励");	//连签七天获得额外奖励
						operate.setNotice("连续签到七天获得奖励");
						signService.saveSign(sign);
						return E3Result.build(200,"恭喜你连续签到七天，喜提大礼包");
					}else{
						sign.setDou_total(sign.getDou_total()+1);	//不是连签7天，则总豆数就是+1
						
						SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd"); //设置时间格式为天
						String last = sdf.format(sign.getSign_last());    //格式化最近签到日期
						String now=sdf.format(new Date());
						if(last.equals(DateConvertUtils.getBefore())){	//如果最近签到正是昨天，则连签+1
							sign.setSign_continue(sign.getSign_continue()+1);
							sign.setSign_last(new Date());
							sign.setSign_total(sign.getSign_total()+1);	//签到总次数+1
							sign.setNotice("0");
							signService.saveSign(sign);
							return E3Result.build(200,"恭喜你连续签到"+sign.getSign_continue()+"天,累积七天有大奖哦");
						}else{	//未能连续签到成功，则相应数据进行重置
							if(!last.equals(now)){
								sign.setSign_continue(1);
								sign.setSign_last(new Date());
								sign.setSign_total(sign.getSign_total()+1);	//签到总次数+1
								sign.setNotice("1");
								signService.saveSign(sign);
								return E3Result.build(200,"恭喜你签到成功，累积七天有大奖哦");
							}						
						}
						shop.setDouNum(shop.getDouNum()+1);
					}
					operate.setShop(shop);
				}else{	//用户从未签到过，数据新增
					Sign sign2=new Sign();
					sign2.setDou_total(1);
					sign2.setShop(shop);
					sign2.setSign_continue(1);
					sign2.setSign_last(new Date());
					sign2.setNotice("2");
					sign2.setSign_total(1);
					signService.saveSign(sign2);
					return E3Result.build(200,"恭喜你签到成功，累积七天有大奖哦");
				}
				
			}else{
				return E3Result.build(401,"您尚未激活店铺，签到没有积分哦");	//用户尚未激活店铺
			}
			operate.setType("sign");
			operate.setOperate_time(new Date());
			operate.setUser(user);
			operateService.save(operate);
			shopService.save(shop);
		}
		else{	//用户尚未登录
			return E3Result.build(401,"请登录后签到");	//用户尚未激活店铺
		}
		return E3Result.build(200,"恭喜你签到成功，累积七天有大奖哦");
	}
	
	@RequestMapping("/shop/sign/daydayup")
	public String go(HttpServletRequest request,Model model)throws Exception{
		HttpSession session=request.getSession();
		User user=(User)session.getAttribute("currentUser");
		if(user!=null){
			Shop shop = shopService.getShopByuserId(user.getId());
			Sign sign = signService.getSignByShopId(shop.getId());
			model.addAttribute("nowSign", sign);
			List<Operate> signs=operateService.getSignListByUserId(user.getId());
			model.addAttribute("signs", signs);
			SimpleDateFormat sd=new SimpleDateFormat("yyyy-MM"); //设置时间格式为天
			Long count=operateService.getMonthCountByuserId(user.getId(), sd.format(new Date()));
			model.addAttribute("count", count);
			int flag = 0;
			//System.out.println("数量为:"+count);
			if(sign!=null){
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd"); //设置时间格式为天
				String last = sdf.format(sign.getSign_last());    //格式化最近签到日期
				String now=sdf.format(new Date());
				if(last.equals(now)){	//如果今天没签到，页面签到按钮设置为未签到
					flag=1;
				}
			}
			model.addAttribute("flag", flag);
			return "shop/sign";
		}
		return "redirect:/shop";	//返回首页
	}
		
		//得到sign对象
	@RequestMapping("/shop/getSign")
	@ResponseBody
	public E3Result getSign(HttpServletRequest request)throws Exception{
		JSONObject result=new JSONObject();
		HttpSession session=request.getSession();
		User user=(User)session.getAttribute("currentUser");
		if(user!=null){
			Shop shop = shopService.getShopByuserId(user.getId());
			Sign sign = signService.getSignByShopId(shop.getId());
			result.put("mes", true);
			result.put("continu", sign.getSign_continue());
			if(sign.getSign_continue()==7){
				result.put("dou", 5);
			}else{
				result.put("dou", 1);
			}
			return E3Result.ok(result);
		}else{
			result.put("mes", false);
			return E3Result.build(401, "签到信息获取异常");
		}		
	}
		
	//2018.02.07 显示本月签到日历
	@RequestMapping("/shop/sign/show")
	@ResponseBody
	public JSONArray show(HttpServletRequest request)throws Exception{
		JSONArray sign=new JSONArray();
		HttpSession session=request.getSession();
		User user=(User)session.getAttribute("currentUser");
		if(user!=null){
			SimpleDateFormat sd=new SimpleDateFormat("yyyy-MM"); //设置时间格式为天
			SimpleDateFormat sdf=new SimpleDateFormat("dd"); //设置时间格式为天
			String time = sd.format(new Date());    //格式化最近签到日期
			List<Operate> signs=operateService.getMonthListByuserId(user.getId(), time);
			List<String> list=new LinkedList<String>();
			for(Operate operate :signs){
				String date=sdf.format(operate.getOperate_time());
				list.add(date);
			}
			sign=JSONArray.fromObject(list);
		}
		return sign;
	}
	
}
