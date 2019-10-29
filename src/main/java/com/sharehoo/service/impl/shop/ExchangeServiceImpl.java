package com.sharehoo.service.impl.shop;

import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;

import com.sharehoo.dao.BaseDAO;
import com.sharehoo.dao.shop.ExchangeDao;
import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.shop.Exchange;
import com.sharehoo.service.ExchangeService;
@Transactional
@Service("exchangeService")
public class ExchangeServiceImpl implements ExchangeService {
	
	@Resource
	private ExchangeDao baseDAO;
	
	@Override
	public void addLog(Exchange exchange) {
		// TODO Auto-generated method stub
		baseDAO.merge(exchange);
	}

	@Override
	public void delete(Exchange exchange) {
		// TODO Auto-generated method stub
		baseDAO.delete(exchange);
	}

	@Override
	public List<Exchange> getExchanges(PageBean pageBean) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer(" from Exchange");
		hql.append(" order by ec_time desc ");
		
		if (pageBean!=null) {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
		}
	}

	@Override
	public Long getTotalByUserId(int userId) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		java.util.Date date=new java.util.Date();
		StringBuffer hql=new StringBuffer(" select count(*) from Cdk c");
		if(userId>0){
			hql.append(" and c.user.id = ?");
			param.add(userId);
		}
		if(date!=null){
			hql.append(" and date_format(c.ec_time,'%y-%M-%d') = date_format(?,'%y-%M-%d')");
			param.add(date);
		}
		return baseDAO.count(hql.toString().replaceFirst("and", "where"), param);
	}

}
