package com.sharehoo.entity.forum;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
//2019.07.29	miki	使用JPA注解配置映射关系
@Entity
@Table(name="t_section")
public class Section implements Serializable{

	private int id;				//板块id
	private String name;		//板块名称
	private User master;		//版主id
	private String logo;		//板块logo图片路径
	private List<Topic> topicList=new ArrayList<Topic>();
	private Zone zone;			//所属大板块
	/*private Section parent;*/		//父板块
	/*private List<Section> sectionList=new ArrayList<Section>();*/
	
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	/*@ManyToOne
	@JoinColumn(name="masterId")*/
	@ManyToOne
	@JoinColumn(name="masterId",nullable=true)
	public User getMaster() {
		return master;
	}
	public void setMaster(User master) {
		this.master = master;
	}
	@OneToMany(mappedBy="section")
	public List<Topic> getTopicList() {
		return topicList;
	}
	public void setTopicList(List<Topic> topicList) {
		this.topicList = topicList;
	}
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="zoneId")
	public Zone getZone() {
		return zone;
	}
	public void setZone(Zone zone) {
		this.zone = zone;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	
	
	/*@ManyToOne(cascade=CascadeType.ALL,fetch=FetchType.EAGER)
	@JoinColumn(name="parentId")
	public Section getParent() {
		return parent;
	}
	public void setParent(Section parent) {
		this.parent = parent;
	}*/
	
	/*@OneToMany(cascade=CascadeType.ALL,mappedBy="parent",fetch=FetchType.EAGER)
	public List<Section> getSectionList() {
		return sectionList;
	}
	public void setSectionList(List<Section> sectionList) {
		this.sectionList = sectionList;
	}*/
	
	
}
