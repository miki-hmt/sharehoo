package com.sharehoo.base.download;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.channels.FileChannel;

public class MikiUtil {
	//计算文件大小，返回M 	miki 2017.08.07
	 public static long GetFileSize(String filePath){
	        long fileSize=0l;
	         FileChannel fc= null;  
	            try {  
	                File f= new File(filePath);  
	                if (f.exists() && f.isFile()){  
	                    FileInputStream fis= new FileInputStream(f);  
	                    fc= fis.getChannel();  
	                    fileSize=fc.size();
	                    //logger.info(fileSize); 
	                }else{  
	                    //logger.info("file doesn't exist or is not a file");  
	                }  
	            } catch (FileNotFoundException e) {  
	                //logger.error(e);  
	            } catch (IOException e) {  
	                //logger.error(e);  
	            } finally {  
	                if (null!=fc){  
	                    try{  
	                        fc.close();  
	                    }catch(IOException e){  
	                        //logger.error(e);  
	                    }  
	                }   
	            } 
	            
	            return fileSize;
	    }
	 public static void main(String[] args){
		 String miki="file_miki74580.zip";
		 System.out.println("文件大小为："+GetFileSize("E:\\eclipse与项目文件\\Soft\\apache-tomcat-7.0.55\\webapps\\Forum\\image_upload\\source_upload\\file\\"+miki));
	 }
}
