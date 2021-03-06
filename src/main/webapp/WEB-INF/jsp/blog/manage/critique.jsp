﻿<%@page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--修改日期格式只显示年月日  -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible"
	content="IE=edge,chrome=1,text/html; charset=utf-8" />
<title>个人博客——留言板</title>
<meta name="keywords" content="个人博客" />
<link href="${host}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />
<meta name="description" content="炮总的个人博客。" />
<link href="${host}/blog/include/css/base.css" rel="stylesheet" />
<link href="${host}/blog/include/css/index.css" rel="stylesheet" />
<link href="${host}/blog/include/css/style.css" rel="stylesheet" />
<link href="${host}/blog/include/css/media.css" rel="stylesheet" />

<!-- 尾部分页 css页码 	2017.05.24 -->
<link href="${host}/blog/include/css/page.css" rel="stylesheet" />

<!-- 2019.09.03 自定义弹窗所需插件 -->
<link rel="stylesheet" type="text/css"
	href="${host}/sweetalert/sweetalert.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
<script src="${host}/sweetalert/sweetalert.min.js"></script>

<script type="text/javascript"
	src="${host}/blog/include/js/jquery.gallery.js"></script>
<script type="text/javascript"
	src="${host}/blog/include/js/modernizr.custom.53451.js"></script>
<script type="text/javascript"
	src="${host}/ckeditor4.12/ckeditor/ckeditor.js"></script>
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0,initial-scale=1.0,maximum-scale=1.0" />
	
	<script type="text/javascript">
		$(function () {
			//2019.09.04 miki 初始化ckeditor编辑器，修改上传文件地址，记得去掉class="ckeditor"
			CKEDITOR.replace('content', { 
				filebrowserImageUploadUrl :"${host}/topic/ckupload?",
				codeSnippet_theme: 'zenburn',
				height:'500'
			});
		});
		</script>
	
<!--[if lt IE 9]>
		<script src="../include/js/modernizr.js"></script>
		<![endif]-->
</head>
<body>
	<div class="ibody">
		<header>
		<h1>${user.nickName }的个人博客</h1>
		<h2>愿居于一城，与卿所见美好......</h2>
		<div class="logo">
			<a href="../manage/article"></a>
		</div>
		<%@ include file="../manage_nav.jsp"%> </header>
		<article>
		<h2 class="about_h">
			您现在的位置是：<a href="">首页</a>><a href="#">留言板</a>
		</h2>
		<div class="template">

			<h3>
				<p>
					<span>最新留言</span>
				</p>
			</h3>
			<ul class="pl_n">
				<c:forEach items="${critiques }" var="critique">
					<dl>
						<dt>
							<img src="${host}/blog/include/images/s8.jpg">
						</dt>
						<dt></dt>
						<dd>${critique.name }
							<time> <fmt:formatDate value="${critique.time }"
								pattern="yyyy-MM-dd HH:mm:ss " /></time>
							&nbsp;&nbsp; <a href="javascript:deleteCritique(${critique.id })"
								class="dellink"><span style="color:red;">删除</span></a>
						</dd>
						<font style="color:gray;">${critique.content }</font>
					</dl>
				</c:forEach>
			</ul>

			<h3>
				<p>
					<span style="color:white;">回复留言</span>
				</p>
			</h3>
			<form action="#" method="post">
				<table>
					<tr>
						<td><input type="text" name="critique.name"
							placeholder="回复留言者姓名" style="height:30px;" /></td>
					</tr>
					<tr>
						<td><textarea name="critique.content" style="height:150px; width:700px;bg-color:gray;"
								placeholder="您的内容"></textarea></td>
					</tr>
					<tr>
						<td><button type="submit"
								style="background:#E41635;width: 60px;height: 30px;font-size: larger;color:white">提交</button></td>
					</tr>

					<input type="hidden" name="critique.user.id" value="${user.id }" />
					<input type="hidden" name="critique.article.id"
						value="${article.id }" />
				</table>
			</form>

		</div>
		<div class="pagination alternate">
			<ul class="clearfix">${pageCode }
			</ul>
		</div>
		</article>
		<aside> <%@ include file="../rnav.jsp"%>
		<div class="ph_news">
			<h2>
				<p>点击排行</p>
			</h2>
			<ul class="ph_n">
				<c:forEach items="${countList }" var="article" varStatus="state">
					<c:choose>
						<c:when test="${ state.index<3}">
							<li><span class="num1">${ state.index+1 }</span><a
								href="${host}/blog/${user.nickNameId}/article/${article.id}"
								target="_blank">${article.title }</a></li>
						</c:when>
						<c:otherwise>
							<li><span>${state.index+1 }</span><a
								href="${host}/blog/${user.nickNameId}/article/${article.id}"
								target="_blank">${article.title }</a></li>
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
							<li><span class="num1">${ state.index+1 }</span><a
								href="${host}/blog/${user.nickNameId}/article/${article.id}"
								target="_blank">${article.title }</a></li>
						</c:when>
						<c:otherwise>
							<li><span>${ state.index+1 }</span><a
								href="${host}/blog/${user.nickNameId}/article/${article.id}"
								target="_blank">${article.title }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</ul>
			<%@ include file="../copyright.jsp"%>
		</aside>
		<script src="${host}/blog/include/js/silder.js"></script>
		<div class="clear"></div>
		<!-- 清除浮动 -->
	</div>

	<script type="text/javascript">
	
		function deleteCritique(id) {
			swal({
				title : "",
				text : "您确定要删除这个评论吗？",
				type : "warning",
				showCancelButton : true,
				closeOnConfirm : false,
				confirmButtonText : "是的，我要删除",
				confirmButtonColor : "#ec6c62"
			}, function() {
				$.post("${host}/blog/manage/critique/delete", {
					id : id
				}, function(result) {
					if (result.status == 200) {
						tipOk("评论已成功删除！", function() {
							console.log(".......");
							location.reload(true);
						});
	
					} else {
						tipError("删除失败！！");
					}
				}, "json");
			});
		}
		function tipOk(content, callback) {
			swal({
				title : content,
				text : '来自<span style="color:red">sharehoo社区</span>、<a href="#">温馨提示</a>。<br/>2秒后自动关闭..',
				imageUrl : "${host}/sweetalert/images/thumbs-up.jpg",
				html : true,
				timer : 2000,
				showConfirmButton : false,
				confirmButtonText : "是的，我要删除",
				confirmButtonColor : "#ec6c62",
				
			},function(){
				if (callback) {
					callback();
				}
			});
		}
		
		function tipError(content) {
			swal("操作失败", content, "error");
		}
		
	</script>

</body>
</html>
