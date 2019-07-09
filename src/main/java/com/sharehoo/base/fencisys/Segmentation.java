package com.sharehoo.base.fencisys;

import java.util.HashMap;

public class Segmentation {

	private String tem = null;
	private HashMap mapDic, len;

	public Segmentation(HashMap mapDic, HashMap len) {
		this.mapDic = mapDic;
		this.len = len;
	}

	public String Fmm(String source) {
		String[] targets = new String[source.length()];
		String target = "";
		int MaxLen = source.length();
		int temLen = MaxLen;
		int primarylen = 0;
		while (true) {
			if (len.containsKey(temLen)) {
				tem = source.substring(primarylen, temLen);
				if (mapDic.containsKey(tem) || temLen - primarylen == 1) {
					primarylen = temLen;
					temLen = MaxLen;
					if (primarylen == MaxLen)
						target = target + tem;
					else
						target = target + tem + "/";
				} else
					temLen--;
			} else
				temLen--;

			if (primarylen == MaxLen)
				break;
		}
		return target;
	}

	public String Bmm(String source) {
		String[] targets = new String[source.length()];
		String target="";
		int MaxLen = source.length();
		int temLen = MaxLen;
		int primarylen = 0;
		int i=0;
		while (true) {
			if (len.containsKey(temLen)) {
				tem = source.substring(primarylen, temLen);
				if (mapDic.containsKey(tem)||temLen-primarylen==1) {
					if (temLen == MaxLen){
						targets[i] = tem;
						}
					else{
						tem = tem+"/";
					targets[i] = tem;
					}
					temLen = primarylen;
					primarylen = 0;
					i++;
				} else
					primarylen++;
			} else
				primarylen++;
			if (temLen == 0)
				break;
		}
		
		for(int j=i-1;j>=0;j--)
			target+=targets[j];		
		return target;
	}

}
