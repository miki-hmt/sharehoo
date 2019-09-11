package com.sharehoo.controller.forum;

import java.io.File;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import com.sharehoo.config.lang.Consts;
import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.forum.Reply;
import com.sharehoo.entity.forum.Section;
import com.sharehoo.entity.forum.Topic;
import com.sharehoo.entity.forum.User;
import com.sharehoo.entity.shop.NewsBanner;
import com.sharehoo.service.forum.NewsBannerService;
import com.sharehoo.service.forum.ReplyService;
import com.sharehoo.service.forum.SectionService;
import com.sharehoo.service.forum.TopicService;
import com.sharehoo.service.forum.UserService;
import com.sharehoo.util.forum.E3Result;
import com.sharehoo.util.forum.IDUtils;
import com.sharehoo.util.forum.PageUtil;
import com.sharehoo.util.forum.ResponseUtil;
import com.sharehoo.util.forum.StringUtil;

import freemarker.template.Configuration;
import freemarker.template.Template;
import net.sf.json.JSONObject;

@Controller
public class TopicController {
	
	private Logger logger = Logger.getLogger(TopicController.class);
	private static final long serialVersionUID = 1L;
	@Autowired
	private HttpServletRequest request;	
	@Resource
	private TopicService topicService;
	@Resource
	private NewsBannerService nbsBannerService;	
	@Resource
	private ReplyService replyService;	
	@Resource
	private SectionService sectionService;
	@Resource
	private UserService userService;
	
	
	@Value("${spring.freemarker.HTML_GEN_PATH}")
	private String HTML_GEN_PATH;
	@Value("${forum.leavemessage.SECRET_TOPIC}")
	private String SECRET_TOPIC;
	
	//2017.12.11 19:54	网页静态化实现
	@Autowired
	private FreeMarkerConfigurer freeMarkerConfigurer;
	
	@RequestMapping("/topic/write")
	// 发帖方法实现
	public String preSave(HttpServletRequest request,HttpServletResponse response,Model model,@RequestParam(value="sectionId",required=false) int sectionId) throws Exception {
		HttpSession session = request.getSession();
		User currentUser = (User) session.getAttribute(Consts.CURRENTUSER);

		// 验证发帖时，用户是否登录，如果没登录，自动跳转到指定页面2016.10.06
		if (currentUser == null) {
			request.getRequestDispatcher("/errorlogin").forward(request, response);
		}
		if(sectionId==0) {
			sectionId = 21;
		}
		Section curSection = sectionService.findSectionById(sectionId);
		model.addAttribute("curSection", curSection);
		List<Section> sectionList = sectionService.findSectionList(null, null);
		model.addAttribute("sectionList", sectionList);
		return "topic/topicAdd";
	}
	
	@RequestMapping("/topic/leftsecret")
	public String preSave2(HttpServletRequest request,HttpServletResponse response,Model model) throws Exception {
		HttpSession session = request.getSession();
		User currentUser = (User) session.getAttribute(Consts.CURRENTUSER);
		
		// 验证发帖时，用户是否登录，如果没登录，自动跳转到指定页面2016.10.06
		if (currentUser == null) {
			// response.sendRedirect(request.getContextPath()+"/login.jsp");
			request.getRequestDispatcher("/errorlogin").forward(request, response);
		}
		List<Section> sectionList = sectionService.findSectionList(null, null);
		model.addAttribute("sectionList", sectionList);
		return "topic/leavem";
	}
	
	/**
	* @Title: psave  
	* @Description: TODO(秘密墙发布话题)  
	* @author miki 
	* @date 2019年8月23日 下午1:33:18   
	* @throws
	 */
	@RequestMapping(value="/secret/publish",method = RequestMethod.POST)
	public String secretTopicSave(Topic topic) throws Exception {
		topic.setPublishTime(new Date());
		topic.setModifyTime(new Date());
		topicService.saveTopic(topic);
		return "redirect:";
	}
	
	
	/**
	* @Title: list  
	* @Description: TODO(对于{id}这样的参数必须要用@PathVariable来接收)  
	* @author miki 
	* @date 2019年8月27日 下午10:48:06   
	* @throws
	 */
	@RequestMapping("/topic/modify/{id}")
	public String update(Model model,@PathVariable("id") int id) throws Exception {
		Topic topic = topicService.findTopicById(id);	// 获取topicId之后得到tpic对象 2017.04.05，否则页面无法得到topic数据
		model.addAttribute("topic", topic);
		Section section = topic.getSection();			// 得到当前帖子所属的版块
		model.addAttribute("section", section);
		User user = topic.getUser(); 				// 得到当前帖子的作者
		model.addAttribute("user", user);
		String mainPage = "updateTopic.jsp";
		model.addAttribute("mainPage", mainPage);
		String crumb1 = "帖子修改";
		model.addAttribute("crumb1", crumb1);
		
		return "admin/main";
	}
	
	@RequestMapping("/topic/publish")
	@ResponseBody
	public E3Result save(HttpServletRequest request,HttpServletResponse response,Topic topic) throws Exception {

		final long code = IDUtils.genTopicCode();
		topic.setCode(code);

		topic.setPublishTime(new Date());
		topic.setModifyTime(new Date());

		// 2017.05.01 回复帖子实现用户积分+1
		HttpSession session = request.getSession();
		User currentUser = (User) session.getAttribute(Consts.CURRENTUSER);
		if (currentUser == null) {
			request.getRequestDispatcher("/errorlogin").forward(request, response);
		}
		topicService.saveTopic(topic);
		// 2017.05.01 发帖子实现用户积分+1
		currentUser.setScore(currentUser.getScore() + 3);
		userService.saveUser(currentUser);

		//************2017.11.16 20:31 网页静态化实例
		try {
			Topic to = topicService.getTopic(topic.getCode());
			
			int size = currentUser.getSectionList().size();
			// 创建一个数据集，Map将data封装进去
			Map data = new HashMap<>();
			data.put("user", currentUser);
			data.put("topic", topic);
			data.put("size", size);
			data.put("sectionList", currentUser.getSectionList());
			data.put("id", to.getId());
			// 加载模板对象
			Configuration configuration = freeMarkerConfigurer.getConfiguration();

			configuration.setDefaultEncoding("UTF-8");
			
			//************** 2019.09.07 miki 在springboot的yml文件中设置freeMarker模板文件的加载路径
			Template template = configuration.getTemplate("topic.ftl");		

			template.setEncoding("UTF-8");
			// 创建一个输出流，指定目录及文件名
			//Writer out=new FileWriter(HTML_GEN_PATH +topic.getCode()+ ".html");			

			File file = new File(HTML_GEN_PATH, topic.getCode() + ".html");
			Writer out = new PrintWriter(file, "UTF-8");
			//Writer outWriter=new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file),"UTF-8"));
			// 生成静态页面
			template.process(data, out);
			// 关闭流
			out.close();
		} catch (Exception e) {
			e.printStackTrace();logger.error(e);return E3Result.build(401, "发表失败..", e.getMessage());
			}
		return E3Result.ok();
	}
	
	@RequestMapping("/admin/topic/save")
	public String adminSaveTopic(@RequestBody Topic topic,Model model) throws Exception {

		topic.setModifyTime(new Date());
		topicService.saveTopic(topic);
		String mainPage = "test.jsp";
		model.addAttribute("mainPage", mainPage);
		return "successAdmin";
	}

	// 2017.04.04 前台帖子列表修改方法
	@RequestMapping("/topic/modify/{topicId}")
	public String modify(HttpServletRequest request,HttpServletResponse response,@PathVariable("topicId") int topicId) throws Exception {
		JSONObject result = new JSONObject();
		if (topicId > 0) {
			Topic topic = topicService.findTopicById(topicId);
			topic.setTop(0);
			topic.setGood(0);
			topicService.saveTopic(topic);
		}
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}

	/*
	 * miki 2017.06.20 设为精华帖
	 */
	@RequestMapping("/topic/hot/{topicId}")
	public String modifyHot(HttpServletRequest request,HttpServletResponse response,@PathVariable("topicId") int topicId) throws Exception {
		JSONObject result = new JSONObject();
		if (topicId > 0) {
			Topic topic = topicService.findTopicById(topicId);
			if (topic.getGood() == 1) {
				result.put("success", false);
				ResponseUtil.write(response, result);
				return null;
			}
			topic.setGood(1);
			topicService.saveTopic(topic);
		}
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}

	/*
	 * miki 2017.06.20 设为置顶帖
	 */
	@RequestMapping("/topic/top/{topicId}")
	public String modifyTop(HttpServletRequest request,HttpServletResponse response,@PathVariable("topicId") int topicId) throws Exception {
		JSONObject result = new JSONObject();
		if (topicId > 0) {
			Topic topic = topicService.findTopicById(topicId);
			if (topic.getTop() == 1) {
				result.put("success", false);
				ResponseUtil.write(response, result);
				return null;
			}
			topic.setTop(1);
			topicService.saveTopic(topic);
		}
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}

	/*
	 * 2017.05.04 留言板显示列表
	 */
	@RequestMapping("/secret")
	public String leaveList(@RequestParam(value="page",required = false) String page,Model model) throws Exception {
		if (StringUtil.isEmpty(page)) {
			page = "1";
		}
		PageBean pageBean = new PageBean(Integer.parseInt(page), Integer.parseInt(SECRET_TOPIC));
		List<Topic> leaveList = topicService.findPtTopicListBySectionId(17, pageBean);
		model.addAttribute("leaveList", leaveList);
		long total = topicService.getPtTopicCountBySectionId(17);
		String pageCode = PageUtil.genPagination(request.getContextPath() + "/secret", total,
				Integer.parseInt(page), Integer.parseInt(SECRET_TOPIC), null);
		model.addAttribute("pageCode", pageCode);
		return "leavemessage";
	}

	/**
	* @Title: list  
	* @Description: TODO(对于{id}这样的参数必须要用@PathVariable来接收)  
	* @author miki 
	* @date 2019年8月27日 下午10:48:06   
	* @throws
	 */
	@RequestMapping("/topic/section/{sectionId}")
	public String list(@PathVariable("sectionId") int sectionId,@RequestParam(value="page",required = false) String page,Model model) throws Exception {
		
		List<NewsBanner> bannerList = nbsBannerService.findSectionTopicBannerListByType();
		model.addAttribute("bannerList", bannerList);
		
		Section section = sectionService.findSectionById(sectionId);
		model.addAttribute("section", section);

		List<Topic> zdTopicList = topicService.findZdTopicListBySectionId(sectionId, null);
		model.addAttribute("zdTopicList", zdTopicList);
		
		if (StringUtil.isEmpty(page)) {
			page = "1";
		}
		PageBean pageBean = new PageBean(Integer.parseInt(page), 20);
		List<Topic> ptTopicList = topicService.findPtTopicListBySectionId(sectionId, pageBean);
		model.addAttribute("ptTopicList", ptTopicList);
		
		long total = topicService.getPtTopicCountBySectionId(sectionId);
		String pageCode = PageUtil.genPagination(request.getContextPath() + "//topic/section/"+sectionId, total,
				Integer.parseInt(page), 20, null);
		model.addAttribute("pageCode", pageCode);
		
		Map<Topic, Reply> topicLastReply=new HashMap<Topic, Reply>();
		Map<Topic, Long> topicReplyCount=new HashMap<Topic, Long>();
		for (Topic topic : zdTopicList) {
			Reply reply = replyService.findLastReplyByTopicId(topic.getId());
			Long replyCount = replyService.getReplyCountByTopicId(topic.getId());
			if (reply != null) {
				topicLastReply.put(topic, reply);
			}
			topicReplyCount.put(topic, replyCount);
		}
		
		for (Topic topic : ptTopicList) {
			Reply reply = replyService.findLastReplyByTopicId(topic.getId());
			Long replyCount = replyService.getReplyCountByTopicId(topic.getId());
			if (reply != null) {
				topicLastReply.put(topic, reply);
			}
			topicReplyCount.put(topic, replyCount);
		}
		model.addAttribute("topicLastReply", topicLastReply);
		model.addAttribute("topicReplyCount", topicReplyCount);
		return "topic/topicList";
	}

	/**
	 * 2017.04.13 后台显示所有帖子列表
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/admin/topics")
	public String listAdmin(@RequestParam(value="page",required = false) String page,Model model) throws Exception {
		if (StringUtil.isEmpty(page)) {
			page = "1";
		}
		Topic s_topic = new Topic();
		s_topic.setTop(2);
		s_topic.setGood(2);
		PageBean pageBean = new PageBean(Integer.parseInt(page), 10);
		List<Topic> topicList = topicService.findTopicList(s_topic, pageBean);
		model.addAttribute("topicList", topicList);
		long total = topicService.getTopicCount(s_topic);
		model.addAttribute("total", total);
		
		String pageCode = PageUtil.genPagination(request.getContextPath() + "/admin/topics", total,
				Integer.parseInt(page), 10, null);
		model.addAttribute("pageCode", pageCode);
		List<Section> sectionList = sectionService.findSectionList(null, null);
		model.addAttribute("sectionList", sectionList);
		String mainPage = "topic.jsp";
		model.addAttribute("mainPage", mainPage);
		
		//************** 添加父级菜单自动展开样式	2019.09.11 miki
		model.addAttribute("ul", "forum");
		
		return "admin/main";
	}

	/**
	 * 2017.04.13 搜索模块显示匹配帖子列表
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/topic/search")
	public String search(HttpServletRequest request,HttpServletResponse response,@RequestParam(value="page",required = false) String page,Model model) throws Exception {
		if (StringUtil.isEmpty(page)) {
			page = "1";
		}
		Topic s_topic = new Topic();
		s_topic.setTop(2);
		s_topic.setGood(2);
		PageBean pageBean = new PageBean(Integer.parseInt(page), 10);
		List<Topic> topicList = topicService.findTopicList(s_topic, pageBean);
		model.addAttribute("topicList", topicList);
		
		long total = topicService.getTopicCount(s_topic);
		model.addAttribute("total", total);
		String pageCode = PageUtil.genPagination(request.getContextPath() + "/topic/search", total,
				Integer.parseInt(page), 10, null);
		model.addAttribute("pageCode", pageCode);
		List<Section> sectionList = sectionService.findSectionList(null, null);
		model.addAttribute("sectionList", sectionList);
		String mainPage = "soutie.jsp";
		model.addAttribute("mainPage", mainPage);
		return "soutie";
	}
	
	
	/**
	* @Title: list  
	* @Description: TODO(对于{id}这样的参数必须要用@PathVariable来接收)  
	* @author miki 
	* @date 2019年8月27日 下午10:48:06   
	* @throws
	 */
	@RequestMapping("/topic/detail/{topicId}")
	public String details(HttpServletRequest request,HttpServletResponse response,@PathVariable("topicId") int topicId,
			@RequestParam(value="page",required = false) String page,Model model) throws Exception {
		Topic topic = topicService.findTopicById(topicId);
		model.addAttribute("topic", topic);
		if (StringUtil.isEmpty(page)) {
			page = "1";
		}
		PageBean pageBean = new PageBean(Integer.parseInt(page), 10);
		List<Reply> replyList = replyService.findReplyListByTopicId(topicId, pageBean);
		model.addAttribute("replyList", replyList);
		
		Map<Reply, Long> son=new HashMap<Reply, Long>();
		Map<Reply, List<Reply>> sonReplyList=new HashMap<Reply,List<Reply>>();
		long count = 0;
		for (Reply reply : replyList) {
			count = replyService.getSonCountByRid(reply.getId());
			son.put(reply, count);
			List<Reply> sonList = replyService.getsonListByRid(reply.getId());
			sonReplyList.put(reply, sonList);
		}
		model.addAttribute("sonReplyList", sonReplyList);
		model.addAttribute("son", son);
		
		long total = replyService.getReplyCountByTopicId(topicId);
		model.addAttribute("total", total);
		
		StringBuffer param = new StringBuffer();
		if (topicId > 0) {
			param.append("topicId=" + topicId);
		}
		String pageCode = PageUtil.genPagination(request.getContextPath() + "/topic/detail/"+topicId, total,
				Integer.parseInt(page), 10, param.toString());
		model.addAttribute("pageCode", pageCode);
		
		return "topic/topicDetails";
	}

	// 后台删除，单个操作实现
	@RequestMapping("/topic/delete")
	@ResponseBody
	public JSONObject backDelete(@RequestParam("topicId") int topicId) throws Exception {
		JSONObject result = new JSONObject();
		Topic topic = topicService.findTopicById(topicId);
		topicService.deleteTopic(topic);
		result.put("success", true);
		return result; // 原来为null
	}

	// topicList页面删除功能实现
	@RequestMapping("/topic/back-delete")
	@ResponseBody
	public JSONObject delete(@RequestParam("topicId") int topicId) throws Exception {
		JSONObject result = new JSONObject();
		if (topicId > 0) {
			int size = replyService.findReplyListByTopicId(topicId, null).size();
			if (size > 0) {
				result.put("success", false);				
				return result;
			}
			Topic topic = topicService.findTopicById(topicId);
			topicService.deleteTopic(topic);
			result.put("success", true);			
		}
		return result; // 原来为null,strust.xml里的通配符匹配，会自动跳转到Topic_list.action
	}

	// 删除多个操作
	@RequestMapping("/topic/batch-delete")
	@ResponseBody
	public JSONObject batchDelete(@RequestParam("ids") String ids) throws Exception {
		JSONObject result = new JSONObject();
		String[] idsStr = ids.split(",");
		for (int i = 0; i < idsStr.length; i++) {
			Topic e = topicService.findTopicById(Integer.parseInt(idsStr[i]));
			topicService.deleteTopic(e);
		}
		result.put("success", true);
		
		return result;
	}
}
