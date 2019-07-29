package com.sharehoo.entity.shop;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

//2017.10.26	cdk兑换码
//2019.07.29	miki	使用JPA注解配置映射关系
@Entity
@Table(name="t_cdk")
public class Cdk implements Serializable{
	
	private int id;
	private String code;
	private int status=0;
	private int money;
	private int douNum;

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
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	@Column(length=2)
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public int getDouNum() {
		return douNum;
	}
	public void setDouNum(int douNum) {
		this.douNum = douNum;
	}
	
	
	
	
}
