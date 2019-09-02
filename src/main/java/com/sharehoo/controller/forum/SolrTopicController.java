package com.sharehoo.controller.forum;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sharehoo.entity.forum.SearchTopic;
import com.sharehoo.entity.forum.TopicSearchResult;
import com.sharehoo.service.forum.TopicSolrJService;
import com.sharehoo.util.forum.E3Result;
import com.sharehoo.util.forum.PageUtil;
import com.sharehoo.util.forum.StringUtil;

@Controller
public class SolrTopicController {
	@Autowired
	private TopicSolrJService topicSolrJService;
	@Value("${forum.topic.SEARCH_TOPIC_RESULT_ROWS}")
	private String SEARCH_TOPIC;
	
	//生成帖子索引		miki	2019.01.02
	@RequestMapping("/solr/import")
	@ResponseBody
	public E3Result importItenList()throws Exception{
		
		E3Result result=topicSolrJService.importAllTopics();
		
		return result;		
	}
		
	//生成帖子索引		miki	2019.01.02
	@RequestMapping("/solr/search")
	public String search(@PathVariable("keyword") String keyword,@PathVariable("category_name") String category_name,
			Model model,HttpServletRequest request,@PathVariable("page") int page)throws Exception{

		int count=Integer.parseInt(SEARCH_TOPIC);
		
		//前台关键字乱码问题
		if(StringUtil.isNotEmpty(keyword)){
//				keyword=new String(keyword.getBytes("iso-8859-1"), "utf-8");
			keyword=java.net.URLDecoder.decode(keyword,"UTF-8");	//2017.08.16 将url中文参数进行转码
		}
		if(StringUtil.isNotEmpty(category_name)){
			category_name=java.net.URLDecoder.decode(category_name,"UTF-8");	//2017.08.16 将url中文参数进行转码
		}
				
		//组织搜索字段为0而显示到前台的情况		
		if(!"0".equals(category_name)){
			//ct.put("curCategory", category_name);
			model.addAttribute("curCategory", category_name);
		}
		//ct.put("search", keyword);
		model.addAttribute("search", keyword);
		//得到查询列表
		TopicSearchResult result=topicSolrJService.searchTopic(keyword,category_name,page,count );
		
		//查询关键字回显		
		String query=keyword;
		model.addAttribute("query", query);
		long totalPages=result.getTotalPages();
		model.addAttribute("totalPages", totalPages);
		long recordCount=result.getRecordCount();
		model.addAttribute("recordCount", recordCount);
		List<SearchTopic> itemList=result.getItemList();
		model.addAttribute("itemList", itemList);
		//分页
		if (page<=0) {
			page=1;
		}
		StringBuffer param=new StringBuffer();
		if(null==category_name){
			category_name="";
		}
		if(null==keyword){
			keyword="";
		}
		param.append("category_name="+category_name+"&keyword="+keyword);
		
		String pageCode=PageUtil.genPagination(request.getContextPath()+"/solr/search", recordCount, page, count,param.toString());
		model.addAttribute("pageCode", pageCode);
		//返回逻辑视图search.jsp
		return "soutie";
		
	}
}
