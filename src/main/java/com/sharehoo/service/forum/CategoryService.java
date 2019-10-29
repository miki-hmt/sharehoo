package com.sharehoo.service.forum;

import java.util.List;

import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.shop.Category;

public interface CategoryService {
	/*
	 * 2017.07.31 miki 栏目类接口实现
	 */
	public void save(Category category);
	
	public void delete(Category category);
	
	public List<Category> getCategoryList(Category s_category,PageBean pageBean);
	
	public Category getCategoryById(int categoryId);
	
	public List<Category> getCategoryByName(String categoryName);
	
	public Long getCount();
}
