package com.sharehoo.util;

import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class StringEx {

    public static String getUUID(){
        return UUID.randomUUID().toString().replace("-", "");
    }

    public static boolean isNumeric(Object obj) throws Exception {
        if (!isNull(obj)) {
            Pattern pattern = Pattern.compile("^\\d+$|-\\d+$");
            String str = sNull(obj);
            Matcher isNum = pattern.matcher(str);
            if (!isNum.matches())
                return false;
            return true;
        } else
            return false;
    }

    public static boolean isNull(Object obj){
        Object objTmp = obj;
        if ("".equals(objTmp))
            objTmp = null;
        return objTmp == null ? true : false;
    }

    public static String sNull(Object obj){
        if (obj != null)
            return obj.toString().trim();
        else
            return "";
    }
    
    public static String getUid(Object obj,Object back){
        if (obj != null)
            return obj.toString().trim();
        else
        	if(back!=null)
        		return back.toString().trim();
        	else
        		return "27";
    }
}
