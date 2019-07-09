package com.sharehoo.service.forum;

import java.util.List;

import com.sharehoo.entity.forum.Me;
import com.sharehoo.entity.forum.PageBean;

/**
 * 2017.05.09
 * miki
 * @author Administrator
 *博客自我介绍接口的实现
 */
public interface MeService {
	
	/*
	 * save
	 */
	public void save(Me me);
	
	/*
	 * delete
	 */
	public void delete(Me me);
	
	/*
	 * 根据Id得到
	 */
	public List<Me> getMeListByUserId(int userId,PageBean pageBean);
	
	/*
	 * 得到列表
	 */
	public Long getMeCount(Me s_me);
	
	public List<Me> findMeList(Me s_me,PageBean pageBean);

	

}