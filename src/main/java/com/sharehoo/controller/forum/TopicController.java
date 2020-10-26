package com.sharehoo.controller.forum;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.*;
import java.util.stream.Collectors;

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
import org.springframework.web.bind.annotation.PostMapping;
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
import com.sharehoo.entity.shop.Log;
import com.sharehoo.entity.shop.NewsBanner;
import com.sharehoo.service.LogService;
import com.sharehoo.service.forum.NewsBannerService;
import com.sharehoo.service.forum.ReplyService;
import com.sharehoo.service.forum.SectionService;
import com.sharehoo.service.forum.TopicService;
import com.sharehoo.service.forum.UserService;
import com.sharehoo.util.PostUrlsToBaidu;
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
	@Autowired
	private LogService logService;
	
	@Value("${spring.freemarker.HTML_GEN_PATH}")
	private String HTML_GEN_PATH;
	@Value("${forum.leavemessage.SECRET_TOPIC}")
	private String SECRET_TOPIC;

	@Value("${forum.version.old:false}")
	private String oldVersion;

	//2017.12.11 19:54	网页静态化实现
	@Autowired
	private FreeMarkerConfigurer freeMarkerConfigurer;

	@RequestMapping("topic/map")
	public String navPage(){

		return "bbs/forum_description";
	}


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
		List<String> urls = new ArrayList<String>();
		
		//2020.05.05 miki 推送网站信息到百度爬虫
		for (Section section : sectionList) {
			urls.add("http://sharehoo.cn/topic/section/"+section.getId());
		}
		String result = PostUrlsToBaidu.postUrl(urls);
		Log log = new Log();
		log.setTime(new Date());
		log.setType("commit url");
		log.setOperation_log("向百度提交17个版本的链接："+result);
		log.setUser(currentUser);		
		logService.save(log);
		
		model.addAttribute("sectionList", sectionList);
		
		/** 2020.10.26
		 * miki
		 * 得到回版主推荐的帖子列表
		 */
		List<Topic> tjTopicList=topicService.findGoodTopicList(null, new PageBean(1, 10));
		model.addAttribute("tjTopicList", tjTopicList);
		
		//旧版本的兼容性问题	设置为true，则显示旧的页面		2020.09.06 miki
		if("true".equals(oldVersion)){
			return "topic/topicAdd";
		}
		return "bbs/create_topic";
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
	@ResponseBody
	public E3Result secretTopicSave(HttpServletRequest request,HttpServletResponse response,Topic topic) throws Exception {
		topic.setPublishTime(new Date());
		topic.setModifyTime(new Date());
		topicService.saveTopic(topic);
		return E3Result.ok();
	}
	
	
	/**
	* @Title: list  
	* @Description: TODO(对于{id}这样的参数必须要用@PathVariable来接收)  
	* @author miki 
	* @date 2019年8月27日 下午10:48:06   
	* @throws
	 */
	@RequestMapping("/admin/topic/modify/{id}")
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

		String code = IDUtils.genTopicCode();
		topic.setCode("topics/"+code);

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
			Template template = configuration.getTemplate("topic_full.ftl");		

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
		
		//2020.05.05 miki 推送网站信息到百度爬虫		
		String result = PostUrlsToBaidu.postUrl("http://sharehoo.cn/"+topic.getCode() + ".html");
		Log log = new Log();
		log.setTime(new Date());
		log.setType("commit url");
		log.setOperation_log("向百度爬虫提交了该链接：http://sharehoo.cn/"+topic.getCode() + ".html"+"提交结果："+result);
		log.setUser(currentUser);		
		logService.save(log);
		
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
	
	/**
	* @Title: getTopic  
	* @Description: TODO(获取话题内容)  
	* @author miki 
	* @date 2020年8月12日 下午8:14:39   
	* @throws
	 */
	@PostMapping("/admin/topic/get")
	@ResponseBody
	public E3Result getTopic(int topicId) {
		Topic topic = topicService.findTopicById(topicId);
		if(null!= topic) {
			return E3Result.ok(topic.getContent());
		}
		return E3Result.build(500, "未查询到话题内容");
	}
	
	/**
	 * @throws IOException 
	* @Title: getTopic  
	* @Description: TODO(获取话题内容)  
	* @author miki 
	* @date 2020年8月12日 下午8:14:39   
	* @throws
	 */
	@SuppressWarnings("deprecation")
	@PostMapping("/admin/topic/update")
	@ResponseBody
	public E3Result getTopic(Topic topic, HttpServletRequest request, HttpServletResponse response) throws IOException {
		Topic old = topicService.findTopicById(topic.getId());
		old.setTop(topic.getTop());
		old.setTitle(topic.getTitle());
		old.setGood(topic.getGood());
		old.setModifyTime(new Date());
		
		old.setSection(topic.getSection());
		old.setContent(topic.getContent());
		
		topicService.saveTopic(old);
		
		//************2017.11.16 20:31 网页静态化实例
		// 2017.05.01 回复帖子实现用户积分+1
		HttpSession session = request.getSession();
		User currentUser = (User) session.getAttribute(Consts.CURRENTUSER);
		try {
			if (currentUser == null) {
				request.getRequestDispatcher("/errorlogin").forward(request, response);
			}
			
			int size = currentUser.getSectionList().size();
			// 创建一个数据集，Map将data封装进去
			Map<String, Object> data = new HashMap<>();
			data.put("user", currentUser);
			data.put("topic", old);
			data.put("size", size);
			data.put("sectionList", currentUser.getSectionList());
			data.put("id", old.getId());
			// 加载模板对象
			Configuration configuration = freeMarkerConfigurer.getConfiguration();

			configuration.setDefaultEncoding("UTF-8");
			
			//************** 2019.09.07 miki 在springboot的yml文件中设置freeMarker模板文件的加载路径
			Template template = configuration.getTemplate("topic_full.ftl");		

			template.setEncoding("UTF-8");
			// 创建一个输出流，指定目录及文件名
			//Writer out=new FileWriter(HTML_GEN_PATH +topic.getCode()+ ".html");			

			File file = new File(HTML_GEN_PATH, old.getCode() + ".html");
			Writer out = new PrintWriter(file, "UTF-8");
			//Writer outWriter=new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file),"UTF-8"));
			// 生成静态页面
			template.process(data, out);
			// 关闭流
			out.close();
		} catch (Exception e) {
			e.printStackTrace();logger.error(e);
			return E3Result.build(401, "发表失败..", e.getMessage());
		}
		
		//2020.05.05 miki 推送网站信息到百度爬虫		
		String result = PostUrlsToBaidu.postUrl("http://sharehoo.cn/"+old.getCode() + ".html");
		Log log = new Log();
		log.setTime(new Date());
		log.setType("commit url");
		log.setOperation_log("向百度爬虫提交了该链接：http://sharehoo.cn/"+old.getCode() + ".html"+"提交结果："+result);
		log.setUser(currentUser);		
		logService.save(log);
		
		return E3Result.ok();		
	}

	// 2017.04.04 前台帖子列表修改方法
	@RequestMapping("/topic/modify/{topicId}")
	@ResponseBody
	public E3Result modify(HttpServletRequest request,HttpServletResponse response,@PathVariable("topicId") int topicId) throws Exception {
		if (topicId > 0) {
			Topic topic = topicService.findTopicById(topicId);
			topic.setTop(0);
			topic.setGood(0);
			topicService.saveTopic(topic);
		}
		return E3Result.ok();
	}

	/*
	 * miki 2017.06.20 设为精华帖
	 */
	@RequestMapping("/topic/hot/{topicId}")
	@ResponseBody
	public E3Result modifyHot(HttpServletRequest request,HttpServletResponse response,@PathVariable("topicId") int topicId) throws Exception {
		if (topicId > 0) {
			Topic topic = topicService.findTopicById(topicId);
			if (topic.getGood() == 1) {
				return E3Result.build(401, "已经射过了，不要再射了..");
			}
			topic.setGood(1);
			topicService.saveTopic(topic);
		}
		return E3Result.ok();
	}

	/*
	 * miki 2017.06.20 设为置顶帖
	 */
	@RequestMapping("/topic/top/{topicId}")
	@ResponseBody
	public E3Result modifyTop(HttpServletRequest request,HttpServletResponse response,@PathVariable("topicId") int topicId) throws Exception {
		if (topicId > 0) {
			Topic topic = topicService.findTopicById(topicId);
			if (topic.getTop() == 1) {
				return E3Result.build(401, "已经顶到了，不要再顶了..");
			}
			topic.setTop(1);
			topicService.saveTopic(topic);
		}
		return E3Result.ok();
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
		String pageCode = PageUtil.genPagination(request.getContextPath() + "/topic/section/"+sectionId, total,
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
		
		//2020.05.05 miki 推送网站信息到百度爬虫		
		String result = PostUrlsToBaidu.postUrl("http://sharehoo.cn/topic/section/"+sectionId);
		Log log = new Log();
		log.setTime(new Date());
		log.setType("commit url");
		log.setOperation_log("向百度爬虫提交了该链接：http://sharehoo.cn/topic/section/"+sectionId+"提交结果："+result);		
		logService.save(log);

		if("true".equals(oldVersion)){
			return "topic/topicList";
		}
		return "bbs/categories_single";
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
		
		//2020.08.15 miki 旧版本代码无用
		/*String mainPage = "topic.jsp";
		String crumb1="帖子管理";
		model.addAttribute("crumb1", crumb1);
		model.addAttribute("mainPage", mainPage);		
		//************** 添加父级菜单自动展开样式	2019.09.11 miki
		model.addAttribute("ul", "forum");*/
		
		return "admin/topic";
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
		model.addAttribute("page", page);
		
		List<Reply> replyList = replyService.findReplyListByTopicId(topicId, pageBean);
		model.addAttribute("replyList", replyList);

		//对list中的对象去重，2020.09.06 miki
		ArrayList<Reply> uniqueLists = replyList.stream().collect(Collectors.collectingAndThen(Collectors.toCollection(() -> new TreeSet<>(Comparator.comparing(o -> o.getUser().getId()))),
				ArrayList::new));
		model.addAttribute("activeList", uniqueLists);

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
		
		/** 2017.05.04
		 * miki
		 * 得到回版主推荐的帖子列表
		 */
		List<Topic> tjTopicList=topicService.findGoodTopicList(null, new PageBean(1, 10));
		model.addAttribute("tjTopicList", tjTopicList);
		
		return "bbs/topicDetails";
	}

	// 后台删除，单个操作实现
	@RequestMapping("/topic/delete")
	@ResponseBody
	public E3Result backDelete(@RequestParam("topicId") int topicId) throws Exception {
		Topic topic = topicService.findTopicById(topicId);
		topicService.deleteTopic(topic);
		return E3Result.ok(); // 原来为null
	}

	// topicList页面删除功能实现
	@RequestMapping("/topic/backDelete")
	@ResponseBody
	public E3Result delete(@RequestParam("topicId") int topicId) throws Exception {
		if (topicId > 0) {
			int size = replyService.findReplyListByTopicId(topicId, null).size();
			if (size > 0) {			
				return E3Result.build(401, "请先删除该帖子下的回复..");
			}
			Topic topic = topicService.findTopicById(topicId);
			topicService.deleteTopic(topic);		
		}
		return E3Result.ok(); // 原来为null,strust.xml里的通配符匹配，会自动跳转到Topic_list.action
	}

	// 删除多个操作
	@RequestMapping("/topic/batchDelete")
	@ResponseBody
	public E3Result batchDelete(@RequestParam("ids") String ids) throws Exception {
		String[] idsStr = ids.split(",");
		for (int i = 0; i < idsStr.length; i++) {
			Topic e = topicService.findTopicById(Integer.parseInt(idsStr[i]));
			topicService.deleteTopic(e);
		}
		
		return E3Result.ok();
	}
}
