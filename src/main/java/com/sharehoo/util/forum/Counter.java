package com.sharehoo.util.forum;

import java.io.BufferedReader; 
import java.io.File; 
import java.io.FileNotFoundException; 
import java.io.FileReader; 
import java.io.FileWriter; 
import java.io.IOException; 
import java.io.PrintWriter; 
  
import javax.servlet.http.HttpServlet; 
  
public class Counter extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	// 写入文件的方法
	public static void write2File(String filename, long count) {
		try {
			PrintWriter out = new PrintWriter(new FileWriter(filename));
			out.println(count);
			out.close();
		} catch (IOException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	// 读文件的方法
	public static long readFromFile(String filename) {
		File file = new File(filename);
		long count = 0;
		if (!file.exists()) {
			try {
				file.createNewFile();
			} catch (IOException e) {
				e.printStackTrace();
			}
			write2File(filename, 0);
		}
		try {
			BufferedReader in = new BufferedReader(new FileReader(file));
			try {
				count = Long.parseLong(in.readLine());
			} catch (NumberFormatException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		return count;
	}
} 
