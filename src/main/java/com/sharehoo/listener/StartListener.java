package com.sharehoo.listener;

import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

import com.sharehoo.config.lang.Consts;
import com.sharehoo.util.CxCacheUtil;
@Configuration
@WebListener
public class StartListener implements ServletContextListener{
	private Logger logger = Logger.getLogger(StartListener.class);
	
	//************ 使用该标签，要加上@Configuration，否则取不到值
	@Value("${spring.site.store.host}")
	private String host;
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		logger.info("监听器初始化...");
		String path = System.getProperty("catalina.home").replace("\\", "/");
		CxCacheUtil.getIntance().setValue(Consts.ROOT_PATH, path);
		ServletContext ct = sce.getServletContext();
		ct.setAttribute("basePath", path);
		String sectionPath = path + Consts.FORUM_UPLOAD_PATH + Consts.FORUM_UPLOAD_SECTION_FOLDER;
		ct.setAttribute("sectionPath", sectionPath);
		
		String topicPath = path + Consts.FORUM_CKEDITOR_UPLOAD_PATH +"/"+Consts.SDF_YYYYMM.format(new Date());
		ct.setAttribute("topicPath", topicPath);
		
		String softPath = path + Consts.FORUM_UPLOAD_PATH +"/"+Consts.FORUM_UPLOAD_SOFT_FOLDER +"/" + Consts.SDF_YYYYMM.format(new Date());
		ct.setAttribute("softPath", softPath);
		logger.info("网站域名："+host);
		/***********
		 * 将域名存放到全局变量中
		 * *******************************/
		ct.setAttribute("host", host);		
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		logger.info("监听器销毁...");
	}

}
