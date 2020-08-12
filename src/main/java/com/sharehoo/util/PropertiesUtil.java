package com.sharehoo.util;

import com.google.gson.Gson;
import org.apache.log4j.Logger;

import java.io.*;
import java.util.*;

/**
 * Title: PropertiesUtil Description: properties基本功能（读/写） 更改properties文件路径
 * Company: cosmosource
 *
 * @date 2018-7-17
 */

public class PropertiesUtil {
    private static Logger logger = Logger.getLogger(PropertiesUtil.class);

    private static String path = System.getProperty("catalina.home").replace("\\", "/");
    private static final String SLASH = path += "/../../idp/config/";
    private static final String PROPERTIES_SYSTEM_PATH = ".properties";
    private static final String CONFIG_PATH = ".config";

    private static InputStream inputStream(String type) throws Exception {
        File file = new File(PropertiesUtil.SLASH + type + PropertiesUtil.CONFIG_PATH);
        if (file.exists())
            return new FileInputStream(PropertiesUtil.SLASH + type + PropertiesUtil.CONFIG_PATH);
        else
            return PropertiesUtil.class.getResourceAsStream("/" + type + PropertiesUtil.PROPERTIES_SYSTEM_PATH);
    }

    private static OutputStream outputStream(String type) throws Exception {
        File file = new File(PropertiesUtil.SLASH + type + PropertiesUtil.CONFIG_PATH);
        if (file.exists())
            return new FileOutputStream(PropertiesUtil.SLASH + type + PropertiesUtil.CONFIG_PATH);
        else
            return new FileOutputStream(PropertiesUtil.class.getClassLoader().getResource("/" + type + PropertiesUtil.PROPERTIES_SYSTEM_PATH).getPath());
    }

    public static String gP(String type, String str) {
        Config config = new Config("dxp");
        Properties properties = config.getAsProperties();
        String propertiesStr = properties.getProperty(str);
        return propertiesStr;
    }

    @SuppressWarnings("rawtypes")
    public static List<Map<String, String>> gLP(String type) {
        List<Map<String, String>> maps = new ArrayList<Map<String, String>>();
        Config config = new Config("dxp");
        Properties properties = config.getAsProperties();
        Iterator it = properties.entrySet().iterator();
        Map<String, String> map = new HashMap<String, String>();
        while (it.hasNext()) {
            Map.Entry entry = (Map.Entry) it.next();
            String key = StringEx.sNull(entry.getKey());
            String value = StringEx.sNull(entry.getValue());
            map.put(key, value);
        }
        maps.add(map);
        System.out.println(new Gson().toJson(maps));
        return maps;
    }


    public static void wAP(String type, List<String[]> list) {
        Config config = new Config("dxp");
        for (String[] arr : list) {
            if (null != arr) {
                String key = arr[0];
                String value = arr[1];
                if (!StringEx.isNull(key) && !StringEx.isNull(value))
                    config.setValue(key, value);
            }
        }
        config.save();
    }

    public static void wP(String type, String key, String value) {
        Config config = new Config("dxp");
        config.setValue(key, value);
        config.save();
    }


    /* 2018.06.13 加载配置信息 miki
     */
    public static Properties getProperty() {
        Config config = new Config("dxp");
        return config.getAsProperties();
    }

}
