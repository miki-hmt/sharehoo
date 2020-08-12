/**
 * 
 */
package com.sharehoo.config.lang;

/**
* @ClassName: EnumLog  
* @Description: TODO(日志类型枚举)  
* @author miki
* @date 2019年6月19日 上午11:40:33  
*
 */
public enum EnumLog {
	LOGIN(1, "logined"),
	FAVORED(2, "favored"),
	POSTED(3, "posted"),
	COMMENT(4, "comment"),
	BROWSE(5, "browse");
	
	private int index;
	private String text;
	
	private EnumLog(int index, String text) {
		this.index = index;
		this.text = text;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}
	
}
