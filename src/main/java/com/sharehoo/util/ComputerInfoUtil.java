/**
 * <b>项目名：</b>宇动云平台<br/>
 * <b>包名：</b>com.cosmosource.dap.utils<br/>
 * <b>文件名：</b>ComputerInfoUtil.java<br/>
 * <b>版本信息：</b><br/>
 * <b>日期：</b>2018年6月27日-下午5:10:02<br/>
 * <b>Copyright (c)</b> 2018北京宇动源科技有限公司-版权所有<br/>
 */
package com.sharehoo.util;

import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

public class ComputerInfoUtil {
    /**
     * 
     * getIp(方法描述：获取机器ip) <br />
     * (方法适用条件描述： – 可选)
     * 
     * @param addr
     * @return
     * @since 1.0.0
     */
    public static String getIp(InetAddress addr) {
        return addr.getHostAddress(); // 获得机器IP
    }

    /**
     * 
     * getComputerName(方法描述：获取用户名) <br />
     * (方法适用条件描述： – 可选)
     * 
     * @param addr
     * @return
     * @since 1.0.0
     */
    public static String getComputerName(InetAddress addr) {
        return addr.getHostName(); // 获得机器名称
    }

    /**
     * 
     * getAllMac(方法描述：无论是否有网络，都可以正常获取所有网卡的Mac信息。) <br />
     * (方法适用条件描述： – 可选)
     * 
     * @return
     * @throws SocketException
     * @since 1.0.0
     */
    public static List<String> getAllMac() throws SocketException {
        List<String> list = new ArrayList<String>();
        Enumeration<NetworkInterface> enumeration = NetworkInterface.getNetworkInterfaces();
        while (enumeration.hasMoreElements()) {
            StringBuffer stringBuffer = new StringBuffer();
            NetworkInterface networkInterface = enumeration.nextElement();
            if (networkInterface != null) {
                byte[] bytes = networkInterface.getHardwareAddress();
                if (bytes != null) {
                    for (int i = 0; i < bytes.length; i++) {
                        if (i != 0) {
                        }
                        int tmp = bytes[i] & 0xff; // 字节转换为整数
                        String str = Integer.toHexString(tmp);
                        if (str.length() == 1) {
                            stringBuffer.append("0" + str);
                        } else {
                            stringBuffer.append(str);
                        }
                    }
                    String mac = stringBuffer.toString().toUpperCase();
                    if (!mac.contains("000000000000")) {
                        list.add(mac);
                    }
                }
            }
        }
        return list;
    }

    /**
     * 
     * getMachineCode(方法描述：获取机器码) <br />
     * (方法适用条件描述： – 可选)
     * 
     * @return
     * @throws SocketException
     * @throws UnknownHostException
     * @since 1.0.0
     */
    public static String getMachineCode() throws SocketException, UnknownHostException {
        InetAddress addr = InetAddress.getLocalHost();
        String computerName = getComputerName(addr);
        StringBuilder sb = new StringBuilder();
        sb.append(computerName);
        List<String> allMac = getAllMac();
        for (String mac : allMac) {
            sb.append("_" + mac);
        }
        return sb.toString().toUpperCase();
    }

//    public static void main(String[] args) throws SocketException {
//        getAllMac();
//    }
}
