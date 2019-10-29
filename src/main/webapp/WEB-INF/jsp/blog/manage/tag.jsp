<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html >
	<head>
	  <meta charset="UTF-8">
	  <title>添加文章专栏</title>
	  <link href="${pageContext.request.contextPath}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />
	  <link rel="stylesheet" href="${host}/blog/tag/css/style.css"> 
	  <!-- 2019.09.03 自定义弹窗所需插件 -->
		<link rel="stylesheet" type="text/css" href="${host}/sweetalert/sweetalert.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
		<script src="${host}/sweetalert/sweetalert.min.js"></script>
	</head>
	<body>
	  	<h1><img alt="${user.nickName}" style="width: 25px; height: 25px;border-radius:50%;" src="${pageContext.request.contextPath}/${user.face }" />添加</h1>
		<textarea class="tagarea" id="content" name="content">
				<c:choose>
					<c:when test="${not empty tag}">${tag.content}</c:when>
					<c:otherwise>${user.nickName} java 我爱你の</c:otherwise>
				</c:choose>
		  		
			</textarea>
			<input id="user" name="user.id" value="${user.id }"
								type="hidden" />
			<c:choose>
				<c:when test="${not empty user}"><input id="okBtn" type="button" value="添加"/></c:when>
			</c:choose>
			
		<!--User Info-->
		<table>
		  <tr>
		    <td colspan="3" align="center"><b>操作说明</b></td>
		  </tr>
		  <tr>
		    <td>添加标签</td>
		    <td> Press <span>Enter</span></td>
		    <td> <i class="chcek"></i> </td>
		  </tr>
		  <tr>
		    <td>修改标签 </td>
		    <td><span>Double click</span> on tag</td>
		    <td><i class="chcek"></i></td>
		  </tr>
		  <tr>
		    <td>删除标签</td>
		    <td> Click on <span>x</span>, <span>Double Backspace</span> <br> or Remove all text</span> and press <span>Enter</span></td>
		    <td><i class="chcek"></i></td>
		  </tr>
		  <tr>
		    <td>移动标签</td>
		    <td>Based on jQuery UI <span>Drag</span></td>
		    <td><i class="chcek"></i></td>
		  </tr>
		</table>

	  	<script src="${host}/blog/tag/js/index.js"></script>
	  <script type="text/javascript">
	  	//springboot框架提交表单实体对象到后台尽量使用ajax提交，将表单序列化提交	2019.08.31 miki
		$("#okBtn").on("click", function() {
			
			if (!checkForm()) {
				var content = getTagFieldValue();
				var userId = $("#user").val();
				$.ajax({
					type : "POST",
					url : "${host}/blog/tag/save?tagId=${tag.id}",
					data : JSON.stringify({content:content.trim(),userId:userId}),
					cache : false,
					contentType: "application/json",
					dataType: "json",
					async : false,
					success : function(data) {
						if (data.status == 200) {
							tipOk("发表成功!!",function(){
								location.reload();
							});
						} else {
							tipError("发表失败!!" + data.msg);
						}
					}
				});		
			}
			return false;	//阻止ajax结束自动刷新页面
		});
		
		//游客进入帖子页面，只能浏览不能评论，若是强行评论，会跳出提示2016.09.24
		function checkForm(){
			var result = false;
			var title = $("#content").val();
			
			if('${user.nickName}'==''){
				tipError("请先登陆，再发布！");
				result = true;
			}else if (title==""||title==null) {
				tipError("请填写内容！");
				result = true;
			}		
			return result;					
		}
		
		function tipOk(content,callback){
			swal({   
				title: content,   
				text: '来自<span style="color:red">sharehoo社区</span>、<a href="#">温馨提示</a>。<br/>2秒后自动关闭..',   
				imageUrl: "${host}/sweetalert/images/thumbs-up.jpg",
				html: true,
				timer: 2000,   
				showConfirmButton: false
			},function(){
					if (callback) {
						callback();
					}
				});
		};
		function tipError(content){
			swal("添加失败", content, "error");
		};
		
	  </script>
	</body>
</html>