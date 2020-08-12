package com.sharehoo.service.forum;

import java.util.List;

import com.sharehoo.entity.forum.Album;
import com.sharehoo.entity.forum.PageBean;

/*
* miki
* 2017.06.03
* 创建相册接口
*/
public interface AlbumService {
	
	public void save( Album album);
	
	public void delete(Album album);
	
	public Album getAlbumById(int id);
	
	/*
	 * miki
	 * 2017.06.03
	 * 根据用户Id得到相册列表
	 */
	public List<Album> getAlbumListByUserId(int userId,PageBean pageBean);
}
