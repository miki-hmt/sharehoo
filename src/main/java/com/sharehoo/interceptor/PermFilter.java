package com.sharehoo.interceptor;

import java.io.IOException;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.sharehoo.config.lang.Consts;
import com.sharehoo.util.forum.StringUtil;
@WebFilter(urlPatterns = "/login/*", filterName = "permFilter")
public class PermFilter implements Filter{
	
	private static Logger logger = Logger.getLogger(PermFilter.class);
	private HttpServletRequest rq;
	private HttpServletResponse rs;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		logger.info("【用户验证拦截器初始化....】");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// 对request和response进行一些预处理
        if (null == request || null == response) {
            logger.error("request,response为null--------------------->");
        }
        if (null == request || null == response) {
            logger.error("request,rs为null--------------------->");
        }
        
        rq = (HttpServletRequest) request;
		rs = (HttpServletResponse) response;
        HttpSession session=rq.getSession();       			
		
		if (session!=null&&(session.getAttribute("admin")!=null || session.getAttribute(Consts.CURRENTUSER)!=null)) {		
			chain.doFilter(rq, rs); 
		}
		 
		//获取的数据判断不为空，struts执行下一步操作，即获取
		setGoingURL(rq, session, chain);
		chain.doFilter(rq, rs); 
		
	}
	
	/*
	 * setGoingURL()函数的声明定义
	 */
	private void setGoingURL(HttpServletRequest request, HttpSession session, FilterChain chain) {

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
			session.setAttribute("GOING_TO", null);
		} else {
			session.setAttribute("GOING_TO", url);
		}
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		logger.info("【用户验证拦截器销毁....】");
	}
}
