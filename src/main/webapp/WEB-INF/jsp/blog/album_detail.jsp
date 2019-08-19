<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--修改日期格式只显示年月日  -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1,text/html; charset=utf-8"/> 
        <link rel="shortcut icon" href="../favicon.ico"/> 
		<title>${user.nickName}的个人博客—相册--IT帮-资讯传播社区</title>
		<meta name="keywords" content="个人博客" />
		<meta name="description" content="个人博客 。" />
		<link href="${pageContext.request.contextPath}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />
		<link href="../blog/include/css/base.css" rel="stylesheet"/>
		<link href="../blog/include/css/style.css" rel="stylesheet"/>
		<link href="../blog/include/css/media.css" rel="stylesheet"/>
		<script type="text/javascript" src="../blog/include/js/jquery.min.js"></script>
		<script type="text/javascript" src="../blog/include/js/jquery.gallery.js"></script>
		<script type="text/javascript" src="../blog/include/js/modernizr.custom.53451.js"></script>
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
    <div class="logo"><a href="${pageContext.request.contextPath }/blog/Blog_show.action?userId=${user.id}"></a></div>
    <%@ include file="./nav.jsp" %> 
     </header>
  <article>
    <h2 class="about_h">您现在的位置是：<a href="${pageContext.request.contextPath }/blog/Blog_show.action?userId=${user.id}">首页</a>><a href="${pageContext.request.contextPath }/blog/AlbumShow_list.action?userId=${user.id}">个人相册</a>><a href="#">照片</a></h2>
    <div class="template">
      <h3>
        <p><span>个人相册</span></p>
      </h3>
      <ul>
       <div class="container" >
			<!-- Codrops top bar -->
			<section id="dg-container" class="dg-container">
				<div class="dg-wrapper">
				<c:forEach items="${photoList}" var="photo" varStatus="state">
					<a href="#"><img src="${pageContext.request.contextPath }/${photo.image}"  width="480px" height="260"/><div>第${state.index+1 }张：${photo.note }&nbsp;&nbsp;<fmt:formatDate value="${photo.time }" pattern="yyyy-MM-dd HH:mm:ss "/></div></a>
				</c:forEach>
				</div>
				<nav >	
					<span class="dg-prev">&lt;</span>
					<span class="dg-next">&gt;</span>
				</nav>
			</section>
        </div>
       
		<script type="text/javascript">
			$(function() {
				$('#dg-container').gallery();
			});
		</script>
      </ul>
      
      
    <div class="page">
           	
           </div>           
    </article>
  <aside>
    <div class="rnav">
      <li class="rnav1 "><a href="http://sharehoo.cn">sharehoo社区</a></li>
      <li class="rnav2 "><a href="#">QQ空间</a></li>
      <li class="rnav3 "><a href="#">个人作品</a></li>
      <li class="rnav4 "><a href="#">程序开发</a></li>
    </div>
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
  <script src="../include/js/silder.js"></script>
  <div class="clear"></div>
  <!-- 清除浮动 --> 
</div>
</body>
</html>
