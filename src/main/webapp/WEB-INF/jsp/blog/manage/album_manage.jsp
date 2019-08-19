<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--修改日期格式只显示年月日  -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>个人博客——相册</title>
		<meta name="keywords" content="个人博客" />
		<meta name="description" content="miki的个人博客。" />
		<link href="../include/css/base.css" rel="stylesheet"/>
		<link href="../include/css/style.css" rel="stylesheet"/>
		<link href="../include/css/media.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />
		<script src="${pageContext.request.contextPath }/js/jquery-1.11.1.js" type="text/javascript"></script>
	 	 <script type="text/javascript">
		function deleteAlbum(albumId){
			if (confirm("您忍心删除这个相册吗？")) {
				$.post("../manage/AlbumManage_delete.action",{aid:albumId},function(result){
					if(result.success){
						alert("相册已成功删除！");
						location.reload(true);
					}else{
						alert("请先删除相册下的评论和图片！");
					}
				},"json");
			}else{
				return;
			}
		}
		</script>

		<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0"/>
		<!--[if lt IE 9]>
		<script src="js/modernizr.js"></script>
		<![endif]-->
	</head>
<body>
<div class="ibody">
  <header>
    <h1>${user.nickName}de博客</h1>
    <h2>愿居于一城，与卿所见美好......</h2>
    <div class="logo"><a href="../manage/Article_list.action?userId=${user.id }"></a></div>
	<%@ include file="../manage_nav.jsp" %>
      </header>
  <article>
    <h2 class="about_h">您现在的位置是：<a href="../manage/Article_list.action?userId=${user.id }">首页</a>><a href="#">相册管理</a></h2>
    <div class="template">
      <h3>
        <p><span>个人相册</span></p>
        <a href="../manage/AlbumManage_add.action"  class="more">新建相册</a> </h3>
      <ul>
      <c:forEach items="${ albumList}" var="album">
        <li><a href="../manage/AlbumManage_detail.action?aid=${album.id }" ><img src="${pageContext.request.contextPath }/${album.image}"/></a><span>${album.title }
	<a href="javascript:void(0)" onclick="javascript:deleteAlbum(${album.id })">删除</a></span></li>
      </c:forEach>
      </ul>
     <h3>
        <p><span>最新评论</span></p>		<!-- 2017.06.04 评论内容关于相册的 -->
      </h3>
      <ul class="pl_n">
       <c:forEach items="${critiques }" var="critique">
        <dl>
          <dt><img src="${pageContext.request.contextPath }/blog/include/images/s8.jpg"> </dt>
          <dt> </dt>
          <dd>${critique.name }
            <time><fmt:formatDate value="${critique.time }" pattern="yyyy-MM-dd HH:mm:ss "/></time>&nbsp;&nbsp;<a href="../manage/CritiqueManage_deletePhc.action?id=${critique.id }" class="dellink"><span style="color:red;">删除</span></a>
          </dd>
         	<font style="color:gray;">${critique.content }</font> 
        </dl>
        </c:forEach>
      </ul>
  </article>
  <aside>
   <%@ include file="../rnav.jsp" %> 
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
   <%@ include file="../copyright.jsp" %> 
  </aside>
  <script src="../include/js/silder.js"></script>
  <div class="clear"></div>
  <!-- 清除浮动 --> 
</div>
</body>
</html>
