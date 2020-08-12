package com.sharehoo.util.forum;
import java.text.DateFormat;  
import java.text.ParseException;  
import java.text.SimpleDateFormat;  
import java.util.Calendar;
import java.util.Date; 
public class DateConvertUtils {
	
	/*
	 * 2018.02.07得到当前日期的前一天的日期
	 */	
	public static String getBefore(){
		Date dNow = new Date();   //当前时间
		Date dBefore = new Date();
		
		Calendar calendar = Calendar.getInstance(); //得到日历
		calendar.setTime(dNow);//把当前时间赋给日历
		calendar.add(Calendar.DAY_OF_MONTH, -1);  //设置为前一天
		dBefore = calendar.getTime();   //得到前一天的时间
		
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd"); //设置时间格式
		String beforeDate = sdf.format(dBefore);    //格式化前一天
		String defaultEndDate = sdf.format(dNow); //格式化当前时间								 
		
		return beforeDate;
	}





     /** 
      * Date 与  String、long 的相互转换 
      * @param args 
      */  
     public static void main(String[] args) {  
           
         Date dt =new Date();  
         System.out.println(dt); //格式： Wed Jul 06 09:28:19 CST 2016  
           
         //格式：2016-7-6  
         String formatDate = null;  
         formatDate = DateFormat.getDateInstance().format(dt);  
         System.out.println(formatDate);    
           
         //格式：2016年7月6日 星期三  
         formatDate = DateFormat.getDateInstance(DateFormat.FULL).format(dt);  
         System.out.println(formatDate);  
           
         //格式 24小时制：2016-07-06 09:39:58  
         DateFormat dFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); //HH表示24小时制；  
         formatDate = dFormat.format(dt);  
         System.out.println(formatDate);  
           
         //格式12小时制：2016-07-06 09:42:44  
         DateFormat dFormat12 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss"); //hh表示12小时制；  
         formatDate = dFormat12.format(dt);  
         System.out.println(formatDate);  
           
         //格式去掉分隔符24小时制：20160706094533  
         DateFormat dFormat3 = new SimpleDateFormat("yyyyMMddHHmmss");  
         formatDate = dFormat3.format(dt);  
         System.out.println(formatDate);  
           
         //格式转成long型：1467770970  
         long lTime = dt.getTime() / 1000;  
         System.out.println(lTime);  
           
         //格式long型转成Date型，再转成String：  1464710394 -> ltime2*1000 -> 2016-05-31 23:59:54  
         long ltime2 = 1464710394;  
         SimpleDateFormat lsdFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
         Date lDate = new Date(ltime2*1000);  
         String lStrDate = lsdFormat.format(lDate);  
         System.out.println(lStrDate);  
           
         //格式String型转成Date型：2016-07-06 10:17:48 -> Wed Jul 06 10:17:48 CST 2016  
         String strDate = "2016-07-06 10:17:48";  
         SimpleDateFormat lsdStrFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
         try {  
             Date strD = lsdStrFormat.parse(strDate);  
             System.out.println(strD);  
         } catch (ParseException e) {  
             e.printStackTrace();  
         }  
   
     }  
}
