package com.sharehoo.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.apache.log4j.Logger;

@WebListener
public class StartListener implements ServletContextListener{
	private Logger logger = Logger.getLogger(StartListener.class);
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		logger.info("监听器销毁...");
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		logger.info("监听器初始化...");
	}

}
