package com.sharehoo.service.impl.forum;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharehoo.dao.BaseDAO;
import com.sharehoo.dao.impl.forum.ReplyDao;
import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.forum.Reply;
import com.sharehoo.service.forum.ReplyService;
@Transactional
@Service("replyService")
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyDao baseDAO;
	
	@Override
	public Reply findLastReplyByTopicId(int topicId) {
		List<Reply> replyList=new ArrayList<Reply>();
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Reply");
		if (topicId>0) {
			hql.append(" and topicId = ?");
			param.add(topicId);
		}
		hql.append(" order by publishTime desc");
		replyList=baseDAO.find(hql.toString().replaceFirst("and", "where"),param);
		if (replyList.size()>0) {
			return replyList.get(0);
		} else {
			return null;
		}
	}

	@Override
	public Long getReplyCountByTopicId(int topicId) {
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select count(*) from Reply");
		if (topicId>0) {
			hql.append(" and topicId = ?");
			param.add(topicId);
		}
		hql.append(" and title='' ");
		return baseDAO.count(hql.toString().replaceFirst("and", "where"), param);
	}

	@Override
	public List<Reply> findReplyListByTopicId(int topicId, PageBean pageBean) {
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Reply");
		if (topicId>0) {
			hql.append(" and topicId=?");
			param.add(topicId);
		}
		hql.append(" and title='' ");
		if (pageBean!=null) {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
		}
	}

	@Override
	public void saveReply(Reply reply) {
		// TODO Auto-generated method stub
		baseDAO.merge(reply);
	}

	@Override
	public void deleteReply(Reply reply) {
		// TODO Auto-generated method stub
		baseDAO.delete(reply);
	}

	@Override
	public Reply findReplyById(int replyId) {
		// TODO Auto-generated method stub
		return baseDAO.get(Reply.class, replyId);
	}
	
	
	/*
	 * miki
	 * 2017.05.29
	 * 根据用户Id得到自己参与的评论
	 */
	@Override
	public List<Reply> unReplyListByUserId(int userId, PageBean pageBean) {
		// TODO Auto-generated method stub
		StringBuffer hql=new StringBuffer("from Reply");
		List<Object> param=new LinkedList<Object>();
		if(userId>0){
			hql.append(" and topicId in (select t.id from Topic t where userId=?)");
			param.add(userId);
		}
		hql.append(" and status=0 order by publishTime desc");
		if (pageBean!=null) {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
		}
	}
	
	
	/*
	 * miki
	 * 2017.05.29
	 * 根据用户Id得打未读信息数目
	 */
	
	@Override
	public Long getUnReplyCountByUserId(int userId) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select count(*) from Reply");
		if (userId>0) {
			hql.append(" and topicId in (select t.id from Topic t where userId=?)");
			param.add(userId);
		}
		hql.append(" and status=0");
		return baseDAO.count(hql.toString().replaceFirst("and", "where"), param);
	}

	@Override
	public List<Reply> getsonListByRid(int rid) {
		// TODO Auto-generated method stub
		List<Object> params = new LinkedList<Object>();
		String hql = "from Reply as reply where reply.title like ? order by reply.publishTime desc";
		params.add("%"+rid+"%");
		
		return baseDAO.findTopN(hql, params, 6);
	}

	@Override
	public Long getSonCountByRid(int rid) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select count(*) from Reply");
		if (rid>0) {
			hql.append(" and title like ?");
			param.add("%"+rid+"%");
		}
		return baseDAO.count(hql.toString().replaceFirst("and", "where"), param);
	}

	@Override
	public List<Reply> getSonReplyList(int rid,PageBean pageBean) {
		// TODO Auto-generated method stub
		StringBuffer hql=new StringBuffer("from Reply");
		List<Object> param=new LinkedList<Object>();
		if(rid>0){
			hql.append(" and title like ?");
			param.add("%"+rid+"%");
		}
		hql.append(" order by publishTime desc");		
		if (pageBean!=null) {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
		}
	}

}
