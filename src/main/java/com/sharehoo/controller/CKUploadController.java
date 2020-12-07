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
import javax.servlet.http.HttpSession;

import com.sharehoo.config.SessionUtil;
import com.sharehoo.config.annotation.HasLogin;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.sharehoo.config.lang.Consts;
import com.sharehoo.entity.forum.User;
import com.sharehoo.util.BootPathUtil;
import com.sharehoo.util.StringEx;
import com.sharehoo.util.forum.DateUtil;
import com.sharehoo.util.forum.WaterMark;

import net.sf.json.JSONObject;

/**
 * 2019.08.15 miki实现ckeditor4.3版本文本编辑器上传图片功能
 * ckeditor4.10版本上传方法如util中UploadAction所示
 */
@Configuration
@Controller
public class CKUploadController {	
	private File upload;       //文件  
    private String uploadContentType;   //文件类型  
    private String uploadFileName;       //文件名
    
    private Logger logger = Logger.getLogger(CKUploadController.class);
    
    @Value("${forum.WATER_NARK_CONTENT}")
	private String WATER_NARK_CONTENT;
	@Value("${forum.WATER_MARK_PATH}")
	private String WATER_MARK_PATH;
    /** 
     * 图片上传 
     * @return 
     * @throws Exception 
     */
    @HasLogin(value="文件上传权限校验")
    @RequestMapping("/topic/ckupload")
    public String execute(HttpServletRequest request,HttpServletResponse response,@RequestParam(value="uploadFileName",required=false) String uploadFileName,
    		@RequestParam("upload") MultipartFile upload,@RequestParam(value="uploadContentType",required=false) String uploadContentType,
    		@RequestParam(value="CKEditorFuncNum",required=false) String CKEditorFuncNum) throws Exception{
    	JSONObject result=new JSONObject();

        User currentUser = SessionUtil.getUser();

        // CKEditor提交的很重要的一个参数    
    	String staticPath = BootPathUtil.getStaticPath();
    	
        PrintWriter out =  response.getWriter();    
        // CKEditor提交的很重要的一个参数    
        String callback = CKEditorFuncNum;  
        String expandedName = "";  //文件扩展名
        if(uploadContentType==null) {
        	uploadContentType = upload.getContentType();
        }
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
        if(upload.getSize() > 600*1024*6){
        	
        	result.put("uploaded", 0);
        	JSONObject errorJson=new JSONObject();
        	errorJson.put("message","文件大小不得大于3.5M");
        	result.put("error",errorJson);
        	out.println(result);   
            return null;    
        }      
               
        /***************
         * 2019.08.15	miki	重新改造文件上传的路径，将文件传输到外部指定位置
         * ********************************************************************/
        InputStream is = upload.getInputStream(); 
        String uploadPath = staticPath +"/images/topicImage/"+Consts.SDF_YYYYMM.format(new Date());    
        String fileName=DateUtil.getCurrentDateStr()+StringEx.get8UUID();    
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
            
        /* miki	2018.07.28
           * 服务器图片上传路径E:/eclipse与项目文件/Soft/apache-tomcat-7.0.55/webapps/Forum/images/topicImage/	
         */
        
        String content=WATER_NARK_CONTENT+"/"+currentUser.getNickName();
        String water_path=WATER_MARK_PATH;
        
        WaterMark.pressText(content,uploadPath+"/"+fileName,"宋体",1,2,40, 400, 30);
               
        // 结合ckeditor功能
        // 2018.07.28   ckeditor4.10版本之后必须要采用此方式来进行上传
        
        String imageContextPath = request.getContextPath() + "/" + "images/topicImage/"+Consts.SDF_YYYYMM.format(new Date());   
        // 返回"图像"选项卡并显示图片    
        
        result.put("uploaded",1);
        result.put("fileName",fileName);
        result.put("url", imageContextPath +"/"+ fileName);
   
        out.println(result);
        return null;
    }
    
    
    
    /** 
    * @Title: execute  
    * @Description: TODO(4.3版本的ck上传图片)  
    * @author miki 
    * @date 2019年8月28日 下午10:45:56   
    * @throws
     */
    @RequestMapping("/topic/upload")
    public String ckUploadImage(HttpServletRequest request,HttpServletResponse response,@RequestParam(value="uploadFileName",required=false) String uploadFileName,
    		@RequestParam("upload") MultipartFile upload,@RequestParam(value="uploadContentType",required=false) String uploadContentType,
    		@RequestParam(value="CKEditorFuncNum",required=false) String CKEditorFuncNum) throws Exception{  
        
    	// CKEditor提交的很重要的一个参数    
    	String staticPath = BootPathUtil.getStaticPath();
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
        if(upload.getSize() > 600*1024){    
            out.println("<script type=\"text/javascript\">");      
            out.println("window.parent.CKEDITOR.tools.callFunction(" + callback + ",''," + "'文件大小不得大于600k');");     
            out.println("</script>");    
            return null;    
        }    
            
        InputStream is = upload.getInputStream();    
        String uploadPath = staticPath +"/images/topicImage/"+Consts.SDF_YYYYMM.format(new Date());    
        String fileName=DateUtil.getCurrentDateStr()+StringEx.get8UUID();    
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
        out.println("window.parent.CKEDITOR.tools.callFunction(" + callback + ",'" + "images/sourceImage/" +
        Consts.SDF_YYYYMM.format(new Date() +"/"+fileName + "','')"));      
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
