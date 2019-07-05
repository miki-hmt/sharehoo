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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
        try {
            String url = request.getRequestURL().toString();
            String urlPre = "";
            if (!StringEx.isNull(url) && url.contains("/dip-web/")) {
                urlPre = url.substring(0, url.indexOf("/dip-web/"));
            }
            url = urlPre + "/dip-web/login.html";
            
        } catch (Exception e) {
            return false;
        }
        return true;
    }
}
