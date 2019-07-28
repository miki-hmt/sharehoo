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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;
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
import com.sharehoo.util.forum.IDUtils;
import com.sharehoo.util.forum.PageUtil;
import com.sharehoo.util.forum.ResponseUtil;
import com.sharehoo.util.forum.StringUtil;

import freemarker.template.Configuration;
import freemarker.template.Template;
import net.sf.json.JSONObject;

@Controller
public class TopicController {
	
	private static final long serialVersionUID = 1L;
	
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
	
	private List<Topic> topicList;	
	private String page;
	private String rows;
	private Long total;
	private String pageCode;
	private Topic s_topic;
	
	private int sectionId;
	private String sectionName;
	private Section section;
	private User user;
	
	private Topic topic;
	private int topicId;	
	private String ids;	
	private String mainPage;
	private String crumb1;	
	private Map<Topic, Reply> topicLastReply=new HashMap<Topic, Reply>();
	private Map<Topic, Long> topicReplyCount=new HashMap<Topic, Long>();
	
	private List<Topic> zdTopicList;
	private List<Topic> ptTopicList;	
	private List<Topic> leaveList;
	private Section curSection;   //当前鼠标点击版块
	private List<Section> sectionList;	
	private List<Reply> replyList;
	private List<NewsBanner> bannerList;	
	private int topicGood;
	private int topicTop;
	
	@Value("${spring.freemarker.HTML_GEN_PATH}")
	private String HTML_GEN_PATH;
	@Value("${forum.leavemessage.SECRET_TOPIC}")
	private String SECRET_TOPIC;
	
	/*
	 * miki 2017.06.14 得到子回复列表
	 */
	private Map<Reply, Long> son=new HashMap<Reply, Long>();
	private Map<Reply, List<Reply>> sonReplyList=new HashMap<Reply,List<Reply>>();
	private List<Reply> sonList;
	private Long count;
	private String title;
	
	//2017.12.11 19:54	网页静态化实现
	@Autowired
	private FreeMarkerConfigurer freeMarkerConfigurer;
	
	@RequestMapping("/topic/write")
	// 发帖方法实现
	public String preSave(HttpServletRequest request,HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		User currentUser = (User) session.getAttribute("currentUser");

		// 验证发帖时，用户是否登录，如果没登录，自动跳转到指定页面2016.10.06

		if (currentUser == null) {
			// response.sendRedirect(request.getContextPath()+"/login.jsp");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
		sectionList = sectionService.findSectionList(null, null);
		return "preSave";
	}
	
	@RequestMapping("/topic/psave2")
	public String preSave2(HttpServletRequest request,HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		User currentUser = (User) session.getAttribute("currentUser");
		
		// 验证发帖时，用户是否登录，如果没登录，自动跳转到指定页面2016.10.06
		if (currentUser == null) {
			// response.sendRedirect(request.getContextPath()+"/login.jsp");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
		sectionList = sectionService.findSectionList(null, null);
		return "pSave";
	}
	
	@RequestMapping("/topic/psave")
	public String psave() throws Exception {
		topic.setPublishTime(new Date());
		topic.setModifyTime(new Date());
		topicService.saveTopic(topic);
		return "ps";
	}
	
	@RequestMapping("/topic/update")
	public String update() throws Exception {
		topic = topicService.findTopicById(topicId);// 获取topicId之后得到tpic对象 2017.04.05，否则页面无法得到topic数据
		section = topic.getSection();// 得到当前帖子所属的版块
		user = topic.getUser(); // 得到当前帖子的作者
		mainPage = "updateTopic.jsp";
		crumb1 = "帖子修改";
		return "successAdmin";
	}
	
	@RequestMapping("/topic/publish")
	public String save(HttpServletRequest request,HttpServletResponse response) throws Exception {

		final long code = IDUtils.genTopicCode();
		topic.setCode(code);

		topic.setPublishTime(new Date());
		topic.setModifyTime(new Date());
		topicService.saveTopic(topic);

		// 2017.05.01 回复帖子实现用户积分+1
		HttpSession session = request.getSession();
		User currentUser = (User) session.getAttribute("currentUser");
		if (currentUser == null) {
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
		// 2017.05.01 发帖子实现用户积分+1
		currentUser.setScore(currentUser.getScore() + 3);
		userService.saveUser(currentUser);

		/*
		 * 2017.11.16 20:31 网页静态化实例
		 */
		try {
			Topic to = topicService.getTopic(topic.getCode());
			User user = (User) session.getAttribute("currentUser");
			int size = user.getSectionList().size();
			// 创建一个数据集，Map将data封装进去
			Map data = new HashMap<>();
			data.put("user", user);
			data.put("topic", topic);
			data.put("size", size);
			data.put("sectionList", user.getSectionList());
			data.put("id", to.getId());
			// 加载模板对象
			Configuration configuration = freeMarkerConfigurer.getConfiguration();

			configuration.setDefaultEncoding("UTF-8");

			Template template = configuration.getTemplate("topic.ftl");

			template.setEncoding("UTF-8");
			// 创建一个输出流，指定目录及文件名
//				Writer out=new FileWriter(HTML_GEN_PATH +topic.getCode()+ ".html");
//				

			File file = new File(HTML_GEN_PATH, topic.getCode() + ".html");
			Writer out = new PrintWriter(file, "UTF-8");
//				Writer outWriter=new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file),"UTF-8"));

			// 生成静态页面
			template.process(data, out);
			// 关闭流
			out.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return "save";
	}

	public String save1() throws Exception {

		topic.setModifyTime(new Date());
		topicService.saveTopic(topic);
		mainPage = "test.jsp";
		return "successAdmin";
	}

	// 2017.04.04 前台帖子列表修改方法
	@RequestMapping("/topic/modify")
	public String modify(HttpServletRequest request,HttpServletResponse response) throws Exception {
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
	@RequestMapping("/topic/hot")
	public String modifyHot(HttpServletRequest request,HttpServletResponse response) throws Exception {
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
	@RequestMapping("/topic/top")
	public String modifyTop(HttpServletRequest request,HttpServletResponse response) throws Exception {
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
	@RequestMapping("/leave-message/index")
	public String leaveList() throws Exception {
		if (StringUtil.isEmpty(page)) {
			page = "1";
		}
		PageBean pageBean = new PageBean(Integer.parseInt(page), Integer.parseInt(SECRET_TOPIC));
		leaveList = topicService.findPtTopicListBySectionId(17, pageBean);
		long total = topicService.getPtTopicCountBySectionId(17);
		pageCode = PageUtil.genPagination(request.getContextPath() + "/Topic_leaveList.action", total,
				Integer.parseInt(page), Integer.parseInt(SECRET_TOPIC), null);
		return "message";
	}

	/**
	 * 2017.04.13
	 * 
	 * @return
	 * @throws Exception 根据版块id显示帖子列表
	 */
	@RequestMapping("/topic/section-{id}/list")
	public String list() throws Exception {
		HttpSession session = request.getSession();
		if (curSection == null) { // 当前鼠标点击版块 2016.12.05
			Object o = session.getAttribute("curSection");
			if (o != null && sectionId == 0) {
				curSection = (Section) o;
			} else {
				curSection = new Section();
				curSection.setId(sectionId);// 2016.12.05 获取url传递参数id
											// http://localhost:8888/Forum/Topic_list.action?sectionId=1
				session.setAttribute("curSection", curSection);
			}
		} else {
			session.setAttribute("curSection", curSection);
		}
		bannerList = nbsBannerService.findSectionTopicBannerListByType();
		section = sectionService.findSectionById(curSection.getId());

		session.setAttribute("section", section);

		zdTopicList = topicService.findZdTopicListBySectionId(curSection.getId(), null);

		if (StringUtil.isEmpty(page)) {
			page = "1";
		}
		PageBean pageBean = new PageBean(Integer.parseInt(page), 20);
		ptTopicList = topicService.findPtTopicListBySectionId(curSection.getId(), pageBean);
		long total = topicService.getPtTopicCountBySectionId(curSection.getId());
		pageCode = PageUtil.genPagination(request.getContextPath() + "/Topic_list.action", total,
				Integer.parseInt(page), 20, null);
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
		return null;
	}

	/**
	 * 2017.04.13 后台显示所有帖子列表
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/topic/admin/list")
	public String listAdmin() throws Exception {
		HttpSession session = request.getSession();
		if (StringUtil.isEmpty(page)) {
			page = "1";
		}
		if (s_topic == null) {
			Object o = session.getAttribute("s_topic");
			if (o != null) {
				s_topic = (Topic) o;
			} else {
				s_topic = new Topic();
				s_topic.setTop(2);
				s_topic.setGood(2);
			}
		} else {
			session.setAttribute("s_topic", s_topic);
		}
		PageBean pageBean = new PageBean(Integer.parseInt(page), 10);
		topicList = topicService.findTopicList(s_topic, pageBean);
		total = topicService.getTopicCount(s_topic);
		pageCode = PageUtil.genPagination(request.getContextPath() + "/admin/Topic_listAdmin.action", total,
				Integer.parseInt(page), 10, null);
		sectionList = sectionService.findSectionList(null, null);
		mainPage = "topic.jsp";
		return "successAdmin";
	}

	/**
	 * 2017.04.13 搜索模块显示匹配帖子列表
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/topic/search")
	public String search(HttpServletRequest request,HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		if (StringUtil.isEmpty(page)) {
			page = "1";
		}
		if (s_topic == null) {
			Object o = session.getAttribute("s_topic");
			if (o != null) {
				s_topic = (Topic) o;
			} else {
				s_topic = new Topic();
				s_topic.setTop(2);
				s_topic.setGood(2);
			}
		} else {
			session.setAttribute("s_topic", s_topic);
		}
		PageBean pageBean = new PageBean(Integer.parseInt(page), 10);
		topicList = topicService.findTopicList(s_topic, pageBean);
		total = topicService.getTopicCount(s_topic);
		pageCode = PageUtil.genPagination(request.getContextPath() + "/Topic_search.action", total,
				Integer.parseInt(page), 10, null);
		sectionList = sectionService.findSectionList(null, null);
		mainPage = "soutie.jsp";
		return "sou";
	}
	
	@RequestMapping("/topic/detail-{id}")
	public String details(HttpServletRequest request,HttpServletResponse response) throws Exception {
		topic = topicService.findTopicById(topicId);

		if (StringUtil.isEmpty(page)) {
			page = "1";
		}
		PageBean pageBean = new PageBean(Integer.parseInt(page), 10);
		replyList = replyService.findReplyListByTopicId(topicId, pageBean);
		for (Reply reply : replyList) {
			long count = replyService.getSonCountByRid(reply.getId());
			son.put(reply, count);
			sonList = replyService.getsonListByRid(reply.getId());
			sonReplyList.put(reply, sonList);

		}
		total = replyService.getReplyCountByTopicId(topicId);
		StringBuffer param = new StringBuffer();
		if (topicId > 0) {
			param.append("topicId=" + topicId);
		}
		pageCode = PageUtil.genPagination(request.getContextPath() + "/Topic_details.action", total,
				Integer.parseInt(page), 10, param.toString());
		return "details";
	}

	// 后台删除，单个操作实现
	@RequestMapping("/topic/delete")
	public String delete(HttpServletRequest request,HttpServletResponse response) throws Exception {
		JSONObject result = new JSONObject();
		Topic topic = topicService.findTopicById(topicId);
		topicService.deleteTopic(topic);
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null; // 原来为null
	}

	// topicList页面删除功能实现
	@RequestMapping("/topic/back-delete")
	public String delete2(HttpServletRequest request,HttpServletResponse response) throws Exception {
		JSONObject result = new JSONObject();
		if (topicId > 0) {
			replyList = replyService.findReplyListByTopicId(topicId, null);
			if (replyList.size() > 0) {
				result.put("success", false);
				ResponseUtil.write(response, result);
				return null;
			}
			Topic topic = topicService.findTopicById(topicId);
			topicService.deleteTopic(topic);
			result.put("success", true);
			ResponseUtil.write(response, result);
		}
		return null; // 原来为null,strust.xml里的通配符匹配，会自动跳转到Topic_list.action
	}

	// 删除多个操作
	@RequestMapping("/topic/batch-delete")
	public String delete1(HttpServletRequest request,HttpServletResponse response) throws Exception {
		JSONObject result = new JSONObject();
		String[] idsStr = ids.split(",");
		for (int i = 0; i < idsStr.length; i++) {
			Topic e = topicService.findTopicById(Integer.parseInt(idsStr[i]));
			topicService.deleteTopic(e);
		}
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}
	
	

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public List<Topic> getTopicList() {
		return topicList;
	}

	public void setTopicList(List<Topic> topicList) {
		this.topicList = topicList;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public String getRows() {
		return rows;
	}

	public void setRows(String rows) {
		this.rows = rows;
	}

	public Long getTotal() {
		return total;
	}

	public void setTotal(Long total) {
		this.total = total;
	}

	public String getPageCode() {
		return pageCode;
	}

	public void setPageCode(String pageCode) {
		this.pageCode = pageCode;
	}

	public Topic getS_topic() {
		return s_topic;
	}

	public void setS_topic(Topic s_topic) {
		this.s_topic = s_topic;
	}

	public int getSectionId() {
		return sectionId;
	}

	public void setSectionId(int sectionId) {
		this.sectionId = sectionId;
	}

	public String getSectionName() {
		return sectionName;
	}

	public void setSectionName(String sectionName) {
		this.sectionName = sectionName;
	}

	public Section getSection() {
		return section;
	}

	public void setSection(Section section) {
		this.section = section;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Topic getTopic() {
		return topic;
	}

	public void setTopic(Topic topic) {
		this.topic = topic;
	}

	public int getTopicId() {
		return topicId;
	}

	public void setTopicId(int topicId) {
		this.topicId = topicId;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public String getMainPage() {
		return mainPage;
	}

	public void setMainPage(String mainPage) {
		this.mainPage = mainPage;
	}

	public String getCrumb1() {
		return crumb1;
	}

	public void setCrumb1(String crumb1) {
		this.crumb1 = crumb1;
	}

	public Map<Topic, Reply> getTopicLastReply() {
		return topicLastReply;
	}

	public void setTopicLastReply(Map<Topic, Reply> topicLastReply) {
		this.topicLastReply = topicLastReply;
	}

	public Map<Topic, Long> getTopicReplyCount() {
		return topicReplyCount;
	}

	public void setTopicReplyCount(Map<Topic, Long> topicReplyCount) {
		this.topicReplyCount = topicReplyCount;
	}

	public List<Topic> getZdTopicList() {
		return zdTopicList;
	}

	public void setZdTopicList(List<Topic> zdTopicList) {
		this.zdTopicList = zdTopicList;
	}

	public List<Topic> getPtTopicList() {
		return ptTopicList;
	}

	public void setPtTopicList(List<Topic> ptTopicList) {
		this.ptTopicList = ptTopicList;
	}

	public List<Topic> getLeaveList() {
		return leaveList;
	}

	public void setLeaveList(List<Topic> leaveList) {
		this.leaveList = leaveList;
	}

	public Section getCurSection() {
		return curSection;
	}

	public void setCurSection(Section curSection) {
		this.curSection = curSection;
	}

	public List<Section> getSectionList() {
		return sectionList;
	}

	public void setSectionList(List<Section> sectionList) {
		this.sectionList = sectionList;
	}

	public List<Reply> getReplyList() {
		return replyList;
	}

	public void setReplyList(List<Reply> replyList) {
		this.replyList = replyList;
	}

	public List<NewsBanner> getBannerList() {
		return bannerList;
	}

	public void setBannerList(List<NewsBanner> bannerList) {
		this.bannerList = bannerList;
	}

	public int getTopicGood() {
		return topicGood;
	}

	public void setTopicGood(int topicGood) {
		this.topicGood = topicGood;
	}

	public int getTopicTop() {
		return topicTop;
	}

	public void setTopicTop(int topicTop) {
		this.topicTop = topicTop;
	}

	public Map<Reply, Long> getSon() {
		return son;
	}

	public void setSon(Map<Reply, Long> son) {
		this.son = son;
	}

	public Map<Reply, List<Reply>> getSonReplyList() {
		return sonReplyList;
	}

	public void setSonReplyList(Map<Reply, List<Reply>> sonReplyList) {
		this.sonReplyList = sonReplyList;
	}

	public List<Reply> getSonList() {
		return sonList;
	}

	public void setSonList(List<Reply> sonList) {
		this.sonList = sonList;
	}

	public Long getCount() {
		return count;
	}

	public void setCount(Long count) {
		this.count = count;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
}
