<%@page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>个人博客——关于我</title>
		<meta name="keywords" content="个人博客" />
		<meta name="description" content="sharehoo社区博客。" />
		<link href="${host}/blog/include/css/base.css" rel="stylesheet"/>
		<link href="${host}/blog/include/css/about.css" rel="stylesheet"/>
		<link href="${host}/blog/include/css/media.css" rel="stylesheet"/>
		<script type="text/javascript" src="${host}/ckeditor4.12/ckeditor/ckeditor.js"></script>
		<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0"/>
		<!--[if lt IE 9]>
		<script src="../include/js/modernizr.js"></script>
		<![endif]-->
	</head>
<body>
<div class="ibody">
  <header>
    <h1>铁环的个人博客</h1>
    <h2>愿居于一城，与卿所见美好......</h2>
    <div class="logo"><a href="../manage/article"></a></div>
    <%@ include file="../manage_nav.jsp" %>
  </header>
  <article>
    <h3 class="about_h">您现在的位置是：<a href="../manage/article">首页</a>><a href="#">关于我</a></h3>
    <div class="about">
      <h2>Just about me</h2>
      <ul>
      <form action="" method="post" enctype="multipart/form-data">
      <textarea name="content" class="ckeditor"><c:forEach items="${listByUer }" var="me">${me.content }</c:forEach></textarea>
      <input id="user" name="user.id" value="${user.id }" type="hidden"/>
      <input id="me" name="id" value="${me.id }" type="hidden"/>
      <input type="submit" style="width: 60px;height: 30px;font-size: larger;" value="保存">
	  </form>
       </ul>
      <h2>About my blog</h2>
      <ul class="blog_a">
        <p>域  名：www.sharehoo.cn 创建于2017年03月15日 
        <p>服务器：阿里云
        <p>程  序：个人博客</p>
      </ul>
    </div>
  </article>
  <aside>
   <%@ include file="../info.jsp" %>
  </aside>
  <script src="${host}/blog/include/js/silder.js"></script>
  <div class="clear"></div>
  <!-- 清除浮动 --> 
</div>
</body>
</html>
