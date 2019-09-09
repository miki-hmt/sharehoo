package com.sharehoo.service.impl.forum;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.sharehoo.dao.BaseDAO;
import com.sharehoo.dao.impl.BaseDAOImpl;
import com.sharehoo.dao.impl.forum.TopicDao;
import com.sharehoo.dao.jedis.JedisClient;
import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.forum.Topic;
import com.sharehoo.service.forum.TopicService;
import com.sharehoo.util.forum.StringUtil;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
@Transactional
@Service("topicService")
public class TopicServiceImpl implements TopicService {

	@Autowired	//2017.12.20  miki 一定要在这加上resource注解，这是spring的依赖注入，不添加会报空指向异常
	private TopicDao baseDAO;
	
	@Value("S{forum.topic.YUAN_CHUANG}")	//原创社区
	private String token;					
	@Value("S{forum.topic.ADVICE}")			//出谋划策
	private String advice;
	@Value("S{forum.topic.JAVAWEB}")		//javaweb
	private String java;
	@Value("S{forum.topic.ERSHOU}")			//二手集市
	private String ershou;
	@Value("S{forum.topic.MONEY}")			//赏金
	private String money;
	@Value("S{forum.topic.JOB_INTERVIEW}")	//面试总结
	private String job;
	@Value("S{forum.topic.CODE}")			//编程语言
	private String code;
	@Value("S{forum.topic.SAY}")			//我想说
	private String say;
	@Value("S{forum.topic.SERVERDEV}")		//服务运维
	private String server;
	@Value("S{forum.topic.MUSIC}")			//音乐心灵
	private String music;
	@Value("S{forum.topic.FRIEND}")			//约伴出游
	private String friend;
	@Value("S{forum.topic.BIGDATA}")		//大数据
	private String bigdata;
	@Value("S{forum.topic.WECHAT}")			//微信开发
	private String wechat;
	@Value("S{forum.topic.FOOD}")			//美食
	private String food;
	@Value("S{forum.topic.WEB}")			//web前端
	private String web;
	@Value("S{forum.topic.GAMEDEV}")		//游戏开发
	private String game;
	
	@Autowired
	private JedisClient jedisClient;
	
	
	@Override
	public void saveTopic(Topic topic) {
				
		int sectionId=topic.getSection().getId();
		try {
			redisDelete(sectionId);
		} catch (Exception e) {}		//redis错误可以忽略	2019.09.07
		baseDAO.merge(topic);
	}

	@Override
	public void deleteTopic(Topic topic) {
		baseDAO.delete(topic);
	}
	
	
	private void redisDelete(int sectionId) {
		switch(sectionId){
			case 21 :				
				jedisClient.hdel(token,String.valueOf(sectionId));
				
				break;
			case 11 :				
				jedisClient.hdel(advice,String.valueOf(sectionId));
				
				break;
			case 1 :
				jedisClient.hdel(java,String.valueOf(sectionId));
							
				break;
			case 2 :
				jedisClient.hdel(ershou,String.valueOf(sectionId));	
	
				break;
			case 3 :
				jedisClient.hdel(say,String.valueOf(sectionId));	
	
				break;
			case 4 :	
				jedisClient.hdel(money,String.valueOf(sectionId));	
	
				break;
			case 7 :	
				jedisClient.hdel(job,String.valueOf(sectionId));	
	
				break;
			case 8 :
				jedisClient.hdel(web,String.valueOf(sectionId));	
	
				break;		
			case 12 :
				jedisClient.hdel(game,String.valueOf(sectionId));	
	
				break;
			case 13 :
				jedisClient.hdel(server,String.valueOf(sectionId));	
	
				break;
			case 14 :
				jedisClient.hdel(music,String.valueOf(sectionId));	
	
				break;
			case 15 :
				jedisClient.hdel(friend,String.valueOf(sectionId));	
	
				break;
			case 16 :
				jedisClient.hdel(bigdata,String.valueOf(sectionId));	
	
				break;
			case 18 :
				jedisClient.hdel(wechat,String.valueOf(sectionId));	
	
				break;
			case 19 :
				jedisClient.hdel(food,String.valueOf(sectionId));	
	
				break;
			case 20 :
				jedisClient.hdel(code,String.valueOf(sectionId));	
				break;
		}
	}
	
	
        /*
         * 搜索框输入帖子名称关键字进行字符串模糊匹配    2016.12.12 
         *   mysql四种模糊匹配的方法：
         * 1，%：表示任意0个或多个字符。可匹配任意类型和长度的字符，有些情况下若是中文，请使用两个百分号（%%）表示。
         * 2，_： 表示任意单个字符。匹配单个任意字符，它常用来限制表达式的字符长度语句： 
			比如 SELECT * FROM [user] WHERE u_name LIKE '_三_' 
			只找出“唐三藏”这样u_name为三个字且中间一个字是“三”的；
		   3，[ ]：表示括号内所列字符中的一个（类似正则表达式）。指定一个字符、字符串或范围，要求所匹配对象为它们中的任一个。 
			比如 SELECT * FROM [user] WHERE u_name LIKE '[张李王]三' 将找出“张三”、“李三”、“王三”（而不是“张李王三”）；


         * @see jiabin.service.TopicService#findTopicList(jiabin.entity.Topic, jiabin.entity.PageBean)
         */
	@Override
	public List<Topic> findTopicList(Topic s_topic, PageBean pageBean) {
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Topic t");
		if (s_topic!=null) {
			if (StringUtil.isNotEmpty(s_topic.getTitle())) {
				hql.append(" and t.title like ?");
				param.add("%"+s_topic.getTitle()+"%");
			}
			if (s_topic.getUser()!=null) {
				if (StringUtil.isNotEmpty(s_topic.getUser().getNickName())) {
					hql.append(" and t.user.nickName like ?");
					param.add("%"+s_topic.getUser().getNickName()+"%");
				}
			}
			if (StringUtil.isNotEmpty(s_topic.getContent())) {
				hql.append(" and t.content like ?");
				param.add("%"+s_topic.getContent()+"%");
			}
			if (s_topic.getPublishTime()!=null) {
				hql.append(" and t.publishTime=?");
				param.add(s_topic.getPublishTime());
			}
			if (s_topic.getModifyTime()!=null) {
				hql.append(" and t.modifyTime=?");
				param.add(s_topic.getModifyTime());
			}
			if (s_topic.getSection()!=null) {
				if (s_topic.getSection().getId()>0) {
					hql.append(" and t.section.id=?");
					param.add(s_topic.getSection().getId());
				}
			}
			if (s_topic.getTop()!=2) {
				hql.append(" and t.top=?");
				param.add(s_topic.getTop());
			}
			if (s_topic.getGood()!=2) {
				hql.append(" and t.good=?");
				param.add(s_topic.getGood());
			}
		}
		hql.append(" and title not like '1' order by publishTime desc");
		if (pageBean!=null) {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
		}
	}
	//查询全部版块帖子总数    2017.04.03
	@Override
	public Long getTopicCount(Topic s_topic) {
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select count(*) from Topic t");
		if (s_topic!=null) {
			if (StringUtil.isNotEmpty(s_topic.getTitle())) {
				hql.append(" and t.title like ?");
				param.add("%"+s_topic.getTitle()+"%");
			}
			if (s_topic.getUser()!=null) {
				if (StringUtil.isNotEmpty(s_topic.getUser().getNickName())) {
					hql.append(" and t.user.nickName like ?");
					param.add("%"+s_topic.getUser().getNickName()+"%");
				}
			}
			if (StringUtil.isNotEmpty(s_topic.getContent())) {
				hql.append(" and t.content like ?");
				param.add("%"+s_topic.getContent()+"%");
			}
			if (s_topic.getPublishTime()!=null) {
				hql.append(" and t.publishTime=?");
				param.add(s_topic.getPublishTime());
			}
			if (s_topic.getModifyTime()!=null) {
				hql.append(" and t.modifyTime=?");
				param.add(s_topic.getModifyTime());
			}
			if (s_topic.getSection()!=null) {
				if (s_topic.getSection().getId()>0) {
					hql.append(" and t.section.id=?");
					param.add(s_topic.getSection().getId());
				}
			}
			if (s_topic.getTop()!=2) {
				hql.append(" and t.top=?");
				param.add(s_topic.getTop());
			}
			if (s_topic.getGood()!=2) {
				hql.append(" and t.good=?");
				param.add(s_topic.getGood());
			}
		}
		return baseDAO.count(hql.toString().replaceFirst("and", "where"), param);
	}

	@Override
	public Topic findTopicById(int topicId) {
		return baseDAO.get(Topic.class, topicId);
	}

	@Override
	public List<Topic> findZdTopicListBySectionId(int sectionId,PageBean pageBean) {
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Topic");
		if (sectionId>0) {
			hql.append(" and sectionId=?");
			param.add(sectionId);
		}
		hql.append(" and top=1");
		if (pageBean!=null) {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
		}
	}
	
	
	
	@Override
	public List<Topic> findPtTopicListBySectionId(int sectionId,PageBean pageBean) {
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Topic");
		if (sectionId>0) {
			hql.append(" and sectionId=?");
			param.add(sectionId);
		}
		hql.append(" and top=0 order by modifyTime desc");
		if (pageBean!=null) {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
		}
	}
	
	
	
	
	/*
	 * 根据版块id得到所有帖子  2017.05.04
	 * 2018.06.19	此处应用redis缓存数据库
	 */
	@Override
	public List<Topic> findTopicListBySectionId(int sectionId,PageBean pageBean){
		List<Topic> ycList=new ArrayList<>();
		Properties prop = new Properties();
		String jsonData="";
		try {
			prop.load(this.getClass().getClassLoader().getResourceAsStream("resource.properties"));
		} catch (IOException e1) {
			throw new RuntimeException(e1);
		}
		String token=prop.getProperty("YUAN_CHUANG");	//原创社区
		String advice=prop.getProperty("ADVICE");		//出谋划策
		
		List<Object> param=new LinkedList<Object>();
		
		//查询缓存
		try {
				//免去每次遍历一个板块就要去查一次redis
			if(sectionId==21 || sectionId==11 || sectionId==1 || sectionId==2 || sectionId==4 || sectionId==7 ||sectionId==20){
				String json=jedisClient.hget(token, sectionId+"");
				
				if(StringUtils.isNotBlank(json)){				
//					System.out.println("我在走缓存...."+json);
					String fields[]={"user","replyList","section","content"};	//配置json转义规则，防止解析嵌套对象出错
					JsonConfig config=new JsonConfig();
				
					config.setExcludes(fields);
					ycList = JSONArray.toList(JSONArray.fromObject(json), new Topic(),config );//将json字符串转成list对象

					return ycList;												//2018.06.19 缓存中存在数据，取出，并终止程序向下进行
				}
			}
						
		} catch (Exception e) {}	//2019.08.19	miki 忽略获取redis异常
		
		//2018.06.19 如果缓存中存在数据则取出，如果不存在则执行查询
		StringBuffer hql=null;
		if(sectionId==21 || sectionId==11){					//只针对原创帖子做缓存
			hql=new StringBuffer("select id,title,t.user.nickName,concat(code,'') from Topic t");
		}else{
			hql=new StringBuffer("from Topic t");
		}
		
		if (sectionId>0) {
			hql.append(" and sectionId=?");
			param.add(sectionId);
		}
		hql.append(" order by publishTime desc");
		
		if (pageBean!=null) {
			
			//2018.06.19 如果查询到原创帖子模块，将查询到的数据存到redis缓存中
			ycList=baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
			
		}else {			
			ycList=baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
				
		}
		
		try {
			switch(sectionId){
			case 21 :
				
				jsonData = JSON.toJSONString(ycList);		//2018.06.19 将list转成json字符串
				jedisClient.hset(token,sectionId+"",jsonData);	//将json字符串放入redis中
				
				break;
			case 11 :
					
				jsonData = JSON.toJSONString(ycList);		//2018.07.12 将list转成json字符串	c出谋划策数据
				jedisClient.hset(advice,sectionId+"",jsonData);	//将json字符串放入redis中
				
				break;

			}
		} catch (Exception e) {}	//写入redis失败可以忽略  2019.08.19	miki
		
		if (pageBean!=null) {			
			
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else {
							
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
		}
		
	}
	
	/**miki
	 * 2018.07.12
	 * 将指定的数据库板块记录放入redis缓存
	 */
	@Override
	public List<Topic> getNewTopicListBySection(int sectionId) {
		// TODO Auto-generated method stub
		String hql="";
		List<Topic> ycList=new ArrayList<>();
		List<Object> param = new LinkedList<Object>();
		Properties prop = new Properties();
		String jsonData="";
		try {
			prop.load(this.getClass().getClassLoader().getResourceAsStream("resource.properties"));
		} catch (IOException e1) {
			throw new RuntimeException(e1);
		}
		String token=prop.getProperty("YUAN_CHUANG");	//原创社区
		String advice=prop.getProperty("ADVICE");		//出谋划策
		String java=prop.getProperty("JAVAWEB");		//javaweb
		String ershou=prop.getProperty("ERSHOU");		//二手集市
		String money=prop.getProperty("MONEY");			//赏金
		String job=prop.getProperty("JOB_INTERVIEW");	//面试总结
		String code=prop.getProperty("CODE");			//编程语言
		String say=prop.getProperty("SAY");				//我想说
		String game=prop.getProperty("GAME");
		String jingmei=prop.getProperty("JINGMEI");
		String music=prop.getProperty("MUSIC");
		String friend=prop.getProperty("FRIEND");
		String bigdata=prop.getProperty("BIGDATA");
		String wechat=prop.getProperty("WECHAT");
		String food=prop.getProperty("FOOD");
		String web=prop.getProperty("WEB");
		
		//先查询缓存
				try {
						//免去每次遍历一个板块就要去查一次redis
					if(sectionId==21 || sectionId==11 || sectionId==1 || sectionId==2 || sectionId==3 || sectionId==4 || 
							sectionId==7 || sectionId==8 || sectionId==11 || sectionId==12 || sectionId==13 || sectionId==14 || 
							sectionId==15 || sectionId==16 || sectionId==18 || sectionId== 19 || sectionId==20 ){
						String json=jedisClient.hget(token, sectionId+"");
						
						if(StringUtils.isNotBlank(json)){				
							String fields[]={"user","replyList","section","content"};	//配置json转义规则，防止解析嵌套对象出错
							JsonConfig config=new JsonConfig();						
							config.setExcludes(fields);
							ycList = JSONArray.toList(JSONArray.fromObject(json), new Topic(),config );//将json字符串转成list对象

							return ycList;												//2018.06.19 缓存中存在数据，取出，并终止程序向下进行
						}
					}								
				} catch (Exception e) {}	//获取redis中的数据，异常可以忽略	2019.08.19	miki
		
		//如果不存在，就先从数据库中读取，然后存入缓存
				
		if(sectionId==21 || sectionId==11 || sectionId==1 || sectionId==2 || sectionId==3 || sectionId==4 || 
				sectionId==7 || sectionId==8 || sectionId==12 || sectionId==13 || sectionId==14 || 
				sectionId==15 || sectionId==16 || sectionId==18 || sectionId== 19 || sectionId==20 ){					//只针对原创帖子做缓存
			hql="select topic.id,topic.title,topic.user.nickName,concat(topic.code,''),topic.user.id from Topic as topic where topic.section.id=? order by topic.publishTime desc";
		}else{
			hql= "from Topic as topic where topic.section.id=? order by topic.publishTime desc";
		}
		param.add(sectionId);
		ycList = baseDAO.findTopN(hql, param, 10);
		
		
		try {
			switch(sectionId){		
			case 21 :				
				jsonData = JSON.toJSONString(ycList);		//2018.07.12 将list转成json字符串
				jedisClient.hset(token,sectionId+"",jsonData);	//将json字符串放入redis中
				
				break;
			case 11 :			
				jsonData = JSON.toJSONString(ycList);		//2018.07.12 将list转成json字符串
				jedisClient.hset(advice,sectionId+"",jsonData);	//将json字符串放入redis中	
				
				break;
			case 1 :
				jsonData = JSON.toJSONString(ycList);		//2018.07.12 将list转成json字符串
				jedisClient.hset(java,sectionId+"",jsonData);	//将json字符串放入redis中				
				
				break;
			case 2 :
				jsonData = JSON.toJSONString(ycList);		//2018.07.12 将list转成json字符串
				jedisClient.hset(ershou,sectionId+"",jsonData);	//将json字符串放入redis中	

				break;
			case 3 :
				jsonData = JSON.toJSONString(ycList);		//2018.07.12 将list转成json字符串
				jedisClient.hset(say,sectionId+"",jsonData);	//将json字符串放入redis中	

				break;
			case 4 :
				jsonData = JSON.toJSONString(ycList);		//2018.07.12 将list转成json字符串
				jedisClient.hset(money,sectionId+"",jsonData);	//将json字符串放入redis中	

				break;
			case 7 :
				jsonData = JSON.toJSONString(ycList);		//2018.07.12 将list转成json字符串
				jedisClient.hset(job,sectionId+"",jsonData);	//将json字符串放入redis中		

				break;
			case 8 :
				jsonData = JSON.toJSONString(ycList);		//2018.07.12 将list转成json字符串
				jedisClient.hset(web,sectionId+"",jsonData);	//将web前端的json字符串放入redis中		

				break;		
			case 12 :
				jsonData = JSON.toJSONString(ycList);		//2018.07.12 将list转成json字符串
				jedisClient.hset(game,sectionId+"",jsonData);	//将游戏开发的json字符串放入redis中		

				break;
			case 13 :

				jsonData = JSON.toJSONString(ycList);		//2018.07.12 将list转成json字符串
				jedisClient.hset(jingmei,sectionId+"",jsonData);	//将精美小东西的json字符串放入redis中		

				break;
			case 14 :
				jsonData = JSON.toJSONString(ycList);		//2018.07.12 将list转成json字符串
				jedisClient.hset(music,sectionId+"",jsonData);	//将j音乐心灵的son字符串放入redis中		

				break;
			case 15 :
				jsonData = JSON.toJSONString(ycList);		//2018.07.12 将list转成json字符串
				jedisClient.hset(friend,sectionId+"",jsonData);	//将越伴出行json字符串放入redis中	

				break;
			case 16 :
				jsonData = JSON.toJSONString(ycList);		//2018.07.12 将list转成json字符串
				jedisClient.hset(bigdata,sectionId+"",jsonData);	//将大数据的json字符串放入redis中		

				break;
			case 18 :
				jsonData = JSON.toJSONString(ycList);		//2018.07.12 将list转成json字符串
				jedisClient.hset(wechat,sectionId+"",jsonData);	//将微信小程序开发的json字符串放入redis中	

				break;
			case 19 :
				jsonData = JSON.toJSONString(ycList);		//2018.07.12 将list转成json字符串
				jedisClient.hset(food,sectionId+"",jsonData);	//将美食美客json字符串放入redis中		

				break;
			case 20 :
				jsonData = JSON.toJSONString(ycList);		//2018.07.12 将list转成json字符串
				jedisClient.hset(code,sectionId+"",jsonData);	//将编程语言的json字符串放入redis中		

				break;
			}
		} catch (Exception e) {}   //写入redis异常可以忽略	2019.08.19	miki
				
		return ycList;
	}
	
					//计算没回复的帖子数量
	@Override
	public Long getNoReplyTopicCount(Topic s_topic) {
		List<Object> param=new LinkedList<Object>();	
		StringBuffer hql=new StringBuffer("select count(*) from Topic where id not in (select r.topic.id from Reply r)");
		if (s_topic!=null) {
			if (s_topic.getSection().getId()>0) {
				hql.append(" and sectionId=?");
				param.add(s_topic.getSection().getId());
			}
		}
		return baseDAO.count(hql.toString(), param);
	}
	
	//2017.05.04  版主推荐帖子列表
	public List<Topic> findGoodTopicList(Topic s_topic,
			PageBean pageBean) {
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Topic");
		
		hql.append(" and good=1 order by publishTime desc");
		if (pageBean!=null) {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
		}
	}
	
    //查找精华帖列表
	@Override
	public List<Topic> findGoodTopicListBySectionId(int sectionId,
			PageBean pageBean) {
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Topic");
		if (sectionId>0) {
			hql.append(" and sectionId=?");
			param.add(sectionId);
		}
		hql.append(" and good=1");
		if (pageBean!=null) {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
		}
	}
	
	//非精华帖列表
	@Override
	public List<Topic> findNotGoodTopicListBySectionId(int sectionId,
			PageBean pageBean) {
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Topic");
		if (sectionId>0) {
			hql.append(" and sectionId=?");
			param.add(sectionId);
		}
		hql.append(" and good=0");
		if (pageBean!=null) {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
		}
	}
	
	
	//计算普通帖子数目
	@Override
	public Long getPtTopicCountBySectionId(int sectionId) {
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select count(*) from Topic");
		if (sectionId>0) {
			hql.append(" and sectionId=?");
			param.add(sectionId);
		}
		hql.append(" and top=0"); 
		return baseDAO.count(hql.toString().replaceFirst("and", "where"), param);
	}
	
	//计算精华帖子数目
		@Override
		public Long getGoodTopicCountBySectionId(int sectionId) {
			List<Object> param=new LinkedList<Object>();
			StringBuffer hql=new StringBuffer("select count(*) from Topic");
			if (sectionId>0) {
				hql.append(" and sectionId=?");
				param.add(sectionId);
			}
			hql.append(" and top=1"); 
			return baseDAO.count(hql.toString().replaceFirst("and", "where"), param);
		}
	
	
	//根据版块计算帖子数目
	@Override
	public Long getTopicCountBySectionId(int sectionId) {
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select count(*) from Topic");
		if (sectionId>0) {
			hql.append(" and sectionId=?");
			param.add(sectionId);
		}
		return baseDAO.count(hql.toString().replaceFirst("and", "where"), param);
	}
	
	/**
	 * 2017.04.29
	 * miki
	 * 通过userId统计帖子列表
	 */
	@Override
	public List<Topic> findTopicListByUserId(int userId, PageBean pageBean) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Topic");
		if (userId>0) {
			hql.append(" and userId=?");
			param.add(userId);
		}
		hql.append(" order by publishTime desc");
		if (pageBean!=null) {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
		}
	}
	
	/**
	 * 2017.04.29
	 * miki
	 * 通过userId统计帖子数目
	 */
	@Override
	public Long getTopicCountByUserId(int userId) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select count(*) from Topic");
		if(userId>0){
			hql.append(" and userId=?");
			param.add(userId);
		}
		return baseDAO.count(hql.toString().replaceFirst("and", "where"), param);
	}
	
	/**
	 * 2017.05.12
	 * miki
	 * 通过userId,sectionId统计问答帖子列表
	 */
	@Override
	public List<Topic> getTopicListByUserId(int userId, PageBean pageBean) {
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Topic");
		if (userId>0) {
			hql.append(" and userId=?");
			hql.append(" and sectionId=11");
			param.add(userId);
		}
		hql.append(" order by publishTime desc");
		if (pageBean!=null) {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
		}
	}
	
	/**
	 * 2017.05.12
	 * miki
	 * 通过userId，sectionId统计问答帖子数目
	 */
	@Override
	public Long getAnswerCountByUserId(int userId) {
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select count(*) from Topic");
		if(userId>0){
			hql.append(" and userId=?");
			hql.append(" and sectionId=11");
			param.add(userId);
		}
		return baseDAO.count(hql.toString().replaceFirst("and", "where"), param);
	}


	@Override
	public List<Topic> getNewsList(int count) {
		// TODO Auto-generated method stub
		List<Object> param = new LinkedList<Object>();
		String hql = "from Topic as topic where topic.title not like '1' order by topic.publishTime desc";

		return baseDAO.findTopN(hql, param, count);
	}

	@Override
	public Topic getTopic(long code) {
		// TODO Auto-generated method stub
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Topic");
		if(code>0){
			hql.append(" and code=?");
			param.add(code);
		}
		return baseDAO.get(hql.toString().replaceFirst("and", "where"),param);
	}
	
	
}
