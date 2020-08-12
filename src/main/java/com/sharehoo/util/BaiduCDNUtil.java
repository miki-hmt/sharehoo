package com.sharehoo.util;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.springframework.web.client.RestTemplate;

import com.baidu.yunjiasu.openapi.client.Reports;
import com.baidu.yunjiasu.openapi.client.SuClientConfig;
import com.baidu.yunjiasu.openapi.exception.WebBackendException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.exceptions.UnirestException;


/**
 * 云加速openapi接入Demo
 */
public class BaiduCDNUtil {
	
	public static SuClientConfig SU_CLIENT_CONFIG = null;

    static {
        SU_CLIENT_CONFIG = new SuClientConfig();
        SU_CLIENT_CONFIG.setAccessKey("30fa7ff1a37b4a238c2a7e4ab8d6998f");
        SU_CLIENT_CONFIG.setSecretKey("877f618c7f324949be38ef547645b220");
        SU_CLIENT_CONFIG.setEndpoint("api.su.baidu.com");
    }
	
	// openapi地址
    private static final String OPENAPI_BASE_URL = "https://api.su.baidu.com/%s";

    // 此处填写您实际的access_key
    private static final String ACCESS_KEY = "30fa7ff1a37b4a238c2a7e4ab8d6998f";

    // 此处填写您实际的secret_key
    private static final String SECRET_KEY = "877f618c7f324949be38ef547645b220";

    // 签名算法
    private static final String SIGN_METHOD = "HMAC-SHA1";
    
    //2020.03.15 miki 网站域名
    private static final String DOMAIN = "sharehoo.cn";

    // Map转JSON
    private static ObjectMapper objectMapper = new ObjectMapper();

    /**
     * 设置公共参数
     *
     * @param authPathInfo
     * @return
     */
    private static Map<String, String> getInitedCommonParamsMap(String authPathInfo) {
        String authTimestamp = String.valueOf(System.currentTimeMillis() / 1000);

        Map<String, String> paramMap = new HashMap<String, String>();

        paramMap.put("X-Auth-Access-Key", ACCESS_KEY);
        paramMap.put("X-Auth-Nonce", authTimestamp);
        paramMap.put("X-Auth-Path-Info", authPathInfo);
        paramMap.put("X-Auth-Signature-Method", SIGN_METHOD);
        paramMap.put("X-Auth-Timestamp", authTimestamp);

        return paramMap;
    }

    /**
     * 排序并拼接参数
     *
     * @param paramMap
     * @return 排序并已拼接完成的参数列表字符串
     */
    private static String getParsedAllParams(Map<String, String> paramMap) {
        List<String> paramList = new ArrayList<String>();

        for (Map.Entry<String, String> entry : paramMap.entrySet()) {
            paramList.add(entry.getKey() + "=" + entry.getValue());
        }

        Collections.sort(paramList);

        StringBuilder params = new StringBuilder();
        for (String param : paramList) {
            params.append(param);
            params.append("&");
        }

        int len = params.length();

        params = params.replace(len - 1, len, "");

        return params.toString();
    }
    
    
    /**
     * 排序并拼接参数
     *
     * @param paramMap
     * @return 排序并已拼接完成的参数列表字符串
     */
    private static String getParsedAllParamObjects(Map<String, Object> paramMap) {
    	List<String> paramList = new ArrayList<String>();
    	
    	for (Map.Entry<String, Object> entry : paramMap.entrySet()) {
    		paramList.add(entry.getKey() + "=" + entry.getValue());
    	}
    	
    	Collections.sort(paramList);
    	
    	StringBuilder params = new StringBuilder();
    	for (String param : paramList) {
    		params.append(param);
    		params.append("&");
    	}
    	
    	int len = params.length();
    	
    	params = params.replace(len - 1, len, "");
    	
    	return params.toString();
    }

    /**
     * 获取请求的header
     *
     * @param path
     * @param bizParamsMap
     * @return header
     */
    private static Map<String, String> getRequestHeader(String path, Map<String, String> bizParamsMap) {
        Map<String, String> commonParamsMap = getInitedCommonParamsMap(path);
        Map<String, String> allParamsMap = new HashMap<String, String>();
        Map<String, String> headersMap = new HashMap<String, String>();

        headersMap.putAll(commonParamsMap);

        allParamsMap.putAll(commonParamsMap);
        allParamsMap.putAll(bizParamsMap);

        String allParamsStr = getParsedAllParams(allParamsMap);
        System.out.println(allParamsStr);

        String sign = getSignature(allParamsStr, SECRET_KEY);
        System.out.println(sign);

        headersMap.put("X-Auth-Sign", sign);

        return headersMap;
    }

    /**
     * 获取签名
     *
     * @param data 待签名数据
     * @param key 秘钥
     * @return HmacSHA1签名Base64字符串
     */
    private static String getSignature(String data, String key) {
        try {
            byte[] keyBytes = key.getBytes();
            SecretKeySpec signingKey = new SecretKeySpec(keyBytes, "HmacSHA1");
            Mac mac = Mac.getInstance("HmacSHA1");
            mac.init(signingKey);

            byte[] rawHmac = mac.doFinal(data.getBytes());

            return Base64.getEncoder().encodeToString(rawHmac);
        } catch (InvalidKeyException e) {
            e.printStackTrace();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (IllegalStateException e) {
            e.printStackTrace();
        }

        return null;
    }

    /**
     * 接入Zone demo
     */
    private static void createZone() {
        String path = "v31/yjs/zones";		//
        Map<String, String> bizParamsMap = new HashMap<String, String>();
        bizParamsMap.put("domain", DOMAIN);
        bizParamsMap.put("type", "ns");

        Map<String, String> headersMap = getRequestHeader(path, bizParamsMap);

        try {
            HttpResponse<String> resp = Unirest.post(String.format(OPENAPI_BASE_URL, path)).headers(headersMap)
                    .body(objectMapper.writeValueAsString(bizParamsMap)).asString();

            System.out.println(resp.getBody());
        } catch (UnirestException e) {
            e.printStackTrace();
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
    }
    
    /**
    * @Title: createZone  
    * @Description: TODO(获取站点访问信息，pv，ip数)  
    * @author miki 
    * @date 2020年3月15日 下午10:40:10   
    * @throws
     */
    private static void getSummarycount() {
    	String path = "v31/yjs/analytics/summarycount";		//v31/yjs/zones
    	Map<String, String> bizParamsMap = new HashMap<String, String>();
    	bizParamsMap.put("domain", DOMAIN);
//    	bizParamsMap.put("type", "ns");
    	bizParamsMap.put("ztype", "zone");
    	bizParamsMap.put("interval", "day");
    	bizParamsMap.put("create_on__gte", "2020-03-14T00:00:00%2008:00");
    	bizParamsMap.put("${fields}", "req_total,req_ori");
    	
    	Map<String, String> headersMap = getRequestHeader(path, bizParamsMap);
    	
    	try {
    		HttpResponse<String> resp = Unirest.post(String.format(OPENAPI_BASE_URL, path)).headers(headersMap)
    				.body(objectMapper.writeValueAsString(bizParamsMap)).asString();
    		
    		System.out.println(resp.getBody());
    	} catch (UnirestException e) {
    		e.printStackTrace();
    	} catch (JsonProcessingException e) {
    		e.printStackTrace();
    	}
    }
    
    public static void testMultiCount() {
        try {
            Map<String, Object> params = new HashMap<String, Object>();
            params.put("domain", "sharehoo.cn");
            params.put("ztype", "zone");
            params.put("interval", "day");
            params.put("create_on__gte", "2020-03-14T00:00:00%2008:00");
            params.put("fields", "waf,pv,uv,cc");
            //getSignature(data, key);
            String sign = getSignature(getParsedAllParamObjects(params), SECRET_KEY);
            System.out.println(sign);

            params.put("X-Auth-Sign", sign);
            Map<String, Object> result = new Reports(SU_CLIENT_CONFIG).multiCount(params);
            System.out.println("结果："+new Gson().toJson(result));
        } catch (WebBackendException e) {
            e.printStackTrace();

        }
    }

    public static void main(String[] args) {
        //createZone();
    	//getSummarycount();
    	RestTemplate restTemplate = new RestTemplate();
    	String object = restTemplate.postForObject("http://data.zz.baidu.com/urls?site=sharehoo.cn&token=9HGKQrZomkrKHdUU", null,String.class);
    	//testMultiCount();
    	System.out.println("***"+object);
    }
}
