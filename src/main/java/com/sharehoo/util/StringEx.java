package com.sharehoo.util;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by zhangshuo on 2016/02/18 字符串处理公用类
 */
public class StringEx {

	private static MessageDigest digest = null;

	public StringEx() {
	}

	public static String getUUID() {
		/*
		 * UUID uuid = UUID.randomUUID(); String str = uuid.toString(); //
		 * 去掉"-"符号 String temp = str.substring(0, 8) + str.substring(9, 13) +
		 * str.substring(14, 18) + str.substring(19, 23) + str.substring(24);
		 * return temp;
		 */

		return UUID.randomUUID().toString().replace("-", "");
	}
	
	public static String get8UUID(){
        UUID id=UUID.randomUUID();
        String[] idd=id.toString().split("-");
        return idd[0];
    }

	public static String encoder(String filePath) throws Exception {

		BufferedInputStream bin = new BufferedInputStream(new FileInputStream(filePath));
		int p = (bin.read() << 8) + bin.read();
		String code = null;

		switch (p) {
		case 0xefbb:
			code = "UTF-8";
			break;
		case 0xfffe:
			code = "Unicode";
			break;
		case 0xfeff:
			code = "UTF-16BE";
			break;
		default:
			code = "GBK";
		}

		return code;
	}

	public static Long strToLong(Object obj) {
		if (isNumeric(obj)) {
			String str = sNull(obj);
			return Long.parseLong(str);
		} else
			return null;

	}

	public static Integer strToInteger(Object obj) {
		if (isNumeric(obj)) {
			String str = sNull(obj);
			return Integer.parseInt(str);
		} else
			return null;

	}

	public static boolean isNumeric(Object obj) {
		if (!isNull(obj)) {
			Pattern pattern = Pattern.compile("^\\d+$|-\\d+$");
			String str = sNull(obj);
			Matcher isNum = pattern.matcher(str);
			if (!isNum.matches()) {
				return false;
			}
			return true;
		} else
			return false;
	}


	/** */
	/**
	 * 按字节长度截取字符串
	 * 
	 * @param str
	 *            将要截取的字符串参数
	 * @param toCount
	 *            截取的字节长�?
	 * @param more
	 *            字符串末尾补上的字符�?
	 * @return 返回截取后的字符�?
	 */
	public static String substring(String str, int toCount, String more) {
		int reInt = 0;
		String reStr = "";
		if (str == null)
			return "";
		char[] tempChar = str.toCharArray();
		for (int kk = 0; (kk < tempChar.length && toCount > reInt); kk++) {
			String s1 = str.valueOf(tempChar[kk]);
			byte[] b = s1.getBytes();
			reInt += b.length;
			reStr += tempChar[kk];
		}
		if (toCount == reInt || (toCount == reInt - 1))
			reStr += more;
		return reStr;
	}

	public static String hash(String data) {
		if (digest == null) {
			try {
				digest = MessageDigest.getInstance("MD5");
			} catch (NoSuchAlgorithmException nsae) {
				System.err.println("Failed to load the MD5 MessageDigest. ");
				nsae.printStackTrace();
			}
		}

		digest.update(data.getBytes());
		return toHex(digest.digest());
	}

	public static String toHex(byte hash[]) {
		StringBuffer buf = new StringBuffer(hash.length * 2);
		int i;
		for (i = 0; i < hash.length; i++) {
			if (((int) hash[i] & 0xff) < 0x10) {
				buf.append("0");
			}
			buf.append(Long.toString((int) hash[i] & 0xff, 16));
		}
		return buf.toString();
	}

	/**
	 * 找到字符串在源串的位�?
	 * 
	 * @param source
	 * @param start
	 * @param tobelocated
	 * @return
	 */
	public static final int indexOf(StringBuffer source, int start, String tobelocated) {
		return source.toString().indexOf(tobelocated, start);
	}

	/**
	 * 替换字符�?
	 * 
	 * @param str
	 * @param oldStr
	 * @param newStr
	 * @return
	 */
	public static String replace(String str, String oldStr, String newStr) {
		if (null == str || null == oldStr || newStr == null)
			return str;
		if (str.length() > 1000000)
			try {
				throw new Exception("源字符串太长!");
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		int len = oldStr.length();
		String post = str;
		StringBuffer resStr = new StringBuffer("");
		int idx;
		while ((idx = post.indexOf(oldStr)) != -1) {
			String pre = post.substring(0, idx);
			post = post.substring(idx + len);
			resStr.append(pre).append(newStr);
		}
		resStr.append(post);
		return resStr.toString();
	}

	/**
	 * 按分割符分割字符�?
	 * 
	 * @param str
	 * @param splitter
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static String[] splitString(String str, String splitter) {
		if (str == null)
			return null;
		if (null == splitter || splitter.length() == 0)
			return (new String[] { str });
		int p = str.indexOf(splitter);
		int prev = 0;
		if (p < 0) {
			String ss[] = new String[1];
			ss[0] = str;
			return ss;
		}
		ArrayList found = new ArrayList();
		String s = null;
		for (; p >= 0; p = str.indexOf(splitter, prev)) {
			if (prev == p)
				s = "";
			else
				s = str.substring(prev, p);
			found.add(s);
			prev = p + 1;
		}

		if (prev < str.length())
			found.add(str.substring(prev, str.length()));
		return (String[]) (String[]) found.toArray(new String[1]);
	}

	/**
	 * 转义字符�?
	 * 
	 * @param str
	 * @return
	 */
	public static String escapeHTML(Object str) {
		String str_ = sNull1(str);
		if (str_.equalsIgnoreCase(""))
			return str_;
		if (str_.length() > 1000000)
			try {
				throw new Exception("源字符串太长!");
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		// str_ = str_.replaceAll("'","\\\\\\'");
		// str_ = str_.replaceAll("\"","\\\\\\\"");
		// str_ = str_.replaceAll(" ","&nbsp;");
		str_ = str_.replaceAll("\'", "�?");
		str_ = str_.replaceAll("\"", "�?");
		str_ = str_.replaceAll("\\\\r\\\\n", "\\\\\\\\r\\\\\\\\n");

		return str_;
	}

	/**
	 * 字符串s在str中出现的次数
	 * 
	 * @param str
	 * @param s
	 * @return
	 */
	public int occurence(String str, String s) {
		if (null == str || null == s)
			return 0;
		int p = str.indexOf(s);
		int cnt = 0;
		if (p < 0)
			return cnt;
		int len = s.length();
		for (cnt++; p < str.length(); cnt++) {
			p += len;
			p = str.indexOf(s, p);
			if (p < 0)
				return cnt;
		}

		return cnt++;
	}

	/**
	 *
	 * 判断字符串对象是否为�?
	 * 
	 * @param obj
	 *            判断对象
	 * @return true:为空 false:不为�?
	 * @see [类�?�类#方法、类#成员]
	 */
	public static boolean isNull(Object obj) {
		Object objTmp = obj;
		if ("".equals(objTmp)) {
			objTmp = null;
		}
		return objTmp == null ? true : false;
	}

	public static String sNull1(Object obj) {

		if (obj != null) {
			String str = obj.toString();
			if (str.indexOf("\"") >= 0) {
				if (str.indexOf("\\\"") < 0 && str.indexOf("\\\\\"") < 0) {
					str = changesyh(str);
				}
			}
			if (str.indexOf("\'") >= 0) {
				if (str.indexOf("\\\'") < 0 && str.indexOf("\\\\\'") < 0) {
					str = changedyh(str);
				}
			} else {

				return str;
			}
			return str;
		} else {
			return "";
		}

	}

	public static String sNull(Object obj) {

		if (obj != null) {
			String str = obj.toString().trim();
			// if(str.indexOf("\"")>=0) {
			// if(str.indexOf("\\\"")<0&&str.indexOf("\\\\\"")<0){
			// str=changesyh(str);
			// }
			// }
			// if(str.indexOf("\'")>=0) {
			// if(str.indexOf("\\\'")<0&&str.indexOf("\\\\\'")<0){
			// str=changedyh(str);
			// }
			// }
			// else{

			// return str;
			// }
			return str;
		} else {
			return "";
		}

	}

	/**
	 * 单引号转�?"
	 * 
	 * @param obj
	 * @return
	 */
	public static String changedyh(Object obj) {
		return obj != null ? obj.toString().replaceAll("\'", "\\\\\'") : "";
	}

	/**
	 * 单引号转码双引号
	 * 
	 * @param obj
	 * @return String
	 */
	public static String changeDyhToSyh(Object obj) {
		return obj != null ? obj.toString().replaceAll("\'", "\''") : "";
	}

	/**
	 * 双引号转�?""
	 * 
	 * @param obj
	 * @return
	 */
	public static String changesyh(Object obj) {
		return obj != null ? obj.toString().replaceAll("\"", "\\\\\"") : "";
	}

	public static String sNullForLogic(Object obj) {
		return obj != null ? obj.toString() : "";
	}

	public static String sIntForLogic(int obj) {
		return obj != 0 ? obj + "" : "";
	}

	public static String sDoubleForLogic(double obj) {
		return obj != 0 ? obj + "" : "";
	}

	public static String sDateForLogic(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return date != null ? sdf.format(date) : "";
	}

	public static String sNull(Object obj, boolean isconvert) {
		if (isconvert)
			return obj != null ? obj.toString() : "";
		else
			return obj != null ? obj.toString() : null;
	}

	/**
	 * 将字符串转换成GBK
	 * 
	 * @param arg
	 * @return
	 * @throws Exception
	 */
	public static String convGbk(String arg) throws Exception {
		if (arg == null) {
			return arg;
		} else {
			String s = null;
			byte b[] = arg.getBytes("ISO-8859-1");
			s = new String(b, "GBK");
			return s;
		}
	}

	/**
	 * 取消GBK
	 * 
	 * @param arg
	 * @return
	 * @throws Exception
	 */
	public static String reverseGbk(String arg) throws Exception {
		if (arg == null) {
			return null;
		} else {
			String s = null;
			byte b[] = arg.getBytes("GBK");
			s = new String(b, "ISO-8859-1");
			return s;
		}
	}

	/**
	 * 转换成html
	 *
	 * @param str
	 * @return
	 */
	public synchronized static String converHtml(String str) {
		if (str == null) {
			return str;
		}
		StringBuffer reStr = new StringBuffer();
		for (int i = 0; i < str.length(); i++) {
			switch (str.charAt(i)) {
			case ' ':
				reStr.append("&nbsp;");
				break;
			case '\r':
				reStr.append(" ");
			case '\n':
				reStr.append("<br>");
			case '\t':
				reStr.append("&nbsp;");
				reStr.append("&nbsp;");
				break;
			default:
				reStr.append(str.charAt(i));
			}
		}
		String replaceStr = reStr.toString();
		return replaceStr;

	}

	/**
	 * 转化字符串成html能够识别的字符串
	 *
	 * @param str
	 *            输出字符�?
	 * @return 替换后的字符�?
	 */
	public static String convertStrToHtml(String str) {
		// String reStr = str;
		// // 下面的代码将字符串以正确方式显示（包括回车，换行，空格）
		// while(reStr.indexOf("\n")!=-1){
		// reStr = reStr.substring(0, reStr.indexOf("\n")) + "<br>" +
		// reStr.substring(reStr.indexOf("\n")+1);
		// }
		// while(reStr.indexOf(" ")!=-1){
		// reStr = reStr.substring(0, reStr.indexOf(" "))+"&nbsp;" +
		// reStr.substring(reStr.indexOf(" ")+1);
		// }
		// return reStr;
		return convertStrToHtml(str, 0);
	}

	/**
	 * 转化字符串成html能够识别的字符串，并对转换后的字符串进行行数处理 如果转换后的字符串的行数大于传入的行数，则返回转换后的字符串
	 * 如果转换后的字符串的行数小于传入的行数，则对转换后的字符串加行处理到传入行数
	 *
	 * @param str
	 *            输出字符�?
	 * @param rowCount
	 *            转换后的行数
	 * @param rowSize
	 *            行的长度（字数）
	 * @return 转换后的字符�?
	 */
	public static String convertStrToHtml(String str, int rowCount, int rowSize) {
		if (str == null) {
			return str;
		}
		int rowNum = 1;
		int wordSize = 1;
		int charSize = 1;
		StringBuffer reStr = new StringBuffer();
		for (int i = 0; i < str.length(); i++) {
			// 如果是汉字，�?个字为一个字长度
			if (0x4e00 < str.charAt(i) && str.charAt(i) < 0x9fbb) {
				wordSize++;
			} else { // 汉字以外的数字，英文字母，标点符�? 2个字作为�?个字长度
				charSize++;
				wordSize = wordSize + (charSize % 2);
			}
			switch (str.charAt(i)) {
			case ' ':
				reStr.append("&nbsp;");
				break;
			case '\r':
				reStr.append("");
				break;
			case '\n':
				reStr.append("<br>");
				rowNum++;
				wordSize = 1;
				break;
			case '\t':
				reStr.append("&nbsp;");
				reStr.append("&nbsp;");
				break;
			default:
				reStr.append(str.charAt(i));
			}
			// 当字数大于指定分行字数时，强制换�?
			if (wordSize > rowSize && rowSize > -1) {
				reStr.append("<br>");
				rowNum++;
				wordSize = 1;
			} else if (wordSize > 44 && rowSize == -1) { // 如果没有指定换行字数，则默认�?44个字为一行，只计算行数，不强制换�?
				rowNum++;
				wordSize = 1;
			}
		}
		// 处理行数
		if (rowNum < rowCount) {
			for (int i = 0; i <= rowCount - rowNum; i++) {
				reStr.append("<br>");
			}
		}

		return reStr.toString();
	}

	/**
	 * 转化字符串成html能够识别的字符串，并对转换后的字符串进行行数处理 如果转换后的字符串的行数大于传入的行数，则返回转换后的字符串
	 * 如果转换后的字符串的行数小于传入的行数，则对转换后的字符串加行处理到传入行数
	 *
	 * @param str
	 *            输出字符�?
	 * @param rowCount
	 *            转换后的行数
	 * @return 转换后的字符�?
	 */
	public static String convertStrToHtml(String str, int rowCount) {
		return convertStrToHtml(str, rowCount, -1);
	}

	/**
	 * 转化字符串成xml能够识别的字符串
	 *
	 * @param str
	 *            输出字符�?
	 * @return 替换后的字符�?
	 */
	public synchronized static String converXml(String str) {
		if (str == null) {
			return str;
		}

		StringBuffer reStr = new StringBuffer();
		for (int i = 0; i < str.length(); i++) {
			switch (str.charAt(i)) {
			case '&':
				reStr.append("&amp;");
				break;
			case '<':
				reStr.append("&lt;");
				break;
			case '>':
				reStr.append("&gt;");
				break;
			case '$':
				reStr.append("$$");
				break;
			case '\'':
				reStr.append("&apos;");
				break;
			case '"':
				reStr.append("&quot;");
			default:
				reStr.append(str.charAt(i));
			}
		}

		String replaceStr = reStr.toString();

		return replaceStr;
	}

	/**
	 * 返回查找字符串在目标字符串中出现的次�?
	 *
	 * @param targetStr
	 *            目标字符�?
	 * @param findStr
	 *            查找字符�?
	 * @return 次数
	 */
	public static int getCount(String targetStr, String findStr) {
		String tempStr = targetStr;
		int count = (tempStr.length() - tempStr.replaceAll(findStr, "").length()) / findStr.length();
		return count;
	}

	public static String splitHtml(String message, long maxLength) {
		StringBuffer sb = new StringBuffer();
		long length = 0;
		String str = message;
		for (int i = 0; i < str.length(); i++) {
			char item = str.charAt(i);
			if (".,:';|".indexOf(item) > -1) {
				length += 3;
			} else if ("[]}{!()` ".indexOf(item) > -1) {
				length += 4;
			} else if ("\"\\~\\/*-_".indexOf(item) > -1) {
				length += 5;
			} else if ("?".indexOf(item) > -1) {
				length += 6;
			} else if ("1234567890$abcdefghijklmnopqrstuvwxyz".indexOf(item) > -1) {
				length += 7;
			} else if ("#".indexOf(item) > -1) {
				length += 8;
			} else if ("=+^><ABCDEFGHIJKLMNOPQRSTUVWXYZ".indexOf(item) > -1) {
				length += 9;
			} else if ("&".indexOf(item) > -1) {
				length += 10;
			} else if ("%".indexOf(item) > -1) {
				length += 11;
			} else {
				length += 12;
			}
			sb.append(item);

			if (length > maxLength - 6) {
				sb.append("...");
				break;
			}
		}
		return sb.toString();
	}
}
