package com.sharehoo.service.impl.shop;

import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;

import com.sharehoo.dao.BaseDAO;
import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.shop.Operate;
import com.sharehoo.service.shop.OperateService;

@Service("operateService")
public class OperateServiceImpl implements OperateService {
	
	@Resource
	private BaseDAO<Operate> baseDAO;
	@Override
	public void save(Operate operate) {
		// TODO Auto-generated method stub
		baseDAO.merge(operate);
	}

	@Override
	public void delete(Operate operate) {
		// TODO Auto-generated method stub
		baseDAO.delete(operate);
	}

	@Override
	public Operate getOperateById(int id) {
		// TODO Auto-generated method stub
		return baseDAO.get(Operate.class, id);
	}

	@Override
	public Long getOperateCountByShopId(int shopId) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select count(*) from Operate");
		if(shopId>0){
			hql.append(" and shop_id=?");
			param.add(shopId);
		}
		return baseDAO.count(hql.toString().replaceFirst("and", "where"), param);
	}

	@Override
	public List<Operate> getOperatesByShopId(int shopId, PageBean pageBean) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer(" from Operate");
		if(shopId>0){
			hql.append(" and shop_id=?");
			param.add(shopId);
		}
		hql.append(" order by operate_time desc");
		if (pageBean!=null) {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
		}
	}

	@Override
	public Operate getOperateByuserId(int userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Operate> getSignListByUserId(int userId) {
		// TODO Auto-generated method stub
		List<Object> params = new LinkedList<Object>();
		String hql = "from Operate as operate where operate.user.id=:userId and operate.type like '%sign%' order by operate.operate_time desc";
		params.add(userId);
		
		return baseDAO.findTopN(hql, params, 7);
	}

	@Override
	public Long getMonthCountByuserId(int userId,String time) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select count(*) from Operate");
		if(userId>0){
			hql.append(" and user_id=?");
			param.add(userId);
		}
		if(time!=null){
			hql.append(" and operate_time > str_to_date(?, '%Y-%m')");
			param.add(time);
		}
		hql.append(" and type like '%sign%'");
		return baseDAO.count(hql.toString().replaceFirst("and", "where"), param);
	}
	
	//2018.02.07 得到本月签到列表
	@Override
	public List<Operate> getMonthListByuserId(int userId, String time) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Operate");
		if(userId>0){
			hql.append(" and user_id=?");
			param.add(userId);
		}
		if(time!=null){
			hql.append(" and operate_time > str_to_date(?, '%Y-%m')");
			param.add(time);
		}
		hql.append(" and type like '%sign%'");
		return baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
	}

}
