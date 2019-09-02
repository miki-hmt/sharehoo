package com.sharehoo.entity.forum;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.GenericGenerator;
//2019.07.29	miki	使用JPA注解配置映射关系
@Entity
@Table(name="t_user")
public class User implements Serializable{

	private int id;        		//用户id
	private String nickName;	//用户昵称
	private String trueName;	//用户真实姓名
	private String password;	//登录密码
	private String sex;			//用户性别	0男		1女
	private String face;		//头像路径
	private Date regTime;		//注册时间
	private String email;		//用户邮箱
	private String mobile;		//联系电话
	private boolean status;    //0表示未激活，1表示激活
	private String activationCode;	//激活码
	private String nickNameId;	//用户昵称英文id，用来做url中地址显示如：localhost:8080/sharehoo/blog/miki/articles
	
	private int levelId;    //2017.03.25 author:miki 添加用户等级，和积分属性 
	private int score;
			
	private int type;			//用户类型	1为其他用户；2管理员
	private List<Section> sectionList=new ArrayList<Section>();
	private List<Topic> topicList=new ArrayList<Topic>();
	private List<Reply> replyList=new ArrayList<Reply>();
	
	@Id
	@GeneratedValue(generator="_native") //设置自动增长
	@GenericGenerator(name="_native",strategy="native")
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(length=11)
	public int getLevelId() {
		return levelId;
	}
	public void setLevelId(int levelId) {
		this.levelId = levelId;
	}
	@Column(length=50)
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	
	@Column(length=20)
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	@Column(length=20)
	public String getTrueName() {
		return trueName;
	}
	public void setTrueName(String trueName) {
		this.trueName = trueName;
	}
	@Column(length=20)
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Column(length=20)
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	@Column(length=20)
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	@Column(length=10)
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	
	public String getFace() {
		return face;
	}
	public void setFace(String face) {
		this.face = face;
	}
	public Date getRegTime() {
		return regTime;
	}
	public void setRegTime(Date regTime) {
		this.regTime = regTime;
	}
	
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
	@OneToMany(fetch=FetchType.EAGER)
	@JoinColumn(name="masterId", updatable=false)
	public List<Section> getSectionList() {
		return sectionList;
	}
	public void setSectionList(List<Section> sectionList) {
		this.sectionList = sectionList;
	}
	
	@OneToMany(mappedBy="user")
	@Cascade(value={CascadeType.DELETE})
	public List<Topic> getTopicList() {
		return topicList;
	}
	public void setTopicList(List<Topic> topicList) {
		this.topicList = topicList;
	}
	
	@OneToMany(mappedBy="user")
	public List<Reply> getReplyList() {
		return replyList;
	}
	public void setReplyList(List<Reply> replyList) {
		this.replyList = replyList;
	}
	
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	
	@Column(length=50)
	public String getActivationCode() {
		return activationCode;
	}
	public void setActivationCode(String activationCode) {
		this.activationCode = activationCode;
	}
	public String getNickNameId() {
		return nickNameId;
	}
	public void setNickNameId(String nickNameId) {
		this.nickNameId = nickNameId;
	}

	
}
