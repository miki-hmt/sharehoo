package com.sharehoo.service.impl.forum;

import java.util.LinkedList;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sharehoo.dao.impl.forum.CritiqueDao;
import com.sharehoo.entity.forum.Critique;
import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.service.forum.CritiqueService;

/**
 * 
 * @author miki
 * date:2017.05.28 23:40:21
 * 逻辑层方法功能实现
 *
 */
@Transactional
@Service("critiqueService")
public class CritiqueServiceImpl implements CritiqueService {
	
	@Autowired
	private CritiqueDao baseDAO;
	
	@Override
	public void save(Critique critique) {
		// TODO Auto-generated method stub
		baseDAO.save(critique);
	}

	@Override
	public void delete(Critique critique) {
		// TODO Auto-generated method stub
		baseDAO.delete(critique);
	}

	@Override
	public List<Critique> getListByUserId(int userId) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		String hql = "from Critique as critique where critique.notice like '1' and critique.user.id=? order by critique.time desc";
		param.add(userId);
		return baseDAO.findTopN(hql, param, 16);
	}

	@Override
	public List<Critique> getAllListByUserId(int userId, PageBean pageBean) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer(" from Critique");
		if(userId>0){
			hql.append(" and userId=?");
			param.add(userId);
		}
		hql.append(" and notice like '1' order by time desc");
		if (pageBean!=null) {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
		}
	}

	@Override
	public List<Critique> getArticleListByUserId(int userId, PageBean pageBean) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Long getCountByUserId(int userId) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select count(*) from Critique");
		if(userId>0){
			hql.append(" and userId=?");
			param.add(userId);
		}
		hql.append(" and notice like '1' ");
		return baseDAO.count(hql.toString().replaceFirst("and", "where"), param);
	}

	@Override
	public Critique getCritiqueById(int id) {
		// TODO Auto-generated method stub
		return baseDAO.get(Critique.class, id);
	}
	
	/*
	 * miki
	 * 2017.06.03
	 * 根据文章id得到评论列表
	 */
	@Override
	public List<Critique> getArticleCritiquesByAid(int articleId) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		String hql = "from Critique as critique where critique.notice like ? and critique.article.id=? order by critique.time desc";
		param.add("2");
		param.add(articleId);
		return baseDAO.findTopN(hql, param, 10);
	}

	@Override
	public List<Critique> getPhListByUserId(int userId) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		String hql="from Critique as critique where critique.notice like ? and critique.user.id=? order by critique.time desc";
		param.add("3");
		param.add(userId);
		
		return baseDAO.findTopN(hql, param, 10);
	}

	@Override
	public List<Critique> getReplyListByAid(int aid) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		String hql="from Critique as critique where critique.notice like ? and critique.article.id=? order by critique.time desc";
		param.add("4");
		param.add(aid);

		return baseDAO.findTopN(hql, param, 10);
	}

	@Override
	public Long getReplyCountByAid(int aid) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select count(*) from Critique");
		if(aid>0){
			hql.append(" and article_id=?");
			param.add(aid);
		}
		hql.append(" and notice like '2' ");
		return baseDAO.count(hql.toString().replaceFirst("and", "where"), param);
	}

}
