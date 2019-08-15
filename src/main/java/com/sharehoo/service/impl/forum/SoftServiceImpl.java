package com.sharehoo.service.impl.forum;

import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sharehoo.dao.impl.forum.SoftDao;
import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.forum.Soft;
import com.sharehoo.service.forum.SoftService;
import com.sharehoo.util.forum.StringUtil;

/**
 * 
 * @author miki
 * date:2017.04.01
 * project:softService接口功能的实现
 *
 */
@Service("softService")
public class SoftServiceImpl implements SoftService {
	@Resource
	private SoftDao baseDAO;
	
	@Override
	public void saveSoft(Soft soft) {
		// TODO Auto-generated method stub
		baseDAO.merge(soft);
		
	}

	@Override
	public void deleteSoft(Soft soft) {
		// TODO Auto-generated method stub
		baseDAO.delete(soft);
	}

	@Override
	public List<Soft> findSoftList(Soft s_soft, PageBean pageBean) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Soft s");
		if (s_soft!=null) {
			if (StringUtil.isNotEmpty(s_soft.getSoname())) {
				hql.append(" and s.soname like ?");
				param.add("%"+s_soft.getSoname()+"%");
			}
			if (StringUtil.isNotEmpty(s_soft.getLogo())) {
				hql.append(" and s.logo like ?");
				param.add("%"+s_soft.getLogo()+"%");
			}
		
			if (StringUtil.isNotEmpty(s_soft.getSize())) {
				hql.append(" and s.size like ?");
				param.add("%"+s_soft.getSize()+"%");
			}
			if (s_soft.getLanguage()!=null) {
				hql.append(" and s.language=?");
				param.add(s_soft.getLanguage());
			}
			if (s_soft.getForSystem()!=null) {
				hql.append(" and s.forSystem=?");
				param.add(s_soft.getForSystem());
			}
			if (s_soft.getSoftSection()!=null) {
				if (s_soft.getSoftSection().getId()>0) {
					hql.append(" and s.soSection.id=?");
					param.add(s_soft.getSoftSection().getId());
				}
			}
			if (s_soft.getMaker()!=null) {
				hql.append(" and s.maker=?");
				param.add(s_soft.getMaker());
			}
			if (s_soft.getDescription()!=null) {
				hql.append(" and s.description=?");
				param.add(s_soft.getDescription());
			}
			if (s_soft.getPublishDate()!=null) {
				hql.append(" and s.publishDate=?");
				param.add(s_soft.getPublishDate());
			}
			if (s_soft.getDownAdress()!=null) {
				hql.append(" and s.downAdress=?");
				param.add(s_soft.getDownAdress());
			}
			
			if (s_soft.getKeyword()!=null) {
				hql.append(" and s.keyword=?");
				param.add(s_soft.getKeyword());
			}
		}
		hql.append(" order by publishDate desc");
		if (pageBean!=null) {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
		}
	}

	@Override
	public Soft findSoftById(int softId) {
		// TODO Auto-generated method stub
		return baseDAO.get(Soft.class, softId);
	}

	@Override
	public Long getSoftCount(Soft s_soft) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select count(*) from Soft s");
		if (s_soft!=null) {
			if (StringUtil.isNotEmpty(s_soft.getSoname())) {
				hql.append(" and s.soname like ?");
				param.add("%"+s_soft.getSoname()+"%");
			}
			if (StringUtil.isNotEmpty(s_soft.getLogo())) {
				hql.append(" and s.logo like ?");
				param.add("%"+s_soft.getLogo()+"%");
			}
		
			if (StringUtil.isNotEmpty(s_soft.getSize())) {
				hql.append(" and s.size like ?");
				param.add("%"+s_soft.getSize()+"%");
			}
			if (s_soft.getLanguage()!=null) {
				hql.append(" and s.language=?");
				param.add(s_soft.getLanguage());
			}
			if (s_soft.getForSystem()!=null) {
				hql.append(" and s.forSystem=?");
				param.add(s_soft.getForSystem());
			}
			if (s_soft.getSoftSection()!=null) {
				if (s_soft.getSoftSection().getId()>0) {
					hql.append(" and s.soSection.id=?");
					param.add(s_soft.getSoftSection().getId());
				}
			}
			if (s_soft.getMaker()!=null) {
				hql.append(" and s.maker=?");
				param.add(s_soft.getMaker());
			}
			if (s_soft.getDescription()!=null) {
				hql.append(" and s.description=?");
				param.add(s_soft.getDescription());
			}
			
			if (s_soft.getPublishDate()!=null) {
				hql.append(" and s.publishDate=?");
				param.add(s_soft.getPublishDate());
			}
		
			if (s_soft.getKeyword()!=null) {
				hql.append(" and s.keyword=?");
				param.add(s_soft.getKeyword());
			}
			
		}
		return baseDAO.count(hql.toString().replaceFirst("and", "where"), param);
	}

	@Override
	public Long getSoftCountBySoftSectionId(int softSectionId) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select count(*) from Soft");
		if (softSectionId>0) {
			hql.append(" and soSectionId=?");
			param.add(softSectionId);
		}
		return baseDAO.count(hql.toString().replaceFirst("and", "where"), param);
	}

	@Override
	public List<Soft> findSoftListBySoftSectionId(int softSectionId, PageBean pageBean) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Soft");
		if (softSectionId>0) {
			hql.append(" and soSectionId=?");
			param.add(softSectionId);
		}
		hql.append(" order by publishDate desc");
		if (pageBean!=null) {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
		}
	}

	@Override
	public List<Soft> goodListBySoftSectionId(int softSectionId, PageBean pageBean) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Soft");
		if (softSectionId>0) {
			hql.append(" and soSectionId=?");
			hql.append(" and good=1");
			param.add(softSectionId);
		}
		hql.append(" order by publishDate desc");
		if (pageBean!=null) {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
		}
	}

	@Override
	public List<Soft> hotListByHot(int hot, PageBean pageBean) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Soft");
		if (hot>0) {
			hql.append(" and hot=?");
			param.add(hot);
		}
		hql.append(" order by publishDate desc");
		if (pageBean!=null) {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
		}
	}

}


