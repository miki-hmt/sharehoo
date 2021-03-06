﻿<%@page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--修改日期格式只显示年月日  -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1,text/html; charset=utf-8"/> 
        <link href="${host}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" /> 
		<title>个人博客——添加照片</title>
		<meta name="keywords" content="个人博客" />
		<meta name="description" content="个人博客。" />
		<link href="${host}/blog/include/css/base.css" rel="stylesheet"/>
		<link href="${host}/blog/include/css/style.css" rel="stylesheet"/>
		<link href="${host}/blog/include/css/media.css" rel="stylesheet"/>
		
		<!-- 2019.09.03 自定义弹窗所需插件 -->
		<link rel="stylesheet" type="text/css" href="${host}/sweetalert/sweetalert.css"/>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
		<script src="${host}/sweetalert/sweetalert.min.js"></script>
		
		<script type="text/javascript" src="${host}/blog/include/js/jquery.gallery.js"></script>
		<script type="text/javascript" src="${host}/blog/include/js/modernizr.custom.53451.js"></script>
		<link href="${host}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />
		
		<!-- 2017.06.03 相册封面视图显示 -->
		<script type="text/javascript" src="${host}/js/uploadPreview.min.js"></script>
		
		
		<meta name="viewport" content="width=device-width, minimum-scale=1.0,initial-scale=1.0,maximum-scale=1.0"/>
		<!--[if lt IE 9]>
		<script src="${host}/blog/include/js/modernizr.js"></script>
		<![endif]-->
		<script type="text/javascript">
			$(function () {
				$("#photoImage").uploadPreview({ Img: "ImgPr", Width: 220, Height: 220 });
				
			});
		</script>
		
		
	</head>
<body>
<div class="ibody">
  <header>
    <h1>${user.nickName }的博客</h1>
    <h2>愿居于一城，与卿所见美好......</h2>
    <div class="logo"><a href="${host}/blog/manage/article"></a></div>
    <%@ include file="../manage_nav.jsp" %>
    </header>
  <article>
    <h2 class="about_h">您现在的位置是：<a href="">首页</a>><a href="">相册管理</a>><a href="#">添加照片</a></h2>
    <div class="template">
      <h3>
        <p><span>个人相册</span></p>
      </h3>
       <form id="photo_form" action="" method="post" enctype="multipart/form-data">
      		<table>
      			<tr>
      				<td><div class="control-group" id="preDiv" style="width: 700px; height: 80px;margin-left: 70px;">
							<img id="ImgPr" class="pull-left" style="width: 170px; height: 90px;" src="${host}/${photo.image }" />
						</div>
						<div class="control-group">
							<label class="control-label" for="image">添加图片(*)</label>
							<div class="controls">
								<input type="file" id="photoImage" name="photoImage"> 
								<input type="hidden" id="faceFileName" name="faceFileName" />
								<input type="hidden" name="user.id" value="${user.id}">
								<input type="hidden" name="album.id" value="${album.id}">
							</div>
						</div>
      				</td>
      			</tr>
      			<tr>
      				<td><span>照片描述:</span><input id="note" name="note"/>
      				</td>
      			</tr>
    			<tr>
	    			<td><input id="okBtn" type="button" style="width: 60px;height: 30px;font-size: larger;" value="上传照片"/></td>
    			</tr>
      		</table>
      </form>
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
  <script src="${host}/blog/include/js/silder.js"></script>
  <div class="clear"></div>
  <!-- 清除浮动 --> 
</div>

<script type="text/javascript">
	
	function addFileName() {
		var uploadfile = $("#photoImage").val();
		var fileName = getFileName(uploadfile);
		$("#faceFileName").val(fileName);
	}
	//获取文件名方式一
	function getFileName(file) { //通过第一种方式获取文件名
		var pos = file.lastIndexOf("\\"); //查找最后一个\的位置
		return file.substring(pos + 1); //截取最后一个\位置到字符长度，也就是截取文件名 
	}
	//springboot框架提交表单实体对象到后台尽量使用ajax提交，将表单序列化提交	2019.08.31 miki
	$("#okBtn").on("click", function() {

		if (checkForm()) {
			addFileName();
			var faceFileName = $("#faceFileName").val();
			var formData = new FormData($("#photo_form")[0]);
			$.ajax({
				type : "POST",
				url : "${host}/blog/manage/photo/add?faceFileName=" + faceFileName,
				data : formData,
				cache : false,
				async : false,
				processData : false, //必须false才会避开jQuery对 formdata 的默认处理
				contentType : false, //必须false才会自动加上正确的Content-Type
				success : function(data) {
					if (data.status == 200) {
						tipOk("发表成功!!");
					} else {
						tipError("发表失败!!" + data.msg);
					}
				}
			});
			return false;
		}
	});
	function checkForm() {
		
		var title = $("#note").val();
		var result = true;

		if (title=="") {
			tipError("标题不能为空！");
			result = false;
		}
		return result;
		
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
			swal("添加失败", content, "error");
		};

</script>


</body>
</html>
