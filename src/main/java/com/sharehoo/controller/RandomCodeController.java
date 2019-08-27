package com.sharehoo.controller;

import java.awt.image.BufferedImage;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;

@Controller
public class RandomCodeController {
	
	@Autowired
    private Producer captchaProducer;
	
	@RequestMapping("/imageCode")
    public ModelAndView getKaptchaImage(HttpServletRequest request, HttpServletResponse response) throws Exception {
        response.setDateHeader("Expires", 0);
        // Set standard HTTP/1.1 no-cache headers.
        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
        // Set IE extended HTTP/1.1 no-cache headers (use addHeader).
        response.addHeader("Cache-Control", "post-check=0, pre-check=0");
        // Set standard HTTP/1.0 no-cache header.
        response.setHeader("Pragma", "no-cache");
        response.setContentType("image/jpeg");
        // create the text for the image
        String capText = captchaProducer.createText();
        
      //个位数字相加
        String s1 = capText.substring(0, 3);
        String s2 = capText.substring(3, 6);
        int count = Integer.valueOf(s1).intValue() + Integer.valueOf(s2).intValue();
        
        capText = s1 + "+" + s2 + "=?";
      
        //log.info("******************验证码是: " + capText + "******************");
        // store the text in the session
        request.getSession().setAttribute(Constants.KAPTCHA_SESSION_KEY, count);
        // create the image with the text
        BufferedImage bi = captchaProducer.createImage(capText);
        ServletOutputStream out = response.getOutputStream();
        // write the data out
        ImageIO.write(bi, "jpg", out);
        try {
            out.flush();
        } finally {
            out.close();
        }
        return null;
    }
}
