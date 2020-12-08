package com.sharehoo.config.aspect;
import com.alibaba.fastjson.JSONObject;
import com.sharehoo.config.lang.Consts;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.ObjectUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * @Author miki
 * @Description 用户是否登录的鉴权注解 *
 * @Date 14:48 2020/11/30
 * @Param
 * @return
 **/


@Component
@Aspect
@SuppressWarnings({"unused"})
public class HasLoginAspect {
	
	public static final Logger logger = LoggerFactory.getLogger(HasLoginAspect.class);

	public HasLoginAspect(){
	    logger.info("创建aop切面拦截...");
    }

    /**
     * 参数处理
     *
     * @param point
     */
    @Before("@annotation(com.sharehoo.config.annotation.HasLogin)")
    public void beforeProReq(JoinPoint point) {
        logger.info("前置拦截-开始");

        logger.info("前置拦截-结束");
    }


    @Around("@annotation(com.sharehoo.config.annotation.HasLogin)")
    public Object checkRequestHead(ProceedingJoinPoint joinPoint) throws Throwable {
        logger.debug("===>check access token start:{}", joinPoint.getArgs());
        long begin = System.nanoTime();

        HttpServletRequest request =
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        request.setCharacterEncoding("UTF-8");
        HttpServletResponse response =
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getResponse();

        HttpSession session = request.getSession();
        Object user= session.getAttribute(Consts.CURRENTUSER);

        String requestUri = request.getRequestURI();
        String requestMethod = request.getMethod();

        logger.info(
                "===>get the equest url:{}; and request method:{}; ",
                requestUri, requestMethod);

        long end = System.nanoTime();
        logger.info("API deal time log {}:{}",
                joinPoint.getTarget().getClass() + "." + joinPoint.getSignature().getName(),
                (end - begin) / 1000000);
        if(ObjectUtils.isEmpty(user)){
            response.sendRedirect("http://sharehoo.cn/login?prePage=http://sharehoo.cn" + requestUri);
            return null;
        }

        return joinPoint.proceed();
    }


    /**
     * 参数处理
     *
     * @param point
     */
    @After("@annotation(com.sharehoo.config.annotation.HasLogin)")
    public void afterProReq(JoinPoint point) {

        logger.info("登录校验拦截-结束");
    }
}
