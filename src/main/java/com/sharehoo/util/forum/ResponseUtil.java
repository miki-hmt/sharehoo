package com.sharehoo.util.forum;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

/*
 * 2016.07.23
 * miik
 * 编码格式设置功能类
 */
public class ResponseUtil {

	public static void write(HttpServletResponse response,Object o)throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		out.println(o.toString());
		out.flush();
		out.close();
	}
}
