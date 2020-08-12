package com.sharehoo.service.impl.shop;

import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sharehoo.dao.shop.CollectDao;
import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.shop.Collect;
import com.sharehoo.service.shop.CollectService;
@Transactional
@Service("collectService")
public class CollectServiceImpl implements CollectService {
	
	@Resource
	private CollectDao baseDAO;
	
	@Override
	public void save(Collect collect) {
		// TODO Auto-generated method stub
		baseDAO.merge(collect);
	}

	@Override
	public void delete(Collect collect) {
		// TODO Auto-generated method stub
		baseDAO.delete(collect);
	}

	@Override
	public Collect getCollectById(int id) {
		// TODO Auto-generated method stub
		return baseDAO.get(Collect.class, id);
	}
	
	//得到某一资源的收藏数目 	2017.08.12 miki
	@Override
	public Long getCollectCountBySourceId(int sourceId) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select count(*) from Collect");
		if(sourceId>0){
			hql.append(" and source_id=?");
			param.add(sourceId);
		}
		return baseDAO.count(hql.toString().replaceFirst("and", "where"), param);
	}

	@Override
	public List<Collect> getCollectsByUserId(int userId, PageBean pageBean) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer(" from Collect");
		if(userId>0){
			hql.append(" and user_id=?");
			param.add(userId);
		}
		hql.append(" order by collect_time desc");
		if (pageBean!=null) {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
		}
	}

	@Override
	public Collect getCollectByuserId(int userId,int sourceId) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Collect");
		if(userId>0){
			hql.append(" and user_id=?");
			param.add(userId);
		}
		if(sourceId>0){
			hql.append(" and source_id=?");
			param.add(sourceId);
		}
		return baseDAO.get(hql.toString().replaceFirst("and", "where"), param);
	}
	
	/*
	 * 2017.08.10 sql转hql语句的方法,用来显示下载页面“大家都在收藏”模块数据列表
	 */
	@Override
	public List<Collect> getCollectsByCollectCount() {
		// TODO Auto-generated method stub
		String sql = "select *,count(*) from t_collect group by source_id order by count(*) desc ";
		
		return baseDAO.findTopNBySql(sql, null, 5,Collect.class);
	}

	@Override
	public Long getCountByuserId(int userId) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select count(*) from Collect");
		if(userId>0){
			hql.append(" and user_id=?");
			param.add(userId);
		}
		return baseDAO.count(hql.toString().replaceFirst("and", "where"), param);
	}

	}
	
