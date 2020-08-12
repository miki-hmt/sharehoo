package com.sharehoo.base.ipseek;

/**
 * 绝对路径提供类
 */
public interface RealPathResolver {
	/**
	 * 获得绝对路径
	 * 
	 * @param path
	 * @return
	 * @see javax.servlet.ServletContext#getRealPath(String)
	 */
	public String get(String path);
}

