package com.sharehoo.base.fencisys;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;

public class GenerateDictionary {
	public void GenHashDic(String filename, HashMap hm, HashMap len) throws FileNotFoundException, IOException {
		String s = new String();
		BufferedReader in = new BufferedReader(
				new FileReader(GenerateDictionary.class.getClassLoader().getResource("/image_upload/source_upload/file")
						+ "\\" + filename));
		while ((s = in.readLine()) != null) {
			hm.put(s, s.length());
			len.put(s.length(), s);
		}
	}


}
