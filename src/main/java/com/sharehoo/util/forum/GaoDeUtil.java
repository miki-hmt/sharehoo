package com.sharehoo.util.forum;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.URI;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

import org.apache.commons.lang3.StringUtils;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


/**
 * @ClassName：MapUtil @Description：
 * @Author：chen
 * @Date：2017年5月17日下午5:49:40 @version：1.0.0
 */


public class GaoDeUtil {
// 高德秘钥
	private final static String key = "52ac564aa201b3aedf5ca725f0e0cf1a";
// url前缀
	private final static String baseUrl = "http://restapi.amap.com/v3/";

	public static String getAddress(String ip) {
		String address = "";
		String url = baseUrl + "ip?ip=" + ip + "&output=json&key=" + key;
		JSONObject jsonobject = JSONObject.fromObject(getHttpResponse(url));
		if ("1".equals(jsonobject.getString("status"))
				&& StringUtils.equalsIgnoreCase("ok", jsonobject.getString("info"))) {

			address = jsonobject.getString("city");
		}
		return address;
	}

	/**
	 * @MethodName：getDistance 计算两地之间骑行的距离(米)
	 * @param originlon  起始经度（高德）
	 * @param origiinlat 起始纬度（高德）
	 * @param deslon     结束经度（高德）
	 * @param deslat     结束纬度（高德）
	 * @return
	 * @ReturnType：BigDecimal @Description：
	 * @Creator：chenhoudong
	 * @CreateTime：2017年5月19日上午9:53:46 @Modifier： @ModifyTime：
	 */

	public static BigDecimal getDistanceByGaoDe(BigDecimal originlon, BigDecimal originlat, BigDecimal deslon,
			BigDecimal deslat) {
// 0速度优先（时间）1费用优先（不走收费路段的最快道路）2距离优先 3不走快速路 4躲避拥堵
// 5多策略（同时使用速度优先、费用优先、距离优先三个策略计算路径）
// 6不走高速 7不走高速且避免收费 8躲避收费和拥堵 9不走高速且躲避收费和拥堵
		String origins = originlon + "," + originlat;
		String destination = deslon + "," + deslat;
		int strategy = 2;
		BigDecimal distance = null;
		String url = baseUrl + "direction/driving?" + "origin=" + origins + "&destination=" + destination + "&strategy="
				+ strategy + "&extensions=base&key=" + key;
		JSONObject jsonobject = JSONObject.fromObject(getHttpResponse(url));
		if ("1".equals(jsonobject.getString("status"))
				&& StringUtils.equalsIgnoreCase("ok", jsonobject.getString("info"))) {
			JSONArray pathArray = jsonobject.getJSONObject("route").getJSONArray("paths");
			String distanceString = pathArray.getJSONObject(0).getString("distance");
			distance = new BigDecimal(distanceString);
		}
		return distance;
	}

	/**
	 * @MethodName：getDistance 几何计算两地距离
	 * @param startlongitude
	 * @param startdimensionality
	 * @param endlongitude
	 * @param enddimensionality
	 * @return
	 * @ReturnType：double @Description：
	 * @Creator：chen
	 * @CreateTime：2017年5月17日下午6:03:12 @Modifier： @ModifyTime：
	 */

	public static BigDecimal getDistanceByGeometry(double startlongitude, double startdimensionality,
			double endlongitude, double enddimensionality) {
		double lon1 = (Math.PI / 180) * startlongitude;
		double lon2 = (Math.PI / 180) * endlongitude;
		double lat1 = (Math.PI / 180) * startdimensionality;
		double lat2 = (Math.PI / 180) * enddimensionality;
		// 地球半径
		double R = 6371;
		// 两点间距离 km，如果想要米的话，结果*1000就可以了
		double d = Math.acos(Math.sin(lat1) * Math.sin(lat2) + Math.cos(lat1) * Math.cos(lat2) * Math.cos(lon2 - lon1))
				* R;
		BigDecimal distance = new BigDecimal(d * 1000);
		return distance;
	}

	/**
	 * @MethodName：coordinate 地址转化为高德坐标
	 * @param address 地址
	 * @return
	 * @ReturnType：String @Description：
	 * @Creator：chenhoudong
	 * @CreateTime：2017年5月17日下午5:28:56 @Modifier： @ModifyTime：
	 */

	public static String coordinate(String address) {
		try {
			address = URLEncoder.encode(address, "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String coordinateString = "";
		String url = baseUrl + "geocode/geo?address=" + address + "&output=json&key=" + key;
		JSONObject jsonobject = JSONObject.fromObject(getHttpResponse(url));
		if ("1".equals(jsonobject.getString("status"))
				&& StringUtils.equalsIgnoreCase("ok", jsonobject.getString("info"))) {
			JSONArray pathArray = jsonobject.getJSONArray("geocodes");
			coordinateString = pathArray.getJSONObject(0).getString("location");
		}
		return coordinateString;
	}

	/**
	 * @MethodName：convert GPS坐标转化为高德坐标
	 * @param coordsys GPS坐标
	 * @return
	 * @ReturnType：String 格式为 "经度，纬度" @Description：
	 * @Creator：chen
	 * @CreateTime：2017年5月17日下午5:27:32 @Modifier： @ModifyTime：
	 */

	public static String convert(BigDecimal lon, BigDecimal lat) {
		String coordsys = lon + "," + lat;
		try {
			coordsys = URLEncoder.encode(coordsys, "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String coordinateString = "";
		String url = baseUrl + "assistant/coordinate/convert?locations=" + coordsys + "&coordsys=gps&output=json&key="
				+ key;
		JSONObject jsonobject = JSONObject.fromObject(getHttpResponse(url));
		if ("1".equals(jsonobject.getString("status"))
				&& StringUtils.equalsIgnoreCase("ok", jsonobject.getString("info"))) {
			coordinateString = jsonobject.getString("locations");
		}
		return coordinateString;
	}

	/**
	 * @MethodName：getAddress 高德坐标转换成地址信息
	 * @param lon 高德坐标经度
	 * @param lat 高德坐标纬度
	 * @return
	 * @ReturnType：String @Description：
	 * @Creator：chen
	 * @CreateTime：2017年5月17日下午4:12:46 @Modifier： @ModifyTime：
	 */
	public static String getAddress(BigDecimal lon, BigDecimal lat) {
		String location = lon + "," + lat;
		String url = baseUrl + "geocode/regeo?key=" + key + "&location=" + location;
		try {
			location = URLEncoder.encode(location, "utf-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONObject jsonobject = JSONObject.fromObject(getHttpResponse(url));
		String addressString = "";
		if ("1".equals(jsonobject.getString("status"))
				&& StringUtils.equalsIgnoreCase("ok", jsonobject.getString("info"))) {
			String regeocodeString = jsonobject.getString("regeocode");
			JSONObject regeocodeJson = JSONObject.fromObject(regeocodeString);
			addressString = regeocodeJson.getString("formatted_address");
		}

		return addressString;
	}

	/**
	 * @MethodName：getHttpResponse
	 * @param allConfigUrl
	 * @return
	 * @ReturnType：String @Description：
	 * @Creator：chen
	 * @CreateTime：2017年5月17日下午3:45:39 @Modifier： @ModifyTime：
	 */

	public static String getHttpResponse(String allConfigUrl) {
		BufferedReader in = null;
		StringBuffer result = null;
		try {
			// url请求中如果有中文，要在接收方用相应字符转码
			URI uri = new URI(allConfigUrl);
			URL url = uri.toURL();
			URLConnection connection = url.openConnection();
			connection.setRequestProperty("Content-type", "text/html");
			connection.setRequestProperty("Accept-Charset", "utf-8");
			connection.setRequestProperty("contentType", "utf-8");
			connection.connect();
			result = new StringBuffer();
			// 读取URL的响应
			in = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));
			String line;
			while ((line = in.readLine()) != null) {
				result.append(line);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (in != null) {
					in.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return result.toString();
	}

	/**
	 * @MethodName：getLocalCity 根据坐标查询城市code
	 * @param lon
	 * @param lat
	 * @return
	 * @ReturnType：String @Description：
	 * @Creator：chen
	 * @CreateTime：2017年5月22日下午2:53:47 @Modifier： @ModifyTime：
	 */

	public static String getLocalCity(BigDecimal lon, BigDecimal lat) {
		String location = lon + "," + lat;
		String url = baseUrl + "geocode/regeo?key=" + key + "&location=" + location + "&radius=3000&roadlevel=1";
		String city = "";
		try {
			location = URLEncoder.encode(location, "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		JSONObject jsonobject = JSONObject.fromObject(getHttpResponse(url));
		if ("1".equals(jsonobject.getString("status"))
				&& StringUtils.equalsIgnoreCase("ok", jsonobject.getString("info"))) {
			String regeocodeString = jsonobject.getString("regeocode");
			JSONObject regeocodeJson = JSONObject.fromObject(regeocodeString);
			String addressString = regeocodeJson.getString("addressComponent");
			JSONObject cityaddress = JSONObject.fromObject(addressString);
			city = cityaddress.getString("citycode");
		}
		return city;
	}

	public static void main(String[] args) {

		System.out.println("地址为:" + getAddress("223.104.106.167"));
// // 格式： 经度,纬度
// // 注意：高德最多取小数点后六位
// BigDecimal originlon = new BigDecimal(104.043390);
// BigDecimal originlat = new BigDecimal(30.641982);
// BigDecimal deslon = new BigDecimal(106.655347);
// BigDecimal deslat = new BigDecimal(31.786691);
// String address = "成都市天府新区长虹科技大厦";
//
// String coordinate = coordinate(address); //高德坐标
// BigDecimal distance = getDistanceByGaoDe(originlon, originlat, deslon,
// deslat); //高德距离
// BigDecimal distance1=getDistanceByGeometry(104.043390,
// 30.641982,106.655347,31.786691);//几何距离
// System.out.println(distance);
// System.out.println(distance1);
// System.out.println("距离计算：");
// System.out.println("行驶距离-----" + distance+"米");
// System.out.println("=================================================");
// System.out.println("地址>>>>>>>>高德坐标:");
// System.out.println(address+"地址转换高德坐标-----" + coordinate);
// System.out.println("=================================================");
// BigDecimal coordsyslon =new BigDecimal(116.481499); //GPS坐标
// BigDecimal coordsyslat =new BigDecimal(39.990475); //GPS坐标
// System.out.println("GPS坐标>>>>>>>>高德坐标:");
// String moordsys =convert(coordsyslon,coordsyslat); //高德坐标
// System.out.println(moordsys);
// System.out.println("=================================================");
// BigDecimal lon=new BigDecimal(104.06342);
// BigDecimal lat=new BigDecimal(30.541304);
// String address2=getAddress(lon,lat);
// System.out.println(address2);
// System.out.println(getLocalCity(originlon,originlat));
	}
}
