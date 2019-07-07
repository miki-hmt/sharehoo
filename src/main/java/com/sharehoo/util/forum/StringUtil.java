package com.sharehoo.util.forum;

/**
 * 字符串工具类
 * @author 
 *
 */
public class StringUtil {

	/**
	 * 判断是否是空
	 * @param str
	 * @return
	 */
	public static boolean isEmpty(String str){
		if(str==null||"".equals(str.trim())){
			return true;
		}else{
			return false;
		}
	}
	
	/**
	 * 判断是否不是空
	 * @param str
	 * @return
	 */
	public static boolean isNotEmpty(String str){
		if((str!=null)&&!"".equals(str.trim())){
			return true;
		}else{
			return false;
		}
	}
	/**
	 * 得到URL中字符串参数，只适合URL中有一个参数
	 * @param url
	 * @return
	 */
	public static String getParamFromUrl(String url){
		String afterQuestion=url.substring(url.indexOf("?")+1);
		return afterQuestion.substring(afterQuestion.indexOf("=")+1);
	}
}
