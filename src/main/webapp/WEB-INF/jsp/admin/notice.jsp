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
<link rel="stylesheet" type="text/css" href="${host}/sweetalert/sweetalert.css"/>
<script src="${host}/sweetalert/sweetalert.min.js"></script>	
	
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript">
	function openAddDlg(){
		$("#myModalLabel").html("添加公告");
	}
	function saveSoftSection(){
	 if ($("#zoneName").val()==null||$("#zoneName").val()=='') {
		 $("#error").html("请输入公告名称！");
		 tipError("请输入公告名称");
		 return false;
	}
	var formData = new FormData($("#fm")[0]);
	$.ajax({
		type : "POST",
		url : "${host}/admin/notice/save",
		data : formData,
		cache : false,
		async : false,
		processData : false, //必须false才会避开jQuery对 formdata 的默认处理
		contentType : false, //必须false才会自动加上正确的Content-Type
		success : function(data) {
			if (data.status == 200) {
				tipOk("保存成功", function() {
					resetValue();
					location.reload(true);
				});			
			} else {
				tipError("保存失败!!" + data.msg);
			}
		}
	});
	return false;	//阻止ajax结束自动刷新页面	
}
 	
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

 function modifyZone(id,name,state,content){
	 $("#myModalLabel").html("修改公告");
	 $("#id").val(id);
	 $("#zoneName").val(name);
	 $("#noticeName").val(state);
	 $("#description").val(content);
 }
 
 
 /*softSectionId对应SoftSection_delete.action里的变量，zoneId表示此处传 的值，softSectionId:zoneId表示将zoneId的值赋给softSectionId */	
	function zoneDelete(zoneId){
		swal({
				title: "您确定要删除吗？", 
				text: "您确定要删除这条数据？", 
				type: "warning",
				showCancelButton: true,
				closeOnConfirm: false,
				confirmButtonText: "是的，忍痛删除",
				confirmButtonColor: "#ec6c62"
				}, function() {
					$.ajax({
						url: "${host}/notice/delete/"+zoneId,
						data: {noticeId:zoneId},
						type: "POST",
					}).done(function(data) {
						if(data.status==200){
							tipOk("删除成功", function() {
								resetValue();
								location.reload(true);
							});
							//swal("操作成功!", "已成功删除数据！", "success");
						}else{
							swal("OMG", "删除操作失败了!", "error");
						}					
					}).error(function(data) {
						swal("OMG", "删除操作失败了!", "error");
					});
				});
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
								 <input id="zoneName" type="text" name="name" placeholder="请输入…">
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="noticeName">状态：</label>
							</td>
							<td>
								 <input id="noticeName" type="text" name="state" placeholder="请输入…">(1:社区首页 0:资源下载板块)
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="description">请输入内容：</label>
							</td>
							<td>
								<textarea rows="5" cols="50" style="width: 405px;" id="description" name="content"></textarea>
							</td>
						</tr>
					</table>
					<input id="id" type="hidden" name="id" value="0">
				</form>
			</div>
			<div class="modal-footer">
				<font id="error" style="color: red;"></font>
				<button class="btn" data-dismiss="modal" aria-hidden="true"
					onclick="return resetValue()">关闭</button>
				<button class="btn btn-primary" id="okBtn" onclick="javascript:saveSoftSection()">保存</button>		<!--  -->
			</div>
		</div>
	</div>
</body>
</html>