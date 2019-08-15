<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<script src="${pageContext.request.contextPath}/js/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="./${pageContext.request.contextPath}/js/uploadPreview.min.js"></script>

<script type="text/javascript">
$(function () {
	$("#logo").uploadPreview({ Img: "ImgPr", Width: 220, Height: 220 });	
});

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
		
					<form class="form-horizontal" style="margin-top: 10px;" action="Soft_save.action" method="post" enctype="multipart/form-data" onsubmit="return checkForm()">
					<div class="control-group">
					
					<!-- 2017 .04.03 
					如果您在 label 元素内点击文本，就会触发此控件。就是说，当用户选择该标签时，浏览器就会自动将焦点转到和标签相关的表单控件上。
							<label> 标签属性只有一个for 属性，该属性必须要与相关元素的 id 属性相同。
										
					 -->
						<label class="control-label" for="soname">【软件名】</label>
						<div class="controls">
							<input type="text" id="soname" name="soft.soname" value="${soft.soname }" style="width: 800px;">
						</div>
					</div>
																								
					<div class="control-group">
						<label class="control-label" for="language">【语言】</label>
						<div class="controls">
							<input type="text" id="language" name="soft.language" value="${soft.language}" style="width: 800px;"><span class="pull-left"></span>
						</div>
					</div>
					
								
					<div class="control-group" id="preDiv" style="width: 700px; height: 80px;margin-left: 80px;">
						<img id="ImgPr" class="pull-left" style="width: 80px; height: 80px;" src="${pageContext.request.contextPath}/${soft.logo }" />
					</div>
						<div class="control-group">
							<label class="control-label" for="logo">上传logo(*)：</label>
						<div class="controls">
							<input type="file" id="logo" name="logo">
						</div>
						</div>
					
					<div class="control-group">
						<label class="control-label" for="softSection">【所属版块】</label>
						<div class="controls">								
							 <select id="softSection" name="soft.softSection.id"><option value="">请选择...</option>
									<c:forEach var="softSection" items="${softSectionList }">
										<option value="${softSection.id }">${softSection.areaName }</option>
									</c:forEach>
								</select>
						</div>
					</div>
					
		
					
					<div class="control-group">
						<label class="control-label" for="forSystem">【支持系统】</label>
						<div class="controls">
							<input type="text" id="forSystem" name="soft.forSystem" value="${soft.forSystem}" style="width: 800px;"><span class="pull-left"></span>
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label" for="maker">【发布者】</label>
						<div class="controls">
							<input type="text" id="maker" name="soft.maker" value="${soft.maker}" style="width: 800px;"><span class="pull-left"></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="size">【size】</label>
						<div class="controls">
							<input type="text" id="size" name="soft.size" value="${soft.size }" style="width: 800px;"><span class="pull-left"></span>
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label" for="keyword">【关键字】</label>
						<div class="controls">
							<input type="text" id="keyword" name="soft.keyword" value="${soft.keyword }" style="width: 800px;"><span class="pull-left"></span>
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label" for="address">【下载地址】</label>
						<div class="controls">
							<input type="text" id="address" name="soft.downAdress" value="${soft.downAdress}" style="width: 800px;"><span class="pull-left"></span>
						</div>
					</div>
											
					<div class="control-group">
						<label class="control-label" for="Content">【描述】</label>
						<div class="controls">
							<textarea  id="Content" name="soft.description" class="ckeditor" cols="50" style="height:200px;width: 800px;" ><span class="pull-left"></span>
							</textarea>
						</div>
					</div>

					<input type="hidden" id="good" name="soft.good" value="0" style="width: 800px;">
					<input type="hidden" id="hot" name="soft.hot" value="0" style="width: 800px;">
					<input type="hidden" id="count" name="soft.count" value="0" style="width: 800px;">							
					
													
					<div class="control-group">
						<div class="controls">
							<Button class="btn btn-primary " data-dismiss="modal" aria-hidden="true" type="submit">提交</Button>
							<font id="error"></font>
						</div>
					</div>
				</form> 

	</div>
	</div>
</body>
</html>