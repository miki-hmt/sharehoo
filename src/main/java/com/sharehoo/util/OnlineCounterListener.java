package com.sharehoo.util;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.sharehoo.interceptor.OnlineCounter;


/**
 * 
 * @author miki
 * 2017.03.25,此类的创建是实现监听网站在线人数的功能 ，创建session对象时，调用函数使人数+1
 * 再然后，把这个HttpSessionListener实现类注册到网站应用中，也就是在网站应用的web.xml中加入如下内容：    
      <listener>   
      
          <listener-class>  
             accp.OnlineCounterListener  
         </listener-class>  
         
      </listener> 
        
 *
 */




public class OnlineCounterListener implements HttpSessionListener {

	@Override
	public void sessionCreated(HttpSessionEvent hse) {
		// TODO Auto-generated method stub
		OnlineCounter.raise();
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent hse) {
		// TODO Auto-generated method stub
		OnlineCounter.reduce();
	}
	
}
