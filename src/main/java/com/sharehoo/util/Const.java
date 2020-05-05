package com.sharehoo.util;

import java.text.SimpleDateFormat;

/**
 * @ClassName: Const
 * @Description: TODO
 * @Author: limi
 * @Date: 2019/5/31
 */
public class Const {
    public static final String AGENTID = "1000008";
    public static final String SECRET = "ax0wnYawvAOal9Vs7bLKpibkI5BapSbaxcDt77TdiUw";
    public static final String CORPID = "wx61f5802a241df65b";
    public static final String QM = "?";
    public static final String URL = "https://qyapi.weixin.qq.com/cgi-bin/";//gettoken?";
    public static final String TYPE_GET_TOKEN_ = "gettoken";
    public static final String PARAMS_GET_TOKEN_ = "corpid={0}&corpsecret={1}";
    public static final String TYPE_GET_OPENID_ = "user/getuserinfo";
    public static final String PARAMS_GET_OPENID_ = "access_token={0}&code={1}";
    public static final String JUMP_URL_ = "https://open.weixin.qq.com/connect/oauth2/authorize";
    public static final String PARAMS_JUMP_ = "appid={0}&redirect_uri={1}&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect";
    public static final String EMPTY = "";
    public static final String FWP = "fwp";
    public static final SimpleDateFormat SDF = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    public static final SimpleDateFormat SDF_DATE = new SimpleDateFormat("yyyy-MM-dd");
}
