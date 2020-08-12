package com.sharehoo.entity.shop;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.sharehoo.entity.forum.Article;
import com.sharehoo.entity.forum.User;


/*
 * 2017.08.09	店铺关收藏功能的实现	miki
 */

@Entity
@Table(name="t_collect")
public class Collect implements Serializable{
	private int id;
	private Shop shop;	//收藏店铺
	private User user;	//当前执行关注操作的人
	private Source source;	//收藏文章
	private Article article;	//收藏资源
	private String url;			//对应的链接
	private Date collect_time;
	
	
	public Collect() {
			
		}
	
	public Collect(Shop shop,User user,Source source,Article article,String url,Date collect_time) {
		this.user = user;
		this.shop = shop;
		this.source = source;
		this.article = article;
		this.url = url;
		this.collect_time = collect_time;
	}
	
	@Id
	@GeneratedValue(generator="_native") //设置自动增长
	@GenericGenerator(name="_native",strategy="native")
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@ManyToOne
	@JoinColumn(name="shop_id")
	public Shop getShop() {
		return shop;
	}
	public void setShop(Shop shop) {
		this.shop = shop;
	}
	
	@ManyToOne
	@JoinColumn(name="user_id")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	@ManyToOne
	@JoinColumn(name="source_id")
	public Source getSource() {
		return source;
	}
	public void setSource(Source source) {
		this.source = source;
	}
	
	@ManyToOne
	@JoinColumn(name="article_id")
	public Article getArticle() {
		return article;
	}
	public void setArticle(Article article) {
		this.article = article;
	}
	
	@Column(length=150)
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Date getCollect_time() {
		return collect_time;
	}
	public void setCollect_time(Date collect_time) {
		this.collect_time = collect_time;
	}
	
	
	
}
