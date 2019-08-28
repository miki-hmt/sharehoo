package com.sharehoo.service.impl.shop;

import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.sharehoo.dao.shop.MenuDao;
import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.shop.Menu;
import com.sharehoo.service.MenuService;
@Transactional
@Service("menuService")
public class MenuServiceImpl implements MenuService {
	
	@Resource
	private MenuDao baseDAO;
	@Override
	public void save(Menu menu) {
		// TODO Auto-generated method stub
		baseDAO.merge(menu);
	}

	@Override
	public void delete(Menu menu) {
		// TODO Auto-generated method stub
		baseDAO.delete(menu);
	}

	@Override
	public List<Menu> getMenuListBycategoryId(int categoryId) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Menu");
		if(categoryId>0){
			hql.append(" and category_id=?");
			param.add(categoryId);
		}
		return baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
	}

	@Override
	public Menu getMenuById(int menuId) {
		// TODO Auto-generated method stub
		return baseDAO.get(Menu.class, menuId);
	}

	@Override
	public List<Menu> getAllMenuList(PageBean pageBean) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Menu order by id desc");
		if (pageBean!=null) {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
		}
	}

	@Override
	public Long getCount() {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select count(*) from Menu");
		return baseDAO.count(hql.toString().replace("and", "where"), param);
	}

}
