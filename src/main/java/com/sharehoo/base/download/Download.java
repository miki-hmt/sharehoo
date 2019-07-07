package com.sharehoo.base.download;
import java.io.*;  
import java.net.*;  

import javax.annotation.Resource;
import javax.servlet.*;  
import javax.servlet.http.*;  
import javax.servlet.annotation.*;  

import jiabin.service.SourceService;
  
@WebServlet(name = "download", urlPatterns = { "/download" })  
public class Download extends HttpServlet {  
    private static final long serialVersionUID = 1L;
    
    @Resource
    private SourceService sourceService;
    protected void service(HttpServletRequest request,  
            HttpServletResponse response) throws ServletException, IOException {
    		String name=request.getParameter("source_name");
        String filePath = this.getServletContext().getRealPath("/");// 获取真实路径  
        
        String downloadFilename =name;// 在下载框默认显示的文件名  
        downloadFilename = URLEncoder.encode(downloadFilename, "UTF-8");  
        // 对默认下载的文件名编码。不编码的结果就是，在客户端下载时文件名乱码  
        File file = new File(filePath + File.separator + name);  
        if (file.exists()) {  
            // 写明要下载的文件的大小  
            response.setContentLength((int) file.length());  
            response.setHeader("Content-Disposition", "attachment;filename="  
                    + downloadFilename);// 设置在下载框默认显示的文件名  
            response.setContentType("application/octet-stream");// 指明response的返回对象是文件流  
            // 读出文件到response  
            // 这里是先需要把要把文件内容先读到缓冲区  
            // 再把缓冲区的内容写到response的输出流供用户下载  
            FileInputStream fileInputStream = new FileInputStream(file);  
            BufferedInputStream bufferedInputStream = new BufferedInputStream(  
                    fileInputStream);  
            byte[] b = new byte[bufferedInputStream.available()];  
            bufferedInputStream.read(b);  
            OutputStream outputStream = response.getOutputStream();  
            outputStream.write(b);  
            // 人走带门  
            bufferedInputStream.close();  
            outputStream.flush();  
            outputStream.close();  
        }  
    }  
}  
