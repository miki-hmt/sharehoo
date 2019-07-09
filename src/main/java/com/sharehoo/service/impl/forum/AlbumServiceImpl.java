package com.sharehoo.service.impl.forum;

import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;

import com.sharehoo.dao.BaseDAO;
import com.sharehoo.entity.forum.Album;
import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.service.forum.AlbumService;

@Service("albumService")
public class AlbumServiceImpl implements AlbumService {
	
	@Resource private SessionFactory sessionFactory;
	@Resource	//2017.12.20  miki 一定要在这加上resource注解，这是spring的依赖注入，不添加会报空指向异常
	private BaseDAO<Album> baseDAO;
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
		return baseDAO.get(Album.class, id);
	}

}
