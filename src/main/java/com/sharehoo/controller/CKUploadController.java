package com.sharehoo.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sharehoo.config.lang.Consts;
import com.sharehoo.util.forum.DateUtil;

/**
 * 2019.08.15 miki实现ckeditor4.3版本文本编辑器上传图片功能
 * ckeditor4.10版本上传方法如util中UploadAction所示
 */
@Controller
public class CKUploadController {	
	private File upload;       //文件  
    private String uploadContentType;   //文件类型  
    private String uploadFileName;       //文件名  
    /** 
     * 图片上传 
     * @return 
     * @throws Exception 
     */  
    @RequestMapping("/ckupload")
    public String execute(HttpServletRequest request,HttpServletResponse response) throws Exception{  
    	String basePath = System.getProperty("catalina.home").replace("\\", "/");  
        PrintWriter out =  response.getWriter();    
        // CKEditor提交的很重要的一个参数    
        String callback = request.getParameter("CKEditorFuncNum");  
        String expandedName = "";  //文件扩展名    
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
            out.println("<script type=\"text/javascript\">");      
            out.println("window.parent.CKEDITOR.tools.callFunction(" + callback + ",''," + "'文件格式不正确（必须为.jpg/.gif/.bmp/.png文件）');");     
            out.println("</script>");    
            return null;    
        }    
        if(upload.length() > 600*1024){    
            out.println("<script type=\"text/javascript\">");      
            out.println("window.parent.CKEDITOR.tools.callFunction(" + callback + ",''," + "'文件大小不得大于600k');");     
            out.println("</script>");    
            return null;    
        }    
               
        /***************
         * 2019.08.15	miki	重新改造文件上传的路径，将文件传输到外部指定位置
         * ********************************************************************/
        InputStream is = new FileInputStream(upload);    
        String uploadPath = basePath + Consts.FORUM_CKEDITOR_UPLOAD_PATH +"/"+Consts.SDF_YYYYMM.format(new Date());    
        String fileName=DateUtil.getCurrentDateStr()+UUID.randomUUID().toString();    
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
            
        // 返回"图像"选项卡并显示图片    
        out.println("<script type=\"text/javascript\">");      
        out.println("window.parent.CKEDITOR.tools.callFunction(" + callback + ",'" + uploadPath + fileName + "','')");      
        out.println("</script>");    
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
    }
}
