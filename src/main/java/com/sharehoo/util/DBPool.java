package com.sharehoo.util;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import com.sharehoo.entity.JDBC;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class DBPool {
    // 初始化c3p0连接池
    private static Map<String, ComboPooledDataSource> dataSources = new ConcurrentHashMap<String, ComboPooledDataSource>();

    public static ComboPooledDataSource init(JDBC jdbc) throws Exception {
        ComboPooledDataSource dataSource = new ComboPooledDataSource();
        String type = jdbc.getType();
        dataSource.setDriverClass(jdbc.getDriver());
        dataSource.setJdbcUrl(jdbc.getUrl());
        dataSource.setUser(jdbc.getUser());
        dataSource.setPassword(jdbc.getPwd());
        dataSource.setInitialPoolSize(10);
        dataSource.setMinPoolSize(10);
        dataSource.setMaxPoolSize(200);
        //应该设置小于数据库默认游标数，否则循环插入会报超过最大游标数错误
        dataSource.setMaxStatements(200);
        dataSource.setMaxIdleTime(60);
        dataSource.setAcquireIncrement(10);
        dataSources.put(jdbc.getMark(), dataSource);
        return dataSource;
    }

    public static ComboPooledDataSource getDataSource(JDBC jdbc) throws Exception {
        ComboPooledDataSource dataSource = dataSources.get(jdbc.getMark());
        if (dataSource != null)
            return dataSource;
        else
            return init(jdbc);
    }


    /**
     * 释放资源，多个try-catch并列，catch块中不能抛出异常，否则将阻止程序的继续执行
     *
     * @param conn
     * @param st
     * @param rs
     */
    public static void release(Connection conn, Statement st, ResultSet rs) {
        try {
            if (rs != null)
                rs.close();
        } catch (Exception e) {

        }
        try {
            if (st != null)
                st.close();
        } catch (Exception e) {

        }
        try {
            if (conn != null)
                conn.close();
        } catch (Exception e) {

        }
    }

    public static void rollBack(Connection conn) throws Exception {
        try {
            if (null != conn)
                conn.rollback();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static boolean isNull(Connection conn) throws Exception {
        return null == conn;
    }
    /*
     * //获取连接方式 public static Connection getConnection(){ Connection con = null;
     * ComboPooledDataSource dataSource=getDataSource(String type,String
     * dbName,String ip,String port,String user,String password); try {
     *
     * con = dataSource.getConnection(); } catch (SQLException e) {
     * e.printStackTrace(); throw new RuntimeException(); } return con; }
     */
}
