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
 * miki 2017.06.24	用户操作日志表实体对象模型
 */

@Entity
@Table(name="t_log")
public class Log implements Serializable{
	private int id;					//
	private User user;				//用户操作日志
	private Date time;				//操作时间
	private String ip;				//登录ip
	private String up_operator;		//上传操作.......标识符为"1"
	private String down_operator;	//下载操作.......标识符为"2"
	private String operation_log;	//用户行为.......记录用户点击链接
	private String type;
	
	private String address;
	private Shop shop;
	
	public Log() {
		
	}
	
	public Log(String ip,Date time,String type,String operation_log,User user,Shop shop,String address) {
		// TODO Auto-generated constructor stub
		this.ip = ip;
		this.time = time;
		this.type = type;
		this.operation_log = operation_log;
		this.user = user;
		this.shop = shop;
		this.address = address;
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
	@Column(length=100)
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	
	@Column(length=10)
	public String getUp_operator() {
		return up_operator;
	}
	public void setUp_operator(String up_operator) {
		this.up_operator = up_operator;
	}
	@Column(length=10)
	public String getDown_operator() {
		return down_operator;
	}
	public void setDown_operator(String down_operator) {
		this.down_operator = down_operator;
	}
	
	@Column(length=50)
	public String getOperation_log() {
		return operation_log;
	}
	public void setOperation_log(String operation_log) {
		this.operation_log = operation_log;
	}
	@Column(length=40)
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Column(length=50)
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@ManyToOne
	@JoinColumn(name="shop_id")
	public Shop getShop() {
		return shop;
	}
	public void setShop(Shop shop) {
		this.shop = shop;
	}
	
	
	
	
}
