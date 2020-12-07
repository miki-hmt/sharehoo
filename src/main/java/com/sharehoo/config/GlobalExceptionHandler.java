package com.sharehoo.config;

import com.sharehoo.base.exception.UserException;
import com.sharehoo.util.forum.E3Result;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 * @ClassName GlobalExceptionHandler
 * @Description controller层全局异常处理类
 * @Author miki
 * @Date 2020/12/7 14:30
 * @Version 1.0
 */

@ControllerAdvice(value = {"com.sharehoo.controller"})
public class GlobalExceptionHandler {

    private static final Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class.getName());

    /**
     * 处理自定义业务异常\底层的微服务业务异常
     */
    @ExceptionHandler(value = {UserException.class})
    @ResponseStatus(code = HttpStatus.CONFLICT)
    @ResponseBody
    public E3Result handleBusinessException(UserException ex) {
        logger.warn("请求异常-{}:{}", ex.getCode(), ex.getMessage());
        return E3Result.build(ex.getCode(), ex.getMessage(), ex.getData());
    }
}
