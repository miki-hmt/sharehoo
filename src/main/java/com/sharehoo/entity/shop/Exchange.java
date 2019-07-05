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

//2017.10.26	miki 充值中心实体类

@Entity
@Table(name="t_exchange")
public class Exchange implements Serializable{
	
	private int id;
	private User user;
	private Date ec_time;
	private String code;
	private int dou;
	private int money;
	private int status=0;
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
	
	public Date getEc_time() {
		return ec_time;
	}
	public void setEc_time(Date ec_time) {
		this.ec_time = ec_time;
	}
	@Column(length=100)
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	@Column(length=20)
	public int getDou() {
		return dou;
	}
	public void setDou(int dou) {
		this.dou = dou;
	}
	@Column(length=10)
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
}
	
	
	

