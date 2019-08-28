package com.sharehoo.service.impl.forum;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.sharehoo.dao.BaseDAO;
import com.sharehoo.dao.impl.forum.LevelDao;
import com.sharehoo.entity.shop.Level;
import com.sharehoo.service.LevelService;
@Transactional
@Service("levelService")
public class LevelServiceImpl implements LevelService {
	@Resource
	private LevelDao baseDAO;
	@Override
	public void save(Level level) {
		// TODO Auto-generated method stub
		baseDAO.merge(level);
	}

	@Override
	public void delete(Level level) {
		// TODO Auto-generated method stub
		baseDAO.delete(level);
	}

	@Override
	public void getCommemtById(int levelId) {
		// TODO Auto-generated method stub
		baseDAO.get(Level.class, levelId);
	}

}
