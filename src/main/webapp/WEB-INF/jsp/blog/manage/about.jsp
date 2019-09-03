<%@page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>个人博客——关于我</title>
		<meta name="keywords" content="个人博客" />
		<meta name="description" content="sharehoo社区博客。" />
		<link href="${host}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />
		<link href="${host}/blog/include/css/base.css" rel="stylesheet"/>
		<link href="${host}/blog/include/css/about.css" rel="stylesheet"/>
		<link href="${host}/blog/include/css/media.css" rel="stylesheet"/>
		<!-- 2019.09.03 自定义弹窗所需插件 -->
		<link rel="stylesheet" type="text/css" href="${host}/sweetalert/sweetalert.css"/>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
		<script src="${host}/sweetalert/sweetalert.min.js"></script>
		
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
      <form action="" id="about_form" method="post" enctype="multipart/form-data">
      <textarea id="content" name="content" class="ckeditor">${me.content }</textarea>
      <input id="user" name="user.id" value="${user.id }" type="hidden"/>
      <input id="me" name="id" value="${me.id }" type="hidden"/>
      <input type="button" id="okBtn" style="background:#E41635;width: 60px;height: 30px;font-size: larger;color:white" value="保存">
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

<script type="text/javascript">
$(function(){
	//springboot框架提交表单实体对象到后台尽量使用ajax提交，将表单序列化提交	2019.08.31 miki
	$("#okBtn").on("click", function() {

		//ckeditor4.12新特性，提交表单前需要更新textAera字段内容	2019.09.02
		for (instance in CKEDITOR.instances) {
			CKEDITOR.instances[instance].updateElement();
		}
		if (checkForm()) {
			var formData = new FormData($("#about_form")[0]);
			$.ajax({
				type : "POST",
				url : "${host}/blog/manage/about/save",
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
		var result = true;

		if ($("#content").val().length < 10) {
			tipError("文章内容最少20个字符！");
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
		swal("发表失败", content, "error");
	};
});	
</script>

</body>
</html>
