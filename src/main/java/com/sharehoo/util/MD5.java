/*
+--------------------------------------------------------------------------
|   mtons [#RELEASE_VERSION#]
|   ========================================
|   Copyright (c) 2014, 2015 mtons. All Rights Reserved
|   http://www.mtons.com
|
+---------------------------------------------------------------------------
*/
package com.sharehoo.util;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;

import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.StringUtils;

/**
 * MD5摘要
 */
public class MD5 {
	
	/**
	 * 对字符串进行Md5加密
	 * 
	 * @param input 原文
	 * @return md5后的密文
	 */
	public static String md5(String input) {
		byte[] code = null;
        try {
            code = MessageDigest.getInstance("md5").digest(input.getBytes());
        } catch (NoSuchAlgorithmException e) {
            code = input.getBytes();
        }
        BigInteger bi = new BigInteger(code);
        return bi.abs().toString(32).toUpperCase();
	}
	
	/**
	 * 对字符串进行Md5加密
	 * 
	 * @param input 原文
	 * @param salt 随机数
	 * @return string
	 */
	public static String generatePasswordMD5(String input, String salt) {
		if(StringEx.isNull(salt)) {
			salt = "";
		}
		return md5(salt + md5(input));
	}
	
	/**
	 * 随机生成指定长度的字符串
	 * @param length 长度
	 * @return string
	 */
	public static String randString(int length) {
		return RandomStringUtils.random(length);
	}
	
	public static String get8UUID(){
        UUID id=UUID.randomUUID();
        String[] idd=id.toString().split("-");
        return idd[0];
    }
	
	public static void main(String[] args) {
		System.out.println(get8UUID());
	}
	
}
