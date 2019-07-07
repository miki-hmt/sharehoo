package com.sharehoo.util.forum;

/**
 * 导航工具类
 * @author Administrator
 *
 */
public class NavUtil {

	/**
	 * 生成导航代码
	 * @param subName
	 * @return
	 */
	public static String genNavCode(String subName){
		StringBuffer navCode=new StringBuffer();
		navCode.append("您现在的位置：");
		navCode.append("<a href='index.jsp'>首页</a>&nbsp;");
		navCode.append("&gt; ");
		navCode.append(subName);
		return navCode.toString();
	}
}
