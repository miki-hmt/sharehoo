package com.sharehoo.entity.forum;

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
//2019.07.29	miki	使用JPA注解配置映射关系
@Entity
@Table(name="t_reply")
public class Reply implements Serializable{

	private int id;				//回复编号
	private Topic topic;		//所属主贴
	private User user;			//回复人
	private int good;		//对我有用,点击自动加1
	private String title;
	private int bad;        //丢个板砖，点击自动加1
	private String content;	//跟帖内容
	private Date publishTime;	//跟帖时间
	private Date modifyTime;	//修改时间
	
	private int status=0;	//回帖状态，默认为0，即未读状态		2017.05.29	miki
	
	private User sonUser;
	
	@Id
	@GeneratedValue(generator="_native")
	@GenericGenerator(name="_native",strategy="native")
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@ManyToOne
	@JoinColumn(name="topicId")
	public Topic getTopic() {
		return topic;
	}
	public void setTopic(Topic topic) {
		this.topic = topic;
	}
	
	@ManyToOne
	@JoinColumn(name="userId")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	public Date getPublishTime() {
		return publishTime;
	}
	public void setPublishTime(Date publishTime) {
		this.publishTime = publishTime;
	}
	
	public Date getModifyTime() {
		return modifyTime;
	}
	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}
	
	@Column(length=255)
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	
	@Column(length=255)
	public int getBad() {
		return bad;
	}
	public void setBad(int bad) {
		this.bad = bad;
	}
	
	
	/*
	@Column(length=100)
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	*/
	
	@Lob
	@Column(columnDefinition="TEXT")
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Column(length=100)
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	@ManyToOne
	@JoinColumn(name="son_id")
	public User getSonUser() {
		return sonUser;
	}
	public void setSonUser(User sonUser) {
		this.sonUser = sonUser;
	}
	
	
	
}
