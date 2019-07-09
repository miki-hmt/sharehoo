package com.sharehoo.dao.jedis.test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.sharehoo.dao.jedis.JedisClient;

/*
 * 2017.10.30 22:26 redis集群测试applicationContext-redis.xml文件
 */

public class JedisTest {
	
	@Test
	public void jedisClient()throws Exception{
		//初始化spring容器
		ApplicationContext applicationContext=new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
		
		//从容器中获得jedisClient对象
		JedisClient jedisClient=applicationContext.getBean(JedisClient.class);
		jedisClient.set("test3", "测绘师");
		System.out.println("测试结果为："+jedisClient.get("test3"));
	}
}
