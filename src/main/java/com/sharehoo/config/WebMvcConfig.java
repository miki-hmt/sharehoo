package com.sharehoo.config;
import javax.servlet.http.HttpSessionListener;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.ServletListenerRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.sharehoo.interceptor.LoginHandlerInterceptor;
import com.sharehoo.listener.OnlineCounterListener;

/**
 * <b>类名称：</b>WebMvcConfig<br>
 * <b>类描述：</b>WebMvcConfigurer配置类<br>
 * <b>创建人：</b>Hsiao Lin<br>
 * <b>修改人：</b><br>
 * <b>修改时间：</b>2018年10月23日20:34:48<br>
 * <b>修改备注：</b><br>
 *
 * @version 1.0.0<br>
 */
@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
	
	private static Logger logger = org.slf4j.LoggerFactory.getLogger(WebMvcConfig.class);
	
	@Autowired
	private OnlineCounterListener sessionListener;
    /**
     * 自己定义的拦截器类
     */
    @Bean
    LoginHandlerInterceptor loginInterceptor() {
        return new LoginHandlerInterceptor();
    }

    /******************
     * 配置静态资源	2019.07.04	miki
     * 以独立的tomcat方式启动的项目，必须要手动指定资源文件加载路径，application.yml文件中配置的路径会无效
     *********************************************************************************************/
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/static/**").addResourceLocations("classpath:/static/");
        registry.addResourceHandler("/jsp/**").addResourceLocations("classpath:/WEB-INF/");			//添加jsp页面读取路径	 2019.07.04	miki
        registry.addResourceHandler("/public/**").addResourceLocations("classpath:/public/");
        registry.addResourceHandler("/templates/**").addResourceLocations("classpath:/templates/");
        
        WebMvcConfigurer.super.addResourceHandlers(registry);
    }

    /**
     * 添加拦截器
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 添加拦截器
        registry.addInterceptor(loginInterceptor())
                /// 添加拦截规则
	        .addPathPatterns("/admin/**")					//只拦截.html结尾的请求	2019.04.11	miki
	        .addPathPatterns("**/login")						//只拦截.html结尾的请求	2019.04.11	miki
	        // 排除拦截
			.excludePathPatterns("/*.html").excludePathPatterns("/*.htm");
        
        WebMvcConfigurer.super.addInterceptors(registry);
    }
    
    @Bean
    public ServletListenerRegistrationBean<HttpSessionListener> listenerRegist() {
        ServletListenerRegistrationBean<HttpSessionListener> srb = new ServletListenerRegistrationBean<HttpSessionListener>();
        srb.setListener(sessionListener);
        logger.info("注册session listener监听器...");
        return srb;
    }
}
