package com.sharehoo.service;

import java.util.List;

import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.shop.Menu;

public interface MenuService {
	/*
	 * 2017.8.13 miki 子目录类接口实现
	 */
	public void save(Menu menu);
	
	public void delete(Menu menu);
	
	public List<Menu> getMenuListBycategoryId(int categoryId);
	
	public Menu getMenuById(int menuId);
	
	public List<Menu> getMenuByName(String menuName);
	
	public List<Menu> getAllMenuList(PageBean pageBean);
	
	public Long getCount();
}
