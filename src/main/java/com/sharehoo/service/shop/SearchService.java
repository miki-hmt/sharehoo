package com.sharehoo.service.shop;

import java.util.Date;
import java.util.List;

import com.sharehoo.entity.shop.Search;
import com.sharehoo.entity.shop.Shop;
import com.sharehoo.entity.shop.Source;


public interface SearchService {
	
	public void save(Search search);
	public Search getSearch(int id);
	public Search getlast();
	
	//2017.12.28得到用户每周的虎豆增长排行
	public List<Shop> getURankByWeek(String time);
	
	//2017.12.28得到用户每周上传资源排行
	public List<Source> getUploadRankByWeek(String time);
	//2017.12.28 统计用户七周内上传数量
	public Long getweekCount(String time,int shopId);
	
	//2017.12.28得到每周的资源下载排行
		public List<Source> getSRankByWeek(String time);
	
	
	//2017.12.28得到每月资源下载排行
	public List<Source> getSRankByMonth(String time);
	
	//2017.12.28得到用户每月的虎豆增长排行
	public List<Shop> getURankByMonth(String time);
	
	//2017.12.28得到用户每月上传资源排行
	public List<Source> getUploadRankByMonth(String time);
	
	public Long getMonthCount(String time,int shopId);
	
}
