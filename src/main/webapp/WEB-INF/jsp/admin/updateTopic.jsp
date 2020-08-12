
<%@page import="javax.swing.text.StyleContext.SmallAttributeSet"%>
<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@page import="javax.swing.text.Document"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="${pageContext.request.contextPath}/js/ckeditor/ckeditor.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改帖子</title>

</head>

<body>

<div class="container-fluid">
			<div id="tooBar" style="padding: 10px 0px 0px 10px;">
				<div class="control-group">
						<label class="control-label" for="topicId">【注意事项】</label>
						<div class="controls">
							<input readonly="readonly" type="text" id="topicId"  name="miki" value="为保证本站会员隐私，不提供修改用户名，或者帖子内容等功能！望理解！" style="width: 800px;">
						</div>
					</div>
				<form class="form-horizontal" style="margin-top: 10px;" action="Topic_save1.action" method="post">
														
					<div class="control-group">
						<label class="control-label" for="topicId">【帖子id】</label>
						<div class="controls">
							<input readonly="readonly" type="text" id="topicId"  name="topic.id" value="${topic.id }" style="width: 800px;">
						</div>
					</div>
									
					<div class="control-group">
						<label class="control-label" for="topicId">【发帖人】</label>
						<div class="controls">
							<input readonly="readonly" type="text" id="topicId"  name="topic.user.id" value="${topic.user.id }" style="width: 800px;">
						</div>
					</div>	
					<div class="control-group">
						<label class="control-label" for="topicId">【发帖时间】</label>
						<div class="controls">
							<input readonly="readonly" type="text" id="topicId"  name="topic.publishTime" value="<fmt:formatDate value="${topic.publishTime }" type="date" pattern="yyyy-MM-dd"/>" style="width: 800px;">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="topicId">【版块】</label>
						<div class="controls">
							<input readonly="readonly" type="text" id="topicId"  name="topic.section.id" value="${topic.section.id }" style="width: 800px;">
						</div>
					</div>
					
					<div class="control-group">
					
					<!-- 2017 .04.03 
					如果您在 label 元素内点击文本，就会触发此控件。就是说，当用户选择该标签时，浏览器就会自动将焦点转到和标签相关的表单控件上。
<label> 标签属性只有一个for 属性，该属性必须要与相关元素的 id 属性相同。
										
					 -->
						<label class="control-label" for="soname">【帖子标题】</label>
						<div class="controls">
							<input type="text" id="soname" value="${topic.title }" name="topic.title" style="width: 800px;">
						</div>
					</div>
																	
					<div class="control-group">
						<label class="control-label" for="size">【是否置顶】</label>
						<div class="controls">
							<input type="text" id="size" name="topic.top" value="${topic.top }" style="width: 800px;">
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label" for="address">【是否精华】</label>
						<div class="controls">
							<input type="text" id="address" name="topic.good" value="${topic.good }" style="width: 800px;">
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label" for="size">【内容】</label>
						<div class="controls">
							<textarea readonly="readonly"  class="ckeditor" id="size" name="topic.content"  style="width: 800px;height:200px;">${topic.content }</textarea>
						</div>
					</div>
					
																													
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