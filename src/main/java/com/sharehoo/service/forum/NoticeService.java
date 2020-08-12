package com.sharehoo.service.forum;

import java.util.List;

import com.sharehoo.entity.forum.Notice;
import com.sharehoo.entity.forum.PageBean;

public interface NoticeService {
	/**
	 * 
	 * @param notice添加公告
	 */
	public void saveNotice(Notice notice);
	
	
	public Long getNoticeCount(Notice s_notice);
	/**
	 * 删除公告
	 */
	public void deleteNotice(Notice notice);
	

	/**
	 * 查找公告
	 */
	public Notice getNoticeById(int noticeId);
	
	/**
	 * 得到公告列表
	 */
	public List<Notice> findNoticeList(Notice s_notice,PageBean pageBean);
	
	//2017.08,25 miki 得到下载社区公告
	public List<Notice> findDownLoadNoticeList();
	
}
