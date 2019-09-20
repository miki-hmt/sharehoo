package com.sharehoo.service.forum;

import java.util.List;

import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.shop.Comment;

public interface CommentService {
	
	/*
	 * 2017.07.11 miki 店铺评论接口实现
	 */
	public void save(Comment comment);
	
	public void delete(Comment commemt);
	
	public void getCommemtById(int id);
	
	public Long getCountByShopId(int shopId);
	
	public List<Comment> getCommentsByShopId(int shopId,PageBean pageBean);
	/*
	 * 2017.08.08 miki 验证用户是否二次评论
	 */
	public Comment getCommentByUserSourceId(int sourceId,int userId);
	/*
	 * 2017.08.08 miki 根据资源id，得到评论列表
	 */
	public List<Comment> getCommentsBySourceId(int sourceId,PageBean pageBean);
	
	/*
	 * 2017.08.08 miki 根据资源id，得到评论数量
	 */
	public Long getCommentCountBysourceId(int sourceId);
	
	public Long getCommentTotalScoreBysourceId(int sourceId);
	
	/*
	 * 2017.08.11 miki 根据shopId，得到评分大于等于四的数量
	 */
	public Long getGoodCommentCountByshopId(int shopId);
}
