package com.sharehoo.listener;
import java.util.Date;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.sharehoo.config.lang.Consts;
import com.sharehoo.util.BootPathUtil;
import com.sharehoo.util.CxCacheUtil;
import com.sharehoo.util.forum.Counter;

/**
 * @author miki
 * 2017.03.25,此类的创建是实现监听网站在线人数的功能 ，创建session对象时，调用函数使人数+1
 * 再然后，把这个HttpSessionListener实现类注册到网站应用中，也就是在网站应用的web.xml中加入如下内容：         
 */
@WebListener
public class OnlineCounterListener implements HttpSessionListener {
	
	public int count=0;//记录session的数量
	
	//监听session的创建,synchronized 防并发bug
	@Override
	public synchronized void sessionCreated(HttpSessionEvent hse) {
		count++;
		hse.getSession().getServletContext().setAttribute(Consts.ONLINEUSER, count);
		
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
		
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent hse) {
		if(count>0) {
			count--;
		}else {
			count = 1;
		}
		hse.getSession().getServletContext().setAttribute(Consts.ONLINEUSER, count);
	}
	
}
