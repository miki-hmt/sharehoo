package com.sharehoo.service.shop;

import java.util.List;

import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.shop.Focus;

public interface FocusService {
	/*
	 * 2017.08.10 miki 店铺关注类接口实现
	 */
	public void save(Focus focus);
	
	public void delete(Focus focus);
	
	public Focus getFocusById(int id);
	
	//得到某个店铺的关注数目 2017.08.12 miki
	public Long getFocusCountByShopId(int shopId);
	
	//根据userId得到关注列表	2017.08.12 miki
	public List<Focus> getFocusesByUserId(int userId,PageBean pageBean);

	public Focus getFocusByShopId(int shopId,int userId);
	
	public Long getFocusCountByUserId(int userId);
}
