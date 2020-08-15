<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>后台管理</title>

<!-- 2020.08.13 miki 新版bootstrap样式文件在旧的代码中不兼容，暂时不用 -->
<!-- <link href="${host}/admin/new-version/css/bootstrap.min.css" rel="stylesheet"> -->
<link rel="stylesheet" href="${host}/admin/css/bootstrap.min.css" />
<link href="${host}/admin/new-version/css/theme.css" rel="stylesheet">
<link href="${host}/admin/new-version/css/fonts.css" rel="stylesheet">

<!--使用jquery的select2.js+select2.css插件实现下拉搜索框	2020.06.14-->
<link rel="stylesheet" href="${host}/admin/css/select2.css" />
<link rel="stylesheet" href="${host}/admin/css/unicorn.main.css" />


<script src="${host}/js/jquery-1.7.2.min.js"></script>
<script src="${host}/admin/new-version/js/tooltip.js"></script>
<script src="${host}/admin/js/jquery.ui.custom.js"></script>

<!-- 引用该插件需要jQuery1.9以下的版本。
	 $.browser方法已从jQuery 1.9中删除。jQuery.browser() removed
	 jQuery.browser()方法自jQuery 1.3以来已被取消，并在1.9中被删除。 -->
<script src="${host}/admin/js/jquery.uniform.js"></script>
<script src="${host}/admin/js/select2.min.js"></script>
<!-- checkbox样式管理  2020.08.15 miki -->
<link rel="stylesheet" href="${host}/admin/css/uniform.css" />

<script src="${host}/admin/js/jquery.dataTables.min.js"></script>
<script src="${host}/admin/js/bootstrap.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploadPreview.min.js"></script>
<script src="${pageContext.request.contextPath}/js/My97DatePicker/WdatePicker.js"></script>

<!-- 2019.09.11	miki 自定义弹窗 -->
<link rel="stylesheet" type="text/css" href="${host}/sweetalert/sweetalert.css"/>
<script src="${host}/sweetalert/sweetalert.min.js"></script>
<style type="text/css">
</style>
<script type="text/javascript">

     //加载小版块logo视图 
$(function () {
	$("#logo").uploadPreview({ Img: "ImgPr", Width: 220, Height: 220 });
});
     
     //添加小版块 
function openAddDlg(){
	$("#myModalLabel").html("增加小板块");
}
     
 
     //修改小版块试图
$(function () {
	$("#slogo").uploadPreview({ Img: "sImgPr", Width: 220, Height: 220 });
});

//2020.08.11 删除
function sectionDelete(sectionId){
 if(confirm("确定要删除这条数据吗?")){
	 $.post("${pageContext.request.contextPath}/admin/section/delete/"+sectionId,{sectionId:sectionId},
			 function(result){
				 var result=eval(result);
				 if(result.success){
					 tipOk("操作成功");
                     location.reload();
				 }else{
					 tipError("操作失败");
				 }
			 }
	 );
 }
}
    
function saveSection(){
	debugger
	 if ($("#sectionName").val()==null||$("#sectionName").val()=='') {
		 $("#error").html("请输入小板块名称！");
		 return false;
	 }
	 if ($("#zone").val()==null||$("#zone").val()=='') {
		 $("#error").html("请选择所属大板块！");
		 return false;
	 }
	 if ($("#masterId").val()==null||$("#masterId").val()=='') {
		 $("#error").html("请输入版主昵称！");
		 return false;
	 }

	//2020.08.11 miki 提交新增表单的时候，自增id不要加到表单中，因为新增表单中的id为空，会导致http 400状态码
	//2020.08.11 miki 注意上传文件的字段名不能与表单对象中的属性值同名，否则会400异常
	var formData = new FormData($("#fm")[0]);
	$.ajax({
		type: "POST",
		url: "${pageContext.request.contextPath}/admin/section/add",
		data: formData,
		cache: false,
		async: false,
		processData : false,  //必须false才会避开jQuery对 formdata 的默认处理
		contentType : false,  //必须false才会自动加上正确的Content-Type
		success: function (data) {
			console.log("成功");
			if(data.status==200){
				tipOk("添加成功",function(){
					resetValue();
                    location.reload();
				});
			}else{
				tipError(data.msg);
			}
		}
	});
	return false;
 }

 function tipOk(content,callback){
	 swal({
		 title: content,
		 text: '来自<span style="color:red">sharehoo社区</span>、<a href="#">温馨提示</a>。<br/>2秒后自动关闭..',
		 imageUrl: "${host}/sweetalert/images/thumbs-up.jpg",
		 html: true,
		 timer: 3000,
		 showConfirmButton: false
	 },function(){
		 if (callback) {
			 callback();
		 }
	 });
 };
 function tipError(content){
	 swal("操作失败", content, "error");
 };

 function modifySection(id,name,zone,masterNickName,logo){
	 $("#myModalLabel1").html("修改小板块");
	 $("#sid").val(id);
	 $("#sname").val(name);
	 $("#szone").val(zone);
	 $("#smasterNickName").val(masterNickName);
	 $("#sImgPr").attr("src","${pageContext.request.contextPath}/"+logo);
 }


function deleteSections(){
	var selectedSpan=$(".checked").parent().parent().next("td");
	if(selectedSpan.length==0){
		alert("请选择要删除的数据！");
		return;
	}
	var strIds=[];
	for(var i=0;i<selectedSpan.length;i++){
		strIds.push(selectedSpan[i].innerHTML);
	}
	var ids=strIds.join(",");
	if(confirm("您确定要删除这"+selectedSpan.length+"条数据吗？")){
		$.post("Section_delete1.action",{ids:ids},function(result){
			if(result.success){
				alert("数据已成功删除！");
                location.reload();
			}else{
				alert("数据删除失败！");
			}
		},"json");
	}else{
		return;
	}
}
function resetValue(){
	 $("#id").val("");
	 $("#sectionName").val("");
}
function searchUserByNickName(userNickName){
	$.post("${host}/user/lookup/"+userNickName,{nickName:userNickName},function(result){
		var result=eval(result);
		$("#info").html(result.info);
		$("#masterId").val(result.masterId);
	});
}


function searchUserByNickName1(userNickName){
	$.post("Section_getUserByNickName.action",{nickName:userNickName},function(result){
		var result=eval(result);
		$("#info1").html(result.info);
		$("#smasterId").val(result.masterId);
	});
}
</script>
</head>
<body style="background-color: #f5f6fa;">
	<!-- class="input-medium search-query"本论坛的搜索方法是"bootstrap模态框"搜索表单   2016.12.06 -->

	<!--保持新版本上风格的统一 上面间距15px	，左右间距15px，背景色 #f5f6fa		旧版代码都要加上这样的样式		2020.08.14 miki  -->
	<div class="row" style="height:20px;width:100%;background-color: #f5f6fa"></div>
	<div class="container-fluid" style="background-color: #ffffff;width:97%">
		<div id="tooBar" style="padding: 10px 0px 0px 10px;">
			<button class="btn btn-primary" type="button" data-backdrop="static" data-toggle="modal" data-target="#dlg" onclick="return openAddDlg()">添加小板块</button>&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#" role="button" class="btn btn-danger" onclick="javascrip:deleteSections()">批量删除</a>
			<form action="Section_list.action" method="post" class="form-search" style="display: inline;">
	          &nbsp;小板块名称：
			  <input name="s_section.name" value="${s_section.name }" type="text" class="input-medium search-query" placeholder="输入小板块名称..."/>
			  &nbsp;所属大板块：
			  <select name="s_section.zone.id"><option value="">请选择...</option>
				<c:forEach var="zone" items="${zoneList }">
					<option value="${zone.id }" ${s_section.zone.id==zone.id?'selected':'' }>${zone.name }</option>
				</c:forEach>
			  </select>
			  &nbsp;版主：
			  <select name="s_section.master.id"><option value="">请选择...</option>
				<c:forEach var="master" items="${masterList }">
					<option value="${master.id }" ${s_section.master.id==master.id?'selected':'' }>${master.nickName }</option>
				</c:forEach>
			  </select>
			  &nbsp;
			  <button type="submit" class="btn btn-primary" title="Search">查询&nbsp;<i class="icon  icon-search"></i></button>
			</form>
		</div>
		<div class="row-fluid">
			<div class="span12">
				<div class="widget-box">
					<div class="widget-title">
						<!-- <span class="icon"> <input type="checkbox"
							id="title-checkbox" name="title-checkbox" />
						</span> -->
						<h5>小板块列表</h5>
					</div>
					<div class="widget-content nopadding">
						<table class="table table-bordered table-striped with-check">
							<thead>
								<tr>
									<th><i class=""></i></th>
									<th>编号</th>
									<th>小板块名称</th>
									<th>小板块logo</th>
									<th class="th">所属大板块</th>
									<th>版主</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${sectionList }" var="section">
									<tr>
										<td><input type="checkbox" /></td>
										<td style="text-align: center;vertical-align: middle;">${section.id }</td>
										<td style="text-align: center;vertical-align: middle;">${section.name }</td>
										<td style="text-align: center;vertical-align: middle;width: 110px;vertical-align: middle;">
											<img style="width: 100px;height:75px;border-radius:50%;" src='${pageContext.request.contextPath}/${section.logo }'></img>
										</td>
										<td style="text-align: center;vertical-align: middle;">${section.zone.name }</td>
										<td style="text-align: center;vertical-align: middle;">${section.master.nickName }</td>
										<td style="text-align: center;vertical-align: middle;">
											<a class="btn btn-xs btn-default submenuitem" data-backdrop="static" data-toggle="modal" data-target="#data"
													onclick="return modifySection(${section.id},'${section.name }',${section.zone.id },'${section.master.nickName }',
															'${section.logo }')"><i class="ftsucai-edit-2"></i>
											</a>
											<a class="btn btn-xs btn-default submenuitem" type="button" onclick="javascript:sectionDelete(${section.id})"><i class="ftsucai-del"></i></a>
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

		<!-- bootstarp 隐藏版块栏2    新增 小版块 	2020.08.11 miki		  -->
		<div id="dlg" class="modal hide fade"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true" onclick="return resetValue()">×</button>
				<h3 id="myModalLabel">增加小板块</h3>
			</div>
			<form id="fm" action="" method="post" enctype="multipart/form-data">
			<div class="modal-body">
				
					<table>
						<tr>
							<td>
								<label class="control-label" for="sectionName">请输入小板块名称：</label>
							</td>
							<td>
								<input id="sectionName" type="text" name="name" placeholder="请输入…">
							</td>
						</tr>
						<tr>
							<td>
								<img id="ImgPr" class="pull-left" style="width: 120px; height: 120px;" src="${pageContext.request.contextPath}/${section.logo }" />
							</td>
							<td>
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="logo">上传logo：</label>
							</td>
							<td>
								<!--2020.08.11 miki 注意上传文件的字段名不能与表单对象中的属性值同名，否则会400异常-->
								<input type="file" id="logo" name="logoFile">
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="zone">请选择所属大板块：</label>
							</td>
							<td>
								<select id="zone" name="zone.id"><option value="">请选择...</option>
									<c:forEach var="zone" items="${zoneList }">
										<option value="${zone.id }">${zone.name }</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="masterNickName">版主：</label>
							</td>
							<td>
								<input id="masterNickName" type="text" name="master.nickName" onkeydown="javascript:searchUserByNickName(this.value)" placeholder="请输入昵称回车">
								<font id="info" style="color: red;"></font>
							</td>
						</tr>
					</table>
				<%--								2020.08.11 miki 提交新增表单的时候，自增id不要加到表单中，因为新增表单中的id为空，会导致http 400状态码--%>
				<%--								<input id="id" type="hidden" name="id">--%>
					<input id="masterId" type="hidden" name="master.id">
				
			</div>
		</form>
		<div class="modal-footer">
			<font id="error" style="color: red;"></font>
			<button class="btn" data-dismiss="modal" aria-hidden="true"
					onclick="return resetValue()">关闭</button>
			<button class="btn btn-primary" onclick="javascript:saveSection()">保存</button>
			<!-- <button class="btn btn-primary" type="submit">保存</button> -->
		</div>
	</div>


			
			<!-- bootstarp 隐藏版块栏2    修改 小版块 	2017.05.28		  -->
		
	<div id="data" class="modal hide fade"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
		<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true" onclick="return resetValue()">×</button>
				<h3 id="myModalLabel1">修改小板块</h3>
			</div>
		<form id="fm1" action="Section_save.action" method="post" enctype="multipart/form-data">	
			<div class="modal-body">
				
					<table>
						<tr>
							<td>
								<label class="control-label" for="name">请输入小板块名称：</label>
							</td>
							<td>
								<input id="sname" type="text" name="name" placeholder="请输入…">
								<input id="sid" type="hidden" readonly="readonly" name="id">
								<input id="smasterId" type="hidden" name="master.id">
							</td>
						</tr>
						<tr>
							<td>
								<img id="sImgPr" class="pull-left" style="width: 120px; height: 120px;" src="${pageContext.request.contextPath}/${section.logo }" />
							</td>
							<td>
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="slogo">上传logo：</label>
							</td>
							<td>
								<input type="file" id="slogo" name="logoFile">
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="zone">请选择所属大板块：</label>
							</td>
							<td>
								<select id="szone" name="zone.id"><option value="">请选择...</option>
									<c:forEach var="zone" items="${zoneList }">
										<option value="${zone.id }">${zone.name }</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="smasterNickName">版主：</label>
							</td>
							<td>
								<input id="smasterNickName" type="text" name="master.nickName" onkeydown="javascript:searchUserByNickName1(this.value)" placeholder="请输入昵称回车">
								<font id="info1" style="color: red;"></font>
							</td>
						</tr>
					</table>
			</div>
		</form>
		<div class="modal-footer">
			<font id="serror" style="color: red;"></font>
			<button class="btn" data-dismiss="modal" aria-hidden="true"
					onclick="return resetValue()">关闭</button>
			<button class="btn btn-primary" type="submit">保存</button>
			<!-- <button class="btn btn-primary" type="submit">保存</button> -->
		</div>
		
		</div>





	</div>
</body>
</html>