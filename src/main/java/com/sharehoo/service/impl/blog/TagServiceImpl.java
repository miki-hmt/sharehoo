package com.sharehoo.service.impl.blog;

import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.sharehoo.dao.impl.blog.TagDao;
import com.sharehoo.entity.blog.Tag;
import com.sharehoo.service.blog.TagService;
@Transactional
@Service("tagService")
public class TagServiceImpl implements TagService{
	@Resource
	private TagDao tagDao;
	
	@Override
	public void save(Tag tag) {
		// TODO Auto-generated method stub
		tagDao.merge(tag);
	}

	@Override
	public Tag getTagByUserId(int userId) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Tag");
		if(userId>0){
			hql.append(" and user_id=?");
			param.add(userId);
		}
		
		return tagDao.get(hql.toString().replaceFirst("and", "where"), param);
	}

}
