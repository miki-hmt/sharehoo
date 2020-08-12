<%@page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--修改日期格式只显示年月日  -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1,text/html; charset=utf-8"/> 
        <link rel="shortcut icon" href="../favicon.ico"/> 
		<title>个人博客——照片管理</title>
		<meta name="keywords" content="个人博客" />
		<meta name="description" content="炮总的个人博客。" />
		<link href="${host}/blog/include/css/base.css" rel="stylesheet"/>
		<link href="${host}/blog/include/css/style.css" rel="stylesheet"/>
		<link href="${host}/blog/include/css/media.css" rel="stylesheet"/>

		<link href="${host}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />
		
		<!-- 2019.09.03 自定义弹窗所需插件 -->
		<link rel="stylesheet" type="text/css" href="${host}/sweetalert/sweetalert.css"/>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
		<script src="${host}/sweetalert/sweetalert.min.js"></script>
		
		<script type="text/javascript" src="${host}/blog/include/js/jquery.gallery.js"></script>
		<script type="text/javascript" src="${host}/blog/include/js/modernizr.custom.53451.js"></script>
		<meta name="viewport" content="width=device-width, minimum-scale=1.0,initial-scale=1.0,maximum-scale=1.0"/>
		<!--[if lt IE 9]>
		<script src="../include/js/modernizr.js"></script>
		<![endif]-->
		
		<script type="text/javascript">

			function deletePhoto(photoId){
				if (confirm("您忍心删除这个相册里的照片吗？")) {
					$.post("${host}//blog/manage/file/delete",{id:photoId},function(result){
						if(result.status==200){
							tipOk("相片已成功删除！");
							location.reload(true);
						}else{
							tipError("删除失败！");
						}
					},"json");
				}else{
					return;
				}
			}
			function deleteCritique(critiqueId){
				if (confirm("您确定要删除该评论吗？")) {
					$.post("${host}//blog/manage/pc/delete",{id:critiqueId},function(result){
						if(result.status==200){
							tipOk("成功删除！");
							location.reload(true);
						}else{
							tipError("删除失败！");
						}
					},"json");
				}else{
					return;
				}
			}
			
		function tipOk(content){
			swal({   
				title: content,   
				text: '来自<span style="color:red">sharehoo社区</span>、<a href="#">温馨提示</a>。<br/>2秒后自动关闭..',   
				imageUrl: "${host}/sweetalert/images/thumbs-up.jpg",
				html: true,
				timer: 2000,   
				showConfirmButton: false
			});
		};
		function tipError(content){
			swal("删除失败", content, "error");
		};
		</script>
	</head>
<body>
<div class="ibody">
  <header>
    <h1>铁环的个人博客</h1>
    <h2>愿居于一城，与卿所见美好......</h2>
    <div class="logo"><a href="../manage/article""></a></div>
    <%@ include file="../manage_nav.jsp" %>
     </header>
  <article>
    <h2 class="about_h">您现在的位置是：<a href="">首页</a>><a href="">相册管理</a>><a href="#">照片管理</a></h2>
    <div class="template">
      <h3>
        <p><span>个人相册</span></p>
        <a href="${host}/blog/manage/ablum/go?aid=${album.id }"  class="more">添加照片</a> </h3>
      </h3>
      <ul>
      <c:forEach items="${ photoList}" var="album">
        <li><a><img src="${host}/${album.image}"/></a><span>${album.note}<a href="javascript:deletePhoto(${album.id})">删除</a></span></li>
      </c:forEach>
      </ul>
      <h3>
        <p><span>最新评论</span></p>
      </h3>
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
      
   <div class="page">
           	
           </div>           
   </article>
  <aside>
    <%@ include file="../rnav.jsp" %> 
    <div class="ph_news">
      <h2>
        <p>点击排行</p>
      </h2>
      <ul class="ph_n">
        <s:iterator value="hotArticles" status="index">
      	<s:if test="#index.index<3">
       		<li><span class="num1"><s:property value="#index.index+1"/></span><a href="../article/article_detail?id="><s:property value="title"/></a></li>
       	</s:if>
       	<s:else>
       		<li><span><s:property value="#index.index+1"/></span><a href="../article/article_detail?id="><s:property value="title"/></a></li>
       	</s:else>
       </s:iterator>
      </ul>
      <h2>
        <p>栏目推荐</p>
      </h2>
      <ul>
        <s:iterator value="recommendArticles" >
        	<li><a href="../article/article_detail?id="><s:property value="title"/></a></li>
      	</s:iterator>
      </ul>
    <%@ include file="../copyright.jsp" %> 
  </aside>
  <script src="${host}/blog/include/js/silder.js"></script>
  <div class="clear"></div>
  <!-- 清除浮动 --> 
</div>
</body>
</html>
