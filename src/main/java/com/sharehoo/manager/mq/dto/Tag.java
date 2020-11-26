package com.sharehoo.manager.mq.dto;

/**
 * @className: Tag
 * @description: 标签
 * @auther: Dimple
 * @Date: 2019/3/16
 * @Version: 1.1
 */
public class Tag extends BaseEntity {

    private static final long serialVersionUID = 1L;


    private Integer tagId;

    /**
     * 标签内容
     */
    private String tagTitle;
    /**
     * 关联的博客个数
     */
    private int count;
    
	public Integer getTagId() {
		return tagId;
	}
	public void setTagId(Integer tagId) {
		this.tagId = tagId;
	}
	public String getTagTitle() {
		return tagTitle;
	}
	public void setTagTitle(String tagTitle) {
		this.tagTitle = tagTitle;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
    
    
}