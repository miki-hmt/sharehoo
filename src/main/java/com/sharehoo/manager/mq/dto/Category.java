package com.sharehoo.manager.mq.dto;

/**
 * @className: Category
 * @description: 分类
 * @auther: Dimple
 * @Date: 2019/3/16
 * @Version: 1.1
 */
public class Category extends BaseEntity {
    private static final long serialVersionUID = 1L;

    private Integer categoryId;
    /**
     * 分类的名称
     */
    private String categoryTitle;

    /**
     * 权重
     */
    private Integer weight;

    /**
     * 描述
     */
    private String description;
    /**
     * 是否推荐，0表示不推荐，1表示推荐
     */
    private String support;
    
    
	public Integer getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryTitle() {
		return categoryTitle;
	}
	public void setCategoryTitle(String categoryTitle) {
		this.categoryTitle = categoryTitle;
	}
	public Integer getWeight() {
		return weight;
	}
	public void setWeight(Integer weight) {
		this.weight = weight;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getSupport() {
		return support;
	}
	public void setSupport(String support) {
		this.support = support;
	}
    
    
}