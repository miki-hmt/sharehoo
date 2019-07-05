package com.sharehoo.entity.shop;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/*
 * 2017.08/17 miki 首页banner新闻图片
 */

@Entity
@Table(name="t_newsBanner")
public class NewsBanner implements Serializable{
	private int id;
	private String news_name;
	private Date news_time;
	private String news_img;
	private String url;
	private String notice;
	private String type;			//分三类，下载社区banner，论坛社区banner，blog社区banner
	
	
	@Id
	@GeneratedValue(generator="_native") //设置自动增长
	@GenericGenerator(name="_native",strategy="native")
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column(length=100)
	public String getNews_name() {
		return news_name;
	}
	public void setNews_name(String news_name) {
		this.news_name = news_name;
	}

	public Date getNews_time() {
		return news_time;
	}
	public void setNews_time(Date news_time) {
		this.news_time = news_time;
	}
	@Column(length=150)
	public String getNews_img() {
		return news_img;
	}
	public void setNews_img(String news_img) {
		this.news_img = news_img;
	}
	
	@Column(length=200)
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	@Column(length=100)
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	
	@Column(length=50)
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
}
