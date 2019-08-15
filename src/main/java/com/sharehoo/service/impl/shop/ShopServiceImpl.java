package com.sharehoo.service.impl.shop;

import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;

import com.sharehoo.dao.BaseDAO;
import com.sharehoo.dao.shop.ShopDao;
import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.shop.Shop;
import com.sharehoo.service.shop.ShopService;

@Service("shopService")
public class ShopServiceImpl implements ShopService {
	
	@Resource	//2017.12.20  miki 一定要在这加上resource注解，这是spring的依赖注入，不添加会报空指向异常
	private ShopDao baseDAO;
	@Override
	public void save(Shop shop) {
		// TODO Auto-generated method stub
		baseDAO.merge(shop);
	}

	@Override
	public void delete(Shop shop) {
		// TODO Auto-generated method stub
		baseDAO.delete(shop);
	}

	@Override
	public Shop getShopById(int id) {
		// TODO Auto-generated method stub
		return baseDAO.get(Shop.class, id);
	}

	@Override
	public Long getShopCountByShopId(int shopId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Shop> getShopsByShopId(int shopId, PageBean pageBean) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Shop getShopByuserId(int userId) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Shop");
		if(userId>0){
			hql.append(" and user_id = ?");
			param.add(userId);
		}
		return baseDAO.get(hql.toString().replaceFirst("and", "where"), param);
	}

	@Override
	public List<Shop> getRichShops() {
		// TODO Auto-generated method stub
		String hql = "from Shop as shop order by shop.douNum desc";
		
		return baseDAO.findTopN(hql, null, 6);
	}

	@Override
	public List<Shop> getNewShops() {
		// TODO Auto-generated method stub
		String hql = "from Shop as shop order by shop.registerTime desc";
		
		return baseDAO.findTopN(hql, null, 3);
	}

	@Override
	public List<Shop> allShops(PageBean pageBean) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Shop");
		if (pageBean!=null) {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
		}
	}

	@Override
	public Long getAllShopCount() {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select count(*) from Shop");		
		return baseDAO.count(hql.toString().replaceFirst("and", "where"), param);
	}

	@Override
	public List<Shop> getShopListByCategory(String categoryName,
			PageBean pageBean) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Shop");
		if(categoryName!=null && categoryName!=""){
			hql.append(" and tag like ?");
			param.add(categoryName);
		}
		hql.append(" order by sourceNum desc");
		if (pageBean!=null) {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
		}
	}

	@Override
	public Long getShopCountBycategory(String categoryName) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select count(*) from Shop");
		if(categoryName!=null && categoryName!=""){
			hql.append(" and tag like ?");
			param.add(categoryName);
		}
		return baseDAO.count(hql.toString().replaceFirst("and", "where"), param);
	}

	@Override
	public List<Shop> getShopListByDownNum() {
		// TODO Auto-generated method stub
		String hql = "from Shop as shop order by shop.downNum desc";
		
		return baseDAO.findTopN(hql, null, 5);
	}
}