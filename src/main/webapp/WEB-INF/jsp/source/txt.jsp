<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>java学习文档专区</title>
<link href="${pageContext.request.contextPath}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />
<style type="text/css">

body{
	background-color:#C7EDCC;
	margin:0 auto;
	
}

.div1{
	background-color:#FFFFFF;
	width:1000px;    /*350px*/
	height:600px;
	border:1px solid gray;
	margin:0px auto;  /*650px*/
}

/*定义几个常用的字体*/
.font1{
margin-left:500px;
font-weight:bold;
font-size: 15px;
}

/*定义几个超链接*/
a:link{
	text-decoration:none;
}

.span1{
	height:30px;
	background-color: pink;
	display: block;
	box-shadow:2px 5px 5px rgba(0,0,0,0.8); 
}

/*背景色调宽度调节*/
.span1 a{
	margin-left: 320px;  /*更改“更多小游戏” 字体的位置 */
}

.faceul{
	border:0px solid green;
	width:1000px;  /*350px   定义左浮动宽度，仅在定义宽度内进行 浮动   2016.10.28*/
	height:140px; 
	/*background-color:green;*/
	     /*去除<li>列表前的点*/
	list-style-type: none;
	padding:0;   /*图片左边紧挨边框*/
	
}



/*控制图片里文字的大小*/
.faceul a{
	font-size: 12px;
	margin-left:14px; /*字体居中*/
	margin-top:1px;
}


    /*faceul li用于控制单个图片区域的大小*/
.faceul li{
	border:1px solid silver;
	float:left;
	width:160px;
	height:130px;
	/*background-color:pink;*/
	margin-left:2px;
	text-align:center;/*表示其它元素将居中*/
	padding:0px;
	box-shadow:2px 5px 5px rgba(0,0,0,0.8); 
}


   /*控制图片大小*/
.faceul img{
	width:150px;
	margin-left: 5px;  /*控制图片之间的间距*/
	margin-top:3px;
	margin-bottom:3px;
	
}

</style>
</head>
<div style="height:160px;">
<jsp:include page="../common/top1.jsp"/>
</div>
<body>

<div class="div1">
    	<div>
            <span class="span1"><font class="font1">j2ee文档</font><a href="#"><font size=2px>>>更多内容>></font></a></span>
            <ul class="faceul">
            <li><img src="../images/mogu.jpg"/><br/><a href="./W3CSchool/www.w3school.com.cn/index.html" target="blank">w3cschool</a></li>
            <li><img src="../images/mogu.jpg"/><br/><a href="./zhiwu/shi.htm" target="blank">JDK查询文档</a></li>
            <li><img src="../images/mogu.jpg"/><br/><a href="./struts2/struts21/index.html"  target="blank">struts2文档</a></li>
            <li><img src="../images/mogu.jpg"/><br/><a href="./hibernate/Hibernate.html"  target="blank">hibernate文档</a></li>
	    
            <li><img src="../images/mogu.jpg"/><br/><a href="./jquery3.0/jQuery3.1.html"  target="blank">jquery3.1文档</a></li>
	    <li><img src="../images/mogu.jpg"/><br/><a href="./h5/HTML521/indexhtml1.html"  target="blank">h5文档</a></li>
	    <li><img src="../images/mogu.jpg"/><br/><a href="./js/JavaScript.html"  target="blank">js文档</a></li>
	    <li><img src="../images/mogu.jpg"/><br/><a href="./css3/CSS3.0.html"  target="blank">css3文档</a></li>
	    <li><img src="../images/mogu.jpg"/><br/><a href="./zhengze/zzbd.html"  target="blank">正则表达式文档</a></li>
            <li><img src="../images/1.jpg"/><br/><a href="../source.jsp">返回下载页</a></li>
            </ul>
    	</div>
    	
    	
    	
  	
    	
    </div>

</body>
</html>