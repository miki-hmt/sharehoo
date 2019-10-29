package com.sharehoo.entity.forum;

import java.util.List;

public class TopicSearchResult {
	
	private long recordCount;
	private int totalPages;
	
	private List<SearchTopic> itemList;
	
	

	public long getRecordCount() {
		return recordCount;
	}

	public void setRecordCount(long recordCount) {
		this.recordCount = recordCount;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public List<SearchTopic> getItemList() {
		return itemList;
	}

	public void setItemList(List<SearchTopic> itemList) {
		this.itemList = itemList;
	}

	
	
}
