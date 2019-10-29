package com.sharehoo.service;

import java.util.List;

import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.shop.Message;

public interface MessageService {
	/**
	 * 
	 * @param notice添加公告
	 */
	public void saveMessage(Message message);
	
	public void save(Message message);
	
	
	public Long getMessageCount();
	/**
	 * 删除私信
	 */
	public void deleteMessage(Message message);
	

	/**
	 * 查找私信
	 */
	public Message getMessageById(int messageId);
	
	/**
	 * 得到私信列表
	 */
	public List<Message> findNoticeList(PageBean pageBean);
	
	/**
	 * 2017.10.26 店铺举报信息列表
	 */
	public List<Message> getAdminMesList(int shopId);
	
}
