package com.sharehoo.service.impl.forum;

import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sharehoo.dao.BaseDAO;
import com.sharehoo.entity.forum.Me;
import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.service.forum.MeService;
import com.sharehoo.util.forum.StringUtil;

@Service("meService")
public class MeServiceImpl implements MeService {
	@Resource
	private BaseDAO<Me> baseDAO;
	
	@Override
	public void save(Me me) {
		// TODO Auto-generated method stub
		baseDAO.merge(me);
	}

	@Override
	public void delete(Me me) {
		// TODO Auto-generated method stub
		baseDAO.delete(me);
	}

	@Override
	public List<Me> getMeListByUserId(int userId,PageBean pageBean) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Me");
		if (userId>0) {
			hql.append(" and userId=?");
			param.add(userId);
		}
		if (pageBean!=null) {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
		}
	}

	@Override
	public Long getMeCount(Me s_me) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select count(*) from Me m");
		if (s_me!=null) {
			if (StringUtil.isNotEmpty(s_me.getNotice())) {
				hql.append(" and m.notice like ?");
				param.add("%"+s_me.getNotice()+"%");
			}
			if (s_me.getUser()!=null) {
				if (StringUtil.isNotEmpty(s_me.getUser().getNickName())) {
					hql.append(" and m.user.nickName like ?");
					param.add("%"+s_me.getUser().getNickName()+"%");
				}
			}
			if (StringUtil.isNotEmpty(s_me.getContent())) {
				hql.append(" and m.content like ?");
				param.add("%"+s_me.getContent()+"%");
			}
			if (s_me.getName()!=null) {
				hql.append(" and m.name=?");
				param.add(s_me.getName());
			}
		}
		return baseDAO.count(hql.toString().replaceFirst("and", "where"), param);

	}
	
	/*
	 * 2017.05.12
	 * miki
	 * ：后台自我介绍列表
	 * (non-Javadoc)
	 * @see jiabin.service.MeService#findMeList(jiabin.entity.Me, jiabin.entity.PageBean)
	 */
	@Override
	public List<Me> findMeList(Me s_me, PageBean pageBean) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Me");
		if(s_me!=null){
			if (StringUtil.isNotEmpty(s_me.getName())) {
				hql.append(" and name like ?");
				param.add("%"+s_me.getName()+"%");
			}
		}
		hql.append(" order by id desc");
		if (pageBean!=null) {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
		}
	}

}
