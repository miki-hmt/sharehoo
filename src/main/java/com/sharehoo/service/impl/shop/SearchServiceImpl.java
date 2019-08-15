package com.sharehoo.service.impl.shop;

import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;

import com.sharehoo.dao.BaseDAO;
import com.sharehoo.dao.SearchDao;
import com.sharehoo.dao.shop.ShopDao;
import com.sharehoo.dao.shop.SourceDao;
import com.sharehoo.entity.shop.Search;
import com.sharehoo.entity.shop.Shop;
import com.sharehoo.entity.shop.Source;
import com.sharehoo.service.shop.SearchService;
import com.sharehoo.util.forum.StringUtil;

@Service("searchService")
public class SearchServiceImpl implements SearchService {
	
	@Resource
	private com.sharehoo.dao.shop.SearchDao baseDAO;
	@Resource
	private SourceDao sourceDAO;
	@Resource
	private ShopDao shopDAO;
	
	@Override
	public void save(Search search) {
		// TODO Auto-generated method stub
		baseDAO.save(search);
	}

	@Override
	public Search getSearch(int id) {
		// TODO Auto-generated method stub
		return baseDAO.get(Search.class,id);
	}

	@Override
	public Search getlast() {
		// TODO Auto-generated method stub
		String hql = "from Search order by id desc";
		List<Search> list = baseDAO.findTopN(hql, null, 1);
		if(list.size()==0){
			return null;
		}
		Search search = (Search) list.get(0);
		return search;
	}
	
	//2017.12.28 16:47得到资源下载数量周排行
			@Override
			public List<Source> getSRankByWeek(String time) {
				// TODO Auto-generated method stub
				List<Object> params = new LinkedList<Object>();
				String hql = "from Source as s where s.id in (select o.source.id from Operate o where o.operate_time > str_to_date(?, '%Y-%m-%d %H') and type like '%download%') order by s.downNum desc";
				params.add(time);
				
				return sourceDAO.findTopN(hql, params, 10);
			}

	//2017.12.28 16:47得到用户虎豆增长数量周排行
	@Override
	public List<Shop> getURankByWeek(String time) {
		// TODO Auto-generated method stub
		List<Object> params = new LinkedList<Object>();
		String hql = " from Shop as p where p.id in (select o.shop.id from Operate o where o.operate_time > str_to_date(?, '%Y-%m-%d %H') and type like '%sell%') order by p.douNum desc ";
		params.add(time);
		return shopDAO.findTopN(hql, params, 10);
	}

	//2017.12.28 16:47得到用户每周上传数量周排行
	@Override
	public List<Source> getUploadRankByWeek(String time) {
		// TODO Auto-generated method stub
		List<Object> params = new LinkedList<Object>();
		String hql=" from Source as s where s.upload_time > str_to_date(?, '%Y-%m-%d %H') group by s.shop.id order by count(*) desc";
		params.add(time);
		return sourceDAO.findTopN(hql, params, 10);
	}

	@Override
	public Long getweekCount(String time,int shopId) {
		// TODO Auto-generated method stub
		
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select count(*) from Source as s");
		if(shopId>0){
			hql.append(" and s.shop.id = ?");
			param.add(shopId);
		}
		if(StringUtil.isNotEmpty(time)){
			hql.append(" and s.upload_time > str_to_date(?, '%Y-%m-%d %H')");
			param.add(time);
		}
		return baseDAO.count(hql.toString().replaceFirst("and", "where"), param);
	}
	
	//2017.12.30 13:47得到用户每月上传数量月排行
	@Override
	public List<Source> getSRankByMonth(String time) {
		// TODO Auto-generated method stub
		List<Object> params = new LinkedList<Object>();
		String hql = "from Source as s where s.id in (select o.source.id from Operate o where o.operate_time > str_to_date(?, '%Y-%m') and type like '%download%') order by s.downNum desc";
		params.add(time);
		
		return sourceDAO.findTopN(hql, params, 10);
	}
	//2017.12.30 13:47得到用户每月虎豆数量月排行
	@Override
	public List<Shop> getURankByMonth(String time) {
		// TODO Auto-generated method stub
		List<Object> params = new LinkedList<Object>();
		String hql = " from Shop as p where p.id in (select o.shop.id from Operate o where o.operate_time > str_to_date(?, '%Y-%m') and type like '%sell%') order by p.douNum desc ";
		params.add(time);
		return shopDAO.findTopN(hql, params, 10);
	}

	//2017.12.30 13:47得到用户每月上传数量月排行
	@Override
	public List<Source> getUploadRankByMonth(String time) {
		// TODO Auto-generated method stub
		List<Object> params = new LinkedList<Object>();
		String hql=" from Source as s where s.upload_time > str_to_date(?, '%Y-%m') group by s.shop.id order by count(*) desc";
		params.add(time);
		return sourceDAO.findTopN(hql, params, 10);
		
	}
	
	@Override
	public Long getMonthCount(String time,int shopId) {
		// TODO Auto-generated method stub
		
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select count(*) from Source as s");
		if(shopId>0){
			hql.append(" and s.shop.id = ?");
			param.add(shopId);
		}
		if(StringUtil.isNotEmpty(time)){
			hql.append(" and s.upload_time > str_to_date(?, '%Y-%m')");
			param.add(time);
		}
		return baseDAO.count(hql.toString().replaceFirst("and", "where"), param);
	}

}
