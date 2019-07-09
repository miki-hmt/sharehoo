package com.sharehoo.service.forum;

import java.util.List;

import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.forum.SoftSection;

/**
 * 
 * @author 2017.03.31 
 * miki
 * project :创建版块操作接口
 *
 */
public interface SoftSectionService {
	
	/**
	 * 
	 * @param softSection保存软件下载版块
	 */
	public void saveSoftSection(SoftSection softSection);
	
	/**
	 * 删除版块
	 */
	public void deleteSoftSection(SoftSection softSection);
	
	/**
	 * 版块列表
	 */
	public List<SoftSection> findSoftSectionsList(SoftSection s_softSection,PageBean pageBean);
	
	/**
	 * 根据id查找版块
	 */
	public SoftSection findSoftSectionById(int softSectionId);
	
	public Long getSoftSectionCount(SoftSection s_softSection);
	
}
