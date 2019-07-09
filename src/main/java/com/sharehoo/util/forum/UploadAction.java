package com.sharehoo.util.forum;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Properties;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

public class UploadAction {			//extends ActionSupport implements ServletRequestAware

	/**
	 * 2018.07.15 miki实现ckeditor4.10文本编辑器上传图片功能
	 */
	private static final long serialVersionUID = 1L;
	private HttpServletRequest request;
	/*private HttpServletResponse response = ServletActionContext.getResponse(); 
	@Override
	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		 this.setRequest(request);
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}
	
	public HttpServletResponse getResponse() {
		return response;
	}

	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}  
	
	
	
	
	private File upload;       //文件  
    private String uploadContentType;   //文件类型  
    private String uploadFileName;       //文件名  
    
    *//** 
     * 图片上传 
     * @return 
     * @throws Exception 
     * Exception异常与io异常的区别：io异常只针对于上传过程中的异常，exception是ioexception的父类
     *//*  
    public String execute() throws Exception{  
        
    	
    	 3. 读取水印配置信息   **3**
		 * 把配置文件内容加载到prop中
		 
		Properties props = new Properties();
		try {
			props.load(this.getClass().getClassLoader().getResourceAsStream("resource.properties"));
		} catch (IOException e1) {
			throw new RuntimeException(e1);
		}
    	
    	JSONObject result=new JSONObject(); 
        getResponse().setCharacterEncoding("utf-8");  
        PrintWriter out =  getResponse().getWriter();    
        // CKEditor提交的很重要的一个参数    
        String callback = ServletActionContext.getRequest().getParameter("CKEditorFuncNum");  
        String expandedName = "miki";  //文件扩展名    
        if (uploadContentType.equals("image/pjpeg") || uploadContentType.equals("image/jpeg")) {    
            //IE6上传jpg图片的headimageContentType是image/pjpeg，而IE9以及火狐上传的jpg图片是image/jpeg    
            expandedName = ".jpg";    
        }else if(uploadContentType.equals("image/png") || uploadContentType.equals("image/x-png")){    
            //IE6上传的png图片的headimageContentType是"image/x-png"    
            expandedName = ".png";    
        }else if(uploadContentType.equals("image/gif")){    
            expandedName = ".gif";    
        }else if(uploadContentType.equals("image/bmp")){    
            expandedName = ".bmp";    
        }else{
        	
        	result.put("uploaded", 0);
        	JSONObject errorJson=new JSONObject();
        	errorJson.put("message","文件格式不正确（必须为.jpg/.gif/.bmp/.png文件）");
        	result.put("error",errorJson);
        	out.println(result); 
            return null;    
        }    
        if(upload.length() > 600*1024*6){
        	
        	result.put("uploaded", 0);
        	JSONObject errorJson=new JSONObject();
        	errorJson.put("message","文件大小不得大于3.5M");
        	result.put("error",errorJson);
        	out.println(result);   
            return null;    
        }    
            
        InputStream is = new FileInputStream(upload);    
        String uploadPath = ServletActionContext.getServletContext().getRealPath("images/topicImage/"); 
        
        String fileName=DateUtil.getCurrentDateStr()+UUID.randomUUID().toString();
        //String fileName = java.util.UUID.randomUUID().toString();  //采用时间+UUID的方式随即命名    
        fileName += expandedName;    
        File file = new File(uploadPath);  
        if(!file.exists()){  //如果路径不存在，创建  
            file.mkdirs();  
        }  
        File toFile = new File(uploadPath, fileName);    
        OutputStream os = new FileOutputStream(toFile);       
        byte[] buffer = new byte[1024];
        int length = 0;    
        while ((length = is.read(buffer)) > 0) {       
            os.write(buffer, 0, length);       
        }
        is.close();    
        os.close();       
        
         miki	2018.07.28
         * 服务器图片上传路径E:/eclipse与项目文件/Soft/apache-tomcat-7.0.55/webapps/Forum/images/topicImage/	
         
        
        String content=props.getProperty("WATER_NARK_CONTENT");
        String water_path=props.getProperty("WATER_MARK_PATH");
        
        WaterMark.pressText(content,water_path+fileName,"宋体",1,2,40, 280, 1);
        
        
        // 结合ckeditor功能
        // 2018.07.28   ckeditor4.10版本之后必须要采用此方式来进行上传
        
        String imageContextPath = request.getContextPath() + "/" + "images/topicImage/";   
        // 返回"图像"选项卡并显示图片    
        
        result.put("uploaded",1);
        result.put("fileName",fileName);
        result.put("url", imageContextPath + fileName);
   
        out.println(result);    
        return null;  
    }  
    public File getUpload() {  
        return upload;  
    }  
    public void setUpload(File upload) {  
        this.upload = upload;  
    }  
    public String getUploadContentType() {  
        return uploadContentType;  
    }  
    public void setUploadContentType(String uploadContentType) {  
        this.uploadContentType = uploadContentType;  
    }  
    public String getUploadFileName() {  
        return uploadFileName;  
    }  
    public void setUploadFileName(String uploadFileName) {  
        this.uploadFileName = uploadFileName;  
    }*/


}  

	
	
	
	

