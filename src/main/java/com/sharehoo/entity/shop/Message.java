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
 * 2017.08.17 miki 站内新闻
 */
@Entity
@Table(name="t_message")
public class Message implements Serializable{
	private int id;
	private Shop shop;	//，发送者，接受者（站长与店铺私信）
	private User user;	
	private Date time;	
	private String type;	//站内私信类型，回复，或者发送
	private String content;		//私信内容
	private String name;	//
	private int status=0;	//私信状态，可读则为0，已读为1
	private Source source;
	
	public Message() {
		
	}
	
	public Message(Shop shop,User user,Date time,String type,String content,String name,Source source) {
		this.shop = shop;
		this.user = user;
		this.time = time;
		this.type = type;
		this.content = content;
		this.name = name;
		this.source = source;
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
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	@Column(length=20)
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}

	@Lob
	@Column(columnDefinition="TEXT")
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	@Column(length=50)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(length=11)
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
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
