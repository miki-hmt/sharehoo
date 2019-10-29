package com.sharehoo.entity.shop;

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

import com.sharehoo.entity.forum.User;

/*
 * miki 2017.07.31	店铺资源表实体对象模型
 */

@Entity
@Table(name="t_source")
public class Source implements Serializable{
	private int id;
	private String name;
	private Date upload_time;
	private User user;
	private Category category;	//资源二级目录
	
	@ManyToOne
	@JoinColumn(name="shop_id")
	public Shop getShop() {
		return shop;
	}
	public void setShop(Shop shop) {
		this.shop = shop;
	}
	private Shop shop;
	private String tag;			//对应上传时的标签，便于搜索
	private int douNum;			//下载所需的豆数目
	private String description;	//设置使用ckeditor文本编辑器，可以上传图片
	private String size;		//文件大小
	private String path;		//文件路径
	private Type type;			//资源大类
	private int downNum = 0;
	private int good = 0;
	private Menu menu;			//资源三级目录
	
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public Date getUpload_time() {
		return upload_time;
	}
	public void setUpload_time(Date upload_time) {
		this.upload_time = upload_time;
	}
	@ManyToOne
	@JoinColumn(name="user_id")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@ManyToOne
	@JoinColumn(name="category_id")
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	@Column(length=20)
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	@Column(length=11)
	public int getDouNum() {
		return douNum;
	}
	public void setDouNum(int douNum) {
		this.douNum = douNum;
	}
	
	@Lob
	@Column(columnDefinition="TEXT")
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@Column(length=20)
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	@Column(length=100)
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
	@Column(length=11)
	public int getDownNum() {
		return downNum;
	}
	public void setDownNum(int downNum) {
		this.downNum = downNum;
	}
	@Column(length=11)
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	
	@ManyToOne
	@JoinColumn(name="menu_id")
	public Menu getMenu() {
		return menu;
	}
	public void setMenu(Menu menu) {
		this.menu = menu;
	}
	@ManyToOne
	@JoinColumn(name="type_id")
	public Type getType() {
		return type;
	}
	public void setType(Type type) {
		this.type = type;
	}
	
	
	
}
