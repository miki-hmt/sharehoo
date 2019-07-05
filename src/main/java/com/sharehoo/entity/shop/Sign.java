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

@Entity
@Table(name="t_sign")
public class Sign implements Serializable{
	private int id;
	private Shop shop;
	private int sign_continue;	//连续签到天数	2018.02.02
	private int sign_total;		//签到总天数
	private String notice;		//
	private Date sign_last;		//最近签到日期
	private int dou_total;		//总签到获得豆数
	
	
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
	@Column(length=11)
	public int getSign_continue() {
		return sign_continue;
	}
	public void setSign_continue(int sign_continue) {
		this.sign_continue = sign_continue;
	}
	@Column(length=11)
	public int getSign_total() {
		return sign_total;
	}
	public void setSign_total(int sign_total) {
		this.sign_total = sign_total;
	}
	@Column(length=50)
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	public Date getSign_last() {
		return sign_last;
	}
	public void setSign_last(Date sign_last) {
		this.sign_last = sign_last;
	}
	@Column(length=11)
	public int getDou_total() {
		return dou_total;
	}
	public void setDou_total(int dou_total) {
		this.dou_total = dou_total;
	}
	
	
	
	
}
