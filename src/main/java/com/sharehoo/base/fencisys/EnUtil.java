package com.sharehoo.base.fencisys;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class EnUtil {
	public static List EnFnCi(String s) throws IOException{
		String filename = "dic.txt";
		HashMap hm = new HashMap();
		HashMap len = new HashMap();
		GenerateDictionary genDic = new GenerateDictionary();
		Segmentation seg;

		genDic.GenHashDic(filename, hm, len);

		String data = "";
		data = s;
		
		seg = new Segmentation(hm, len);
		
		String BmmTarget = seg.Bmm(data);
		String[] ary = BmmTarget.split("/");//调用API方法按照逗号分隔字符串 
		  List<String> enList=new ArrayList<String>();
		  for(String item: ary){
			  if(ChineseAndEnglish.isEnglish(item)){
				  	enList.add(item);				
				}
		  }
		System.out.println("英文BMM算法统计结果为: " + BmmTarget);
		//System.out.println("英文分词数："+enList.size());
		return enList;
	}
}
