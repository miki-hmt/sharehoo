package com.sharehoo.config;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import com.sharehoo.base.exception.BusinessException;
import com.sharehoo.base.exception.UserException;
import com.sharehoo.util.ServletUtils;
import com.sharehoo.util.forum.E3Result;

/**
 * @ClassName GlobalExceptionHandler
 * @Description controller全局异常处理类
 * @Author miki
 * @Date 2020/12/7 14:30
 * @Version 1.0
 */

@ControllerAdvice(value = {"com.sharehoo.controller"})
public class GlobalExceptionHandler {

    private static final Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class.getName());

    /**
     * 1.处理自定义业务异常\底层的微服务业务异常
     */
    @ExceptionHandler(value = {UserException.class})
    @ResponseStatus(code = HttpStatus.CONFLICT)
    @ResponseBody
    public E3Result handleBusinessException(UserException ex) {
        logger.warn("请求异常-{}:{}", ex.getCode(), ex.getMessage());
        return E3Result.build(ex.getCode(), ex.getMessage(), ex.getData());
    }
    
    /**
     * 2.顶级异常捕获处理
     */
    @ExceptionHandler(value = {Exception.class})
    @ResponseStatus(code = HttpStatus.CONFLICT)
    @ResponseBody
    public E3Result handleException(Exception ex) {
    	if(ex instanceof NullPointerException) {
    		logger.warn("空指针异常}:{}", ex.getMessage());
    	}     
        return E3Result.build(401, ex.getMessage());
    }
    
    /**
	 * 拦截未知的运行时异常
	 */
	@ExceptionHandler(RuntimeException.class)
	public E3Result notFount(RuntimeException e) {
		logger.error("运行时异常:{}");
		return E3Result.build(401, e.getMessage());
	}

	/**
	 * 业务异常
	 */
	@ExceptionHandler(BusinessException.class)
	public Object businessException(HttpServletRequest request, BusinessException e) {
		logger.error("页面不存在，出现空指针异常{}",e.getMessage());
		if (ServletUtils.isAjaxRequest(request)) {
			return E3Result.build(401, e.getMessage());
		} else {
			String requestUri = request.getRequestURI();
	        String requestMethod = request.getMethod();

	        logger.info(
	                "错误请求地址===>get the equest url:{}; and request method:{}; ",
	                requestUri, requestMethod);
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.addObject("errorMessage", e.getMessage());
			modelAndView.setViewName("bug/2bug");
			return modelAndView;
		}
	}
}
