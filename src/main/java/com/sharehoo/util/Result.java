package com.sharehoo.util;

import com.google.gson.Gson;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Result {

    private transient Logger logger = LoggerFactory.getLogger(Result.class);

    public enum STATUS {
        OK(0),     //"成功"
        ERROR(1),  //"错误"
        WARNING(2),//"警告"
        INFO(3);   //"信息"
        private int value;

        private STATUS(int value) {
            this.value = value;
        }

        public int getValue() {
            return value;
        }
    }

    private String msg = Const.EMPTY;
    private int status = STATUS.OK.getValue();
    private Object data = Const.EMPTY;

    public Result() {
        super();
    }

    public Result(Object data) {
        this.data = data;
    }

    public Result(STATUS status) {
        this.status = status.getValue();
    }

    public Result(STATUS status, String msg) {
        this.status = status.getValue();
        this.msg = msg;
    }

    public Result(Exception e) {
        logger.error("", e);
        this.status = STATUS.ERROR.getValue();
        StackTraceElement ste = e.getStackTrace()[0];
        this.msg = "错误:[" + e.getMessage() + "]发生于[" + ste.getClassName() + "]类[" + ste.getMethodName() + "]方法[" + ste.getLineNumber() + "]行";
    }

    public int status() {
        return status;
    }

    public Object get() {
        if (!StringEx.isNull(data))
            return data;
        else return msg;
    }


    public void setError(String error) {
        this.status = STATUS.ERROR.getValue();
        this.msg = error;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public void setError(Exception e) {
        logger.error("", e);
        this.status = STATUS.ERROR.getValue();
        StackTraceElement ste = e.getStackTrace()[0];
        this.msg = "错误:[" + e.getMessage() + "]发生于[" + ste.getClassName() + "]类[" + ste.getMethodName() + "]方法[" + ste.getLineNumber() + "]行";
    }

    public Object getData() {
        return this.data;
    }

    public String getResult() {
        if (null == data)
            data = Const.EMPTY;
        return new Gson().toJson(this);
    }

    /**
     * 判断Result成功
     */
    public boolean isOk() {
        return this.status == STATUS.OK.getValue();
    }
}
