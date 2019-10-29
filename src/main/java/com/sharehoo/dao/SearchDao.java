package com.sharehoo.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Service;

import com.sharehoo.entity.shop.SearchItem;
import com.sharehoo.entity.shop.SearchResult;

@Configuration
public class SearchDao {
	//**************** 2019.08.14	miki springboot版本使用要将 SolrServer改为 SolrClient
	
	@Value("${shop.solr-host}")
	private String host;
	
	public SearchResult search(SolrQuery query)throws Exception{
		
		HttpSolrClient shopSolrClient = new HttpSolrClient.Builder(host).build();
		
		//根据query查询索引库
		QueryResponse queryResponse=shopSolrClient.query(query); 
		
		//取查询结果
		SolrDocumentList solrDocumentList=queryResponse.getResults();
		
		//取查询结果总记录数
		long numFound=solrDocumentList.getNumFound();
		SearchResult result=new SearchResult();
		result.setRecordCount(numFound);
		
		//取商品列表，并高亮显示
		Map<String, Map<String, List<String>>> highlighting = queryResponse.getHighlighting();
		
		List<SearchItem> itemList=new ArrayList<>(); 
		for(SolrDocument solrDocument : solrDocumentList){
			SearchItem item=new SearchItem();
			item.setId((String)solrDocument.get("id"));
			item.setDouNum(String.valueOf(solrDocument.get("item_douNum")));
			item.setPrice(String.valueOf(solrDocument.get("item_douNum")));
			item.setShopName(((String)solrDocument.get("item_shop_name")));

			item.setDownNum(String.valueOf(solrDocument.get("item_downNum")));
			item.setSize((String)solrDocument.get("item_size"));
			String date=(String)solrDocument.get("item_uploadDate");
			item.setUploadDate(date.substring(0, date.length()-1));
			item.setDescription((String)solrDocument.get("item_desc"));
			//取高亮显示
			List<String> list = highlighting.get(solrDocument.get("id")).get("item_title");
//			List<String> descList = highlighting.get(solrDocument.get("id")).get("item_desc");
			String title = "";
			String desc = "";
			if (list !=null && list.size() > 0 ) {
				title = list.get(0);
			} else {
				title = (String) solrDocument.get("item_title");
			}
			
//			if (descList !=null && descList.size() > 0 ) {
//				desc = descList.get(0);
//			} else {
//				desc = (String) solrDocument.get("item_desc");
//			}
//			item.setDescription(desc);
			
			item.setTitle((title));
			//添加到商品列表
			itemList.add(item);		
		}
		result.setItemList(itemList);
		
		//返回结果
		return result;
		}
	
	public SearchResult search(SolrQuery query,String host)throws Exception{
		
		HttpSolrClient shopSolrClient = new HttpSolrClient.Builder(host).build();
		
		//根据query查询索引库
		QueryResponse queryResponse=shopSolrClient.query(query); 
		
		//取查询结果
		SolrDocumentList solrDocumentList=queryResponse.getResults();
		
		//取查询结果总记录数
		long numFound=solrDocumentList.getNumFound();
		SearchResult result=new SearchResult();
		result.setRecordCount(numFound);
		
		//取商品列表，并高亮显示
		Map<String, Map<String, List<String>>> highlighting = queryResponse.getHighlighting();
		
		List<SearchItem> itemList=new ArrayList<>(); 
		for(SolrDocument solrDocument : solrDocumentList){
			SearchItem item=new SearchItem();
			item.setId((String)solrDocument.get("id"));
			item.setDouNum(String.valueOf(solrDocument.get("item_douNum")));
			item.setPrice(String.valueOf(solrDocument.get("item_douNum")));
			item.setShopName(((String)solrDocument.get("item_shop_name")));
			
			item.setDownNum(String.valueOf(solrDocument.get("item_downNum")));
			item.setSize((String)solrDocument.get("item_size"));
			String date=(String)solrDocument.get("item_uploadDate");
			item.setUploadDate(date.substring(0, date.length()-1));
			item.setDescription((String)solrDocument.get("item_desc"));
			//取高亮显示
			List<String> list = highlighting.get(solrDocument.get("id")).get("item_title");
//			List<String> descList = highlighting.get(solrDocument.get("id")).get("item_desc");
			String title = "";
			String desc = "";
			if (list !=null && list.size() > 0 ) {
				title = list.get(0);
			} else {
				title = (String) solrDocument.get("item_title");
			}
			
//			if (descList !=null && descList.size() > 0 ) {
//				desc = descList.get(0);
//			} else {
//				desc = (String) solrDocument.get("item_desc");
//			}
//			item.setDescription(desc);
			
			item.setTitle((title));
			//添加到商品列表
			itemList.add(item);		
		}
		result.setItemList(itemList);
		
		//返回结果
		return result;
	}
	
	public static void main(String[] args) {
		HttpSolrClient shopSolrClient = new HttpSolrClient.Builder("http://localhost:8081/solr/collection1").build();
		if(null!=shopSolrClient) {
			System.out.println("创建成功");
		}
	}
}
