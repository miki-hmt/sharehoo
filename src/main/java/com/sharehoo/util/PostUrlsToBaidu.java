package com.sharehoo.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.List;
import java.util.Vector;

import com.alibaba.fastjson.JSONObject;

public class PostUrlsToBaidu {
	
	private static String zzApiUrl = "http://data.zz.baidu.com/urls?site=sharehoo.cn&token=9HGKQrZomkrKHdUU"; //从百度站长平台获取接口调用地址
    //返回状态码
    private final static int SUCESS_200 = 200;
    private final static int ERROR_400 = 400;
    private final static int ERROR_401 = 401;
    private final static int ERROR_404 = 404;
    private final static int ERROR_500 = 500;
  
  
    public static String postUrl(Vector<String> urls) throws IOException {
        URLConnection urlConnection;
        StringBuffer result = new StringBuffer();
        PrintWriter postPrintWriter = null;
        BufferedReader bufferedReader = null;
        int statusCode;
        try {
            urlConnection = new URL(zzApiUrl).openConnection();
            urlConnection.setRequestProperty("Content-Type", "text/plain");
            urlConnection.setRequestProperty("User-Agent", "curl/7.12.1");
            urlConnection.setRequestProperty("Host", "data.zz.baidu.com");
            urlConnection.setDoInput(true);
            urlConnection.setDoOutput(true);
            HttpURLConnection httpUrlConnection = (HttpURLConnection) urlConnection;
            postPrintWriter = new PrintWriter(httpUrlConnection.getOutputStream());
            //构造请求参数
            StringBuffer parm = new StringBuffer();
            for (String s : urls) {
                if (s != null) {
                    //去除两头空格
                    String tmpUrl = s.trim();
                    if (tmpUrl.contains("http://") || tmpUrl.contains("https://")) {
                        parm.append(tmpUrl);
                        parm.append("\n");
                    }
                }
            }
            //发送参数
            postPrintWriter.print(parm);
            //刷新输出流缓冲
            postPrintWriter.flush();
            statusCode = httpUrlConnection.getResponseCode();
            switch (statusCode) {
                case SUCESS_200:
                    if (statusCode == SUCESS_200) {
                        //通过BufferedReader输入流来读取Url的响应
                        bufferedReader = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
                        String line;
                        while ((line = bufferedReader.readLine()) != null) {
                            result.append(line);
                        }
                    }
                    String resultT = result.toString();
                    if (result != null) {
                        JSONObject jsonObject = JSONObject.parseObject(resultT);
                        Object t = jsonObject.get("not_same_site");
                        Object successInt = jsonObject.get("success");
                        if(successInt.equals(0)){
                            result.delete(0, result.length());
                            result.append("提交失败,");
  
                        }else if (successInt.equals(1)){
                            result.delete(0, result.length());
                            result.append("提交成功");
                        }
                        if (t != null) {
                            result.append("接口调用地址与提交的网址不匹配");
                        }
                    }
  
                    break;
                case ERROR_400:
                    result.append("站点未在站长平台验证");
                    break;
                case ERROR_401:
                    result.append("接口调用地址 错误");
                    break;
                case ERROR_404:
                    result.append("接口地址填写错误");
                    break;
                case ERROR_500:
                    result.append("服务器偶然异常，通常重试就会成功");
                    break;
  
                default:
                    result.append("未知错误");
                    break;
            }
  
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            //关闭流
            if (postPrintWriter != null) {
                postPrintWriter.close();
            }
            if (bufferedReader != null) {
                bufferedReader.close();
            }
        }
        return result.toString();
    }
    
    public static String postUrl(String url) throws IOException {
        URLConnection urlConnection;
        StringBuffer result = new StringBuffer();
        PrintWriter postPrintWriter = null;
        BufferedReader bufferedReader = null;
        int statusCode;
        try {
            urlConnection = new URL(zzApiUrl).openConnection();
            urlConnection.setRequestProperty("Content-Type", "text/plain");
            urlConnection.setRequestProperty("User-Agent", "curl/7.12.1");
            urlConnection.setRequestProperty("Host", "data.zz.baidu.com");
            urlConnection.setDoInput(true);
            urlConnection.setDoOutput(true);
            HttpURLConnection httpUrlConnection = (HttpURLConnection) urlConnection;
            postPrintWriter = new PrintWriter(httpUrlConnection.getOutputStream());
            //构造请求参数
            StringBuffer parm = new StringBuffer();
            if (url != null) {
                //去除两头空格
                String tmpUrl = url.trim();
                if (tmpUrl.contains("http://") || tmpUrl.contains("https://")) {
                    parm.append(tmpUrl);
                    parm.append("\n");
                }
            }
            //发送参数
            postPrintWriter.print(parm);
            //刷新输出流缓冲
            postPrintWriter.flush();
            statusCode = httpUrlConnection.getResponseCode();
            switch (statusCode) {
                case SUCESS_200:
                    if (statusCode == SUCESS_200) {
                        //通过BufferedReader输入流来读取Url的响应
                        bufferedReader = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
                        String line;
                        while ((line = bufferedReader.readLine()) != null) {
                            result.append(line);
                        }
                    }
                    String resultT = result.toString();
                    if (result != null) {
                        JSONObject jsonObject = JSONObject.parseObject(resultT);
                        Object t = jsonObject.get("not_same_site");
                        Object successInt = jsonObject.get("success");
                        if(successInt.equals(0)){
                            result.delete(0, result.length());
                            result.append("提交失败,");
  
                        }else if (successInt.equals(1)){
                            result.delete(0, result.length());
                            result.append("提交成功");
                        }
                        if (t != null) {
                            result.append("接口调用地址与提交的网址不匹配");
                        }
                    }
  
                    break;
                case ERROR_400:
                    result.append("站点未在站长平台验证");
                    break;
                case ERROR_401:
                    result.append("接口调用地址 错误");
                    break;
                case ERROR_404:
                    result.append("接口地址填写错误");
                    break;
                case ERROR_500:
                    result.append("服务器偶然异常，通常重试就会成功");
                    break;
  
                default:
                    result.append("未知错误");
                    break;
            }
  
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            //关闭流
            if (postPrintWriter != null) {
                postPrintWriter.close();
            }
            if (bufferedReader != null) {
                bufferedReader.close();
            }
        }
        return result.toString();
    }
    
    public static String postUrl(List<String> urls) throws IOException {
        URLConnection urlConnection;
        StringBuffer result = new StringBuffer();
        PrintWriter postPrintWriter = null;
        BufferedReader bufferedReader = null;
        int statusCode;
        try {
            urlConnection = new URL(zzApiUrl).openConnection();
            urlConnection.setRequestProperty("Content-Type", "text/plain");
            urlConnection.setRequestProperty("User-Agent", "curl/7.12.1");
            urlConnection.setRequestProperty("Host", "data.zz.baidu.com");
            urlConnection.setDoInput(true);
            urlConnection.setDoOutput(true);
            HttpURLConnection httpUrlConnection = (HttpURLConnection) urlConnection;
            postPrintWriter = new PrintWriter(httpUrlConnection.getOutputStream());
            //构造请求参数
            StringBuffer parm = new StringBuffer();
            for (String s : urls) {
                if (s != null) {
                    //去除两头空格
                    String tmpUrl = s.trim();
                    if (tmpUrl.contains("http://") || tmpUrl.contains("https://")) {
                        parm.append(tmpUrl);
                        parm.append("\n");
                    }
                }
            }
            //发送参数
            postPrintWriter.print(parm);
            //刷新输出流缓冲
            postPrintWriter.flush();
            statusCode = httpUrlConnection.getResponseCode();
            switch (statusCode) {
                case SUCESS_200:
                    if (statusCode == SUCESS_200) {
                        //通过BufferedReader输入流来读取Url的响应
                        bufferedReader = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
                        String line;
                        while ((line = bufferedReader.readLine()) != null) {
                            result.append(line);
                        }
                    }
                    String resultT = result.toString();
                    if (result != null) {
                        JSONObject jsonObject = JSONObject.parseObject(resultT);
                        Object t = jsonObject.get("not_same_site");
                        Object successInt = jsonObject.get("success");
                        if(successInt.equals(0)){
                            result.delete(0, result.length());
                            result.append("提交失败,");
  
                        }else if (successInt.equals(1)){
                            result.delete(0, result.length());
                            result.append("提交成功");
                        }
                        if (t != null) {
                            result.append("接口调用地址与提交的网址不匹配");
                        }
                    }
  
                    break;
                case ERROR_400:
                    result.append("站点未在站长平台验证");
                    break;
                case ERROR_401:
                    result.append("接口调用地址 错误");
                    break;
                case ERROR_404:
                    result.append("接口地址填写错误");
                    break;
                case ERROR_500:
                    result.append("服务器偶然异常，通常重试就会成功");
                    break;
  
                default:
                    result.append("未知错误");
                    break;
            }
  
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            //关闭流
            if (postPrintWriter != null) {
                postPrintWriter.close();
            }
            if (bufferedReader != null) {
                bufferedReader.close();
            }
        }
        return result.toString();
    }
    
    public static void main(String[] args) {
		Vector vector = new Vector();
		vector.add("http://sharehoo.cn/blog/hxk/article/60");
		try {
			System.out.println(postUrl(vector));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
