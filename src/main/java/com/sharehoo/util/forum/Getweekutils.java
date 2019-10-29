package com.sharehoo.util.forum;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class Getweekutils {
	public static String getFirstDayOfWeek(Date time){ 
		DateFormat dFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); //HH表示24小时制；  
        String date=dFormat.format(new Date()).toString(); 
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");        
	    Calendar cal = Calendar.getInstance();
	    try {
	        cal.setTime(sdf.parse(date));
	        // Calendar默认周日为第一天, 所以设置为1
	        cal.set(Calendar.DAY_OF_WEEK, 1);
	        // 如果要返回00点0分0秒
	        //cal.set(Calendar.HOUR_OF_DAY, 0);
	        //cal.set(Calendar.MINUTE, 0);
	        //cal.set(Calendar.SECOND, 0);
	        //cal.set(Calendar.MILLISECOND, 0);
	    } catch (ParseException e) {
	            
	    }        
	    return sdf.format(cal.getTime());
	}
	
	public static void main(String[] agrs){
		
		System.out.println("这周日的日期为:"+Getweekutils.getFirstDayOfWeek(new Date()));
	}
}
