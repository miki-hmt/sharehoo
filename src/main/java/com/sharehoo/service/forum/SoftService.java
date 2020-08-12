package com.sharehoo.service.forum;

import java.util.List;

import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.forum.Soft;

/**
 * 
 * @author miki
 * date:2017.04.01
 * project:接口的定义
 *
 */

public interface SoftService {
	
	
	/**
	 * 保存
	 * @param soft
	 */
	public void saveSoft(Soft soft);
	
	/**
	 * 删除操作
	 */
	public void deleteSoft(Soft soft);
	
	/**
	 * 显示列表
	 */
	public List<Soft> findSoftList(Soft s_soft,PageBean pageBean);
	
	/**
	 * 根据sectionId查询版块帖子列表
	 */
	public List<Soft> findSoftListBySoftSectionId(int softSectionId,PageBean pageBean);
	
	/**
	 * 根据id查找
	 */
	public Soft findSoftById(int softId);
	
	/**
	 * 统计数量
	 */
	public Long getSoftCount(Soft soft);
	
	/**
	 * 根据版块统计数目
	 */
	public Long getSoftCountBySoftSectionId(int softSectionId);
	
	/*
	 * 2017.05.13
	 * 版块推荐软件列表
	 */
	public List<Soft> goodListBySoftSectionId(int softSectionId,PageBean pageBean);
	
	/**
	 * 2017.05.14
	 * miik
	 * 得打热门下载列表
	 */
	public List<Soft> hotListByHot(int hot,PageBean pageBean);
	
	/**
	 * 2017.05.13
	 * miki
	 * 
	 */
}
