package com.sharehoo.service.forum;

import java.util.List;

import com.sharehoo.entity.forum.Critique;
import com.sharehoo.entity.forum.PageBean;

/**
 * 
 * @author miki
 * date:2017.05.28
 *评论接口实现
 */
public interface CritiqueService {
	
	//用户留言
	public void save(Critique critique);
	
	//删除留言
	public void delete(Critique critique);
	/*
	 * miik 2017.05.29得到用户留言列表，前台显示
	 */
	public List<Critique> getListByUserId(int userId);
	
	/* Miik
	 * 2017.05.29 得到用户所有留言列表，前台显示
	 */
	public List<Critique> getAllListByUserId(int userId,PageBean pageBean);	
	/*
	 * miik
	 * 2017.05.29 得到用户相册留言列表，前台显示
	 */	
	public List<Critique> getArticleListByUserId(int userId,PageBean pageBean);	
	/* miki
	 * 2017.05.30  统计留言数目
	 */
	public Long getCountByUserId(int userId);
	/*
	 * miki
	 * 2017.05.31  根据id得到评论
	 */
	public Critique getCritiqueById(int id);
	/* miki
	 * 2017.06.03   根据文章Id得到评论列表
	 */
	public List<Critique> getArticleCritiquesByAid(int articleId);
	/*
	 * miki  2017.06.04	根据用户id得到个人相册最新评论列表
	 */
	public List<Critique> getPhListByUserId(int userId);
	
	public List<Critique> getReplyListByAid(int aid);
	
	public Long getReplyCountByAid(int aid);
}
