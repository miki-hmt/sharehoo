package com.sharehoo.service.shop;

import java.util.List;

import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.shop.Collect;

public interface CollectService {
	/*
	 * 2017.08.10 miki 店铺收藏类接口实现
	 */
	public void save(Collect collect);
	
	public void delete(Collect collect);
	
	public Collect getCollectById(int id);
	
	public Long getCollectCountBySourceId(int sourceId);
	
	/*
	 * 2017.08.12 collect表中存储的是source_Id和归属source的店铺，所以查找收藏列表时，应该根据user_id字段
	 */
	public List<Collect> getCollectsByUserId(int userId,PageBean pageBean);

	public Collect getCollectByuserId(int userId,int sourceId);
	
	public List<Collect> getCollectsByCollectCount();
	
	//根据用户Id得到总数	2017.08.12 miki
	public Long getCountByuserId(int userId);
}
