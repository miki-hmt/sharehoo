package com.sharehoo.service.shop;

import java.util.List;

import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.shop.Shop;

public interface ShopService {
	/*
	 * 2017.07.11 miki 店铺类接口实现
	 */
	public void save(Shop shop);
	
	public void delete(Shop shop);
	
	public Shop getShopById(int id);
	
	public Long getShopCountByShopId(int shopId);
	
	public List<Shop> getShopsByShopId(int shopId,PageBean pageBean);

	public Shop getShopByuserId(int userId);
	
	/*
	 * 2017.08.09	miki 根据店铺下载豆多少得到排行前六名商家
	 */
	public List<Shop> getRichShops();
	
	/*
	 * 资源细节页面，新店开业列表 2017.08.10 miki
	 */
	public List<Shop> getNewShops();
	
	/*
	 * 2020.06.13 miki 得到全部店铺列表,新增字段type
	 */
	public List<Shop> allShops(PageBean pageBean,String type);
	
	/**
	* @Title: searchShops  
	* @Description: TODO(店铺搜索)  
	* @author miki 
	* @date 2020年6月14日 下午2:10:17   
	* @throws
	 */
	public List<Shop> searchShops(PageBean pageBean,Shop search_shop);
	
	public Long getAllShopCount();
	
	public Long getSearchShopCount(Shop s_shop);
	
	/*
	 * 2017.08.18 通过栏目名匹配店铺列表
	 */
	public List<Shop> getShopListByCategory(String categoryName,PageBean pageBean);
	
	public Long getShopCountBycategory(String categoryName);
	
	//2017.08.26 店铺排行榜
	public List<Shop> getShopListByDownNum();
}
