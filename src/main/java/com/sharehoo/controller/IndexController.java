package com.sharehoo.controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sharehoo.entity.forum.Article;
import com.sharehoo.entity.forum.Notice;
import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.forum.Section;
import com.sharehoo.entity.forum.Topic;
import com.sharehoo.entity.forum.User;
import com.sharehoo.service.forum.ArticleService;
import com.sharehoo.service.forum.NoticeService;
import com.sharehoo.service.forum.SectionService;
import com.sharehoo.service.forum.TopicService;
import com.sharehoo.service.forum.UserService;
import com.sharehoo.util.forum.PageUtil;
import com.sharehoo.util.forum.ResponseUtil;
import com.sharehoo.util.forum.StringUtil;

import net.sf.json.JSONObject;

@Controller
public class IndexController {
	
	@Resource
	private TopicService topicService;
	
	@Resource
	private SectionService sectionService;
	@Resource
	private UserService userService;
	
	@Resource
	private NoticeService noticeService;
	@Resource
	private ArticleService articleService;
	
	@Value("${forum.topic.NEW_TOPIC}")
	private String NEW_TOPIC;
	@Value("${forum.topic.YUAN_TOPIC}")
	private String YUAN_TOPIC;
	@Value("${forum.topic.CHU_TOPIC}")
	private String CHU_TOPIC;
	@Value("${forum.topic.RECOMMEND}")
	private String RECOMMEND;
	
	/**
	 * miki
	 * 2017.04.15
	 * 后台管理员公告保存方法的实现
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/notice/savepr",method = RequestMethod.POST)
	public String savepr(@RequestBody Notice notice)throws Exception{
		notice.setPubDate(new Date());
		noticeService.saveNotice(notice);
		return "pr";
	}
	
	@RequestMapping("/notice/detail")
	public String detail(@RequestParam("noticeId") int noticeId,Model model)throws Exception{
		if(noticeId>0){
		Notice notice=noticeService.getNoticeById(noticeId);
		model.addAttribute("notice", notice);
		return "detail";
		}
		return "false";
	}
	
	/**
	 * miki
	 * 2017.04.15
	 * 后台管理员公告保存方法的实现
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/notice/save",method = RequestMethod.POST)
	public String save(@RequestBody Notice notice)throws Exception{
		notice.setPubDate(new Date());
		noticeService.saveNotice(notice);
		return "";
	}
	
	/**miki
	 * 删除公告
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/notice/delete")
	@ResponseBody
	public JSONObject delete(@RequestParam("noticeId") int noticeId)throws Exception{
		JSONObject result=new JSONObject();
		Notice e=noticeService.getNoticeById(noticeId);
		noticeService.deleteNotice(e);
		result.put("successAdmin", true);
		
		return result;
		
	}
	
	@RequestMapping("/notice/list")
	public String list(HttpServletRequest request,HttpServletResponse response,Model model)throws Exception{
		String page = request.getParameter("page");		
		if (StringUtil.isEmpty(page)) {
			page="1";
		}
		Notice s_notice = new Notice();
		PageBean pageBean=new PageBean(Integer.parseInt(page), 6);
		List<Notice> noticeList=noticeService.findNoticeList(s_notice, pageBean);
		model.addAttribute("noticeList", noticeList);
		long total=noticeService.getNoticeCount(s_notice);
		String pageCode=PageUtil.genPagination(request.getContextPath()+"/admin/Notice_list.action", total, Integer.parseInt(page), 6,null);
		model.addAttribute("pageCode", pageCode);
		String mainPage="notice.jsp";
		model.addAttribute("mainPage", mainPage);
		String crumb1="公告管理";
		model.addAttribute("crumb1", crumb1);
		
		return "";
		
	}
	
	/**
	 * author:miki
	 * date:2019.08.15
	 * 首页建立Notice_listpr.action得到公告列表，因为要即时更新公告，所以不能将其放入inition.action中
	 * 在listpr方法中添加userScoreList用户列表属性
	 * 在首页通过触发Notice_listpr.action来得到用户等级排行列表
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/index")
	public String index(HttpServletRequest request,HttpServletResponse response,Model model)throws Exception{
		List<Notice> noticeList=noticeService.findNoticeList(null, null);
		model.addAttribute("noticeList", noticeList);
		String page = "1";
		HttpSession session=request.getSession();
		
		/* 2017.05.04得到前13个最新帖子列表
		 */
		int count = Integer.parseInt(NEW_TOPIC);
		List<Topic> lastTopicList=topicService.getNewsList(count);
		model.addAttribute("lastTopicList", lastTopicList);
		
		/* 2017.05.04
		 * 得到原创社区的最近新帖	
		 */
		int new_count = Integer.parseInt(YUAN_TOPIC);
		Section section=sectionService.findSectionById(21);
		session.setAttribute("section", section);				
		
		PageBean pageBean2=new PageBean(1,new_count );
		List<Topic> ycTopicList=topicService.findTopicListBySectionId(21, pageBean2);
		model.addAttribute("ycTopicList", ycTopicList);

		/**
		 * 2017.05.04
		 * miki
		 * 得到出谋划策的最近新帖	
		 */					
		PageBean pageBean3=new PageBean(Integer.parseInt(page),new_count);
		List<Topic> helpTopicList=topicService.findTopicListBySectionId(11, pageBean3);
		model.addAttribute("helpTopicList", helpTopicList);

		/** 2017.05.04
		 * miki
		 * 得到回版主推荐的帖子列表
		 */
		Topic s_topic=new Topic();
		PageBean pageBean4=new PageBean(Integer.parseInt(page),new_count);
		List<Topic> tjTopicList=topicService.findGoodTopicList(s_topic, pageBean4);
		model.addAttribute("tjTopicList", tjTopicList);
		
		/**
		 * 2017.04.29
		 * author:miki
		 * 得到用户贡献榜排行列表
		 */
		List<User> userScoreList=userService.getUserListByScroe();
		model.addAttribute("userScoreList", userScoreList);
		
		//2017.11.03 遍历版块列表
		List<Section> sectionList=sectionService.findSectionList(null, null);
		model.addAttribute("sectionList", sectionList);
		
		for (Section section2 : sectionList) {
			s_topic=new Topic();
			s_topic.setSection(section2);
			 int s=section2.getId(); //1    新的算法  2017.04.04
			Long totalCount=topicService.getTopicCountBySectionId(s);  //2   新的算法  2017.04.04   //板块的总帖数		
			s_topic.setGood(1);
			Long goodCount=topicService.getGoodTopicCountBySectionId(s);//3   板块的精华帖数			
			s_topic.setGood(0);
			Long noReplyCount=topicService.getNoReplyTopicCount(s_topic); //板块的无回复帖数
			
			//根据sectionId得到该版块下面的新贴纸
			List<Topic> topicNewList=topicService.getNewTopicListBySection(s);
			Map<Section, List<Topic>> good=new HashMap<Section, List<Topic>>();
			good.put(section2, topicNewList);
			model.addAttribute("good", good);
			
			Map<Section, Long> sectionTopicCount=new HashMap<Section, Long>();
			Map<Section, Long> sectionGoodTopicCount=new HashMap<Section, Long>();
			Map<Section, Long> sectionNoReplyTopicCount=new HashMap<Section, Long>();
			
			sectionTopicCount.put(section2, totalCount);
			model.addAttribute("sectionTopicCount", sectionTopicCount);
			
			sectionGoodTopicCount.put(section2, goodCount);
			model.addAttribute("sectionGoodTopicCount", sectionGoodTopicCount);
			
			sectionNoReplyTopicCount.put(section2, noReplyCount);
			model.addAttribute("sectionNoReplyTopicCount", sectionNoReplyTopicCount);
		}
		
		
		
		/*
		 * miki
		 * 2017.06.02
		 * 社区首页得到热门文章列表，放入服务器时，要改userId****************************待改？？？？
		 */
		List<Article> countList=articleService.getHotByUserId(21);
		model.addAttribute("countList", countList);
		return "index";
	}
}
