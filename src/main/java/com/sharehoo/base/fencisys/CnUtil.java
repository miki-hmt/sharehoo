package com.sharehoo.base.fencisys;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class CnUtil {
	public static List EnFnCi(String key) throws IOException{
		String filename = "dic.txt";
		HashMap hm = new HashMap();
		HashMap len = new HashMap();
		GenerateDictionary genDic = new GenerateDictionary();
		Segmentation seg;

		genDic.GenHashDic(filename, hm, len);
	
		seg = new Segmentation(hm, len);
		
		String FmmTarget = seg.Bmm(key);
		String[] ary = FmmTarget.split("/");//调用API方法按照逗号分隔字符串
		  List<String> cnList=new ArrayList<String>(); 
		  for(String item: ary){
			  if(ChineseAndEnglish.isChinese(item)){
				  	cnList.add(item);				
				}
		  }
		System.out.println("中文BMM算法统计结果为: " + FmmTarget);
		return cnList;
	}
}
