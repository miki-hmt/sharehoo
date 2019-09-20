package com.sharehoo.service.impl.shop;

import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;

import com.sharehoo.dao.BaseDAO;
import com.sharehoo.dao.shop.CommentDao;
import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.shop.Comment;
import com.sharehoo.service.forum.CommentService;
@Transactional
@Service("commentService")
public class CommentServiceImpl implements CommentService {
	
	@Resource
	private CommentDao baseDAO;
	
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
		List<Object> params = new LinkedList<Object>();
		String hql = "from Comment as comment where comment.user.id=? and comment.source.id=? ";
		params.add(userId);
		params.add(sourceId);
		List<Comment> findTopN = baseDAO.findTopN(hql, params, 1);
		if(findTopN.size()==0){
			return null;
		}
		Comment comment = findTopN.get(0);
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
	
	/**
	 * 2019.09.20 miki 计算某个资源得所有评分总和
	 */
	@Override
	public Long getCommentTotalScoreBysourceId(int sourceId) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select sum(sacrify_score) from Comment");
		if(sourceId>0){
			hql.append(" and source_id=?");
			param.add(sourceId);
		}
		return baseDAO.count(hql.toString().replaceFirst("and", "where"), param);
	}
}