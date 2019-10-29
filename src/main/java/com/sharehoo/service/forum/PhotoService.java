package com.sharehoo.service.forum;

import java.util.List;

import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.forum.Photo;

/*
 * miki
 * 2017.06.03
 * 实现相片接口
 */
public interface PhotoService {
	public void save(Photo photo);
	
	public void delete(Photo photo);
	
	public Photo getPhotoById(int photoId);
	
	public List<Photo> getPhotosByAlbumId(int aid);
	
	public List<Photo> getFileListByUserId(int userId,PageBean pageBean);
	
	//得到收藏文件数目
	public Long getFileCountByUserId(int userId);
}
