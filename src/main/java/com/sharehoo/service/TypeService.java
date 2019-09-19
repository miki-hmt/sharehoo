package com.sharehoo.service;

import java.util.List;

import com.sharehoo.entity.shop.Type;

public interface TypeService {
	
	public void save(Type type);
	
	public void delete(Type type);
	
	public List<Type> getTypeList();
	
	public List<Type> getTypeByName(String typeName);
	
	public Type getTypeById(int id);
}
