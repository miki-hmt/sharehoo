package com.sharehoo.service;

import java.util.List;

import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.shop.Log;

public interface LogService {
	/*
	 * 2017.07.11 miki 操作记录类接口实现
	 */
	public void save(Log log);
	
	public void delete(Log log);
	
	public void getLogById(int id);
	
	//店铺当天访问量统计 miki 2017.08.25 
	public Long getLogCountByShopId(int shopId);
	//店铺访问量统计 miki 2017.08.25
	public Long getAllLogCountByShopId(int shopId);
	
	public List<Log> getLogs(PageBean pageBean);
	public Long getAllCount();
}
