package com.sharehoo.service.forum;

import java.util.List;

import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.shop.NewsBanner;

public interface NewsBannerService {
	/**
	 * 
	 * @param 2017.08.17 miki 首页logo新闻图片
	 */
	public void saveNewsBanner(NewsBanner newsBanner);
	
	
	public Long getMessageCount(NewsBanner newsBanner);
	/**
	 * 删除banner
	 */
	public void deleteMessage(NewsBanner newsBanner);
	

	/**
	 * 查找banner
	 */
	public NewsBanner getNewsBannerById(int newsBannerId);
	
	/**
	 * 得到banner列表
	 */
	public List<NewsBanner> findNewsBannerListByType();
	
	/*
	 * 2017.08.23 miki 得到所有banner列表
	 */
	public List<NewsBanner> getAllBanners(PageBean pageBean);
	
	public Long getCount();
	
	/**
	 * 得到详细资源页大神推荐版块图文   banner列表
	 */
	public List<NewsBanner> findRecommendBannerListByType();
	
	/*
	 * 2018.09.21	得到板块帖子列表页面的推荐banner
	 */
	public List<NewsBanner> findSectionTopicBannerListByType();
}
