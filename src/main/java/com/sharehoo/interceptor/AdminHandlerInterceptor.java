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
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import com.sharehoo.config.lang.Consts;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 
* @ClassName: AdminHandlerInterceptor  
* @Description: TODO(对后台管理页面进行权限拦截，非登录用户不能访问)  
* @author miki
* @date 2020年11月28日 上午10:40:49  
*
 */
@Component
public class AdminHandlerInterceptor implements HandlerInterceptor{
    private static Logger logger = LoggerFactory.getLogger(AdminHandlerInterceptor.class);

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
		
		if (session!=null&&(session.getAttribute("admin")!=null || session.getAttribute(Consts.CURRENTUSER)!=null)) {		
			return true;
		}
		
		response.sendRedirect("/admin/go");
		return false;
    }
}
