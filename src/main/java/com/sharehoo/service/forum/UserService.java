package com.sharehoo.service.forum;

import java.util.List;

import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.forum.User;

public interface UserService {

	public void saveUser(User user);
	
	public boolean existUserWithNickName(String nickName);
	
	public User login(User user);
	
	public List<User> findUserList(User s_user,PageBean pageBean);
	
	public Long getUserCount(User s_user);
	
	public void delete(User user);
	
	public User getUserById(int id);
	public User getUserByNickNameId(String nickNameid);
	
	public User getUserByNickName(String nickName);
	
	/**
	 * 2017.04.14
	 * miki
	 * 根据激活码查找用户
	 * @param activationCode
	 * @return
	 */
	
	public User findUserByActivationCode(String activationCode);

	public boolean existUserWithEmail(String email);
	
	/*
	 * 2017.05.06
	 * miki 
	 * 找回密码判断
	 */
	public boolean existUserWithTrueName(String trueName);
	
	//2020.06.12 判断是否存在重复手机号
	public boolean existUserWithTelephone(String phone);
	
	public User findUserByTrueName(String trueName);
	
	/**
	 * 2017.05.01
	 * miki
	 * 实现得到用户列表，根据积分多少排名
	 */
	public List<User> userListByScore(User user,PageBean pageBean);
	
	public List<User> getUserListByScroe();
}
