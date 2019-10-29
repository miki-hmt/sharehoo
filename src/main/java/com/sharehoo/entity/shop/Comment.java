package com.sharehoo.entity.shop;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;

import com.sharehoo.entity.forum.User;


/*
 * miki 2017.06.24	店铺评论表实体对象模型
 */

@Entity
@Table(name="t_comment")
public class Comment implements Serializable{
	private int id;			//评论Id
	private User user;		//评论人
	private Shop shop;		//店铺
	private String content; //内容
	private Date publishTime;//评论时间
	private int sacrify_score;//满意度......分为3部分，作品完整度4分，用户满意度3分，实用性3分，满分10分，下载之后才能评论
	private Source source;
	
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
	@JoinColumn(name="user_id")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	@ManyToOne
	@JoinColumn(name="shop_id")
	public Shop getShop() {
		return shop;
	}
	public void setShop(Shop shop) {
		this.shop = shop;
	}
	
	@Lob
	@Column(columnDefinition="TEXT")
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getPublishTime() {
		return publishTime;
	}
	public void setPublishTime(Date publishTime) {
		this.publishTime = publishTime;
	}
	@Column(length=2)
	public int getSacrify_score() {
		return sacrify_score;
	}
	public void setSacrify_score(int sacrify_score) {
		this.sacrify_score = sacrify_score;
	}
	@ManyToOne
	@JoinColumn(name="source_id")
	public Source getSource() {
		return source;
	}
	public void setSource(Source source) {
		this.source = source;
	}
	
	
	
}
