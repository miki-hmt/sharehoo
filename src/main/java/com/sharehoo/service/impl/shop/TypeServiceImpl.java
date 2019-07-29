package com.sharehoo.service.impl.shop;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;

import com.sharehoo.dao.BaseDAO;
import com.sharehoo.entity.shop.Type;
import com.sharehoo.service.TypeService;

@Service("typeService")
public class TypeServiceImpl implements TypeService {
	
	@Resource
	private BaseDAO<Type> baseDAO;
	
	@Override
	public void save(Type type) {
		// TODO Auto-generated method stub
		baseDAO.merge(type);
	}

	@Override
	public void delete(Type type) {
		// TODO Auto-generated method stub
		baseDAO.delete(type);
	}

	@Override
	public List<Type> getTypeList() {
		// TODO Auto-generated method stub
		String hql = "from Type";
		
		return baseDAO.find(hql);
	}

	@Override
	public Type getTypeById(int id) {
		// TODO Auto-generated method stub
		return baseDAO.get(Type.class, id);
	}

}
