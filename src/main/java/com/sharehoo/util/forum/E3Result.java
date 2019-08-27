package com.sharehoo.util.forum;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 *2017.10.23 17:10	sharehoo自定义响应结构
 */
public class E3Result implements Serializable {

    // 定义jackson对象
    private static final ObjectMapper MAPPER = new ObjectMapper();
    
    /**
     * 401.1 – 未授权：登录失败
     * HTTP 404- 无法找到文件
		HTTP 405 – 资源被禁止
		HTTP 406 – 无法接受
		HTTP 407 – 要求代理身份验证
		HTTP 410 – 永远不可用
		HTTP 412 – 先决条件失败
		HTTP 414 – 请求 – URI 太长
		HTTP 500 – 内部服务器错误
		HTTP 500.100 – 内部服务器错误 – ASP 错误
		HTTP 500-11 服务器关闭
		HTTP 500-12 应用程序重新启动
		HTTP 500-13 – 服务器太忙
		HTTP 500-14 – 应用程序无效
		HTTP 500-15 – 不允许请求 global.asa
		Error 501 – 未实现
		HTTP 502 – 网关错误
     */
    
    // 响应业务状态
    private Integer status;
    
    // 响应消息
    private String msg;

    // 响应中的数据
    private Object data;

    public static E3Result build(Integer status, String msg, Object data) {
        return new E3Result(status, msg, data);
    }

    public static E3Result ok(Object data) {
        return new E3Result(data);
    }

    public static E3Result ok() {
        return new E3Result(null);
    }

    public E3Result() {

    }

    public static E3Result build(Integer status, String msg) {
        return new E3Result(status, msg, null);
    }

    public E3Result(Integer status, String msg, Object data) {
        this.status = status;
        this.msg = msg;
        this.data = data;
    }

    public E3Result(Object data) {
        this.status = 200;
        this.msg = "OK";
        this.data = data;
    }

//    public Boolean isOK() {
//        return this.status == 200;
//    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    /**
     * 将json结果集转化为Result对象
     * 
     * @param jsonData json数据
     * @param clazz TaotaoResult中的object类型
     * @return
     */
    public static E3Result formatToPojo(String jsonData, Class<?> clazz) {
        try {
            if (clazz == null) {
                return MAPPER.readValue(jsonData, E3Result.class);
            }
            JsonNode jsonNode = MAPPER.readTree(jsonData);
            JsonNode data = jsonNode.get("data");
            Object obj = null;
            if (clazz != null) {
                if (data.isObject()) {
                    obj = MAPPER.readValue(data.traverse(), clazz);
                } else if (data.isTextual()) {
                    obj = MAPPER.readValue(data.asText(), clazz);
                }
            }
            return build(jsonNode.get("status").intValue(), jsonNode.get("msg").asText(), obj);
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * 没有object对象的转化
     * 
     * @param json
     * @return
     */
    public static E3Result format(String json) {
        try {
            return MAPPER.readValue(json, E3Result.class);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Object是集合转化
     * 
     * @param jsonData json数据
     * @param clazz 集合中的类型
     * @return
     */
    public static E3Result formatToList(String jsonData, Class<?> clazz) {
        try {
            JsonNode jsonNode = MAPPER.readTree(jsonData);
            JsonNode data = jsonNode.get("data");
            Object obj = null;
            if (data.isArray() && data.size() > 0) {
                obj = MAPPER.readValue(data.traverse(),
                        MAPPER.getTypeFactory().constructCollectionType(List.class, clazz));
            }
            return build(jsonNode.get("status").intValue(), jsonNode.get("msg").asText(), obj);
        } catch (Exception e) {
            return null;
        }
    }

}
