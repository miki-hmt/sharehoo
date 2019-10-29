package com.sharehoo.util;

import java.io.FileNotFoundException;

import org.apache.log4j.Logger;
import org.springframework.util.ResourceUtils;

public class BootPathUtil {
	private static Logger logger =Logger.getLogger(BootPathUtil.class);
	
	/**
	* @Title: getStaticPath  
	* @Description: TODO(获取static的绝对路径)  
	* @author miki 
	* @date 2019年8月28日 下午8:24:40   
	* @throws
	 */
	public static String getStaticPath() {
		try {
			String path = ResourceUtils.getURL("classpath:static").getPath().replace("%20"," ");
			path = path.substring(1);
			
			return path;
		} catch (FileNotFoundException e) {
			logger.error(e);
			e.printStackTrace();
		}
		return "";
	}
}
