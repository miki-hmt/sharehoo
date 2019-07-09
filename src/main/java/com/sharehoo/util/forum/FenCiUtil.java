package com.sharehoo.util.forum;

import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.sharehoo.base.fencisys.ChineseAndEnglish;
import com.sharehoo.base.fencisys.CnUtil;
import com.sharehoo.base.fencisys.GenerateDictionary1;
import com.sharehoo.base.fencisys.Segmentation;

public class FenCiUtil {

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
		  String ms="大家早上好";
		  //String ms1=new String(ms.getBytes("utf-8"),"utf-8");
		  List<String> cnList1= CnUtil.EnFnCi(ms);
		  for(String item: cnList1){
			  System.out.println("测试结果："+item);
		  }
		System.out.println("中文分词数："+cnList1.size()+"英文分词数："+enList.size());
	}
	
}
