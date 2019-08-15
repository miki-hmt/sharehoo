package com.sharehoo.service.impl.forum;

import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;

import com.sharehoo.dao.BaseDAO;
import com.sharehoo.dao.impl.forum.MessageDao;
import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.shop.Message;
import com.sharehoo.service.MessageService;
@Service("messageService")
public class MessageServiceImpl implements MessageService {
	
	@Resource
	MessageDao baseDAO;
	@Override
	public void saveMessage(Message message) {
		// TODO Auto-generated method stub
		baseDAO.merge(message);
	}

	@Override
	public Long getMessageCount() {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select count(*) from Message");
		hql.append(" and type like '%send%'");
		return baseDAO.count(hql.toString().replaceFirst("and", "where"), param);
	}

	@Override
	public void deleteMessage(Message message) {
		// TODO Auto-generated method stub
		baseDAO.delete(message);
	}

	@Override
	public Message getMessageById(int messageId) {
		// TODO Auto-generated method stub
		return baseDAO.get(Message.class, messageId);
	}

	@Override
	public List<Message> findNoticeList(PageBean pageBean) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Message");
		hql.append(" and type like '%send%' order by time desc");
		if (pageBean!=null) {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
		}
	}

	@Override
	public void save(Message message) {
		// TODO Auto-generated method stub
		baseDAO.save(message);
	}

	@Override
	public List<Message> getAdminMesList(int shopId) {
		// TODO Auto-generated method stub
		List<Object> param = new LinkedList<Object>();
		String hql = "from Message as message where message.shop.id=:shopId and message.type like '%handle%' and status=0 order by message.time desc";
		param.add(shopId);
		return baseDAO.findTopN(hql, param, 3);
	}

}
