package com.sharehoo.service.forum;
import java.util.List;

import com.sharehoo.entity.forum.Article;
import com.sharehoo.entity.forum.PageBean;

/**
 * 
 * @author miki
 * date:2017.04.25
 *文章接口实现
 */
public interface ArticleService {
	
	public void saveArticle(Article article);
	
	public void deleteArticle(Article article);
	
	/*
	 * 得到文章数量
	 */
	public Long getArticleCount(Article s_article);
	
	/*
	 * 查找文章
	 */
	public Article getArticleById(int articleId);
	
	/*
	 * 后台得到所有文章列表
	 */
	public List<Article> findArticleList(Article s_article,PageBean pageBean); 
	
	/*
	 * miki
	 * date:2017.05.17
	 * 根据用户id得到文章列表
	 */
	public List<Article> getArticleListByUserId(int userId,PageBean pageBean);
	
	public List<Article> getArticleListByUserId(int userId,String category,PageBean pageBean);
	
	/*
	 * miki
	 * 2017.05.24
	 * 根据用户id得到用户总博客数目
	 */
	public Long getArticleCountByUserId(int userId);
	public Long getArticleCountByUserId(int userId,String type);
	
	/*
	 * miki
	 * 2017.05.25
	 * 根据访问量多少得到用户博客数目(放弃使用)
	 */
	public List<Article> findListByCount(int userId,PageBean pageBean);
	
	/*
	 * miki
	 * 2017.05.26
	 * 根据访问量多少得到用户博客数目
	 */
	public List<Article> getHotByUserId(int userId);
	
	
	/*
	 * miki
	 * 2017.05.26
	 * 根据是否推荐得到用户博客列表
	 */
	public List<Article> getRecommendsByUserId(int userId);
	
	public List<Article> findListByNotice(int userId,PageBean pageBean);
	
	/*
	 * miik
	 * 2017.06.03
	 * 根据id得到文章的下一篇
	 */
	public Article getBefore(int articleId,int userId);
	
	public Article getAfter(int articleId,int userId);
}
