package com.sharehoo.service.impl.forum;

import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharehoo.dao.BaseDAO;
import com.sharehoo.dao.impl.BaseDAOImpl;
import com.sharehoo.dao.impl.forum.NewsBannerDao;
import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.shop.NewsBanner;
import com.sharehoo.service.forum.NewsBannerService;
@Transactional
@Service("newsBannerService")

public class NewsBannerServiceImpl implements NewsBannerService {
	
	@Autowired
	private NewsBannerDao baseDAO;
	@Override
	public void saveNewsBanner(NewsBanner newsBanner) {
		// TODO Auto-generated method stub
		baseDAO.merge(newsBanner);
	}

	@Override
	public Long getMessageCount(NewsBanner newsBanner) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteMessage(NewsBanner newsBanner) {
		// TODO Auto-generated method stub
		baseDAO.delete(newsBanner);
	}

	@Override
	public NewsBanner getNewsBannerById(int newsBannerId) {
		// TODO Auto-generated method stub
		return baseDAO.get(NewsBanner.class, newsBannerId);
	}

	@Override
	public List<NewsBanner> findNewsBannerListByType() {
		// TODO Auto-generated method stub
		String hql = "from NewsBanner as nb where nb.type like '%download%' and nb.notice like '%1%' order by nb.news_time desc";
		
		return baseDAO.findTopN(hql, null, 5);
	}

	@Override
	public List<NewsBanner> getAllBanners(PageBean pageBean) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from NewsBanner");
		hql.append(" order by news_time desc");
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
		StringBuffer hql=new StringBuffer("select count(*) from NewsBanner");
		return baseDAO.count(hql.toString().replaceFirst("and", "where"), param);
	}
	
	//2017.08.26 miki  �����Ƽ����ͼ���б�
	@Override
	public List<NewsBanner> findRecommendBannerListByType() {
		// TODO Auto-generated method stub
		String hql = "from NewsBanner as nb where nb.type like '%recommend%' and nb.notice like '%1%' order by nb.news_time desc";
		
		return baseDAO.findTopN(hql, null, 5);
	}

	@Override
	public List<NewsBanner> findSectionTopicBannerListByType() {
		// TODO Auto-generated method stub
		String hql = "from NewsBanner as nb where nb.type like '%topicBanner%' and nb.notice like '%1%' order by nb.news_time desc";
		
		return baseDAO.findTopN(hql, null, 5);
	}

}
