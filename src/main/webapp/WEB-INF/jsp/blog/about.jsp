<%@page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--修改日期格式只显示年月日  -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>${user.nickName}博客介绍--技术交流_干货分享_课设下载_源码下载</title>
		<meta name="baidu-site-verification" content="qGEMPsi9L8" />
 		<meta name="Author" content="miki">
  		<meta name="Keywords" content="课设,下载,博客,论坛,IT资讯,开发心得,干货分享,代码,源码">
  		<meta name="Description" content="sharehoo.cn资讯交流平台--专注于程序员开发道路的技术分享，问题解决。
	会员可以发帖交流与讨论，每个人都有一个个人博客，可以在上面写下自己的心得与感悟。同时提供资源下载，开源源码下载，课程设计，专注于服务大学生。">	
		<link href="${host}/blog/include/css/base.css" rel="stylesheet"/>
		<link href="${host}/blog/include/css/about.css" rel="stylesheet"/>
		<link href="${host}/blog/include/css/media.css" rel="stylesheet"/>
		<link href="${host}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />
		<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0"/>
		<!--[if lt IE 9]>
		<script src="../include/js/modernizr.js"></script>
		<![endif]-->
	</head>
<body>
<div class="ibody">
  <header>
    <h1>${user.nickName }的博客</h1>
    <h2>愿居于一城，与卿所见美好......</h2>
    <div class="logo"><a href="../index/index"></a></div>
  <%@ include file="./nav.jsp" %> 
   </header>
  <article>
    <h3 class="about_h">您现在的位置是：<a href="${host}/blog/${user.nickNameId}">首页</a>><a href="${host}/blog/${user.nickNameId}/about">关于我</a></h3>
    <div class="about">
      <h2>Just about me</h2>
      <ul>
       <c:forEach items="${aboutList }" var="me">
       		${me.content }
       </c:forEach>
       </ul>
      <h2>About my blog</h2>
      <ul class="blog_a">
        <p>域  名：sharehoo.cn
        <p>服务器：阿里云
        <p>程  序：社区博客</p>
      </ul>
    </div>
  </article>
  <aside>
   <%@ include file="./info.jsp" %>
  </aside>
  <script src="${host}/blog/include/js/silder.js"></script>
  <div class="clear"></div>
  <!-- 清除浮动 --> 
</div>
</body>
</html>
