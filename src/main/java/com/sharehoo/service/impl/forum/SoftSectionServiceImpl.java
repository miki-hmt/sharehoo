package com.sharehoo.service.impl.forum;

import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.sharehoo.dao.impl.forum.SoftSectionDao;
import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.forum.SoftSection;
import com.sharehoo.service.forum.SoftSectionService;
import com.sharehoo.util.forum.StringUtil;
@Transactional
@Service("SoftSectionService")
public class SoftSectionServiceImpl implements SoftSectionService {
	
	@Resource
	private SoftSectionDao baseDAO;
	
	/**
	 * 
	 * @param miik
	 * 2017.03.31
	 * softSection保存软件下载版块
	 */
	@Override
	public void saveSoftSection(SoftSection softSection){
		baseDAO.merge(softSection);
	}
	
	/**
	 * 删除版块
	 */
	@Override
	public void deleteSoftSection(SoftSection softSection){
		baseDAO.delete(softSection);
	}
	
	/**
	 * 版块列表
	 */
	@Override
	public List<SoftSection> findSoftSectionsList(SoftSection s_softSection,PageBean pageBean){
		
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from SoftSection");
		if(s_softSection!=null){
			if (StringUtil.isNotEmpty(s_softSection.getAreaName())) {
				hql.append(" and areaName like ?");
				param.add("%"+s_softSection.getAreaName()+"%");
			}
		}
		if (pageBean!=null) {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
		}
	}
		
	
	/**
	 * 根据id查找版块
	 */
	@Override
	public SoftSection findSoftSectionById(int softSectionId){
		return baseDAO.get(SoftSection.class, softSectionId);
		
	}

	@Override
	public Long getSoftSectionCount(SoftSection s_softSection) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select count(*) from SoftSection");
		if (s_softSection!=null) {
			if (StringUtil.isNotEmpty(s_softSection.getAreaName())) {
				hql.append(" and areaName like ?");
				param.add("%"+s_softSection.getAreaName()+"%");
			}
		}
		return baseDAO.count(hql.toString().replaceFirst("and", "where"), param);
	}
	
	
}
