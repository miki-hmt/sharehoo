package com.sharehoo.service.shop;

import java.util.List;

import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.shop.Source;

public interface SourceService {
	/*
	 * 2017.07.31 miki 资源类接口实现
	 */
	public void save(Source source);
	
	public void delete(Source source);
	
	public Source getSourceById(int id);
	
	public Long getSourceCountByuserId(int userId);
	
	//得到店铺内所有资源	2017.08.15 miki
	public List<Source> getSourcesByShopId(int shopId,PageBean pageBean);

	public Source getSourceByshopId(int shopId);
	
	public Source getLastUploadByShopId(int shopId);
	
	public List<Source> getNewSources();	//首页得到最新资源栏	2017.08.07 miki
	
	public List<Source> getGoodSources();
	//按照下载量得到店铺内前五个资源 2017.08.10 miki
	public List<Source> getSourcesByshopId(int shopId);
	
	/*
	 * 根据店铺id得到最近新品资源
	 */
	public Source getnewSourceByShopId(int shopId);
	
	/*
	 * 得到数据库中所有资源	2017.08.15 miki
	 */
	public List<Source> allSourceList(PageBean pageBean);
	
	public List<Source> allSourceListByDownNum(PageBean pageBean);
	
	public Long getAllCount();
	
	/*
	 * 2017.08.15 miki 通过caategoryId得到资源列表
	 */
	public List<Source> getSourceListByCategoryId(int categoryId,PageBean pageBean);
	
	public Long getCountByCategoryId(int categoryId);
	
	/*
	 * 2017.08.15 miki 通过menuId得到资源列表
	 */
	public List<Source> getSourceListByMenuId(int menuId,PageBean pageBean);
	
	public Long getCountByMenuId(int MenuId);
	
	/*
	 * 2017.08.16 miki	根据关键字查询source表
	 */
	public List<Source> getSourceListByKeyword(int categoryId,int typeId,String keyword,String keyword2,String keyword3,String keyword4,PageBean pageBean);
	
	public Long getCountByCateTypeKeyword(int categoryId,int typeId,String keyword,String keyword2,String keyword3,String keyword4);
	
	/*
	 * 2017.08.16 miki 根据categoryId和typeId得到资源列表
	 */
	public List<Source> getSourcesBycategoryType(int categoryId,int typeId,PageBean pageBean);
	public Long getCountByCateType(int categoryId,int typeId);
	
	//2017.12.28得到每周的资源下载排行
	public List<Source> getSRankByWeek(String time);
	
	
	//2018.08.09	miki 得到搜索资源列表
	public List<Source> getSearchSourceList(PageBean pageBean);
}
