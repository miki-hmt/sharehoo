package com.sharehoo.service.impl.forum;

import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharehoo.dao.BaseDAO;
import com.sharehoo.dao.impl.BaseDAOImpl;
import com.sharehoo.dao.impl.forum.UserDao;
import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.forum.User;
import com.sharehoo.service.forum.UserService;
import com.sharehoo.util.forum.StringUtil;
@Transactional
@Service("UserService")
public class UserServiceImpl implements UserService {

	@Autowired	//2017.12.20  miki 一定要在这加上resource注解，这是spring的依赖注入，不添加会报空指向异常
	private UserDao baseDAO;
	@Override
	public void saveUser(User user) {
		baseDAO.merge(user);
	}

	@Override
	public boolean existUserWithNickName(String nickName) {
		String hql="select count(*) from User where nickName=?";
		long count=baseDAO.count(hql, new Object[]{nickName});
		if (count>0) {
			return true;
		} else {
			return false;
		}
	}
	
	/*2017.04.14
	 * 判断邮箱是否已注册
	 * (non-Javadoc)
	 * @see jiabin.service.UserService#existUserWithEmail(java.lang.String)
	 */
	
	@Override
	public boolean existUserWithEmail(String email){
		String hql="select count(*) from User where email=?";
		long count=baseDAO.count(hql,new Object[]{email});
		if(count>0){
			return true;
		}else{
			return false;
		}
	}
	
	/**
	 *  第1步：
	 * 2017.05.06
	 * miki
	 * 判断用户真实姓名是否正确
	 */

	@Override
	public boolean existUserWithTrueName(String trueName) {
		// TODO Auto-generated method stub
		String hql="select count(*) from User where trueName=?";
		long count=baseDAO.count(hql,new Object[]{trueName});
		if(count>0){
			return true;
		}else{
			return false;
		}
	}
	
	/**
	 * 第2步：
	 * 2017.05.06
	 * miki
	 * 通过真实姓名找到该用户
	 */
	@Override
	public User findUserByTrueName(String trueName) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from User");
		if(StringUtil.isNotEmpty(trueName)){
			hql.append(" and trueName = ?");
			param.add(trueName);
		}
		return baseDAO.get(hql.toString().replaceFirst("and", "where"), param);
	}
	
	
	@Override
	public User login(User user) {
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from User u where u.password=?");
		
		//2020.06.12 miki 适配手机号，邮箱，昵称不同场景下的用户登录
		hql.append("and u.nickName=? or u.email=? or u.mobile=?");
		
		param.add(user.getPassword());
		param.add(user.getNickName());
		param.add(user.getNickName());
		param.add(user.getNickName());
		return baseDAO.get(hql.toString(), param);
	}

	@Override
	public List<User> findUserList(User s_user, PageBean pageBean) {
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from User");
		if (s_user!=null) {
			if (StringUtil.isNotEmpty(s_user.getNickName())) {
				hql.append(" and nickName like ?");
				param.add("%"+s_user.getNickName()+"%");
			}
			if (s_user.getType()>0) {
				hql.append(" and type = ?");
				param.add(s_user.getType());
			}
		}
		if (pageBean!=null) {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else{
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
		}
	}

	@Override
	public Long getUserCount(User s_user) {
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select count(*) from User");
		if (s_user!=null) {
			if (StringUtil.isNotEmpty(s_user.getNickName())) {
				hql.append(" and nickName like ?");
				param.add("%"+s_user.getNickName()+"%");
			}
			if (s_user.getType()>0) {
				hql.append(" and type = ?");
				param.add(s_user.getType());
			}
		}
		return baseDAO.count(hql.toString().replaceFirst("and", "where"), param);
	}

	@Override
	public void delete(User user) {
		baseDAO.delete(user);
	}

	@Override
	public User getUserById(int id) {
		return baseDAO.get(User.class, id);
	}

	@Override
	public User getUserByNickName(String nickName) {
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from User");
		if (StringUtil.isNotEmpty(nickName)) {
			hql.append(" and nickName = ?");
			param.add(nickName);
		}
		return baseDAO.get(hql.toString().replaceFirst("and", "where"), param);
	}
	
	
	@Override
	public User getUserByNickNameId(String nickNameId) {
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from User");
		if (StringUtil.isNotEmpty(nickNameId)) {
			hql.append(" and nickNameId = ?");
			param.add(nickNameId);
		}
		return baseDAO.get(hql.toString().replaceFirst("and", "where"), param);
	}

	@Override
	public User findUserByActivationCode(String activationCode) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from User");
		if(StringUtil.isNotEmpty(activationCode)){
			hql.append(" and activationCode = ?");
			param.add(activationCode);
		}
		return baseDAO.get(hql.toString().replaceFirst("and", "where"), param);
	}

	
	/**
	 * miki
	 * date:2017.05.01
	 * 根据score积分多少排列用户
	 * 1.首先判断用户是否为空(做搜索功能的时候，会通过输入姓名或者类型等条件
	 * 2.用户为空则直接根据降序的方式来排序)
	 */
	@Override
	public List<User> userListByScore(User user, PageBean pageBean) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from User");
		if (user!=null) {
			if (StringUtil.isNotEmpty(user.getNickName())) {
				hql.append(" and nickName like ?");
				param.add("%"+user.getNickName()+"%");
			}
			if (user.getType()>0) {
				hql.append(" and type = ?");
				param.add(user.getType());
			}
		}
		hql.append(" order by score desc");				
		
		if (pageBean!=null) {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else{
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
		}
	}

	@Override
	public List<User> getUserListByScroe() {
		// TODO Auto-generated method stub
		String hql = "from User as user where user.status=1 order by user.score desc";
		List<Object> param = new LinkedList<Object>();
		return baseDAO.findTopN(hql, param, 20);
	}

	@Override
	public boolean existUserWithTelephone(String phone) {
		// TODO Auto-generated method stub
		String hql="select count(*) from User where mobile=?";
		long count=baseDAO.count(hql, new Object[]{phone});
		if (count>0) {
			return true;
		} else {
			return false;
		}
	}

	
}
