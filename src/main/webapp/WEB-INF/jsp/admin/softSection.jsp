<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<!-- 2019.09.11	miki 自定义弹窗 -->
<link rel="stylesheet" type="text/css" href="${host}/sweetalert/sweetalert.css"/>
<script src="${host}/sweetalert/sweetalert.min.js"></script>
<head>

	<!-- 					2017.04.04
						author:miki
						project:后台资源版块页面的增删改查
 -->
	
	
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript">
function openAddDlg(){
	$("#myModalLabel").html("增加大板块");
}
 function saveSoftSection(){
	 if ($("#zoneName").val()==null||$("#zoneName").val()=='') {
		 $("#error").html("请输入大板块名称！");
		 return false;
	}
	var formData = new FormData($("#fm")[0]);
		$.ajax({
			type : "POST",
			url : "${host}/admin/softsection/add",
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
		return false; //阻止ajax结束自动刷新页面
 }
 
 function modifyZone(id,areaName,descript){
	 $("#myModalLabel").html("修改大板块");
	 $("#id").val(id);
	 $("#zoneName").val(areaName);
	 $("#description").val(descript);
 }
 
 
 /*softSectionId对应SoftSection_delete.action里的变量，zoneId表示此处传 的值，softSectionId:zoneId表示将zoneId的值赋给softSectionId */	
function zoneDelete(zoneId){
	swal({
		title: "您确定要删除这家伙吗？", 
		text: "删除之后，就灭了啊..", 
		type: "warning",
		showCancelButton: true,
		closeOnConfirm: false,
		confirmButtonText: "是的，强行删除！",
		confirmButtonColor: "#ec6c62"
		}, function() {
			$.ajax({
				url: "${host}/admin/softsection/delete/"+zoneId,
				data: {softSectionId:zoneId},
				type: "POST",
			}).done(function(data) {
				if(data.info){
					tipOk("删除成功", function() {
						resetValue();
						location.reload(true);
					});
					//swal("操作成功!", "已成功删除数据！", "success");
				}else{
					swal("OMG", "操作失败了!", "error");
				}					
			}).error(function(data) {
				swal("OMG", "操作失败了!", "error");
			});
		});	
	/* if(confirm("确定要删除这条数据吗?")){
		$.post("SoftSection_delete.action",{softSectionId:zoneId},				
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
	} */
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

 function resetValue(){
	 $("#id").val("");
	 $("#zoneName").val("");
}

</script>
</head>
<body>
	<div class="container-fluid">
		<div id="tooBar" style="padding: 10px 0px 0px 10px;">
			<button class="btn btn-primary" type="button" data-backdrop="static" data-toggle="modal" data-target="#dlg" onclick="return openAddDlg()">添加大板块</button>&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
		<div class="row-fluid">
			<div class="span12">
				<div class="widget-box">
					<div class="widget-title">
						<!-- <span class="icon"> <input type="checkbox"
							id="title-checkbox" name="title-checkbox" />
						</span> -->
						<h5>资源版块列表</h5>
					</div>
					<div class="widget-content nopadding">
						<table class="table table-bordered table-striped with-check">
							<thead>
								<tr>
									<th><i class=""></i></th>
									<th>编号</th>
									<th>板块名称</th>
									<th>备注</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${softSectionList }" var="softSection">
									<tr>
										<td><input type="checkbox" /></td>
										<td style="text-align: center;">${softSection.id }</td>
										<td style="text-align: center;">${softSection.areaName }</td>
										<td style="text-align: center;">${softSection.descript }</td>
										<td style="text-align: center;">
											<button class="btn btn-info" type="button" data-backdrop="static" data-toggle="modal" data-target="#dlg" onclick="return modifyZone(${softSection.id},'${softSection.areaName }','${softSection.descript }')">修改
											</button>&nbsp;&nbsp;<button class="btn btn-danger" type="button" onclick="javascript:zoneDelete(${softSection.id})">删除</button>
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
				<h3 id="myModalLabel">增加板块</h3>
			</div>
			<div class="modal-body">
				<form id="fm" action="">
					<table>
						<tr>
							<td>
								<label class="control-label" for="zoneName">请输入板块名称：</label>
							</td>
							<td>
								 <input id="zoneName" type="text" name="areaName" placeholder="请输入…">
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="description">请输入备注：</label>
							</td>
							<td>
								<textarea rows="5" cols="50" style="width: 405px;" id="description" name="descript"></textarea>
							</td>
						</tr>
					</table>
					<!-- 2019.09.12 miki 此处因为保存和修改都使用一个form，所以给id一个默认值，修改时对其重新初始化，添加时后台会自动生成新的id -->
					<input id="id" type="hidden" name="id" value="0">
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