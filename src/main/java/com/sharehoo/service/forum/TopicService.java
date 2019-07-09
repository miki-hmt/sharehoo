package com.sharehoo.service.forum;

import java.util.List;

import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.forum.Topic;

public interface TopicService {

	public void saveTopic(Topic topic);
	
	public void deleteTopic(Topic topic);
	
	public List<Topic> findTopicList(Topic s_topic,PageBean pageBean);
	/**
	 * 
	 * @param s_topic查询全部版块的帖子数目
	 * @return
	 */
	public Long getTopicCount(Topic s_topic);
	
	public Topic findTopicById(int topicId);	
	
	public List<Topic> findZdTopicListBySectionId(int sectionId,PageBean pageBean);
	
	public List<Topic> findPtTopicListBySectionId(int sectionId,PageBean pageBean);
			
	public List<Topic> findGoodTopicListBySectionId(int sectionId,PageBean pageBean);
	
	public List<Topic> findNotGoodTopicListBySectionId(int sectionId,PageBean pageBean);
	
	public Long getNoReplyTopicCount(Topic s_topic);
	
	/**
	 * 
	 * @param sectionId 根据版块查询帖子数母
	 * @return
	 */
	public Long getTopicCountBySectionId(int sectionId);

	/**
	 * 
	 * @param sectionId 根据版块查询所有帖子列表
	 * @return
	 * 2017.05.04  
	 * miki
	 */
	public List<Topic> findTopicListBySectionId(int sectionId,PageBean pageBean);
	
	public List<Topic> findGoodTopicList(Topic s_topic,PageBean pageBean);
	/**
	 * 
	 * @param sectionId 根据版块查询精华帖数目
	 * @return
	 */
	public Long getGoodTopicCountBySectionId(int sectionId);
	
	public Long getPtTopicCountBySectionId(int sectionId);
	
	/**
	 * 2017.04.29
	 * 根据用户id查找帖子列表
	 */
	public List<Topic> findTopicListByUserId(int userId,PageBean pageBean);
	

	/**
	 * 2017.05.12
	 * 根据用户id,版块，查找帖子列表
	 */
	public List<Topic> getTopicListByUserId(int userId,PageBean pageBean);
	

	/**
	 * 2017.05.12
	 * 通过userId,sectionId查找帖子数目
	 * @param userId
	 * @return
	 */
	public Long getAnswerCountByUserId(int userId);

	
	/**
	 * 2017.04.29
	 * 通过userId查找帖子数目
	 * @param userId
	 * @return
	 */
	public Long getTopicCountByUserId(int userId);
	
	/*
	 * 2017.11.04 首页通过sectionId得到当前新帖
	 */
	public List<Topic> getNewTopicListBySection(int sectionId);
	
	/*
	 * 2017.11.05 得到最近新帖
	 */
	public List<Topic> getNewsList(int count);
	
	public Topic getTopic(long code);
}
