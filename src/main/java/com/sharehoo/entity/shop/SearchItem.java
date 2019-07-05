package com.sharehoo.entity.shop;
import java.io.Serializable;


public class SearchItem implements Serializable{
	private String id;
	private String title;
	private String shopName;
	private String price;
	private String image;
	private String category_name;
	private String menu_name;
	private String description;
	private String tag;
	private String userName;
	private String douNum;
	private String typeName;
	private String downNum;
	private String uploadDate;
	private String size;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	
	
	//2017.11.01	增加方法使搜索时显示图片列表的第一张图，在前台jsp中通过${item.images[0]}显示
	public String[] getImages() {
		if (image != null && !"".equals(image)) {
			String[] strings = image.split(",");
			return strings;
		}
		return null;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public String getDescription() {
		return description;
	}
	public String getTag() {
		return tag;
	}
	public String getUserName() {
		return userName;
	}
	public String getDouNum() {
		return douNum;
	}
	public String getTypeName() {
		return typeName;
	}
	public String getDownNum() {
		return downNum;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public void setDouNum(String douNum) {
		this.douNum = douNum;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public void setDownNum(String downNum) {
		this.downNum = downNum;
	}
	public String getUploadDate() {
		return uploadDate;
	}
	public void setUploadDate(String uploadDate) {
		this.uploadDate = uploadDate;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	
}

