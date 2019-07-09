package com.sharehoo.service;

import com.sharehoo.entity.shop.Level;

public interface LevelService {
	/*
	 * 2017.07.11 miki 店铺等级接口实现
	 */
	public void save(Level level);
	
	public void delete(Level level);
	
	public void getCommemtById(int levelId);
}
