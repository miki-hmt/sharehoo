package com.sharehoo.service.forum;

import java.util.List;

import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.forum.Reply;

public interface ReplyService {

	public Reply findLastReplyByTopicId(int topicId);
	
	public Long getReplyCountByTopicId(int topicId);
	
	public List<Reply> findReplyListByTopicId(int topicId, PageBean pageBean);
	
	public void saveReply(Reply reply);
	
	public void deleteReply(Reply reply);
	
	public Reply findReplyById(int replyId);
	
	/*
	 * miki
	 * 2017.05.29	早上
	 * 根据用户Id得到未读回复列表
	 */
	public List<Reply> unReplyListByUserId(int userId,PageBean pageBean);
	
	/*
	 * miki
	 * 2017.05.29 早上
	 * 根据用户Id得到未读回复信息总数
	 */
	public Long getUnReplyCountByUserId(int userId);
	
	/*
	 * miki 2017.06.14 根据回复id查找子回复列表
	 */
	public List<Reply> getsonListByRid(int rid);
	
	/*
	 * miki 2017.06.14 根据回复id查找回复数目
	 */
	public Long getSonCountByRid(int rid);
	public List<Reply> getSonReplyList(int rid,PageBean pageBean);
}
