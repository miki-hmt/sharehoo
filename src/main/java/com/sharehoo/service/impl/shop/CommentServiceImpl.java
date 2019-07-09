package com.sharehoo.service.impl.shop;

import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;

import com.sharehoo.dao.BaseDAO;
import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.shop.Comment;
import com.sharehoo.service.forum.CommentService;

@Service("commentService")
public class CommentServiceImpl implements CommentService {
	
	@Resource 
	private SessionFactory sessionFactory;
	
	@Resource
	private BaseDAO<Comment> baseDAO;
	
	@Override
	public void save(Comment comment) {
		// TODO Auto-generated method stub
		baseDAO.merge(comment);
	}

	@Override
	public void delete(Comment commemt) {
		// TODO Auto-generated method stub
		baseDAO.delete(commemt);
	}

	@Override
	public void getCommemtById(int id) {
		// TODO Auto-generated method stub
		baseDAO.get(Comment.class, id);
	}

	@Override
	public Long getCountByShopId(int shopId) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select count(*) from Comment");
		if(shopId>0){
			hql.append(" and shop_id=?");
			param.add(shopId);
		}
		return baseDAO.count(hql.toString().replaceFirst("and", "where"), param);
	}

	@Override
	public List<Comment> getCommentsByShopId(int shopId, PageBean pageBean) {
		// TODO Auto-generated method stub
		return null;
	}
	
	/*
	 * 2017.08.08 miki 限制用户对一个资源评论一次
	 * 通过userId和sourceId得到comment表里的评论信息，若不为空，则存在评论
	 */
	@Override
	public Comment getCommentByUserSourceId(int sourceId,int userId) {
		// TODO Auto-generated method stub
		String hql = "from Comment as comment where comment.user.id=:userId and comment.source.id=:sourceId ";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger("userId", userId);
		query.setInteger("sourceId", sourceId);
		query.setFirstResult(0);
		query.setMaxResults(1);
		if(query.list().size()==0){
			return null;
		}
		Comment comment = (Comment) query.list().get(0);
		return comment;

	}
	
	/*
	 * 2017.08.08 miki 得到某一资源的用户评论列表
	 */
	@Override
	public List<Comment> getCommentsBySourceId(int sourceId, PageBean pageBean) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Comment");
		if(sourceId>0){
			hql.append(" and source_id=?");
			param.add(sourceId);
		}
		hql.append(" order by publishTime desc");
		if (pageBean!=null) {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
		}
	}
	
	/*
	 * 2017.08.12 miki 得到某个资源的好评数量
	 */
	@Override
	public Long getCommentCountBysourceId(int sourceId) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select count(*) from Comment");
		if(sourceId>0){
			hql.append(" and source_id=?");
			param.add(sourceId);
		}
		return baseDAO.count(hql.toString().replaceFirst("and", "where"), param);
	}
	
	/*
	 * 2017.08.12 miki 得到好评数量
	 */
	@Override
	public Long getGoodCommentCountByshopId(int shopId) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select count(*) from Comment");
		if(shopId>0){
			hql.append(" and shop_id=?");
			param.add(shopId);
		}
		hql.append(" and sacrify_score > 4");
		return baseDAO.count(hql.toString().replaceFirst("and", "where"), param);
	}
}