package com.sharehoo.service.impl.forum;

import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.sharehoo.dao.BaseDAO;
import com.sharehoo.dao.impl.forum.CategoryDao;
import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.shop.Category;
import com.sharehoo.service.forum.CategoryService;
import com.sharehoo.util.forum.StringUtil;
@Transactional
@Service("categoryService")
public class CategoryServiceImpl implements CategoryService {
	@Resource
	private CategoryDao baseDAO;
	
	@Override
	public void save(Category category) {
		// TODO Auto-generated method stub
		baseDAO.merge(category);
	}

	@Override
	public void delete(Category category) {
		// TODO Auto-generated method stub
		baseDAO.delete(category);
	}

	@Override
	public List<Category> getCategoryList(Category s_category,PageBean pageBean) {
		
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Category");
		if(s_category!=null){
			if (StringUtil.isNotEmpty(s_category.getName())) {
				hql.append(" and name like ?");
				param.add("%"+s_category.getName()+"%");
			}
		}if (pageBean!=null) {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
		}
	}

	@Override
	public Category getCategoryById(int categoryId) {
		// TODO Auto-generated method stub
		return baseDAO.get(Category.class, categoryId);
	}

	@Override
	public Long getCount() {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select count(*) from Category");
		return baseDAO.count(hql.toString().replace("and", "where"), param);
	}

	@Override
	public List<Category> getCategoryByName(String categoryName) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Category and name = ?");
		param.add(categoryName);
		return baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
	}

}
