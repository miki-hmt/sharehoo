<%@page pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--修改日期格式只显示年月日  -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1,text/html; charset=utf-8"/> 
        <link rel="shortcut icon" href="../favicon.ico"/> 
		<title>干货下载--技术交流_干货分享_课设下载_源码下载</title>
		<meta name="baidu-site-verification" content="qGEMPsi9L8" />
 		<meta name="Author" content="miki">
  		<meta name="Keywords" content="课设,下载,博客,论坛,IT资讯,开发心得,干货分享,代码,源码">
  		<meta name="Description" content="sharehoo.cn资讯交流平台--专注于程序员开发道路的技术分享，问题解决。
	会员可以发帖交流与讨论，每个人都有一个个人博客，可以在上面写下自己的心得与感悟。同时提供资源下载，开源源码下载，课程设计，专注于服务大学生。">	
		<link href="../blog/include/css/base.css" rel="stylesheet"/>
		<link href="../blog/include/css/style.css" rel="stylesheet"/>
		<link href="../blog/include/css/media.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />
		<script type="text/javascript" src="../blog/include/js/jquery.min.js"></script>
		<script type="text/javascript" src="../blog/include/js/jquery.gallery.js"></script>
		<script type="text/javascript" src="../blog/include/js/modernizr.custom.53451.js"></script>
		<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
		<meta name="viewport" content="width=device-width, minimum-scale=1.0,initial-scale=1.0,maximum-scale=1.0"/>
		<!--[if lt IE 9]>
		<script src="../include/js/modernizr.js"></script>
		<![endif]-->
	</head>
<body>
<div class="ibody">
  <header>
    <h1>${user.nickName }的博客</h1>
    <h2>愿居于一城，与卿所见美好......</h2>
    <div class="logo"><a href="${pageContext.request.contextPath}/blog/Blog_show.action?userId=${user.id}"></a></div>
     <%@ include file="./nav.jsp" %>
    </header>
  <article>
    <h2 class="about_h">您现在的位置是：<a href="${pageContext.request.contextPath}/blog/Blog_show.action?userId=${user.id}">首页</a>><a href=#>资源</a></h2>
    <div class="template">
      <h3>
        
      </h3>
      		<table>
      		<c:forEach items="${fileList}" var="file">
      			<tr>
      				<td><a href="${pageContext.request.contextPath}/image_upload/file/${file.image}">${file.note}</a></td>
      				<td>&nbsp;</td>
      				<td><a href="${pageContext.request.contextPath}/image_upload/file/${file.image}"><button>下载</button></a></td>
      			</tr>
      			</c:forEach>
      		</table>
     </article>
  <aside>
   <%@ include file="./rnav.jsp" %> 
    <div class="ph_news">
      <h2>
        <p>点击排行</p>
      </h2>
      <ul class="ph_n">
        
      </ul>
      <h2>
        <p>栏目推荐</p>
      </h2>
      <ul>
        <s:iterator value="recommendArticles" >
        	<li><a href="../article/article_detail?id=<s:property value="id"/>"><s:property value="title"/></a></li>
      	</s:iterator>
      </ul>
    <%@ include file="./copyright.jsp" %> 
  </aside>
  <script src="../blog/include/js/silder.js"></script>
  <div class="clear"></div>
  <!-- 清除浮动 --> 
</div>
</body>
</html>
