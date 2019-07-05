package com.sharehoo.entity;

import java.io.InputStream;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Properties;

/**
 * @ClassName: JDBC
 * @Description: TODO
 * @Author: limi
 * @Date: 2019/4/17
 */
public class JDBC implements Serializable {
	
    public static final String ORACLE_DRIVER = "oracle.jdbc.driver.OracleDriver";

    public static final String MYSQL_DRIVER = "com.mysql.jdbc.Driver";

    public static final String MYSQL_TYPE = "mysql";

    public static final String ORACLE_TYPE = "oracle";

    public static final String SQL_SERVER_TYPE = "sql_server";

    private String dbKey;

    private String url;
    private String driver;
    private String ip;
    private String port;
    private String database;
    private String user;
    private String pwd;
    private String type;
    private String mark;
    private String memo;

    public JDBC(String dbKey, String ip, String port, String database, String user, String pwd, String type) {
        this.dbKey = dbKey;
        this.ip = ip;
        this.port = port;
        this.database = database;
        this.user = user;
        this.pwd = pwd;
        this.type = type;
        this.mark = ip + port + database;
        switch (type) {
            case JDBC.ORACLE_TYPE:
                url = "jdbc:oracle:thin:@" + ip + ":" + port + ":" + database;
                driver = JDBC.ORACLE_DRIVER;
                break;
            case JDBC.MYSQL_TYPE:
                //jdbc:mysql://localhost:3306/dbName?useUnicode=true&useSSL=true
                url = "jdbc:mysql://" + ip + ":" + port + "/" + database+"?useSSL=false&characterEncoding=utf8";
                driver = JDBC.MYSQL_DRIVER;
                break;
        }
    }

    public static JDBC getJdbc() throws Exception {
        Properties properties = new Properties();
        // 使用ClassLoader加载properties配置文件生成对应的输入流
        InputStream in = JDBC.class.getClassLoader().getResourceAsStream("/jdbc.properties");
        // 使用properties对象加载输入流
        properties.load(in);
        //获取key对应的value值
        String ip = properties.getProperty("ip");
        String port = properties.getProperty("port");
        String name = properties.getProperty("name");
        String user = properties.getProperty("user");
        String pwd = properties.getProperty("pwd");
        String type = properties.getProperty("type");
        
        return new JDBC("jdbc", ip, port, name, user, pwd, type);
    }

    public JDBC getInstance() {
        switch (type) {
            case JDBC.ORACLE_TYPE:
                url = "jdbc:oracle:thin:@" + ip + ":" + port + ":" + database;
                driver = JDBC.ORACLE_DRIVER;
                break;
            case JDBC.MYSQL_TYPE:
                //jdbc:mysql://localhost:3306/dbName?useUnicode=true&useSSL=true
                url = "jdbc:mysql://" + ip + ":" + port + "/" + database;
                driver = JDBC.MYSQL_DRIVER;
                break;
        }
        return this;
    }

    public JDBC mark() {
        this.mark = ip + port + database;
        return this;
    }

    public String test() throws Exception {
        Connection conn = null;
        Statement stmt = null;
        try {
            Class.forName(driver);
        } catch (Exception e) {
            throw new Exception("驱动加载失败");
        }
        try {
            conn = DriverManager.getConnection(url, user, pwd);
            stmt = conn.createStatement();
        } catch (Exception e) {
            throw new Exception(ip + ":" + port + " 连接失败");
        } finally {
            if (null != stmt)
                stmt.close();
            if (null != conn)
                conn.close();
        }
        return ip + ":" + port + " 连接成功";
    }

    public String getIp() {
        return ip;
    }

    public String getPort() {
        return port;
    }

    public String getDatabase() {
        return database;
    }

    public String getUser() {
        return user;
    }

    public String getPwd() {
        return pwd;
    }

    public String getType() {
        return type;
    }

    public String getMark() {
        return mark;
    }

    public String getDbKey() {
        return dbKey;
    }

    public String getUrl() {
        return url;
    }

    public String getDriver() {
        return driver;
    }
}
