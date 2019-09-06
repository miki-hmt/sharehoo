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
import javax.xml.crypto.Data;

import org.hibernate.annotations.GenericGenerator;

import com.sharehoo.entity.forum.User;


/*
 * 2017.08.09	店铺虎豆进账记录功能的实现	miki
 */

@Entity
@Table(name="t_operate")
public class Operate implements Serializable{
	private int id;
	private String type;
	private Shop shop;	//操作店铺
	private User user;	//当前执行下载，上传操作的人
	private Source source;	//操作资源对象
	private String notice;			//对应的链接
	
	private Date operate_time;
	
	public Operate() {
		// TODO Auto-generated constructor stub
	}
	
	public Operate(String type,Shop shop,User user,Source source,String notice,Date operate_time) {
		// TODO Auto-generated constructor stub
		this.type = type;
		this.shop = shop;
		this.user = user;
		this.source = source;
		this.notice = notice;
		this.operate_time = operate_time;
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
	@Column(length=50)
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
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
	
	@Column(length=100)
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	public Date getOperate_time() {
		return operate_time;
	}
	public void setOperate_time(Date operate_time) {
		this.operate_time = operate_time;
	}
}
