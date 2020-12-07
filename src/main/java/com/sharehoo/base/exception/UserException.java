package com.sharehoo.base.exception;

import com.sharehoo.util.forum.E3Result;

/**
 * @ClassName UserException
 * @Description TODO
 * @Author miki
 * @Date 2020/12/7 14:33
 * @Version 1.0
 */
public class UserException extends RuntimeException{

    /**
     * 异常编码
     */
    private Integer code;

    /**
     * 异常内容
     */
    private String message;

    /**
     * 数据
     */
    private Object data;

    public UserException() {
        super();
    }

    public UserException(E3Result result){
        this.code = result.getStatus();
        this.message = result.getMsg();
    }

    public UserException(Integer code, String message) {
        this.code = code;
        this.message = message;
    }

    public UserException(Integer code, String message, Object data) {
        this.code = code;
        this.message = message;
        this.data = data;
    }

    public UserException(Throwable cause) {
        super(cause);
    }

    public UserException(String message, Throwable cause) {
        super(message, cause);
    }

    public Integer getCode() {
        return code;
    }

    @Override
    public String getMessage() {
        return message;
    }

    public Object getData() {
        return data;
    }
}
