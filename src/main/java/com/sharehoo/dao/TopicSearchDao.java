package com.sharehoo.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.solr.client.solrj.SolrClient;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sharehoo.entity.forum.SearchTopic;
import com.sharehoo.entity.forum.TopicSearchResult;


	
@Repository
public class TopicSearchDao {
	
	@Autowired
	private SolrClient topicSolrServer;
		
	public TopicSearchResult search(SolrQuery query)throws Exception{
			
		//根据query查询索引库
		QueryResponse queryResponse=topicSolrServer.query(query); 
		
		//取查询结果
		SolrDocumentList solrDocumentList=queryResponse.getResults();
		
		//取查询结果总记录数
		long numFound=solrDocumentList.getNumFound();
		TopicSearchResult result=new TopicSearchResult();
		result.setRecordCount(numFound);
		
		//取帖子列表，并高亮显示
		Map<String, Map<String, List<String>>> highlighting = queryResponse.getHighlighting();
		
		List<SearchTopic> itemList=new ArrayList<>(); 
		for(SolrDocument solrDocument : solrDocumentList){
			SearchTopic item=new SearchTopic();
			item.setId(Integer.parseInt(solrDocument.get("id").toString()));
			
			item.setUser_name(((String)solrDocument.get("topic_user_name")));

			String date=(String)solrDocument.get("topic_publishTime");
			item.setPublishTime(date.substring(0, date.length()-2));
			item.setSection_name((String)solrDocument.get("topic_section_name"));
			item.setCode((String)solrDocument.get("topic_code"));
			
			//取高亮显示
			List<String> list = highlighting.get(solrDocument.get("id")).get("topic_title");

			String title = "";
			if (list !=null && list.size() > 0 ) {
				title = list.get(0);
			} else {
				title = (String) solrDocument.get("topic_title");
			}
			
			item.setTitle((title));
			//添加到帖子列表
			itemList.add(item);		
		}
		result.setItemList(itemList);
		
		//返回结果
		return result;
		}
}
