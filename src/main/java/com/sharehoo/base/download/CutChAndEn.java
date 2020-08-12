package com.sharehoo.base.download;
import java.util.ArrayList;

/*
 * 2017.08.24 miki 含有中英文截断操作
 */
public class CutChAndEn {
    public static void main(String[] args) {
        ArrayList<String> lst = new ArrayList<String>();
        lst.add("AGS(American Geographical Society)美国地理学会 ");
        lst.add("AGS(Appalachian Geological Society)阿巴拉契亚地质学会(美国) ");
        lst.add("Ahnfeltia(红藻类)伊谷草属(Q) ");
        lst.add("Ahnfeltia(1)红藻类伊谷草属(Q) ");
        lst.add("American Institute of Chemical Engineers美国化学工程师学会 ");
 
        for (int k = 0; k < lst.size(); k++) {
            StringBuffer sb = new StringBuffer();
            String s1 = lst.get(k);
            for (int i = 0; i < s1.length(); i++) {
                char c = s1.charAt(i);
                Character.UnicodeBlock cUB = Character.UnicodeBlock.of(c);
                if (cUB != Character.UnicodeBlock.CJK_UNIFIED_IDEOGRAPHS) {
                    sb.append(c);
                } else {
                    if (sb.substring(i - 1).equals("(")) {
                        sb.setCharAt(i - 1, '\t');
                        sb.append("(" + s1.substring(i));
                    } else if (sb.substring(i - 1).equals(")")) {
                        int idx = sb.indexOf("(");
                        if (idx >= 0) {
                            try {
                                Integer.parseInt(sb.substring(idx + 1, i - 1));
                                sb.setCharAt(idx, '\t');
                                StringBuffer sb1 = new StringBuffer();
                                sb1.append(sb.substring(0, idx));
                                sb1.append("\t" + s1.substring(idx));
                                sb = sb1;
                            } catch (NumberFormatException e) {
                                sb.append("\t" + s1.substring(i));
                            }
                        }
                    } else {
                        sb.append("\t" + s1.substring(i));
                    }
                    break;
                }
            }
            System.out.println(sb.toString());
        }
    }
}