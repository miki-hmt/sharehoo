package com.sharehoo.entity.shop;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/*
 * 2017.08.13 miki category子目录类创建
 */

import org.hibernate.annotations.GenericGenerator;
@Entity
@Table(name="t_sonMenu")
public class Menu implements Serializable{
	private int id;
	private Category category;
	private String name;
	
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
	@JoinColumn(name="category_id")
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	@Column(length=100)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
