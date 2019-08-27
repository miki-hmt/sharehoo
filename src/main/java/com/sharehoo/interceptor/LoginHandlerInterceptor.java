/*
 * Copyright 2017 Hsiao Lin Studio
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.sharehoo.interceptor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.sharehoo.util.StringEx;
import com.sharehoo.util.forum.StringUtil;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginHandlerInterceptor extends HandlerInterceptorAdapter {
    private static Logger logger = LoggerFactory.getLogger(LoginHandlerInterceptor.class);

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 对request和response进行一些预处理
        if (null == request || null == response) {
            logger.error("request,response为null--------------------->");
        }
        if (null == request || null == response) {
            logger.error("request,rs为null--------------------->");
        }     
        HttpSession session=request.getSession();       			
		
		if (session!=null&&session.getAttribute("admin")!=null) {		
			return true; 
		}
		 
		//获取的数据判断不为空，struts执行下一步操作，即获取
		setGoingURL(request, session, true);
		return true;
    }
    
    
	/*
	 * setGoingURL()函数的声明定义
	 */
	private void setGoingURL(HttpServletRequest request, HttpSession session, Boolean invocation) {

		//如果refer不为空，直接使用它。如果为空我们分别获得命名空间，action名，以及请求参数，重新构造成一个URL保存在SESSION中
		String url = request.getHeader("referer");
		String url2;
		if (url == null || url.equals("")) {
			url = "";
			String path = request.getContextPath();
			
			Map<String, String[]> zzMap = request.getParameterMap();
			if (zzMap != null) {
				for (String s : zzMap.keySet()) {
					String[] value = zzMap.get(s);
					for (String val : value) {
						url = url + s + "=" + val + "&";
					}
				}
			}
		}
		if (url.indexOf("prePage") > 0) {
			url2 = StringUtil.getParamFromUrl(url);
			session.setAttribute("prepareGoingTo", url2);
			session.setAttribute("backGoingTo", url);
		} else {
			session.setAttribute("GOING_TO", url);
		}
	}
    
}
