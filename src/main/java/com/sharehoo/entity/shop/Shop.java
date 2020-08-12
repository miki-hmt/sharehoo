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
 * miki 2017.06.24	用户店铺表实体对象模型
 */

@Entity
@Table(name="t_shop")
public class Shop implements Serializable{
	private int id;
	private User user;			//店主
	private int douNum;			//店主下载豆
	private String shop_name;	//店铺名称
	private Level level;		//店铺等级（黄金店铺，白金店铺....)
	private Date registerTime;	//注册时间....需要激活店铺，不激活无法使用(激活后系统自动赠送5金豆)
	private int downNum = 0;		//店铺资源下载数目
	private int status;			//店铺状态....关闭或使用中(0或1)
	private String face;
	private String tag;			//店铺标签，根据标签分类，查找店铺	2017.07.31	3：53
	private int sourceNum = 0;		//店铺内所拥有资源数
	private int maxNum = 6;			//最大上传资源数目，初始为6
		
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
	@Column(length=11)
	public int getDouNum() {
		return douNum;
	}
	public void setDouNum(int douNum) {
		this.douNum = douNum;
	}
	@Column(length=11)
	public String getShop_name() {
		return shop_name;
	}
	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}
	
	@ManyToOne
	@JoinColumn(name="level_id")
	public Level getLevel() {
		return level;
	}
	public void setLevel(Level level) {
		this.level = level;
	}
	
	public Date getRegisterTime() {
		return registerTime;
	}
	public void setRegisterTime(Date registerTime) {
		this.registerTime = registerTime;
	}
	@Column(length=11)
	public int getDownNum() {
		return downNum;
	}
	public void setDownNum(int downNum) {
		this.downNum = downNum;
	}
	@Column(length=11)
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Column(length=40)
	public String getFace() {
		return face;
	}
	public void setFace(String face) {
		this.face = face;
	}
	@Column(length=40)
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	@Column(length=11)
	public int getSourceNum() {
		return sourceNum;
	}
	public void setSourceNum(int sourceNum) {
		this.sourceNum = sourceNum;
	}
	@Column(length=11)
	public int getMaxNum() {
		return maxNum;
	}
	public void setMaxNum(int maxNum) {
		this.maxNum = maxNum;
	}
	
}
