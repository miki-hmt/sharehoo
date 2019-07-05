package com.sharehoo.util;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;

import java.io.*;
import java.util.*;

public class Config {

    private String name;
    private Document doc;
    private Properties properties;
    private static String path = System.getProperty("catalina.home").replace("\\", "/");
    private static final String SLASH = path + "/../../idp/config/";
    private static final String PROPERTIES_SYSTEM_PATH = ".properties";
    private static final String CONFIG_PATH = ".config";

    private static final List<String> propertiesList = setProperties();

    //定义properties key
    private static List<String> setProperties() {
        List<String> list = new ArrayList<>();
        list.add("");
        return list;
    }


    //定义默认值
    private static Map<String, String> defaultSet() {
        Map<String, String> map = new LinkedHashMap<>();
        return map;
    }

    //初始化类
    public Config(String type) {
        this.name = type;
        getDoc(this.name);
        getProperties(this.name);
    }


    public Properties getAsProperties() {
        Properties newProperties = this.properties;
        Element configuration = doc.getRootElement();
        Element appSettings = configuration.element("appSettings");
        Iterator<Element> iterator = appSettings.elementIterator("add");
        while (iterator.hasNext()) {
            Element e = iterator.next();
            newProperties.setProperty(e.attributeValue("key"), e.attributeValue("value"));
        }
        return newProperties;
    }

    private void getDoc(String type) {
        SAXReader reader = new SAXReader();
        try {
            File file = new File(SLASH + type + CONFIG_PATH);
            if (!file.exists()) {
                loadDefaultConfig();
            }
            doc = reader.read(file);
        } catch (DocumentException e) {
            System.err.println("读取config文件异常");
        }
    }

    public void save() {
        saveProperties();
        saveConfig();
    }


    private void saveConfig() {
        try {
            File file = new File(Config.SLASH + this.name + Config.CONFIG_PATH);
            if (!file.exists()) {
                file.createNewFile();
            }
            FileOutputStream out = new FileOutputStream(file);//指定文件输出的位置
            OutputFormat format = OutputFormat.createPrettyPrint();
            format.setEncoding("utf-8");
            XMLWriter writer = new XMLWriter(out, format);
            writer.write(doc);
            writer.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void saveProperties() {
        OutputStream fos = null;
        try {
            fos = outputStream(this.name);
            properties.store(new OutputStreamWriter(fos, "UTF-8"), "");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                fos.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }


    private void getProperties(String type) {
        try {
            properties = new Properties();
            InputStream is = inputStream(type);
            properties.load(new InputStreamReader(is, "UTF-8"));
            is.close();
        } catch (Exception e) {
            System.err.println("读取properties异常,使用默认配置");
            properties = new Properties();
            loadDefaultProperties();
            saveProperties();
        }
    }


    private void loadDefaultConfig() {
        Map<String, String> map = defaultSet();
        for (String key : propertiesList) {
            map.remove(key);
        }
        doc = DocumentHelper.createDocument();
        Element configuration = doc.addElement("configuration");
        Element appSettings = configuration.addElement("appSettings");
        for (Map.Entry<String, String> entry : map.entrySet()) {
            Element seting = appSettings.addElement("add");
            seting.addAttribute("key", entry.getKey());
            seting.addAttribute("value", entry.getValue());
        }
        saveConfig();
    }

    private void loadDefaultProperties() {
        Map map = defaultSet();
        for (String key : propertiesList) {
            properties.setProperty(key, String.valueOf(map.get(key)));
        }
    }


    private static InputStream inputStream(String type) {
        return Config.class.getResourceAsStream("/" + type + Config.PROPERTIES_SYSTEM_PATH);
    }

    private OutputStream outputStream(String type) throws Exception {
        File f = new File(Config.class.getClassLoader().getResource("").getPath() + type + Config.PROPERTIES_SYSTEM_PATH);
        if (!f.exists())
            f.createNewFile();
        return new FileOutputStream(f);

    }


    public void setValue(String key, String value) {
        if (getValue(key).isEmpty()) {
            addValue(key, value);
        } else {
            editValue(key, value);
        }
    }

    public void remove(String key) {
        if (propertiesList.contains(key)) {
            properties.remove(key);
        } else {
            Element configuration = doc.getRootElement();
            Element appSettings = configuration.element("appSettings");
            Iterator<Element> iterator = appSettings.elementIterator("add");
            while (iterator.hasNext()) {
                Element e = iterator.next();
                if (key.equals(e.attributeValue("key"))) {
                    appSettings.remove(e);
                }
            }
        }
    }

    private void addValue(String key, String value) {
        if (propertiesList.contains(key)) {
            properties.setProperty(key, value);
        } else {
            Element configuration = doc.getRootElement();
            Element appSettings = configuration.element("appSettings");
            Element seting = appSettings.addElement("add");
            seting.addAttribute("key", key);
            seting.addAttribute("value", value);
        }
    }

    private void editValue(String key, String value) {
        if (propertiesList.contains(key)) {
            properties.setProperty(key, value);
        } else {
            Element configuration = doc.getRootElement();
            Element appSettings = configuration.element("appSettings");
            Iterator<Element> iterator = appSettings.elementIterator("add");
            while (iterator.hasNext()) {
                Element e = iterator.next();
                if (key.equals(e.attributeValue("key"))) {
                    e.attribute("value").setValue(value);
                }
            }
        }

    }

    public String getValue(String key) {
        if (propertiesList.contains(key)) {
            return properties.getProperty(key);
        } else {
            Element configuration = doc.getRootElement();
            Element appSettings = configuration.element("appSettings");
            Iterator<Element> iterator = appSettings.elementIterator("add");
            while (iterator.hasNext()) {
                Element e = iterator.next();
                if (key.equals(e.attributeValue("key"))) {
                    return e.attributeValue("value");
                }
            }
        }
        return "";
    }


}
