package com.sharehoo.dao.jedis.test;

import java.util.HashSet;
import java.util.Set;

import org.junit.Test;

import redis.clients.jedis.HostAndPort;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisCluster;

public class JedisTest2 {
	
	//通过java程序访问数据库
	
	@Test
	public void test(){
		
		//0.导入jedis-2.7.0.jar和commons-pool2-2-2.3.jar
		
		//1.获取连接对象
		Jedis jedis=new Jedis("134.175.1.32",6379);
		
		//2.获得数据
		jedis.get("username");
		
		//3.插入数据
		jedis.set("sex", "男");
		System.out.println("取得的名字为："+jedis.get("username")+"性别："+jedis.get("sex"));
	}
	
	
	
	/*
	 * 集群测试 	2017.10.30 22:30
	 */
	@Test
	public void testJedisCluster()throws Exception{
		//创建一个jedisCluster集群对象，有一个参数node是set型，set中包含若干hostAndPort对象
		Set<HostAndPort> nodes=new HashSet<>();
		nodes.add(new HostAndPort("192.168.125.128", 7001));
		nodes.add(new HostAndPort("192.168.125.128", 7002));
		nodes.add(new HostAndPort("192.168.125.128", 7003));
		nodes.add(new HostAndPort("192.168.125.128", 7004));
		nodes.add(new HostAndPort("192.168.125.128", 7005));
		nodes.add(new HostAndPort("192.168.125.128", 7006));
		
		JedisCluster jedisCluster=new JedisCluster(nodes);
		
		//直接使用jedisCluster对象
		jedisCluster.set("teed", "888哈哈哈");
		String ss=jedisCluster.get("tee");
		System.out.println(ss);
		
		//关闭jedisCluster对象
		jedisCluster.close();
	}
}
