package com.sharehoo.entity.forum;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * 
 * @author miki
 * date:2017.04.24
 * project:相册实体
 *
 */
//使用JPA注解配置映射关系
@Entity		//告诉JPA这是一个实体类（和数据表映射的类）
@Table(name="t_album")		//@Table来指定和哪个数据表对应;如果省略默认表名就是user；
public class Album implements Serializable{
	
	private int id;			//相册id
	private String image;	//相册logo
	private User user;		//相册对应用户
	
	@ManyToOne
	@JoinColumn(name="userId")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	private String title;	//相册标题
	private String content;	//相册描述
	private String notice;	//相册声明
	private Date time;		//建立时间
	
	private List<Photo> photoList=new ArrayList<Photo>();
	
	@OneToMany(mappedBy="album")
	public List<Photo> getPhotoList() {
		return photoList;
	}
	public void setPhotoList(List<Photo> photoList) {
		this.photoList = photoList;
	}
	@Id
	@GeneratedValue(generator="_native")
	@GenericGenerator(name="_native",strategy="native")
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
		
	@Column(length=50)
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	@Lob
	@Column(columnDefinition="TEXT")
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	@Column(length=100)
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	
	
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	} 
	
	
	
}
