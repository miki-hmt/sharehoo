package com.sharehoo.util.forum;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import sun.misc.BASE64Encoder;

public class MD5 {

	/**
	 * @param args
	 * @category MD5
	 */
	MessageDigest m;
	BASE64Encoder b;
	String n;
	public String complie(String s){
		try {
			s = s.trim();	//2017.05.27	String类中的trim函数，去掉字符串中的首，尾空格
			m = MessageDigest.getInstance("MD5");
			b = new BASE64Encoder();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		try {
			n = b.encode(m.digest(s.getBytes("UTF-8")));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return n;
	}
	public static void main(String[] args) throws IOException {
		int num = 10;
		num+=1;
		
		String str = new MD5().complie("miki123456");	//测试密码加密
		System.out.println(str+num);
	}
}
