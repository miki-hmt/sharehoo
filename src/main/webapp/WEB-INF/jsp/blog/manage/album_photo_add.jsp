<%@page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--修改日期格式只显示年月日  -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1,text/html; charset=utf-8"/> 
        <link rel="shortcut icon" href="../favicon.ico"/> 
		<title>个人博客——添加照片</title>
		<meta name="keywords" content="个人博客" />
		<meta name="description" content="个人博客。" />
		<link href="../include/css/base.css" rel="stylesheet"/>
		<link href="../include/css/style.css" rel="stylesheet"/>
		<link href="../include/css/media.css" rel="stylesheet"/>
		<script type="text/javascript" src="../include/js/jquery.min.js"></script>
		<script type="text/javascript" src="../include/js/jquery.gallery.js"></script>
		<script type="text/javascript" src="../include/js/modernizr.custom.53451.js"></script>
		<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
		<link href="${host}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />
		<!-- 2017.06.03 相册封面视图显示 -->
		<script type="text/javascript" src="${host}/js/jquery-1.11.1.js"></script>
		<script type="text/javascript" src="${host}/js/uploadPreview.min.js"></script>
		
		
		<meta name="viewport" content="width=device-width, minimum-scale=1.0,initial-scale=1.0,maximum-scale=1.0"/>
		<!--[if lt IE 9]>
		<script src="../include/js/modernizr.js"></script>
		<![endif]-->
		<script type="text/javascript">
			$(function () {
				$("#image").uploadPreview({ Img: "ImgPr", Width: 220, Height: 220 });
				
			});
		</script>
		
		
	</head>
<body>
<div class="ibody">
  <header>
    <h1>${user.nickName }的博客</h1>
    <h2>愿居于一城，与卿所见美好......</h2>
    <div class="logo"><a href="../manage/article"></a></div>
    <%@ include file="../manage_nav.jsp" %>
    </header>
  <article>
    <h2 class="about_h">您现在的位置是：<a href="${host}/blog/manage/Article_list.action">首页</a>><a href="${host}/blog/manage/AlbumManage_list.action">相册管理</a>><a href="#">添加照片</a></h2>
    <div class="template">
      <h3>
        <p><span>个人相册</span></p>
      </h3>
       <form action="../manage/PhotoManage_save.action?aid=${album.id}" method="post" theme="xhtml" enctype="multipart/form-data">
      		<table>
      			<tr>
      				<td><div class="control-group" id="preDiv" style="width: 700px; height: 80px;margin-left: 70px;">
							<img id="ImgPr" class="pull-left" style="width: 170px; height: 90px;" src="${host}/${photo.image }" />
						</div>
						<div class="control-group">
							<label class="control-label" for="image">添加图片(*)</label>
							<div class="controls">
								<input type="file" id="image" name="image"> 
								<input type="hidden" name="photo.user.id" value="${user.id}">
								<input type="hidden" name="photo.album.id" value="${album.id}">
							</div>
						</div>
      				</td>
      			</tr>
      			<tr>
      				<td><span>照片描述:</span><input name="photo.note"/>
      				</td>
      			</tr>
    			<tr>
	    			<td><input type="submit" style="width: 60px;height: 30px;font-size: larger;" value="上传照片"/></td>
    			</tr>
      		</table>
      </form>
      <h3>
        <p><span>最新评论</span></p>
      </h3>
      <ul class="pl_n">
       <s:iterator value="critiques" >
        <dl>
          <dt><img src="../include/images/s8.jpg"> </dt>
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
      	
       </s:iterator>
      </ul>
      <h2>
        <p>栏目推荐</p>
      </h2>
      <ul>
        <s:iterator value="recommendArticles" >
        	<li><a href="../article/article_detail?id=<s:property value="id"/>"><s:property value="title"/></a></li>
      	</s:iterator>
      </ul>
    <%@ include file="../copyright.jsp" %> 
  </aside>
  <script src="../include/js/silder.js"></script>
  <div class="clear"></div>
  <!-- 清除浮动 --> 
</div>
</body>
</html>
