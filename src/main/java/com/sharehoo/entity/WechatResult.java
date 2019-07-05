package com.sharehoo.entity;

/**
 * @ClassName: WechatResult
 * @Description: TODO
 * @Author: limi
 * @Date: 2019/6/5
 */
public class WechatResult {
    private int errcode;
    private String errmsg;
    private String access_token;
    private String UserId;

    public int getErrcode() {
        return errcode;
    }

    public void setErrcode(int errcode) {
        this.errcode = errcode;
    }

    public String getErrmsg() {
        return errmsg;
    }

    public void setErrmsg(String errmsg) {
        this.errmsg = errmsg;
    }

    public String getAccess_token() {
        return access_token;
    }

    public void setAccess_token(String access_token) {
        this.access_token = access_token;
    }

    public String getUserId() {
        return UserId;
    }

    public void setUserId(String userId) {
        UserId = userId;
    }
}
