package com.sharehoo.service.impl.shop;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;

import com.sharehoo.dao.BaseDAO;
import com.sharehoo.dao.shop.SourceDao;
import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.shop.Source;
import com.sharehoo.service.shop.SourceService;
import com.sharehoo.util.forum.StringUtil;
@Transactional
@Service("sourceService")
public class SourceServiceImpl implements SourceService {
	
	@Resource	//2017.12.20  miki 一定要在这加上resource注解，这是spring的依赖注入，不添加会报空指向异常
	private SourceDao baseDAO;
	@Override
	public void save(Source source) {
		// TODO Auto-generated method stub
		baseDAO.merge(source);
	}

	@Override
	public void delete(Source source) {
		// TODO Auto-generated method stub
		baseDAO.delete(source);
	}

	@Override
	public Source getSourceById(int id) {
		
		return baseDAO.get(Source.class, id);
		// TODO Auto-generated method stub		
	}

	@Override
	public Long getSourceCountByuserId(int userId) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select count(*) from Source");
		if(userId>0){
			hql.append(" and user_id = ?");
			param.add(userId);
		}
		
		return baseDAO.count(hql.toString().replaceFirst("and", "where"), param);
	}

	@Override
	public List<Source> getSourcesByShopId(int shopId, PageBean pageBean) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Source");
		if(shopId>0){
			hql.append(" and shop_id = ?");
			param.add(shopId);
		}
		hql.append(" order by upload_time desc");
		if (pageBean!=null) {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
		}
	}

	@Override
	public Source getSourceByshopId(int shopId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Source getLastUploadByShopId(int shopId) {
		// TODO Auto-generated method stub
		List<Source> sourceList=new ArrayList<Source>();
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Source");
		if (shopId>0) {
			hql.append(" and shop_id = ?");
			param.add(shopId);
		}
		hql.append(" order by upload_time desc");
		sourceList=baseDAO.find(hql.toString().replaceFirst("and", "where"),param);
		if (sourceList.size()>0) {
			return sourceList.get(0);
		} else {
			return null;
		}
	}
	
	/*
	 * 2017.08.07 miik 得到最新资源
	 */
	@Override
	public List<Source> getNewSources() {
		// TODO Auto-generated method stub
		String hql = "from Source as source order by source.upload_time desc";
		
		return baseDAO.findTopN(hql, null, 5);
	}
	
	/*
	 * 2017.08.07 miik 根据访问量得到精品资源
	 */
	@Override
	public List<Source> getGoodSources() {
		// TODO Auto-generated method stub
		String hql = "from Source as source where source.good=1 order by source.upload_time desc";
		
		return baseDAO.findTopN(hql, null, 5);
	}

	@Override
	public List<Source> getSourcesByshopId(int shopId) {
		// TODO Auto-generated method stub
		List<Object> params = new LinkedList<Object>();
		String hql = "from Source as source where source.shop.id=? order by source.downNum desc";
		params.add(shopId);
		
		return baseDAO.findTopN(hql, params, 5);
	}

	@Override
	public Source getnewSourceByShopId(int shopId) {
		// TODO Auto-generated method stub
		List<Object> params = new LinkedList<Object>();
		String hql = "from Source as source where source.shop.id=? order by source.upload_time desc ";
		params.add(shopId);
		List<Source> list = baseDAO.findTopN(hql, params, 1);
		if(list.size()==0){
			return null;
		}
		Source source = (Source) list.get(0);
		return source;
	}

	@Override
	public List<Source> allSourceList(PageBean pageBean) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Source");
		hql.append(" order by upload_time desc");
		if (pageBean!=null) {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
		}
	}

	@Override
	public Long getAllCount() {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select count(*) from Source");		
		return baseDAO.count(hql.toString().replaceFirst("and", "where"), param);
	}

	@Override
	public List<Source> allSourceListByDownNum(PageBean pageBean) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Source");
		hql.append(" order by downNum desc");
		if (pageBean!=null) {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
		}
	}

	@Override
	public List<Source> getSourceListByCategoryId(int categoryId,
			PageBean pageBean) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Source");
		if(categoryId>0){
			hql.append(" and category_id = ?");
			param.add(categoryId);
		}
		hql.append(" order by upload_time desc");
		if (pageBean!=null) {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
		}
	}

	@Override
	public Long getCountByCategoryId(int categoryId) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select count(*) from Source");
		if(categoryId>0){
			hql.append(" and category_id = ?");
			param.add(categoryId);
		}
		
		return baseDAO.count(hql.toString().replaceFirst("and", "where"), param);
	}

	@Override
	public List<Source> getSourceListByMenuId(int menuId, PageBean pageBean) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Source");
		if(menuId>0){
			hql.append(" and menu_id = ?");
			param.add(menuId);
		}
		hql.append(" order by upload_time desc");
		if (pageBean!=null) {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
		}
	}
	
	//2017.08.16 miki 通过二级菜单Id得到资源数目
	@Override
	public Long getCountByMenuId(int MenuId) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select count(*) from Source");
		if(MenuId>0){
			hql.append(" and menu_id = ?");
			param.add(MenuId);
		}
		
		return baseDAO.count(hql.toString().replaceFirst("and", "where"), param);
	}

	//2017.08.16 miki 通过关键字检索得到资源列表
	@Override
	public List<Source> getSourceListByKeyword(int categoryId, int typeId,
			String keyword,String keyword2,String keyword3,String keyword4, PageBean pageBean) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Source s");	
			if (categoryId>0) {
				hql.append(" and s.category.id=?");
				param.add(categoryId);
			}
			if (typeId>0) {
					hql.append(" and s.type.id=?");
					param.add(typeId);	
			}
			if (StringUtil.isNotEmpty(keyword)) {
				hql.append(" and s.name like ?");
				param.add("%"+keyword+"%");
			}
			if (StringUtil.isNotEmpty(keyword2)) {
				hql.append(" or s.name like ?");
				param.add(keyword2+"%");
			}
			if (StringUtil.isNotEmpty(keyword3)) {
				hql.append(" or s.name like ?");
				param.add(keyword3+"%");
			}
			if (StringUtil.isNotEmpty(keyword4)) {
				hql.append(" or s.tag like ?");
				param.add("%"+keyword2+"%");
			}
		if (pageBean!=null) {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
		}
	}

	//2017.08.16 miki 通过关键字检索得到资源数目
	@Override
	public Long getCountByCateTypeKeyword(int categoryId, int typeId,
			String keyword,String keyword2,String keyword3,String keyword4) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select count(*) from Source s");	
			if (categoryId>0) {
				hql.append(" and s.category.id=?");
				param.add(categoryId);
			}
			if (typeId>0) {
					hql.append(" and s.type.id=?");
					param.add(typeId);	
			}
			if (StringUtil.isNotEmpty(keyword)) {
				hql.append(" and s.name like ?");
				param.add("%"+keyword+"%");
			}
			if (StringUtil.isNotEmpty(keyword2)) {
				hql.append(" or s.name like ?");
				param.add("%"+keyword2+"%");
			}
			if (StringUtil.isNotEmpty(keyword3)) {		//英文首字母开头的关键字
				hql.append(" or s.name like ?");
				param.add(keyword3+"%");
			}
			if (StringUtil.isNotEmpty(keyword4)) {
				hql.append(" or s.tag like ?");
				param.add("%"+keyword2+"%");
			}
			return baseDAO.count(hql.toString().replaceFirst("and", "where"), param);
	}

	@Override
	public List<Source> getSourcesBycategoryType(int categoryId, int typeId,PageBean pageBean) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Source");
		if(categoryId>0){
			hql.append(" and category_id = ?");
			param.add(categoryId);
		}
		if(typeId>0){
			hql.append(" and type_id = ?");
			param.add(typeId);
		}
		hql.append(" order by upload_time desc");
		if (pageBean!=null) {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
		}
	}

	@Override
	public Long getCountByCateType(int categoryId, int typeId) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select count(*) from Source");
		if(categoryId>0){
			hql.append(" and category_id = ?");
			param.add(categoryId);
		}
		if(typeId>0){
			hql.append(" and type_id = ?");
			param.add(typeId);
		}
		return baseDAO.count(hql.toString().replaceFirst("and", "where"), param);
	}

	//2017.12.28 16:47得到资源下载数量周排行
		@Override
		public List<Source> getSRankByWeek(String time) {
			// TODO Auto-generated method stub
			List<Object> params = new LinkedList<Object>();
			String hql = "from Source as s where s.id in (select o.source.id from Operate o where o.operate_time > str_to_date(?, '%Y-%m-%d %H') and type like '%download%') order by s.downNum desc";
			params.add(time);
			
			return baseDAO.findTopN(hql, params, 9);
		}

		
		public List<Source> getSearchSourceList(PageBean pageBean) {
			// TODO Auto-generated method stub
			List<Object> param=new LinkedList<Object>();
			StringBuffer hql=new StringBuffer("from Source");
			hql.append(" order by upload_time desc");
			if (pageBean!=null) {
				return baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
			}else {
				return baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
			}
		}
}
