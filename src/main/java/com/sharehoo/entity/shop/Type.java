package com.sharehoo.entity.shop;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/*
 * 2017.08.14 miki	资源类型大类
 */
@Entity
@Table(name="t_type")
public class Type implements Serializable{
	private int id;		
	private String name;	//大类名字
	
	
	@Id
	@GeneratedValue(generator="_native") //设置自动增长
	@GenericGenerator(name="_native",strategy="native")
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column(length=20)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
