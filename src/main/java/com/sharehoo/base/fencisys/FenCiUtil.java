package com.sharehoo.base.fencisys;

import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import jiabin.fencisys.ChineseAndEnglish;
import jiabin.fencisys.GenerateDictionary;
import jiabin.fencisys.ImportCorpus;
import jiabin.fencisys.Segmentation;

public class FenCiUtil {
	
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
	public static void main(String[] args) throws IOException {
		// FileInputStream fis = new FileInputStream("199801.txt");
		// FileOutputStream fos = new FileOutputStream("dic.txt");
		// ImportCorpus readF = new ImportCorpus(fis, fos);
		// readF.readDic();
		// System.out.println("导入结束");

		String filename = "dic.txt";
		HashMap hm = new HashMap();
		HashMap len = new HashMap();
		GenerateDictionary1 genDic = new GenerateDictionary1();
		Segmentation seg;

		genDic.GenHashDic(filename, hm, len);

		System.out.println("请输入您需要分解的语句：");

		InputStreamReader reader = new InputStreamReader(System.in);
		BufferedReader br = new BufferedReader(reader);
		String data = "";
		data = br.readLine();
		
		seg = new Segmentation(hm, len);
		
		String BmmTarget = seg.Bmm(data);
//		if(FmmTarget.indexOf("/")>0){
//			int i=FmmTarget.indexOf("/");
//			String mm=FmmTarget.substring(0, i);
//			System.out.println("截取后的第一个字段为："+mm);
//		}
		String[] ary = BmmTarget.split("/");//调用API方法按照逗号分隔字符串
		  List<String> cnList=new ArrayList<String>(); 
		  List<String> enList=new ArrayList<String>();
		  for(String item: ary){
			  if(!ChineseAndEnglish.isEnglish(item)){
				  	cnList.add(item);				
				}else{
					enList.add(item);
				}
			  System.out.println(item);
		  }
		  List<String> cnList1= FenCiUtil.EnFnCi("饿了就吃饭");
		  for(String item: cnList1){
			  System.out.println("测试结果："+item);
		  }
		System.out.println("BMM算法统计结果为: " + BmmTarget);
		System.out.println("中文分词数："+cnList1.size()+"英文分词数："+enList.size());
	}
	
}
