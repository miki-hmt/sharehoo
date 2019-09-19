<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 2019.09.11	miki 自定义弹窗 -->
<link rel="stylesheet" type="text/css" href="${host}/sweetalert/sweetalert.css"/>
<script src="${host}/sweetalert/sweetalert.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<script src="${pageContext.request.contextPath}/ckeditor4.12/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploadPreview.min.js"></script>

<script type="text/javascript">
	$(function () {
		//初始换编辑器
		CKEDITOR.replace('Content', {
			filebrowserImageUploadUrl : "${host}/topic/ckupload?", //2019.09.07 miki 加上？可以实现拖动图片上传
			codeSnippet_theme : 'zenburn',
			height : '500',
			width : '800'
		});
		$("#logo").uploadPreview({ Img: "ImgPr", Width: 220, Height: 220 });	
	});


	//springboot框架提交表单实体对象到后台尽量使用ajax提交，将表单序列化提交	2019.08.31 miki
	$("#okBtn").on("click", function() {

		//ckeditor4.12新特性，提交表单前需要更新textAera字段内容	2019.09.02
		for (instance in CKEDITOR.instances) {
			CKEDITOR.instances[instance].updateElement();
		}
		
		if (!checkForm()) {
			var formData = new FormData($("#fm")[0]);
			$.ajax({
				type : "POST",
				url : "${host}/admin/soft/add",
				data : formData,
				cache : false,
				async : false,
				processData : false, //必须false才会避开jQuery对 formdata 的默认处理
				contentType : false, //必须false才会自动加上正确的Content-Type
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
	
	function tipOk(content,callback){
		swal({   
			title: content,   
			text: '来自<span style="color:red">sharehoo社区</span>、<a href="#">温馨提示</a>。<br/>2秒后自动关闭..',   
			html: true,
			type: "success",
			timer: 3000  
		},function(){
				if (callback) {
					callback();
				}
			});
	};
	function tipError(content){
		swal("发表失败", content, "error");
	};

	function checkForm(){
		if ($("#soname").val()==""||$("#soname").val()==null) {
			alert("请填写主题！");
			return false;
		}
		if ($("#softSection").val()==0||$("#softSection").val()==null) {
			alert("请选择板块！");
			return false;
		}
		if (CKEDITOR.instances.Content.getData().length<10) {
			alert("内容最少10个字符！");
			return false;
		}
		
	}

</script>


<title>文件上传</title>

</head>
<body>
<div class="container-fluid">
		<div id="tooBar" style="padding: 10px 0px 0px 10px;">
		
		
					<!-- 2017.04.08  form表单上传文件时，要加上enctype="multipart/form-data" 
							否则会报错：No result defined for action and result input  -->
		
			<form class="form-horizontal" id="fm" style="margin-top: 10px;" action="" method="post" enctype="multipart/form-data">
				<div class="control-group">
				
				<!-- 2017 .04.03 
				如果您在 label 元素内点击文本，就会触发此控件。就是说，当用户选择该标签时，浏览器就会自动将焦点转到和标签相关的表单控件上。
						<label> 标签属性只有一个for 属性，该属性必须要与相关元素的 id 属性相同。
									
				 -->
					<label class="control-label" for="soname">【软件名】</label>
					<div class="controls">
						<input type="text" id="soname" name="soname" value="${soft.soname }" style="width: 800px;">
					</div>
				</div>
																								
				<div class="control-group">
					<label class="control-label" for="language">【语言】</label>
					<div class="controls">
						<input type="text" id="language" name="language" value="${soft.language}" style="width: 800px;"><span class="pull-left"></span>
					</div>
				</div>
					
								
				<div class="control-group" id="preDiv" style="width: 700px; height: 80px;margin-left: 80px;">
					<img id="ImgPr" class="pull-left" style="width: 80px; height: 80px;" src="${pageContext.request.contextPath}/${soft.logo }" />
				</div>
				<div class="control-group">
					<label class="control-label" for="logo">上传logo(*)：</label>
				<div class="controls">
					<input type="file" id="logo" name="slogo">
				</div>
				</div>
					
					<div class="control-group" style="width: 800px;">
						<label class="control-label" for="softSection">【所属版块】</label>
						<div class="controls">								
							 <select id="softSection" name="softSection.id"><option value="">请选择...</option>
									<c:forEach var="softSection" items="${softSectionList }">
										<option value="${softSection.id }">${softSection.areaName }</option>
									</c:forEach>
								</select>
						</div>
					</div>
					
		
					
					<div class="control-group">
						<label class="control-label" for="forSystem">【支持系统】</label>
						<div class="controls">
							<input type="text" id="forSystem" name="forSystem" value="${soft.forSystem}" style="width: 800px;"><span class="pull-left"></span>
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label" for="maker">【发布者】</label>
						<div class="controls">
							<input type="text" id="maker" name="maker" value="${soft.maker}" style="width: 800px;"><span class="pull-left"></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="size">【size】</label>
						<div class="controls">
							<input type="text" id="size" name="size" value="${soft.size }" style="width: 800px;"><span class="pull-left"></span>
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label" for="keyword">【关键字】</label>
						<div class="controls">
							<input type="text" id="keyword" name="keyword" value="${soft.keyword }" style="width: 800px;"><span class="pull-left"></span>
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label" for="address">【下载地址】</label>
						<div class="controls">
							<input type="text" id="address" name="downAdress" value="${soft.downAdress}" style="width: 800px;"><span class="pull-left"></span>
						</div>
					</div>
											
					<div class="control-group">
						<label class="control-label" for="Content">【描述】</label>
						<div class="controls">
							<textarea  id="Content" name="description" cols="50" style="height:200px;width: 800px;" ><span class="pull-left"></span>
							</textarea>
						</div>
					</div>

					<input type="hidden" id="good" name="good" value="0" style="width: 800px;">
					<input type="hidden" id="hot" name="hot" value="0" style="width: 800px;">
					<input type="hidden" id="count" name="count" value="0" style="width: 800px;">							
					
													
					<div class="control-group">
						<div class="controls">
							<Button class="btn btn-primary" id="okBtn" data-dismiss="modal" aria-hidden="true">提交</Button>
							<font id="error"></font>
						</div>
					</div>
				</form> 

	</div>
	</div>
</body>
</html>