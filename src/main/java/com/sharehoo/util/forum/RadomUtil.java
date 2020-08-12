package com.sharehoo.util.forum;

import org.apache.commons.lang3.RandomStringUtils;
import java.util.UUID;
/**
 * 生成随机密码
 * @author miki
 *2017.03.25
 */
public class RadomUtil {
	
	
	public static int getRandNum(int min, int max) {
	    int randNum = min + (int)(Math.random() * ((max - min) + 1));
	    return randNum;
	}
	public static String getRandString() {
		  String randomNum2 = RandomStringUtils.randomNumeric(8);
		  
		  return randomNum2;
	}
	
	public static String getUUID(){ 
		String uuid = UUID.randomUUID().toString(); 
		//去掉“-”符号 
		return uuid.replaceAll("-", "");
		}
	public static void main(String[] args){
		System.out.println("随机字符串为："+getRandString()+"....随机9位数字"+getRandNum(1, 1000000000)+"...uuid为："+getUUID().substring(2, 18));
	}
}
