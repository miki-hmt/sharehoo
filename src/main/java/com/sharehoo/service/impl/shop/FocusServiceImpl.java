package com.sharehoo.service.impl.shop;

import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sharehoo.dao.shop.FocusDao;
import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.shop.Focus;
import com.sharehoo.service.shop.FocusService;

@Service("focusService")
public class FocusServiceImpl implements FocusService {
	
	@Resource
	private FocusDao baseDAO;
	
	@Override
	public void save(Focus focus) {
		// TODO Auto-generated method stub
		baseDAO.merge(focus);
	}

	@Override
	public void delete(Focus focus) {
		// TODO Auto-generated method stub
		baseDAO.delete(focus);
	}

	@Override
	public Focus getFocusById(int id) {
		// TODO Auto-generated method stub
		return baseDAO.get(Focus.class, id);
	}
	//根据店铺Id得到该店铺的关注列表   2017.08.12 miki
	@Override
	public Long getFocusCountByShopId(int shopId) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select count(*) from Focus");
		if(shopId>0){
			hql.append(" and shop_id=?");
			param.add(shopId);
		}
		return baseDAO.count(hql.toString().replaceFirst("and", "where"), param);
	}
	
	//根据用户Id得到所关注店铺列表   2017.08.12 miki
	@Override
	public List<Focus> getFocusesByUserId(int userId, PageBean pageBean) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer(" from Focus");
		if(userId>0){
			hql.append(" and user_id=?");
			param.add(userId);
		}
		hql.append(" order by focus_time desc");
		if (pageBean!=null) {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
		}
	}

	@Override
	public Focus getFocusByShopId(int shopId,int userId) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Focus");
		if(shopId>0){
			hql.append(" and shop_id=?");
			param.add(shopId);
		}
		if(userId>0){
			hql.append(" and user_id=?");
			param.add(userId);
		}
		return baseDAO.get(hql.toString().replaceFirst("and", "where"), param);
	}
	
	/*
	 * 2017.08.12 miki	查找某个用户的到关注列表
	 */
	@Override
	public Long getFocusCountByUserId(int userId) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select count(*) from Focus");
		if(userId>0){
			hql.append(" and user_id=?");
			param.add(userId);
		}
		return baseDAO.count(hql.toString().replaceFirst("and", "where"), param);
	}

}
