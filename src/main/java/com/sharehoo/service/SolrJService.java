package com.sharehoo.service;

import com.sharehoo.entity.shop.SearchResult;
import com.sharehoo.util.forum.E3Result;

public interface SolrJService {
	
	public E3Result importAllItems();		//返回booeal型
	
	public SearchResult search(String keyword,String category_name,String menu_name,String type,int page,int rows)throws Exception;
}
