package com.sharehoo.service.impl.forum;

import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;

import com.sharehoo.dao.BaseDAO;
import com.sharehoo.dao.impl.forum.ArticleDao;
import com.sharehoo.entity.forum.Article;
import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.service.forum.ArticleService;
import com.sharehoo.util.forum.StringUtil;

/**
 * 
 * @author miki
 * date:2017.04.25 21:03:21
 * 逻辑层方法功能实现
 *
 */

@Transactional
@Service("articleService")
public class ArticleServiceImpl implements ArticleService {
	
	@Resource
	private ArticleDao baseDAO;
	
	@Override
	public void saveArticle(Article article) {
		// TODO Auto-generated method stub
		baseDAO.merge(article);
	}

	@Override
	public void deleteArticle(Article article) {
		// TODO Auto-generated method stub
		baseDAO.delete(article);
	}

	@Override
	public Long getArticleCount(Article s_article) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select count(*) from Article a");
		
		if (s_article!=null) {
			if (StringUtil.isNotEmpty(s_article.getTitle())) {
				hql.append(" and a.title like ?");
				param.add("%"+s_article.getTitle()+"%");
			}
			if (s_article.getUser()!=null) {
				if (StringUtil.isNotEmpty(s_article.getUser().getNickName())) {
					hql.append(" and a.user.nickName like ?");
					param.add("%"+s_article.getUser().getNickName()+"%");
				}
			}
			if (StringUtil.isNotEmpty(s_article.getContent())) {
				hql.append(" and a.content like ?");
				param.add("%"+s_article.getContent()+"%");
			}
			if (s_article.getImage()!=null) {
				hql.append(" and a.image=?");
				param.add(s_article.getImage());
			}
			if (s_article.getTime()!=null) {
				hql.append(" and a.time=?");
				param.add(s_article.getTime());
			}
			if (s_article.getEditer()!=null) {				
					hql.append(" and a.editer=?");
					param.add(s_article.getEditer());
			}
			if (s_article.getCount()>0) {
				hql.append(" and a.count=?");
				param.add(s_article.getCount());
			}
			if (s_article.getCount1()>0) {
				hql.append(" and a.count1=?");
				param.add(s_article.getCount1());
			}
			if (s_article.getNotice()!=null) {
				hql.append(" and a.notice=?");
				param.add(s_article.getNotice());
			}
			if (s_article.getKeywords()!=null) {
				hql.append(" and a.keywords=?");
				param.add(s_article.getKeywords());
			}
		}
		return baseDAO.count(hql.toString().replaceFirst("and", "where"), param);
	}
		

	@Override
	public Article getArticleById(int articleId) {
		// TODO Auto-generated method stub
		return baseDAO.get(Article.class, articleId);
	}

	@Override
	public List<Article> findArticleList(Article s_article, PageBean pageBean) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Article a");
		if (s_article!=null) {
			if (StringUtil.isNotEmpty(s_article.getTitle())) {
				hql.append(" and a.title like ?");
				param.add("%"+s_article.getTitle()+"%");
			}
			if (s_article.getUser()!=null) {
				if (StringUtil.isNotEmpty(s_article.getUser().getNickName())) {
					hql.append(" and a.user.nickName like ?");
					param.add("%"+s_article.getUser().getNickName()+"%");
				}
			}
			if (StringUtil.isNotEmpty(s_article.getContent())) {
				hql.append(" and a.content like ?");
				param.add("%"+s_article.getContent()+"%");
			}
			if (s_article.getImage()!=null) {
				hql.append(" and a.image=?");
				param.add(s_article.getImage());
			}
			if (s_article.getTime()!=null) {
				hql.append(" and a.time=?");
				param.add(s_article.getTime());
			}
			if (s_article.getEditer()!=null) {				
					hql.append(" and a.editer=?");
					param.add(s_article.getEditer());
			}
			if (s_article.getCount()>0) {
				hql.append(" and a.count=?");
				param.add(s_article.getCount());
			}
			if (s_article.getCount1()>0) {
				hql.append(" and a.count1=?");
				param.add(s_article.getCount1());
			}
			if (s_article.getNotice()!=null) {
				hql.append(" and a.notice=?");
				param.add(s_article.getNotice());
			}
			if (s_article.getKeywords()!=null) {
				hql.append(" and a.keywords=?");
				param.add(s_article.getKeywords());
			}
		}
		if (pageBean!=null) {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
		}
	}

	@Override
	public List<Article> getArticleListByUserId(int userId,PageBean pageBean) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Article");
		if (userId>0) {
			hql.append(" and userId=?");
			param.add(userId);
		}
		hql.append(" order by time desc");
		if (pageBean!=null) {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
		}
	}

	@Override
	public Long getArticleCountByUserId(int userId) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select count(*) from Article");
		if(userId>0){
			hql.append(" and userId=?");
			param.add(userId);	
		}
		return baseDAO.count(hql.toString().replaceFirst("and", "where"), param);
	}

	@Override
	public List<Article> findListByCount(int userId,PageBean pageBean) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer(" from Article as article");
		if(userId>0){
			hql.append(" and userId=?");
			param.add(userId);
		}
		hql.append(" order by article.count");
		if (pageBean!=null) {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
		}
	}

	@Override
	public List<Article> findListByNotice(int userId,PageBean pageBean) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer(" from Article");
		if(userId>0){
			hql.append(" and userId=?");
			param.add(userId);
		}
		hql.append(" and notice like '%recommendArticles%'");
		if (pageBean!=null) {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
		}
	}

	@Override
	public List<Article> getHotByUserId(int userId) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		String hql = "from Article as article where article.user.id=? order by article.count desc";
		
		param.add(userId);
		return baseDAO.findTopN(hql, param, 10);
	}
	
	/*
	 * (non-Javadoc)
	 * @see jiabin.service.ArticleService#getRecommendsByUserId(int)
	 * miki
	 * 2017.05.27
	 * 根据用户id得到推荐文章
	 */
	
	@Override
	public List<Article> getRecommendsByUserId(int userId) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		String hql = "from Article as article where article.notice like '%recommendArticles%' and article.user.id=? order by article.time desc";
		param.add(userId);
		return baseDAO.findTopN(hql, param, 10);
	}

	@Override
	public Article getBefore(int articleId, int userId) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		String hql = "from Article as article where article.id< ? and article.user.id= ? order by article.id desc";
		param.add(articleId);
		param.add(userId);
		List<Article> list = baseDAO.find(hql, param);
		
		if(list.size()==0){
			return null;
		}
		Article article = list.get(0);
		return article;
	}

	@Override
	public Article getAfter(int articleId, int userId) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		String hql = "from Article as article where article.id>? and article.user.id=? order by article.id asc";
		param.add(articleId);
		param.add(userId);
		List<Article> list = baseDAO.find(hql, param);
		if(list.size()==0){
			return null;
		}
		Article article = list.get(0);
		return article;
	}

}
