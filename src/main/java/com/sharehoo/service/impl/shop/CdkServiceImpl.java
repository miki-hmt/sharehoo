package com.sharehoo.service.impl.shop;

import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sharehoo.dao.BaseDAO;
import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.shop.Cdk;
import com.sharehoo.service.shop.CdkService;
import com.sharehoo.util.forum.StringUtil;

@Service("cdkService")
public class CdkServiceImpl implements CdkService {
	@Resource
	private BaseDAO<Cdk> baseDao;

	@Override
	public void add(Cdk cdk) {
		// TODO Auto-generated method stub
		baseDao.merge(cdk);
	}

	@Override
	public void delete(Cdk cdk) {
		// TODO Auto-generated method stub
		baseDao.delete(cdk);
	}

	@Override
	public List<Cdk> getCdkList(PageBean pageBean) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer(" from Cdk");
		hql.append(" order by id desc ");
		
		if (pageBean!=null) {
			return baseDao.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else {
			return baseDao.find(hql.toString().replaceFirst("and", "where"), param);
		}
	}

	@Override
	public Long getCdkTotal() {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select count(*) from Cdk");
		
		return baseDao.count(hql.toString().replaceFirst("and", "where"), param);
	}

	@Override
	public Cdk getCdk(int cdkId) {
		// TODO Auto-generated method stub
		return baseDao.get(Cdk.class, cdkId);
	}

	@Override
	public Cdk getCdkByCode(String code) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Cdk");
		if(StringUtil.isNotEmpty(code)){
			hql.append(" and code = ?");
			param.add(code);
		}
		hql.append(" and status=0 ");
		return baseDao.get(hql.toString().replaceFirst("and", "where"), param);
	}

	

}
