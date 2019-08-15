<%@ page contentType="image/jpeg"

	import="java.awt.*, //引入包，Graphics所在的包
	
java.awt.image.*,java.util.*,javax.imageio.*" pageEncoding="utf-8"%>


<%!

/*
*验证码图片 产生机制 2016.08.23 
*/



    //生成随机颜色的代码
Color getRandColor(int fc,int bc)  
{
Random random = new Random();
if(fc>255) fc=255;
if(bc>255) bc=255;
int r=fc+random.nextInt(bc-fc);
int g=fc+random.nextInt(bc-fc);
int b=fc+random.nextInt(bc-fc);
return new Color(r,g,b);
}
%>
<%
out.clear();//这句针对resin服务器，如果是tomacat可以不要这句


response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","no-cache");
response.setDateHeader("Expires", 0);

    //在内存中创建图像  
int width=60, height=20;
BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

   
    //Graphics是抽象类，它的对象是用来给image ()方法做画笔的
    //获取图形上下文 
Graphics g = image.getGraphics();
    
    //生成随机类 
Random random = new Random();

   //设置背景颜色 
g.setColor(getRandColor(200,250));
   
   //构造长方形背景 
g.fillRect(0, 0, width, height);
   
   //设置字体 
g.setFont(new Font("Times New Roman",Font.PLAIN,18));
   
   //getRandColor为随机得到一个color对象 
g.setColor(getRandColor(160,200));
   
   //随机生成155条干扰线，使图像中的认证码不易被其他程序探测到
for (int i=0;i<155;i++)
{
int x = random.nextInt(width);
int y = random.nextInt(height);
int xl = random.nextInt(12);
int yl = random.nextInt(12);
g.drawLine(x,y,x+xl,y+yl);
}
   
    //获取随机产生的认证码(4位数字 )
String sRand="";
for (int i=0;i<4;i++){
String rand=String.valueOf(random.nextInt(10));
sRand+=rand;

    //将认证码显示到图像中 
g.setColor(new Color(20+random.nextInt(110),20+random.nextInt(110),20+random.nextInt(110)));
g.drawString(rand,13*i+6,16);
}


    // 将认证码存入SESSION
    //保存入session用于与用户的输入进行比较 
    //比较完清除session
   
session.setAttribute("sRand",sRand);
g.dispose();


    //输出图像到页面
ImageIO.write(image, "JPEG", response.getOutputStream());
%>