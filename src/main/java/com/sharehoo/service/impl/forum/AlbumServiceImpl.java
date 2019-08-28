package com.sharehoo.service.impl.forum;

import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.sharehoo.dao.BaseDAO;
import com.sharehoo.dao.impl.BaseDAOImpl;
import com.sharehoo.dao.impl.forum.AlbumDao;
import com.sharehoo.entity.forum.Album;
import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.service.forum.AlbumService;
@Transactional
@Service("albumService")
public class AlbumServiceImpl implements AlbumService {
	
	@Autowired
	private AlbumDao baseDAO;
	@Override
	public void save(Album album) {
		// TODO Auto-generated method stub
		baseDAO.merge(album);
		
	}

	@Override
	public void delete(Album album) {
		// TODO Auto-generated method stub
		baseDAO.delete(album);
		
	}

	@Override
	public List<Album> getAlbumListByUserId(int userId,PageBean pageBean) {
		// TODO Auto-generated method stub
		StringBuffer hql=new StringBuffer(" from Album");
		List<Object> param=new LinkedList<Object>();
		if(userId>0){
			hql.append(" and userId=?");
			param.add(userId);
		}
		hql.append(" order by time desc");
		if (pageBean!=null) {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
		}
	}

	@Override
	public Album getAlbumById(int id) {
		// TODO Auto-generated method stub
		return baseDAO.getOne(id);
	}

}
