package com.sharehoo.entity.forum;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;


/**
 * 
 * @author miki 
 * 2017.03.31 
 * project:资源下载页面小版块entity
 *
 */


@Entity
@Table(name="t_softSection")
public class SoftSection implements Serializable{
	private int id;
	private String areaName;
	private String descript;
	
	private List<Soft> softList=new ArrayList<Soft>();
	
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
	public String getAreaName() {
		return areaName;
	}
	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}
	
	@Column(length=200)
	public String getDescript() {
		return descript;
	}
	public void setDescript(String descript) {
		this.descript = descript;
	}
	@OneToMany(mappedBy="softSection",fetch=FetchType.EAGER)
	public List<Soft> getSoftList() {
		return softList;
	}
	public void setSoftList(List<Soft> softList) {
		this.softList = softList;
	}
	
	
}
