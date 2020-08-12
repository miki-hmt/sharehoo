package com.sharehoo.test;

import java.io.FileNotFoundException;

import org.springframework.util.ResourceUtils;

public class Test {
	public static void main(String[] args) throws FileNotFoundException {
		String dd = "dassad";
		System.out.println(dd.indexOf("d"));
		String path = ResourceUtils.getURL("classpath:static").getPath().replace("%20"," ");
		System.out.println(path);
	}
}
