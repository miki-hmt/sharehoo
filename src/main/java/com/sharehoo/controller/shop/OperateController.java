package com.sharehoo.controller.shop;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.sharehoo.config.SessionUtil;
import com.sharehoo.config.annotation.HasLogin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sharehoo.config.lang.Consts;
import com.sharehoo.entity.forum.User;
import com.sharehoo.entity.shop.Collect;
import com.sharehoo.entity.shop.Focus;
import com.sharehoo.entity.shop.Message;
import com.sharehoo.entity.shop.Shop;
import com.sharehoo.entity.shop.Source;
import com.sharehoo.service.MessageService;
import com.sharehoo.service.shop.CollectService;
import com.sharehoo.service.shop.FocusService;
import com.sharehoo.service.shop.ShopService;
import com.sharehoo.service.shop.SourceService;
import com.sharehoo.util.forum.E3Result;
@Controller
public class OperateController {
	@Autowired
	private ShopService shopService;
	@Autowired
	private FocusService focusService;
	@Autowired
	private SourceService sourceService;
	@Autowired
	private CollectService collectService;
	@Autowired
	private MessageService messageService;
	
	/*
	 * 2017.08.10 miki 执行关注操作
	 */
	@RequestMapping("/shop/focus")
	@ResponseBody
	public E3Result focus(HttpServletRequest request,@RequestParam("shopId") int shopId)throws Exception {

		User user = SessionUtil.getUser();
		if(user!=null){
			if(shopId>0){
				Shop shop=shopService.getShopById(shopId);

				Focus focus=new Focus("关注店铺", new Date(), user, shop);
				focusService.save(focus);
				return E3Result.ok();
			}
			return E3Result.build(401, "关注失败");
		}
		return E3Result.build(401, "请登录后，再关注额");
	}
	
	

	/*
	 * 2017.08.10 miki 执行收藏操作
	 */
	@RequestMapping("/shop/collect")
	@ResponseBody
	public E3Result collect(HttpServletRequest request,@RequestParam("sourceId") int sourceId)throws Exception{

		User user = SessionUtil.getUser();
		if(user!=null){
			if(sourceId>0){
				Source source=sourceService.getSourceById(sourceId);
				
				Collect collect=new Collect(source.getShop(), user, source, null, "/shop/source/"+sourceId, new Date());
				collectService.save(collect);
				return E3Result.ok();
			}
			return E3Result.build(401, "您关注的资源不存在饿..");
		}
		return E3Result.build(401, "请登录后，再关注额");
	}
	
	/*
	 * 2017.08.12 miki 取消对资源的关注
	 */
	@RequestMapping("/shop/source/cancelFocus")
	@ResponseBody
	public E3Result cancelCollect(HttpServletRequest request,@RequestParam("sourceId") int sourceId)throws Exception{

		User user = SessionUtil.getUser();
		if(user!=null){
			if(sourceId>0){
				Collect collect=collectService.getCollectByuserId(user.getId(), sourceId);
				if(null!=collect) {
					collectService.delete(collect);
					return E3Result.ok();
				}						
				return E3Result.build(401, "您要找的资源失踪了饿");
			}
		}
		return E3Result.build(401, "请登录后，再关注额");
	}
	
	/*
	 * 2017.08.12 miki	取消对店铺的关注
	 */
	@RequestMapping("/shop/cancelFocus")
	@ResponseBody
	public E3Result cancelFocus(HttpServletRequest request,@RequestParam("shopId") int shopId)throws Exception{

		User user = SessionUtil.getUser();
		if(user!=null){
			if(shopId>0){
				Focus focus=focusService.getFocusByShopId(shopId, user.getId());
				focusService.delete(focus);
				return E3Result.ok();
			}
			return E3Result.build(401, "您要找的资源失踪了饿");
		}
		return E3Result.build(401, "请登录后，再关注额");
	}
	
	@RequestMapping("/shop/message/send")
	@ResponseBody
	public E3Result operate(HttpServletRequest request,@RequestParam("sourceId") int sourceId,Message message)throws Exception{

		User user = SessionUtil.getUser();
		if(user!=null){
			if(sourceId>0){
				message.setTime(new Date());
				message.setType("send");
				messageService.saveMessage(message);
				return E3Result.ok();		
			}
			return E3Result.build(401, "您要举报的资源不存在饿");
		}
		return E3Result.build(401, "请登录后，再关注额");
	}
	
	/*
	 * miki 2017.08.29 举报方法实现
	 */
	@RequestMapping("/shop/message/report")
	@ResponseBody
	public E3Result report(HttpServletRequest request,@RequestParam("sourceId") int sourceId,Message message)throws Exception{
		User user = SessionUtil.getUser();
		if(user!=null){
			if(sourceId>0){
				message.setTime(new Date());
				message.setType("send");
				messageService.saveMessage(message);
				return E3Result.ok();		
			}
			return E3Result.build(401, "您要举报的资源不存在饿");
		}
		return E3Result.build(401, "请登录后，再关注额");
	}
}
