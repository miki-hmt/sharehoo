package com.sharehoo.service.impl.shop;

import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sharehoo.dao.BaseDAO;
import com.sharehoo.dao.shop.SignDao;
import com.sharehoo.entity.shop.Sign;
import com.sharehoo.service.shop.SignService;

@Service("signService")
public class SignServiceImpl implements SignService {
	
	@Resource
	private SignDao baseDAO;
	
	@Override
	public void saveSign(Sign sign) {
		// TODO Auto-generated method stub
		baseDAO.merge(sign);
	}

	@Override
	public void delete(Sign sign) {
		// TODO Auto-generated method stub
		baseDAO.delete(sign);
	}

	@Override
	public Sign getSignByShopId(int shopId) {
		// TODO Auto-generated method stub
		StringBuffer hql=new StringBuffer(" from Sign");
		List<Object> param=new LinkedList<Object>();
		if(shopId>0){
			hql.append(" and shop_id=?");
			param.add(shopId);			
		}
		return baseDAO.get(hql.toString().replaceFirst("and", "where"), param);
	}

}
