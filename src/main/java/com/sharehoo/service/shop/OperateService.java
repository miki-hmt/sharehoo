package com.sharehoo.service.shop;

import java.util.List;

import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.shop.Operate;

public interface OperateService {
	/*
	 * 2017.08.10 miki 店铺关注类接口实现
	 */
	public void save(Operate operate);
	
	public void delete(Operate operate);
	
	public Operate getOperateById(int id);
	
	/*
	 * 2017.08.10 得到店铺操作记录
	 */
	public Long getOperateCountByShopId(int shopId);
	
	public List<Operate> getOperatesByShopId(int shopId,PageBean pageBean);

	public Operate getOperateByuserId(int userId);
	
	//2018.02.07得到前七天签到列表
	public List<Operate> getSignListByUserId(int userId);
	
	//2018.02.07 得到本月签到
	public Long getMonthCountByuserId(int userId,String time);
	//2018.02.07 得到本月签到列表
	public List<Operate> getMonthListByuserId(int userId,String time);
	
}
