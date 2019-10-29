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
@Table(name="t_search")
public class Search implements Serializable{
	
	private int id;
	private Category category;
	private String en_key;
	private String ch_key;
	private String keyword;
	private Type type;
	private Date search_time;
	private Menu menu;
	
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
	@JoinColumn(name="cate_id")
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	
	@Column(length=100)
	public String getEn_key() {
		return en_key;
	}
	public void setEn_key(String en_key) {
		this.en_key = en_key;
	}
	@Column(length=100)
	public String getCh_key() {
		return ch_key;
	}
	public void setCh_key(String ch_key) {
		this.ch_key = ch_key;
	}
	@Column(length=100)
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public Date getSearch_time() {
		return search_time;
	}
	public void setSearch_time(Date search_time) {
		this.search_time = search_time;
	}
	@ManyToOne
	@JoinColumn(name="type_id")
	public Type getType() {
		return type;
	}
	public void setType(Type type) {
		this.type = type;
	}
	@ManyToOne
	@JoinColumn(name="smenu_id")
	public Menu getMenu() {
		return menu;
	}
	public void setMenu(Menu menu) {
		this.menu = menu;
	}
		
}
