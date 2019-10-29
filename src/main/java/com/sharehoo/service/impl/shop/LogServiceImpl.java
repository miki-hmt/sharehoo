package com.sharehoo.service.impl.shop;

import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.sharehoo.dao.BaseDAO;
import com.sharehoo.dao.shop.LogDao;
import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.shop.Log;
import com.sharehoo.service.LogService;
@Transactional
@Service("logService")
public class LogServiceImpl implements LogService {
	
	@Resource
	private LogDao baseDAO;
	@Override
	public void save(Log log) {
		// TODO Auto-generated method stub
		baseDAO.merge(log);
	}

	@Override
	public void delete(Log log) {
		// TODO Auto-generated method stub
		baseDAO.delete(log);
	}

	@Override
	public void getLogById(int id) {
		// TODO Auto-generated method stub
		baseDAO.get(Log.class, id);
	}
	
	//2017.08.25 miki 得到当天访问量
	@Override
	public Long getLogCountByShopId(int shopId) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		java.util.Date date=new java.util.Date();
		StringBuffer hql=new StringBuffer("select count(*) from Log l");
		if(shopId>0){
			hql.append(" and l.shop.id = ?");
			param.add(shopId);
		}
		if(date!=null){
			hql.append(" and date_format(l.time,'%y-%M-%d') = date_format(?,'%y-%M-%d')");
			param.add(date);
		}
		return baseDAO.count(hql.toString().replaceFirst("and", "where"), param);
	}

	@Override
	public List<Log> getLogs(PageBean pageBean) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Log");
		hql.append(" order by time desc");
		if (pageBean!=null) {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
		}
	}
	
	//2017.08.25 miki 得到所有访问量
	@Override
	public Long getAllLogCountByShopId(int shopId) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select count(*) from Log");
		if(shopId>0){
			hql.append(" and shop_id = ?");
			param.add(shopId);
		}
		return baseDAO.count(hql.toString().replaceFirst("and", "where"), param);
	}

	@Override
	public Long getAllCount() {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select count(*) from Log");
		return baseDAO.count(hql.toString().replace("and", "where"),param);
	}


}
