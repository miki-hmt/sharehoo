package com.sharehoo.service.impl.forum;

import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;

import com.sharehoo.dao.BaseDAO;
import com.sharehoo.dao.impl.forum.NoticeDao;
import com.sharehoo.entity.forum.Notice;
import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.service.forum.NoticeService;
import com.sharehoo.util.forum.StringUtil;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {
	
	@Resource
	private NoticeDao baseDAO;
	
	@Override
	public void saveNotice(Notice notice) {
		// TODO Auto-generated method stub
		baseDAO.merge(notice);
	}

	@Override
	public void deleteNotice(Notice notice) {
		// TODO Auto-generated method stub
		baseDAO.delete(notice);
	}

	@Override
	public Notice getNoticeById(int noticeId) {
		// TODO Auto-generated method stub
		return baseDAO.get(Notice.class, noticeId);
	}
	
	//2017.08.25 miki 论坛公告
	@Override
	public List<Notice> findNoticeList(Notice s_notice, PageBean pageBean) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Notice");
		if(s_notice!=null){
			if (StringUtil.isNotEmpty(s_notice.getName())) {
				hql.append(" and name like ?");
				param.add("%"+s_notice.getName()+"%");
			}
		}
		hql.append(" order by pubDate desc");
		if (pageBean!=null) {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
		}

	}
	
	//2017.08.25 miki 下载社区公告公告
	public List<Notice> findDownLoadNoticeList() {
		// TODO Auto-generated method stub
		String hql = "from Notice as notice where notice.state=0 order by notice.pubDate desc";
		
		return baseDAO.findTopN(hql, null, 5);

	}
	
	
	@Override
	public Long getNoticeCount(Notice s_notice) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select count(*) from Notice");
		if(s_notice!=null){
			if(StringUtil.isNotEmpty(s_notice.getName())){
				hql.append(" and name like ?");
				param.add("%"+s_notice.getName()+"%");
			}
		}
		return baseDAO.count(hql.toString().replaceFirst("and", "where"), param);
	}
}
