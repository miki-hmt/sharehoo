package com.sharehoo.listener;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.connection.DataType;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.SetOperations;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;
import com.sharehoo.config.lang.Consts;
import com.sharehoo.entity.forum.User;
import com.sharehoo.util.BootPathUtil;
import com.sharehoo.util.CxCacheUtil;
import com.sharehoo.util.forum.Counter;

/**
 * @author miki
 * 2017.03.25,此类的创建是实现监听网站在线人数的功能 ，创建session对象时，调用函数使人数+1
 * 再然后，把这个HttpSessionListener实现类注册到网站应用中，也就是在网站应用的web.xml中加入如下内容：
 * 二次改造：2020.09.05 miki 不需要再加@webListener注解    
 * 参考链接：https://www.cnblogs.com/even247/articles/9134895.html    
 */
@Component
public class OnlineCounterListener implements HttpSessionListener {
	
	private static Logger logger = LoggerFactory.getLogger(OnlineCounterListener.class);
	
	public int count=0;//记录session的数量
	@Autowired
    private RedisTemplate redisTemplate;
    @Autowired
    private StringRedisTemplate stringRedisTemplate;
	
	
	//监听session的创建,synchronized 防并发bug
	@Override
	public synchronized void sessionCreated(HttpSessionEvent hse) {
		
		int number = 0;
		HttpSession session = hse.getSession();
        //去redis中根据sessionId获取
        @SuppressWarnings("unchecked")
		Set<Object> set = redisTemplate.keys("spring:session:sessions*");	//"*" + session.getId() + "*"
        ArrayList<Object> list = new ArrayList<>(set);
        for (int i = 0; i < list.size(); i++) {
            String key = list.get(i).toString();
            //判断是否hash类型 并且判断是否是有效的用户session
            if (redisTemplate.type(key) == DataType.HASH) {
                Map<String, Object> map = redisTemplate.opsForHash().entries(key);
                if (map.containsKey(Consts.SESSION_USER_CODE)) {
                	number++;
                	logger.info("用户登录后产生的session增加用户数");
                    //存储用户hash
                    //saveUserOnlineHash((User) map.get(Consts.SESSION_USER_CODE));
                }
            }
        }
        if(number > 0) {
        	setOnlineUserNumber(number);
            logger.info("创建了一个Session连接:[" + session.getId() + "]");
        }
        		
  		//################################old 旧的获取在线人数的方式########################################################################################
		//count++;
		//hse.getSession().getServletContext().setAttribute(Consts.ONLINEUSER, count);
        //一天的用户数
		setAllUserNumber(+1);
		
		//************ 记录访问总数
		//获取项目的static根路径  
    	String staticPath = BootPathUtil.getStaticPath();
		long total = Counter.readFromFile(staticPath +"/count.txt");
		total++;
		Counter.write2File(staticPath +"/count.txt", total);
		
		//************ 记录当天访问总数
		String now = Consts.SDF_YYYYMMDD.format(new Date());
		
		if(now.equals(String.valueOf(CxCacheUtil.getIntance().getValue(Consts.NOWDATE)))){		//1. 如果是同一天，每创建一个session总数+1
			Object value = CxCacheUtil.getIntance().getValue(Consts.DAYONLINEUSER);
			long daynum = Long.parseLong(String.valueOf(value));
			daynum++;
			CxCacheUtil.getIntance().setValue(Consts.DAYONLINEUSER,daynum);
		}else {																					//2. 如果不是同一天，初始化session，初始化当天总数
			CxCacheUtil.getIntance().setValue(Consts.NOWDATE, now);
			CxCacheUtil.getIntance().setValue(Consts.DAYONLINEUSER,1);
		}
		
	}/**
     * session销毁
    *
    * @param event
    */
   @Override
   public void sessionDestroyed(HttpSessionEvent event) {
       boolean flag = true;
       HttpSession session = event.getSession();
       Set<String> keys = redisTemplate.keys("*" + session.getId() + "*");
       ArrayList<Object> removelist = new ArrayList<>(keys);
       for (int i = 0; i < removelist.size(); i++) {
           String key = removelist.get(i).toString();
           //判断是否hash类型 并且判断是否是有效的用户session
           if (redisTemplate.type(key) == DataType.HASH) {
               Map<String, Object> map = redisTemplate.opsForHash().entries(key);
               List<String> mapKeys = new ArrayList<String>(map.keySet());
               for (int j = 0; j < mapKeys.size(); j++) {

                   if (mapKeys.get(j).indexOf(Consts.VERIFICATION) != -1) {
                	   logger.info("验证码产生的session不减用户数");
                       flag = false;
                       break;
                   }
               }
           }
       }
       redisTemplate.delete(keys);
       Set<Object> set = redisTemplate.keys("spring:session:ianbase:expirations*");
       ArrayList<Object> list = new ArrayList<>(set);
       for (int i = 0; i < list.size(); i++) {
           String key = String.valueOf(list.get(i));
           //删除set
           if (redisTemplate.type(key) == DataType.SET) {
               SetOperations<String, String> vo = redisTemplate.opsForSet();
               Iterator<String> it = vo.members(key).iterator();
               while (it.hasNext()) {
                   if (it.next().indexOf(session.getId().toString()) != -1) {
                       System.out.println(key+"................");
                       redisTemplate.delete(key);
                       logger.info("删除成功了");
                   }
               }
           }
       }
       System.out.println("销毁了一个Session连接:[" + session.getId() + "]");
       if (getAllUserNumber() > 0 && flag) {
           removeOnlineHashBySessionId(session.getId().toString());
       }
   }

   /**
    * 保存用户数
    *
    * @param n
    */
   private void setAllUserNumber(int n) {
       Long number = getAllUserNumber() + n;
       if (number >= 0) {
//           logger.info("用户数：" + number);
           logger.info("用户数：" + number);
           stringRedisTemplate.opsForValue().set(Consts.ALLUSER_NUMBER, String.valueOf(number));
       }
   }
   
   private void setOnlineUserNumber(int number) {
       if (number >= 0) {
//           logger.info("用户数：" + number);
           logger.info("用户数：" + number);
           stringRedisTemplate.opsForValue().set(Consts.ONLINE_USERS_NUMBER, String.valueOf(number));
       }
   }

   /**
    * 获取登录用户数目
    *
    * @return
    */
   public Long getAllUserNumber() {
       Object v = stringRedisTemplate.opsForValue().get(Consts.ALLUSER_NUMBER);
       if (v != null) {
           return Long.valueOf(v.toString());
       }
       return 0L;
   }
   
   public Long getOnlineUserNumber() {
       Object v = stringRedisTemplate.opsForValue().get(Consts.ONLINE_USERS_NUMBER);
       if (v != null) {
           return Long.valueOf(v.toString());
       }
       return 0L;
   }
   
   public void saveUserOnlineHash(User sysUser){
	   
	   String userId = String.valueOf(sysUser.getId());
       Map<String,User> onlineUsers = null;
       if(redisTemplate.opsForHash().entries(Consts.ONLINE_USERS)!=null){
           onlineUsers = redisTemplate.opsForHash().entries(Consts.ONLINE_USERS);
           if(!onlineUsers.keySet().contains(userId)){
               setAllUserNumber(+1);
           }
           onlineUsers.put(userId, sysUser);
           redisTemplate.opsForHash().putAll(Consts.ONLINE_USERS,onlineUsers);
       }else{
           onlineUsers = new HashMap<>();
           if(!onlineUsers.keySet().contains(userId)){
               setAllUserNumber(+1);
           }
           onlineUsers.put(userId, sysUser);
           redisTemplate.opsForHash().putAll(Consts.ONLINE_USERS,onlineUsers);
       }

   }
   public void removeOnlineHashBySessionId(String sesssionId){
       if(redisTemplate.opsForHash().entries(Consts.ONLINE_USERS)!=null){
           Map<String,User> onlineUsers = redisTemplate.opsForHash().entries(Consts.ONLINE_USERS);
           if(onlineUsers.keySet().contains(sesssionId)){
               setAllUserNumber(-1);
           }
           onlineUsers.remove(sesssionId);
           redisTemplate.delete(Consts.ONLINE_USERS);
           redisTemplate.opsForHash().putAll(Consts.ONLINE_USERS,onlineUsers);
       }
   }

//	@Override
//	public void sessionDestroyed(HttpSessionEvent hse) {
//		if(count>0) {
//			count--;
//		}else {
//			count = 1;
//		}
//		hse.getSession().getServletContext().setAttribute(Consts.ONLINEUSER, count);
//	}
	
}
