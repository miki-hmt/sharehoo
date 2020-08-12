package com.sharehoo.entity.forum;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

//2019.07.29	miki	使用JPA注解配置映射关系
@Entity
@Table(name="t_software")
public class Soft implements Serializable{
	private int id;
	private String soname;	
	private String logo;
	private SoftSection softSection; //对应表中的soSectionId
	private String size;
	private String language;
	private String forSystem;
	private String maker;
	private String description;
	private String downAdress;
	private Date publishDate;
	
	/*
	 * 2017.05.13
	 * miki
	 * 添加四个属性：使得页面更加完善
	 */
	private int good=0; //是否为首页推荐软件
	private int hot=0; //是否为热门软件
	private int count=0; //下载量
	private String keyword; //关键字
	
	
	@Id
	@GeneratedValue(generator="_native")
	@GenericGenerator(name="_native",strategy="native")
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(length=50)
	public String getSoname() {
		return soname;
	}
	public void setSoname(String soname) {
		this.soname = soname;
	}
	
	
	@Column(length=50)
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	
	@Column(length=20)
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	
	@Column(length=50)
	public String getForSystem() {
		return forSystem;
	}
	public void setForSystem(String forSystem) {
		this.forSystem = forSystem;
	}
	
	@Column(length=50)
	public String getMaker() {
		return maker;
	}
	public void setMaker(String maker) {
		this.maker = maker;
	}
	
	
	
	@Column(length=100)
	public String getDownAdress() {
		return downAdress;
	}
	public void setDownAdress(String downAdress) {
		this.downAdress = downAdress;
	}
		
	@ManyToOne
	@JoinColumn(name="soSectionId")
	public SoftSection getSoftSection() {
		return softSection;
	}
	public void setSoftSection(SoftSection softSection) {
		this.softSection = softSection;
	}
	
	@Column(length=100)
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	
	@Lob
	@Column(columnDefinition="TEXT")
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getPublishDate() {
		return publishDate;
	}
	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public int getHot() {
		return hot;
	}
	public void setHot(int hot) {
		this.hot = hot;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Column(length=20)
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
		
}
