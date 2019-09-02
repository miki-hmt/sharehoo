<%@page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--修改日期格式只显示年月日  -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html>
<html>
    <head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>${user.nickName}博客文章--IT帮-资讯传播社区--技术交流_干货分享_课设下载_源码下载</title>
		<meta name="baidu-site-verification" content="qGEMPsi9L8" />
 		<meta name="Author" content="miki">
  		<meta name="Keywords" content="课设,下载,博客,论坛,IT资讯,开发心得,干货分享,代码,源码">
  		<meta name="Description" content="sharehoo.cn资讯交流平台--专注于程序员开发道路的技术分享，问题解决。
	会员可以发帖交流与讨论，每个人都有一个个人博客，可以在上面写下自己的心得与感悟。同时提供资源下载，开源源码下载，课程设计，专注于服务大学生。">	
		
		<!-- 尾部分页 css页码 	2017.05.24 -->
		<link href="${host}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />
		<link href="${host}/blog/include/css/page.css" rel="stylesheet"/>
		<!--2018.07.18  miki  ckeditor代码高亮	开头这里的样式为默认的风格，可以根据自己的喜好更换风格-->
		<!--我的高亮效果是zenburn-->
		<link rel="stylesheet" href="${host}/highlight/styles/gruvbox-dark.css">
		<script src="${host}/highlight/highlight.pack.js"></script>
		<script>hljs.initHighlightingOnLoad();</script>
		<link href="${host}/blog/include/css/base.css" rel="stylesheet"/>
		<link href="${host}/blog/include/css/style.css" rel="stylesheet"/>
		<link href="${host}/blog/include/css/media.css" rel="stylesheet"/>
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
    <h2 class="about_h">您现在的位置是：<a href="${host}/blog/${user.nickNameId}">首页</a>><a href="${host}/blog/${user.nickNameId}/article">漫生活</a></h2>
    <div class="bloglist">
    <c:forEach items="${articleList }" var="article">
      <div class="newblog">
        <ul>
          <h3><a href="${host}/blog/${user.nickNameId}/article/${article.id}"  target="_blank">${article.title }</a></h3>
          <div class="autor"><span>作者：<a>${article.editer }</a></span><span>分类：[<a href="/">${article.type }</a>]</span><span>浏览（<a href="/">${article.count }</a>）</span><span>评论（<a href="/">${article.count1 }</a>）</span>
          <span>
          </span></div>
          <div class="content">${article.content }</div><a href="${host}/blog/${user.nickNameId}/article/${article.id}"  class="readmore" style="display:inline-block;"  target="_blank">全文</a>
        </ul>
        <figure><img src="${host}/${article.image}" width="200" height="100" /></figure>
        <div class="dateview"><fmt:formatDate value="${article.time }" pattern="yyyy-MM-dd HH:mm:ss "/></div>
      </div>
     </c:forEach>
    </div>
		
	<div class="pagination alternate">
		<ul class="clearfix">
		${pageCode }
		</ul>
	</div> 
	          
  </article>
  <aside>
    <div class="rnav">
      <li class="rnav1 "><a href="#">日记</a></li>
      <li class="rnav2 "><a href="#">欣赏</a></li>
      <li class="rnav3 "><a href="#">编程</a></li>
      <li class="rnav4 "><a href="#">经典语录</a></li>
    </div>
    <div class="ph_news">
      <h2>
        <p>点击排行</p>
      </h2>
      		<ul class="ph_n">
		      <c:forEach items="${countList }" var="article" varStatus="state">
		      <c:choose>
		      	<c:when test="${ state.index<3}">
		      		<li><span class="num1">${ state.index+1 }</span><a href="${host}/blog/${user.nickNameId}/article/${article.id}"  target="_blank">${article.title }</a></li>       	
		      	</c:when>
		      	<c:otherwise>
		      		<li><span>${state.index+1 }</span><a href="${host}/blog/${user.nickNameId}/article/${article.id}"  target="_blank">${article.title }</a></li>
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
		      			<li><span class="num1">${ state.index+1 }</span><a href="${host}/blog/${user.nickNameId}/article/${article.id}"  target="_blank">${article.title }</a></li>       	
		      		</c:when>
		      	<c:otherwise>
		      		<li><span>${ state.index+1 }</span><a href="${host}/blog/${user.nickNameId}/article/${article.id}"  target="_blank">${article.title }</a></li>
		      	</c:otherwise>
		      </c:choose>
		      </c:forEach>
		     </ul>
      <h2>
        <p>最新评论</p>
      </h2>
      <ul class="pl_n">
      <s:iterator value="critiques" >
        <dl>
          <dt><img src="${host}/blog/include/images/s8.jpg"> </dt>
          <dt> </dt>
          <dd><s:property value="name"/>
            <time><s:property value="time"/></time>
          </dd>
          <dd><a href="#"><s:property value="content" escape="false"/></a></dd>
        </dl>
        </s:iterator>
      </ul>
    </div>
   <%@ include file="./copyright.jsp" %> 
  </aside>
  <script src="${host}/blog/include/js/silder.js"></script>
  <div class="clear"></div>
  <!-- 清除浮动 --> 
</div>
</body>
</html>
