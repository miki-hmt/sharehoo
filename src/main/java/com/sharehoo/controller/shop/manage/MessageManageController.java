package com.sharehoo.controller.shop.manage;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.sharehoo.config.SessionUtil;
import com.sharehoo.config.annotation.HasLogin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sharehoo.config.lang.Consts;
import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.forum.User;
import com.sharehoo.entity.shop.Message;
import com.sharehoo.entity.shop.Source;
import com.sharehoo.service.MessageService;
import com.sharehoo.service.shop.SourceService;
import com.sharehoo.util.forum.E3Result;
import com.sharehoo.util.forum.PageUtil;
import com.sharehoo.util.forum.StringUtil;

@Controller
public class MessageManageController {
	
	@Autowired
	private MessageService messageService;
	@Autowired
	private SourceService sourceService;

	@HasLogin
	@RequestMapping("/admin/messages")
	public String msList(HttpServletRequest request,Model model,@RequestParam(value="page",required=false) String page)throws Exception{

		User user = SessionUtil.getUser();
		if (user.getType()==2) {
			if (StringUtil.isEmpty(page)) {
				page="1";
			}
			PageBean pageBean=new PageBean(Integer.parseInt(page), 10);
			List<Message> mesList=messageService.findNoticeList(pageBean);
			model.addAttribute("mesList", mesList);
			long total=messageService.getMessageCount();
			String pageCode=PageUtil.genPagination(request.getContextPath()+"/admin/messages", total, Integer.parseInt(page), 10,null);
			model.addAttribute("pageCode", pageCode);
		}else {
			String error="我已经记录你的ip了，再乱来，你就死定了！";
			model.addAttribute("error", error);
			return "admin/login";
		}
		
		//旧版本无用代码	2020.08.15 miki
		/*String mainPage="shop_message.jsp";
		model.addAttribute("mainPage", mainPage);
		String crumb1="举报管理";
		model.addAttribute("crumb1", crumb1);		
		//************** 添加父级菜单自动展开样式	2019.09.11 miki
		model.addAttribute("ul", "download");*/
		
		return "admin/shop_message";
		
	}

	@RequestMapping("/admin/message/save")
	@ResponseBody
	public E3Result save(HttpServletRequest request,@RequestParam("sourceId") int sourceId,@RequestParam("id") int id,Message message)throws Exception{

		User user = SessionUtil.getUser();
		if (user!=null&&user.getType()==2) {
			if(sourceId>0){
				Source source=sourceService.getSourceById(sourceId);
				message.setType("handle");
				message.setTime(new Date());
				message.setShop(source.getShop());
				message.setSource(source);
				message.setStatus(0);
				messageService.save(message);
				Message message2=messageService.getMessageById(id);
				message2.setStatus(1);
				messageService.saveMessage(message2);

				return E3Result.ok();
			}
		}
		String error="我已经记录你的ip了，再乱来，你就死定了！";
		return E3Result.build(401, error);
}
}
