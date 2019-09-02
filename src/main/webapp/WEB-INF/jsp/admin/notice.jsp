<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<!-- 					2017.04.15
						author:miki
						project:后台公告页面的增删改查
 -->
	
	
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript">
function openAddDlg(){
	$("#myModalLabel").html("添加公告");
}
 function saveSoftSection(){
	 if ($("#zoneName").val()==null||$("#zoneName").val()=='') {
		 $("#error").html("请输入公告名称！");
		 return false;
	}
	 $.post("Notice_save.action", $("#fm").serialize());
	 alert("保存成功！");
	 resetValue();
	 location.reload(true);
 }
 function modifyZone(id,name,state,content){
	 $("#myModalLabel").html("修改公告");
	 $("#id").val(id);
	 $("#zoneName").val(name);
	 $("#noticeName").val(state);
	 $("#description").val(content);
 }
 
 
 /*softSectionId对应SoftSection_delete.action里的变量，zoneId表示此处传 的值，softSectionId:zoneId表示将zoneId的值赋给softSectionId */	
function zoneDelete(zoneId){
	if(confirm("确定要删除这条数据吗?")){
		$.post("Notice_delete.action",{noticeId:zoneId},				
				function(result){
					var result=eval(result);
					if(result.error){
						alert(result.error);
					}else{
						alert("删除成功！");
						window.location.reload(true);
					}
				}
			);
	}
}
 function resetValue(){
	 $("#id").val("");
	 $("#zoneName").val("");
}

</script>
</head>
<body>
	<div class="container-fluid">
		<div id="tooBar" style="padding: 10px 0px 0px 10px;">
			<button class="btn btn-primary" type="button" data-backdrop="static" data-toggle="modal" data-target="#dlg" onclick="return openAddDlg()">添加公告</button>(state:1表示论坛公告  0表示下载社区公告)&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
		<div class="row-fluid">
			<div class="span12">
				<div class="widget-box">
					<div class="widget-title">
						<!-- <span class="icon"> <input type="checkbox"
							id="title-checkbox" name="title-checkbox" />
						</span> -->
						<h5>公告列表</h5>
					</div>
					<div class="widget-content nopadding">
						<table class="table table-bordered table-striped with-check">
							<thead>
								<tr>
									<th><i class=""></i></th>
									<th>编号</th>
									<th>名称</th>
									<th>内容</th>
									<th>发布时间</th>
									<th>状态</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${noticeList }" var="notice">
									<tr>
										<td><input type="checkbox" /></td>
										<td style="text-align: center;">${notice.id }</td>
										<td style="text-align: center;">${notice.name }</td>
										<td style="text-align: center;">${notice.content }</td>
										<td style="text-align: center;"><fmt:formatDate value="${notice.pubDate}" pattern="yyyy-MM-dd "/></td>
										<td style="text-align: center;">
											<c:choose>
											<c:when test="${notice.state==true }">论坛公告</c:when>
											<c:when test="${notice.state==false }">下载社区公告</c:when>										
											<c:otherwise></c:otherwise>
											</c:choose>
											</td>
										<td style="text-align: center;">
											<button class="btn btn-info" type="button" data-backdrop="static" data-toggle="modal" data-target="#dlg" onclick="return modifyZone(${notice.id},'${notice.name }','${notice.state }','${notice.content }')">修改
											</button>&nbsp;&nbsp;<button class="btn btn-danger" type="button" onclick="javascript:zoneDelete(${notice.id})">删除</button>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="pagination alternate">
					<ul class="clearfix">${pageCode }
					</ul>
				</div>


			</div>
		</div>
		<div id="dlg" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true" onclick="return resetValue()">×</button>
				<h3 id="myModalLabel">添加公告</h3>
			</div>
			<div class="modal-body">
				<form id="fm" action="">
					<table>
						<tr>
							<td>
								<label class="control-label" for="zoneName">请输入名称：</label>
							</td>
							<td>
								 <input id="zoneName" type="text" name="notice.name" placeholder="请输入…">
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="noticeName">状态：</label>
							</td>
							<td>
								 <input id="noticeName" type="text" name="notice.state" placeholder="请输入…">
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="description">请输入内容：</label>
							</td>
							<td>
								<textarea rows="5" cols="50" style="width: 405px;" id="description" name="notice.content"></textarea>
							</td>
						</tr>
					</table>
					<input id="id" type="hidden" name="notice.id">
				</form>
			</div>
			<div class="modal-footer">
				<font id="error" style="color: red;"></font>
				<button class="btn" data-dismiss="modal" aria-hidden="true"
					onclick="return resetValue()">关闭</button>
				<button class="btn btn-primary" onclick="javascript:saveSoftSection()">保存</button>
			</div>
		</div>
	</div>
</body>
</html>