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

import com.sharehoo.entity.forum.User;

/*
 * 2017.08.09	店铺关注功能的实现	miki
 */

@Entity
@Table(name="t_focus")
public class Focus implements Serializable{
	private int id;
	private Shop shop;	//关注店铺
	private User user;	//当前执行关注操作的人
	private String type;	//执行类型,
	private Date focus_time;
	
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
	@Column(length=50)
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Date getFocus_time() {
		return focus_time;
	}
	public void setFocus_time(Date focus_time) {
		this.focus_time = focus_time;
	}
	
	
	
	
}
