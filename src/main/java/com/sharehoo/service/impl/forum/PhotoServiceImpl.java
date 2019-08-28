package com.sharehoo.service.impl.forum;

import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;

import com.sharehoo.dao.BaseDAO;
import com.sharehoo.dao.impl.forum.PhotoDao;
import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.forum.Photo;
import com.sharehoo.service.forum.PhotoService;
@Transactional
@Service("photoService")
public class PhotoServiceImpl implements PhotoService {
	
	@Resource
	private PhotoDao baseDAO; 
	@Override
	public void save(Photo photo) {
		// TODO Auto-generated method stub
		baseDAO.merge(photo);
		
	}

	@Override
	public void delete(Photo photo) {
		// TODO Auto-generated method stub
		baseDAO.delete(photo);
		
	}

	@Override
	public Photo getPhotoById(int photoId) {
		// TODO Auto-generated method stub
		return baseDAO.get(Photo.class, photoId);
	}

	@Override
	public List<Photo> getPhotosByAlbumId(int aid) {
		// TODO Auto-generated method stub
		List<Object> params = new LinkedList<Object>();
		String hql = "from Photo as photo where photo.notice like ? and photo.album.id=:aid order by photo.time desc";
		params.add("1");
		params.add(aid);
		return baseDAO.find(hql, params);
	}

	@Override
	public List<Photo> getFileListByUserId(int userId, PageBean pageBean) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Photo");
		if(userId>0){
			hql.append(" and userId=?");
			param.add(userId);
		}
		hql.append(" and notice like '2' order by time desc");
		if(pageBean!=null){
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
		}
	}

	@Override
	public Long getFileCountByUserId(int userId) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select count(*) from Photo");
		if(userId>0){
			hql.append(" and userId=?");
			param.add(userId);
		}
		hql.append(" and notice like '2' ");
		
		return baseDAO.count(hql.toString().replaceFirst("and", "where"), param);
	}

}
