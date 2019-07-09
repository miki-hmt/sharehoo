package com.sharehoo.service.impl.forum;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.common.SolrInputDocument;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharehoo.dao.TopicSearchDao;
import com.sharehoo.entity.forum.Topic;
import com.sharehoo.entity.forum.TopicSearchResult;
import com.sharehoo.service.forum.TopicService;
import com.sharehoo.service.forum.TopicSolrJService;
import com.sharehoo.service.shop.SourceService;
import com.sharehoo.util.forum.E3Result;

@Service("topicSolrJService")
public class TopicSolrJServiceImpl implements TopicSolrJService {
	
	@Autowired
	private SolrServer topicSolrServer;
	@Resource
	private SourceService sourceService;
	
	@Resource
	private TopicService topicService;
	
	@Autowired
	private TopicSearchDao searchDao;

	@Override
	public E3Result importAllTopics() {
		// TODO Auto-generated method stub		
		try {
			topicSolrServer.deleteById("*:*",1000);			//先清空原来的内容
			
			List<Topic> topicList = topicService.findTopicList(null, null);		//得到所有topic列表			
			//遍历话题列表
			for(Topic topic : topicList){
				//创建文档对象
				SolrInputDocument document=new SolrInputDocument();
				
				//向文档对象中添加域
				document.addField("id", String.valueOf(topic.getId()));
				document.addField("topic_title", topic.getTitle());
				document.addField("topic_publishTime", topic.getPublishTime().toString());
				document.addField("topic_code", String.valueOf(topic.getCode()));

				document.addField("topic_section_name", topic.getSection().getName());
				document.addField("topic_user_name", topic.getUser().getNickName());
				//把文档对象写入索引库
				topicSolrServer.add(document);
				
				}
				//提交
			topicSolrServer.commit();
			
			} catch (Exception e) {
				e.printStackTrace();
				return E3Result.build(500, "数据导入异常");
			} 	
		return E3Result.ok();
	}

	@Override
	public TopicSearchResult searchTopic(String keyword,String category_name, int page, int rows)
			throws Exception {		
		// 创建一个solrQuery对象
		SolrQuery solrQuery=new SolrQuery();
		
		if(!StringUtils.isNotEmpty(keyword)){
			keyword="*";
		}
		//如果是单个字符，进行模糊查询
		if(keyword.length()==1 && !"*".equals(keyword)){
			solrQuery.setQuery("topic_title:"+"*"+keyword+"*");		//模糊查询
		}else{
			solrQuery.setQuery("topic_title:"+keyword);
		}
	
		//设置分页条件
		if(page<=0){
			page=1;
		}
		solrQuery.setStart((page-1)*rows);
		solrQuery.setRows(rows);
		
		//设置默认搜索域
		solrQuery.set("df","topic_title");
		
		//设置过滤条件,如果点击目录按钮，则将只筛选此目录内的数据
		if(StringUtils.isNotEmpty(category_name) && !"0".equals(category_name)){
			solrQuery.set("fq","topic_section_name:"+category_name);
		}	
		
		//开启高亮显示
		if("*".equals(keyword)){			//如果keyword为空，默认搜索全部资源，此时会将全部title和description高亮，要避免这样
			
			solrQuery.setHighlight(false);
			solrQuery.addHighlightField("topic_title");
		}else{
			solrQuery.setHighlight(true);
			solrQuery.addHighlightField("topic_title");
			solrQuery.setHighlightSimplePre("<em style=\"color:red\">");
			solrQuery.setHighlightSimplePost("</em>");
		}
				
		//调用dao执行查询
		TopicSearchResult result=searchDao.search(solrQuery);
		
		//计算总页数
		long recordCount=result.getRecordCount();
		int totalPage = (int)(recordCount / rows) ;
		if(recordCount % rows>0){
			totalPage++;
		}
		
		//添加到返回结果
		result.setTotalPages(totalPage);
		
		return result;
		
	}
}

