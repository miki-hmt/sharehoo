package com.sharehoo.controller.forum;

import java.io.File;
import java.io.IOException;
import java.security.Security;
import java.text.MessageFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sharehoo.base.exception.UserException;
import com.sharehoo.base.ipseek.IpGet;
import com.sharehoo.base.ipseek.IpSeekUtils;
import com.sharehoo.config.lang.Consts;
import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.forum.Reply;
import com.sharehoo.entity.forum.Section;
import com.sharehoo.entity.forum.Topic;
import com.sharehoo.entity.forum.User;
import com.sharehoo.entity.shop.Log;
import com.sharehoo.service.LogService;
import com.sharehoo.service.forum.ReplyService;
import com.sharehoo.service.forum.SectionService;
import com.sharehoo.service.forum.TopicService;
import com.sharehoo.service.forum.UserService;
import com.sharehoo.util.CxCacheUtil;
import com.sharehoo.util.forum.DateUtil;
import com.sharehoo.util.forum.GaoDeUtil;
import com.sharehoo.util.forum.MD5;
import com.sharehoo.util.forum.NavUtil;
import com.sharehoo.util.forum.PageUtil;
import com.sharehoo.util.forum.RadomUtil;
import com.sharehoo.util.forum.ResponseUtil;
import com.sharehoo.util.forum.StringUtil;

import cn.itcast.commons.CommonUtils;
import net.sf.json.JSONObject;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private LogService logService;
	@Autowired
	private ReplyService replyService;
	@Autowired
	private TopicService topicService;
	@Autowired
	private SectionService sectionService;
	/**
	 * miki
	 * date:2017.04.14
	 * 用户注册邮箱发送激活邮件功能
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/user/register")
	public String register(@RequestParam("file") File face,@PathVariable("faceFileName") String faceFileName,
			@RequestBody User user)throws Exception{
		if (face!=null) {
			String basePath = (String)CxCacheUtil.getIntance().getValue(Consts.ROOT_PATH);
			String imageName=DateUtil.getCurrentDateStr();
			String realPath = basePath + Consts.FORUM_UPLOAD_PATH + Consts.FORUM_UPLOAD_USER_FOLDER + "/images/user/";

			String imageFile=imageName+"."+faceFileName.split("\\.")[1];
			File saveFile=new File(realPath,imageFile);
			FileUtils.copyFile(face, saveFile);
			user.setFace("images/user/"+imageFile);//原来为"images/user/"   2016.10.12
		}else{
			user.setFace("images/user/timg1.jpg");
		}
		user.setRegTime(new Date());
		
		/*
		 * MD5加密用户密码
		 * 2017.05.27
		 */
		user.setPassword(new MD5().complie(user.getPassword().trim())); //trim函数，去掉字符串中的首，尾空格
		
		user.setStatus(false);				//2017.04.14 注册时设置状态为false，不可登录状态
		user.setActivationCode(CommonUtils.uuid()+CommonUtils.uuid());	//2017.04.14  自动生成激活码，用于邮箱验证，需要导入itcast-tools-1.4.jar包
		userService.saveUser(user);
		
		
		/* 3. 发邮件   **3**
		 * 把配置文件内容加载到prop中
		 */
		Properties props = new Properties();
		try {
			props.load(this.getClass().getClassLoader().getResourceAsStream("email_template.properties"));
		} catch (IOException e1) {
			throw new RuntimeException(e1);
		}
		
		//登录邮件服务器，得到session
    	
        //设置SSL连接、邮件环境
        Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());                      

        //建立邮件会话
        
        final String userName=props.getProperty("username");
        final String password=props.getProperty("password");
        
        Session session = Session.getDefaultInstance(props, new Authenticator() {
            //身份认证
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(userName, password);
            }
        });
        //建立邮件对象
        MimeMessage message = new MimeMessage(session);
        //设置邮件的发件人、收件人、主题
            //附带发件人名字
        
        String from=props.getProperty("from");
        String title=props.getProperty("subject");
        String to = user.getEmail();
        String content = MessageFormat.format(props.getProperty("content"),user.getActivationCode(),user.getNickName());		//内容
        
        message.setFrom(new InternetAddress(from));
        message.setRecipients(Message.RecipientType.TO,to);
        
        //邮件标题
        message.setSubject(title);
        
        //文本部分
        MimeBodyPart textPart = new MimeBodyPart();
        textPart.setContent("<img src='cid:myimg'/><div style='width:1193px; height:100px;border:1px solid red'>"+content+"</div>", "text/html;charset=UTF-8");
        //内嵌图片部分
        MimeBodyPart imagePart = new MimeBodyPart();
        imagePart.setDataHandler(new DataHandler(new FileDataSource("D:/soft/logo.jpg")));//图片路径
        imagePart.setContentID("myimg");
        //图文整合，关联关系
        MimeMultipart mmp1 = new MimeMultipart();
        mmp1.addBodyPart(textPart);
        mmp1.addBodyPart(imagePart);
        mmp1.setSubType("related");
        MimeBodyPart textImagePart = new MimeBodyPart();
        textImagePart.setContent(mmp1);
        //附件部分
        MimeBodyPart attachmentPart = new MimeBodyPart();
        DataHandler dh = new DataHandler(new FileDataSource("D:/soft/freemarker/file/sharehoo社区福利.txt"));//文件路径
        String fileName = dh.getName();
        attachmentPart.setDataHandler(dh);
        attachmentPart.setFileName(fileName);
        //图文和附件整合，复杂关系
        MimeMultipart mmp2 = new MimeMultipart();
        mmp2.addBodyPart(textImagePart);
        mmp2.addBodyPart(attachmentPart);
        mmp2.setSubType("mixed");
        //将以上内容添加到邮件的内容中并确认
        message.setContent(mmp2);
        message.saveChanges();
        //发送邮件
        Transport.send(message);
		
		
		//User currentUser=userService.getUserByNickName(user.getNickName()); //定义一个当前对象赋给刚注册成功的用户
		//request.getSession().setAttribute("currentUser", currentUser);
		return "register_success";
	}
	
	
	/**
	 * miki
	 * date:2017.04.14
	 * 激活链接：120.25.78.31:8080/Forum/User_active.action?
	 * 用户邮箱激活邮件功能
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/user/active")
	public String active(HttpServletRequest request,@PathVariable("activationCode") String activationCode)throws Exception{
		HttpSession session=request.getSession();
		User user = null;
		try {
		
		user=userService.findUserByActivationCode(activationCode);
		user.setId(user.getId());

		if(user == null) throw new UserException("无效的激活码！");
		if(user.isStatus()) throw new UserException("您已经激活过了，不要二次激活！");
		user.setStatus(true);
		userService.saveUser(user);
		request.setAttribute("code", "success");//通知msg.jsp显示对号
		request.setAttribute("msg", "恭喜，激活成功，请马上登录！");
	} catch (UserException e) {
		// 说明service抛出了异常
		request.setAttribute("msg", e.getMessage());
		request.setAttribute("code", "error");//通知msg.jsp显示X
	}
		User currentUser=userService.getUserByNickName(user.getNickName()); //定义一个当前对象赋给刚注册成功的用户
		request.getSession().setAttribute("currentUser", currentUser);

		return "msg";		
	}
	
	
	@RequestMapping("/user/update")	
	public String modify(@RequestBody User user,@RequestParam("face") File face,@PathVariable("faceFileName") String faceFileName,
			HttpServletRequest request)throws Exception{
		if(null!=user){
			User old=userService.getUserById(user.getId());
			if (face!=null) {
				String imageName=DateUtil.getCurrentDateStr();
				String basePath = (String)CxCacheUtil.getIntance().getValue(Consts.ROOT_PATH);
				String realPath = basePath + Consts.FORUM_UPLOAD_PATH + Consts.FORUM_UPLOAD_USER_FOLDER + "/images/user/";

				String imageFile=imageName+"."+faceFileName.split("\\.")[1];
				File saveFile=new File(realPath,imageFile);
				FileUtils.copyFile(face, saveFile);
				user.setFace("images/user/"+imageFile);//原来为"images/user/" 
			}else{
				user.setFace(old.getFace());
			}
			if(StringUtils.isEmpty(user.getEmail())){
				user.setEmail(old.getEmail());
			}
			if(StringUtils.isEmpty(user.getMobile())){
				user.setMobile(old.getMobile());
			}
			if(StringUtils.isEmpty(user.getNickName())){
				user.setNickName(old.getNickName());
			}
			if(StringUtils.isEmpty(user.getTrueName())){
				user.setTrueName(old.getTrueName());
			}
			if(null==user.getRegTime()){
				user.setRegTime(old.getRegTime());
			}
			user.setType(old.getType());

			user.setPassword(new MD5().complie(user.getPassword().trim()));
			
			userService.saveUser(user);						
			request.getSession().invalidate(); //注销session
		}
		
		return "redirect:home";
	}
	
	@RequestMapping("/user/check-name")
	@ResponseBody
	public JSONObject existUserWithUserName(@PathVariable("nickName") String nickName)throws Exception{
		boolean exist=userService.existUserWithNickName(nickName);
		JSONObject result=new JSONObject();
		if (exist) {
			result.put("exist", true);
		} else {
			result.put("exist", false);
		}
		
		return result;
	}
	
	@RequestMapping("/user/check-email")
	@ResponseBody
	public JSONObject existUserWithEmail(@PathVariable("email") String email)throws Exception{
		boolean exist=userService.existUserWithEmail(email);
		JSONObject result=new JSONObject();
		if (exist) {
			result.put("exist", true);
			System.out.println("miki2222222");
		} else {
			result.put("exist", false);
		}
		return result;
	}
	
	/*
	 * 2017.05.06
	 * miki
	 * 用户找回密码判断
	 */
	@RequestMapping("/user/truename")
	@ResponseBody
	public JSONObject existUserWithTrueName(HttpServletRequest request,@PathVariable("trueName") String trueName)throws Exception{
		HttpSession session=request.getSession();
		boolean exist=userService.existUserWithTrueName(trueName);
		JSONObject result=new JSONObject();
		if (exist) {
			result.put("exist", true);
			session.setAttribute("trueName", trueName);  // 2017.05.06  找回密码的关键一步，要将trueName赋给session不然无法取到trueName的值
		} else {
			result.put("exist", false);
		}
		return result;
	}
	
	/**
	 * 2017.05.06
	 * miki
	 * 用户找回密码
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/user/find")
	@ResponseBody
	public String find(HttpServletRequest request,@PathVariable("trueName") String trueName,@PathVariable("imageCode") String imageCode)throws Exception{
		HttpSession session1=request.getSession();
		
		if(!imageCode.equals(session1.getAttribute("sRand"))){
			String error="验证码错误！";			
			session1.setAttribute("error", error);	
		}
		else{
			trueName=session1.getAttribute("trueName").toString();
		}
		
		if(trueName!=null){
		User user=userService.findUserByTrueName(trueName);
		String sa="miki";
		sa="miki"+RadomUtil.getRandNum(1, 999999);
		
		/*
		 * miki
		 * 2017.05.27
		 * 找回密码也要对新密码加密
		 */
		user.setPassword(new MD5().complie(sa).trim());
		userService.saveUser(user);
		request.setAttribute("code", "success");//通知msg.jsp显示对号
		request.setAttribute("msg", "恭喜，密码修改成功，请马上登录！");
		
		
		/* 3. 发邮件   **3**
		 * 把配置文件内容加载到prop中
		 */
		Properties props = new Properties();
		try {
			props.load(this.getClass().getClassLoader().getResourceAsStream("email_template3.properties"));
		} catch (IOException e1) {
			throw new RuntimeException(e1);
		}
		
		//登录邮件服务器，得到session
    	
        //设置SSL连接、邮件环境
        Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());                      

        //建立邮件会话
        
        final String userName=props.getProperty("username");
        final String password=props.getProperty("password");
        
        Session session = Session.getDefaultInstance(props, new Authenticator() {
            //身份认证
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(userName, password);
            }
        });
        //建立邮件对象
        MimeMessage message = new MimeMessage(session);
        //设置邮件的发件人、收件人、主题
            //附带发件人名字
        
        String from=props.getProperty("from");
        String title=props.getProperty("subject");
        String to = user.getEmail();
        String content = MessageFormat.format(props.getProperty("content"),sa);		//内容
        
        message.setFrom(new InternetAddress(from));
        message.setRecipients(Message.RecipientType.TO,to);
        
        //邮件标题
        message.setSubject(title);
        
        //文本部分
        MimeBodyPart textPart = new MimeBodyPart();
        textPart.setContent("<img src='cid:myimg'/><div style='width:1193px; height:100px;border:1px solid red'>"+content+"</div>", "text/html;charset=UTF-8");
        //内嵌图片部分
        MimeBodyPart imagePart = new MimeBodyPart();
        imagePart.setDataHandler(new DataHandler(new FileDataSource("D:/soft/logo.jpg")));//图片路径
        imagePart.setContentID("myimg");
        //图文整合，关联关系
        MimeMultipart mmp1 = new MimeMultipart();
        mmp1.addBodyPart(textPart);
        mmp1.addBodyPart(imagePart);
        mmp1.setSubType("related");
        MimeBodyPart textImagePart = new MimeBodyPart();
        textImagePart.setContent(mmp1);
        //附件部分
        MimeBodyPart attachmentPart = new MimeBodyPart();
        DataHandler dh = new DataHandler(new FileDataSource("D:/soft/freemarker/file/sharehoo社区福利.txt"));//文件路径
        String fileName = dh.getName();
        attachmentPart.setDataHandler(dh);
        attachmentPart.setFileName(fileName);
        //图文和附件整合，复杂关系
        MimeMultipart mmp2 = new MimeMultipart();
        mmp2.addBodyPart(textImagePart);
        mmp2.addBodyPart(attachmentPart);
        mmp2.setSubType("mixed");
        //将以上内容添加到邮件的内容中并确认
        message.setContent(mmp2);
        message.saveChanges();
        //发送邮件
        Transport.send(message);
		
		}
		return "1msg";
	}
	/**
	 * 2017.04.15
	 * miki
	 * 用户未激活账户登录时，系统会提示错误，并禁止登录
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/user/login")
	public String login(HttpServletRequest request,@RequestBody User user,@PathVariable("imageCode") String imageCode,@PathVariable("error") String error)throws Exception{	
		HttpSession session=request.getSession();
		/*
		 * 2017.05.27 miki
		 * 将得到的新用户密码加密保存，然后与数据库里的密码作对比，
		 * 加密字符串后面必须要加上函数.trim(),因为不去掉首尾空格的话，加密的数据会不一致 
		 */
		user.setPassword(new MD5().complie(user.getPassword().trim()));		
		User currentUser=userService.login(user);
		
		if(!imageCode.equals(session.getAttribute("sRand"))){
			error="验证码错误！";			
			session.setAttribute("error", error);			
		}else
			if(currentUser==null){
			error="用户名或密码错误！";			
			session.setAttribute("error", error);			
		}
		else 
			if(currentUser.isStatus()==false){
			error="用户未激活，请激活后登录！";			
			session.setAttribute("error", error);
		}else{
			session.setAttribute("currentUser", currentUser);
			session.removeAttribute("error");		
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
			log1.setType("userLogin");
			log1.setOperation_log("用户登录");
			log1.setUser(currentUser);
			logService.save(log1);
						
			/*
			 *2017.05.29 miki 统计未读信息数
			 */
			Long count2=replyService.getUnReplyCountByUserId(currentUser.getId());
			session.setAttribute("count", count2);
			System.out.println("未读信息数目："+count2);
			}
		if (user.getType()==3) {
			return "adminLogin";
		} else {
			return "log_result";
		}
	}
	
	@RequestMapping("/admin/user/login")
	public String loginAdmin(HttpServletRequest request,@RequestBody User user,@PathVariable("imageCode") String imageCode,
			@PathVariable("error") String error)throws Exception{
		HttpSession session=request.getSession();
		//HttpServletRequest req=(HttpServletRequest)ServletActionContext.getRequest();
		/*
		 * 2017.05.27 将得到的新用户密码加密保存，然后与数据库里的密码作对比 加密字符串后面必须要
		 * 加上函数.trim(),因为不去掉首尾空格的话，加密的数据会不一致 miki
		 */
		user.setPassword(new MD5().complie(user.getPassword().trim()));
		System.out.println(user.getPassword());
		
		User currentUser=userService.login(user);
		if (currentUser!=null&&currentUser.getType()==2) {
			session.setAttribute("currentUser", currentUser);
			
			Log log1=new Log();
			String ip=IpGet.getIp2(request);
			String address=GaoDeUtil.getAddress(ip);	//2018.01.27运用高德api得到当前地址
			if(address.equals("[]")){
				String provence=IpSeekUtils.getIpProvinceByBaidu(ip);
				log1.setAddress(provence+">"+"手机Ip访问");
			}else{
				String provence=IpSeekUtils.getIpProvinceByBaidu(ip);
				if(address!=null && address!=""){
					log1.setAddress(provence+">"+address);
				}
			}	
			log1.setIp(ip);
			log1.setTime(new Date());
			log1.setType("adminLogin");
			log1.setOperation_log("管理员登录");
			logService.save(log1);
			
			
		}else {
			error="用户名或密码错误！";
			return "login";
		}
		return "admin/main";
	}
	
	@RequestMapping("/user/logout")
	public String logout(HttpServletRequest request)throws Exception{
		request.getSession().invalidate();
		return "redirect:home";
	}
	
	@RequestMapping("/admin/user/logout")
	public String logout2(HttpServletRequest request)throws Exception{
		request.getSession().invalidate();
		return "redirect:login";
	}
	
	@RequestMapping("/user/modify")
	public String preSave(HttpServletRequest request,Model model)throws Exception{
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("currentUser");
		model.addAttribute("user", user);
		String navCode=NavUtil.genNavCode("个人中心");
		model.addAttribute("navCode", navCode);
		return "userCenter/userModify";
	}
	
	

	/**
	 * miki
	 * 2017.05.29
	 * 补充实现个人中心帖子数目及列表查询功能
	 * 查询未读消息
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/user/center")
	public String userCenter(HttpServletRequest request,Model model)throws Exception{
		
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("currentUser");
		
		/*
		 * 2017.05.29
		 * miki
		 * 统计未读信息数
		 */
		Long count2=replyService.getUnReplyCountByUserId(user.getId());		
		model.addAttribute("count", count2);
		
		String navCode=NavUtil.genNavCode("个人中心");
		model.addAttribute("navCode", navCode);
		return "userCenter/userHome";
	}
	
	

	/**
	 * miki
	 * 2017.05.12
	 * 更新个人中心模块功能
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/user/info")
	public String getUserInfo(Model model)throws Exception{
		
		String navCode=NavUtil.genNavCode("个人中心");
		model.addAttribute("navCode", navCode);
		String mainPage="userCenter/userInfo.jsp";
		model.addAttribute("mainPage", mainPage);
		return "userCenter/userHome";
	}
	
	
	/**
	 * miki
	 * 2017.05.12
	 * 更新个人中心模块功能
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/user/main")
	public String center(HttpServletRequest request,Model model)throws Exception{
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("currentUser");
		model.addAttribute("user", user);
		String navCode=NavUtil.genNavCode("个人中心");
		model.addAttribute("navCode", navCode);
		return "userCenter/center";
	}
	
	
	/**
	 * miki
	 * 2017.05.12
	 * 更新个人中心  模帖子版块
	 */
	@RequestMapping("/user/topic")
	public String topic(HttpServletRequest request,Model model,@PathVariable("page") String page)throws Exception{
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("currentUser");
		model.addAttribute("user", user);
		if(user.getId()>0){
		System.out.println("用户："+user.getId());
		Long count1=topicService.getTopicCountByUserId(user.getId());
		
		model.addAttribute("count1", count1);
				
		if (StringUtil.isEmpty(page)) {
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page),8);
		List<Topic> TopicList=topicService.findTopicListByUserId(user.getId(), pageBean);
		model.addAttribute("topicList", TopicList);
		Map<Topic, Reply> topicLastReply=new HashMap<Topic, Reply>();
		Map<Topic, Long> topicReplyCount=new HashMap<Topic, Long>();
		
		for (Topic topic : TopicList) {
			Reply reply=replyService.findLastReplyByTopicId(topic.getId());
			Long replyCount=replyService.getReplyCountByTopicId(topic.getId());
			if (reply!=null) {
				topicLastReply.put(topic, reply);
			}
			topicReplyCount.put(topic, replyCount);
		}
		
		model.addAttribute("topicLastReply", topicLastReply);
		model.addAttribute("topicReplyCount", topicReplyCount);
		
		long topicTotal=topicService.getTopicCountByUserId(user.getId());
		String pageCode=PageUtil.genPagination(request.getContextPath()+"/User_topic.action", topicTotal, Integer.parseInt(page), 8,null);
		model.addAttribute("pageCode", pageCode);
	}			
		String navCode=NavUtil.genNavCode("个人中心");
		model.addAttribute("navCode", navCode);
		return "userCenter/userTopic";
	}
	
	/**
	 * miki
	 * 2017.05.12
	 * 更新个人中心  我的问答版块
	 */
	@RequestMapping("/user/answer")
	public String answer(HttpServletRequest request,Model model,@PathVariable("page") String page)throws Exception{
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("currentUser");
		model.addAttribute("user", user);
		if (StringUtil.isEmpty(page)) {
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page),8);
		List<Topic> TopicList=topicService.getTopicListByUserId(user.getId(), pageBean);
		model.addAttribute("topicList", TopicList);
		Map<Topic, Reply> topicLastReply=new HashMap<Topic, Reply>();
		Map<Topic, Long> topicReplyCount=new HashMap<Topic, Long>();
		
		for (Topic topic : TopicList) {
			Reply reply=replyService.findLastReplyByTopicId(topic.getId());
			Long replyCount=replyService.getReplyCountByTopicId(topic.getId());
			if (reply!=null) {
				topicLastReply.put(topic, reply);
			}
			topicReplyCount.put(topic, replyCount);
		}
		
		model.addAttribute("topicLastReply", topicLastReply);
		model.addAttribute("topicReplyCount", topicReplyCount);
		
		long topicTotal=topicService.getAnswerCountByUserId(user.getId());
		String pageCode=PageUtil.genPagination(request.getContextPath()+"/User_answer.action", topicTotal, Integer.parseInt(page), 8,null);			
		model.addAttribute("pageCode", pageCode);
		return "userCenter/answerTopic";
	}
	
	/*
	 * miik
	 * 2017.05.29
	 * 用户未读信息列表
	 */
	@RequestMapping("/user/reply")
	public String unReply(HttpServletRequest request,Model model,@PathVariable("page") String page)throws Exception{
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("currentUser");
		model.addAttribute("user", user);
		/*
		 * 2017.05.29
		 * miki
		 * 统计未读信息数
		 */
		Long count2=replyService.getUnReplyCountByUserId(user.getId());
		model.addAttribute("count", count2);
		
		if (StringUtil.isEmpty(page)) {
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), 8);
		
		List<Reply> unReplyList=replyService.unReplyListByUserId(user.getId(), pageBean);
		model.addAttribute("unReplyList", unReplyList);
		Map<Reply, Topic> to=new HashMap<Reply, Topic>();	//得到所属帖子的信息
		Map<Reply,User> uu=new HashMap<Reply,User>();	//得到回复人的个人信息
		
		for(Reply reply : unReplyList){
			Topic topic=topicService.findTopicById(reply.getTopic().getId());
			if(topic!=null){
				to.put(reply,topic);
			}
			if(null!=userService.getUserById(reply.getUser().getId())){
				uu.put(reply, user);
			}	
		}
		model.addAttribute("to", to);
		model.addAttribute("uu", uu);
		
		long replyTotal=replyService.getUnReplyCountByUserId(user.getId());
		String pageCode=PageUtil.genPagination(request.getContextPath()+"/User_unReply.action", replyTotal, Integer.parseInt(page), 8,null);
		model.addAttribute("pageCode", pageCode);
		return "userCenter/userMesg";
	}
	
	@RequestMapping("/admin/user/save")
	public String save(HttpServletRequest request,@RequestBody User user)throws Exception{
		userService.saveUser(user);
		//session.setAttribute("currentUser", user);
		/*navCode=NavUtil.genNavCode("个人中心");
		mainPage="userCenter/userInfo.jsp";*/
		return "admin/main";
	}
	@RequestMapping("/admin/user/list")
	public String list(HttpServletRequest request,@PathVariable("page") String page,Model model)throws Exception{
		if (StringUtil.isEmpty(page)) {
			page="1";
		}
		
		PageBean pageBean=new PageBean(Integer.parseInt(page),6);
		List<User> userList=userService.findUserList(null, pageBean);
		model.addAttribute("userList", userList);
		List<Section> sectionList=sectionService.findSectionList(null, null);
		model.addAttribute("sectionList", sectionList);
		long total=userService.getUserCount(null);
		String pageCode=PageUtil.genPagination(request.getContextPath()+"/admin/User_list.action", total, Integer.parseInt(page), 6,null);
		model.addAttribute("pageCode", pageCode);
		String mainPage="user.jsp";
		model.addAttribute("mainPage", mainPage);
		String crumb1="用户管理";
		model.addAttribute("crumb1", crumb1);
		return "admin/main";
	}
	
	@RequestMapping("/admin/user/deletes")
	@ResponseBody
	public JSONObject deleteUsers(HttpServletRequest request,@PathVariable("ids") String ids)throws Exception{
		JSONObject result=new JSONObject();
		String[] idsStr=ids.split(",");
		for (int i = 0; i < idsStr.length; i++) {
			User u=userService.getUserById(Integer.parseInt(idsStr[i]));
			if (u.getSectionList().size()>0) {
				result.put("info", u.getNickName()+"是版主，不能删除！");
				return result;
			}
		}
		for (int i = 0; i < idsStr.length; i++) {
			User u=userService.getUserById(Integer.parseInt(idsStr[i]));
			userService.delete(u);
		}
		result.put("info", "删除成功！");
		return result;
	}
	
	@RequestMapping("/admin/user/delete/{userId}")
	@ResponseBody
	public JSONObject delete(@PathVariable("userId") int userId)throws Exception{
		JSONObject result=new JSONObject();
		User e=userService.getUserById(userId);
		if(e.getSectionList().size()>0){
			result.put("info", "此用户是版主，不能删除！");
			
			return result;
		}else {
			userService.delete(e);
			result.put("info", "删除成功！");
			return result;
		}
	}
	@RequestMapping("/admin/user/add/{userId}")
	@ResponseBody
	public JSONObject saveUser(@PathVariable("userId") int userId,@RequestBody User user)throws Exception{
		JSONObject result=new JSONObject();
		if(userId>0){
		User user1=userService.getUserById(userId);
		user.setFace(user1.getFace());
		userService.saveUser(user);
		result.put("success", true);
		}else{
			result.put("success", true);
		}
		return result;
	}
	
	@RequestMapping("/admin/user/modify/{userId}")
	@ResponseBody
	public JSONObject modifyPassword(@RequestBody User user)throws Exception{
		User u=userService.getUserById(user.getId());	
		/*
		 * miki
		 * 2017.05.27
		 * 修改密码时，加密用户密码
		 */
		u.setPassword(new MD5().complie(user.getPassword().trim()));
		userService.saveUser(u);
		JSONObject result=new JSONObject();
		result.put("success", true);

		return result;
	}
}