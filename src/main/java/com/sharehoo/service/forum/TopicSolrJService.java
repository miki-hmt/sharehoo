package com.sharehoo.service.forum;

import com.sharehoo.entity.forum.TopicSearchResult;
import com.sharehoo.util.forum.E3Result;

public interface TopicSolrJService {
	
	public E3Result importAllTopics();		//2019.01.02	miki	搜索话题	返回booeal型
	
	public TopicSearchResult searchTopic(String keyword,String category_name,int page,int rows)throws Exception;
}
