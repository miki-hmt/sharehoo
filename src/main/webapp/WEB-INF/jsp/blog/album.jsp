﻿<%@page pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--修改日期格式只显示年月日  -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>${user.nickName}的个人博客—相册--IT帮-资讯传播社区</title>
		<meta name="keywords" content="${user.nickName},个人博客" />
		<meta name="description" content="${user.nickName}的个人博客。" />
		<link href="${pageContext.request.contextPath}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />
		<link href="../blog/include/css/base.css" rel="stylesheet"/>
		<link href="../blog/include/css/style.css" rel="stylesheet"/>
		<link href="../blog/include/css/media.css" rel="stylesheet"/>
		<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0"/>
		<!--[if lt IE 9]>
		<script src="js/modernizr.js"></script>
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
    <h2 class="about_h">您现在的位置是：<a href="${pageContext.request.contextPath }/blog/Blog_show.action?userId=${user.id}">首页</a>><a href="${pageContext.request.contextPath }/blog/AlbumShow_list.action?userId=${user.id}">相册</a></h2>
    <div class="template">
     <h3>
        <p><span>个人相册</span></p>
     </h3>
      <ul>
      <c:forEach items="${ albumList}" var="album">
        <li><a href="${pageContext.request.contextPath }/blog/AlbumShow_photo.action?aid=${album.id }" ><img src="${pageContext.request.contextPath }/${album.image}"/></a><span>${album.title }</span></li>
      </c:forEach>
      </ul>
     <h3>
        <p><span>最新评论</span></p>		<!-- 2017.06.04 评论内容关于相册的 -->
      </h3>
      <ul class="pl_n">
       <c:forEach items="${phCritiques }" var="critique">
        <dl>
          <dt><img src="${pageContext.request.contextPath }/blog/include/images/s8.jpg"> </dt>
          <dt> </dt>
          <dd>${critique.name }
            <time><fmt:formatDate value="${critique.time }" pattern="yyyy-MM-dd HH:mm:ss "/></time>
          </dd>
         	<font style="color:gray;">${critique.content }</font> 
        </dl>
        </c:forEach>
      </ul>
      <h3>
        <p><span>留下足迹</span></p>
        <a href="#" target="_blank" class="more"></a>
      </h3>
       <form action="${pageContext.request.contextPath}/blog/Critique_savePh.action?userId=${user.id}" method="post" >
      		<table>
      			<tr>
      				<td><span>您的昵称:</span></td><td><input type="text" name="critique.name"/></td>
      			</tr>
      			<tr>
	    			<td><div style="width:70px;padding-bottom: 189px;"><span>留言内容:</span>
	    			</div></td><td><textarea name="critique.content" style ="height:200px; width:630px;" ></textarea></td>
    			</tr>
    			<tr>
	    			<td></td><td><button type="submit" style="width: 60px;height: 30px;font-size: larger;">提交</button></td>
    			</tr>
    			
    			<input type="hidden" name="critique.user.id" value="${user.id }"/>
      		</table>
      </form>
  </article>
  <aside>
    <div class="rnav">
      <li class="rnav1 "><a href="http://123.206.23.11/">个人博客</a></li>
      <li class="rnav2 "><a href="http://user.qzone.qq.com/787894993">QQ空间</a></li>
      <li class="rnav3 "><a href="#">个人作品</a></li>
      <li class="rnav4 "><a href="#">程序开发</a></li>
    </div>
    <div class="ph_news">
      <h2>
        <p>点击排行</p>
      </h2>
     <ul class="ph_n">
        <c:forEach items="${countList }" var="article" varStatus="state">
		      <c:choose>
		      	<c:when test="${ state.index<3}">
		      		<li><span class="num1">${ state.index+1 }</span><a href="${pageContext.request.contextPath}/blog/Blog_detail.action?id=${article.id}"  target="_blank">${article.title }</a></li>       	
		      	</c:when>
		      	<c:otherwise>
		      		<li><span>${state.index+1 }</span><a href="${pageContext.request.contextPath}/blog/Blog_detail.action?id=${article.id}"  target="_blank">${article.title }</a></li>
		      	</c:otherwise>
		      	</c:choose>
		      </c:forEach>
      </ul>
      <h2>
        <p>栏目推荐</p>
      </h2>
      <ul class="ph_n">
      <c:forEach items="${recommendList }" var="article" varStatus="state">
		      	<c:choose>
		      		<c:when test="${ state.index<3}">
		      			<li><span class="num1">${ state.index+1 }</span><a href="${pageContext.request.contextPath}/blog/Blog_detail.action?id=${article.id}"  target="_blank">${article.title }</a></li>       	
		      		</c:when>
		      	<c:otherwise>
		      		<li><span>${ state.index+1 }</span><a href="${pageContext.request.contextPath}/blog/Blog_detail.action?id=${article.id}"  target="_blank">${article.title }</a></li>
		      	</c:otherwise>
		      </c:choose>
		      </c:forEach>
      </ul>
    </div> 
    <%@ include file="./copyright.jsp" %> 
  </aside>
  <script src="../blog/include/js/silder.js"></script>
  <div class="clear"></div>
  <!-- 清除浮动 --> 
</div>
</body>
</html>
