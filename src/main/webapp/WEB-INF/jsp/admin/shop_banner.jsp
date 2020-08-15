<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>后台管理</title>

<!-- 2020.08.13 miki 新版bootstrap样式文件在旧的代码中不兼容，暂时不用	<link href="${host}/admin/new-version/css/bootstrap.min.css" rel="stylesheet"> -->
<link rel="stylesheet" href="${host}/admin/css/bootstrap.min.css" />
<link href="${host}/admin/new-version/css/theme.css" rel="stylesheet">
<link href="${host}/admin/new-version/css/fonts.css" rel="stylesheet">

<!--使用jquery的select2.js+select2.css插件实现下拉搜索框的五个插件（注意插件的先后顺序）	2020.08.15-->
<script src="${host}/js/jquery-1.7.2.min.js"></script>
<link rel="stylesheet" href="${host}/admin/css/select2.css" />
<link rel="stylesheet" href="${host}/admin/css/unicorn.main.css" />
<script src="${host}/admin/js/select2.min.js"></script>

<!-- 引用该插件需要jQuery1.9以下的版本。否则报错方法找不到..
	 jQuery.browser()方法自jQuery 1.3以来已被取消，并在1.9中被删除。 -->
<script src="${host}/admin/js/jquery.uniform.js"></script>
<!-- checkbox样式管理  2020.08.15 miki -->
<link rel="stylesheet" href="${host}/admin/css/uniform.css" />

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploadPreview.min.js"></script>

<script src="${host}/admin/new-version/js/tooltip.js"></script>
<script src="${host}/admin/js/jquery.ui.custom.js"></script>
<script src="${host}/admin/js/jquery.dataTables.min.js"></script>
<script src="${host}/admin/js/bootstrap.min.js"></script>

<!-- 2019.09.11	miki 自定义弹窗 -->
<link rel="stylesheet" type="text/css" href="${host}/sweetalert/sweetalert.css"/>
<script src="${host}/sweetalert/sweetalert.min.js"></script>
<style type="text/css">
</style>
<script type="text/javascript">

     //加载小版块logo视图 
$(function () {
	$("#image").uploadPreview({ Img: "ImgPr", Width: 320, Height: 220 });
});
     
     
$(function () {
	$("#simage").uploadPreview({ Img: "sImgPr", Width: 320, Height: 220 });
});
         
     
     //添加小版块 
function openAddDlg(){
	$("#myModalLabel").html("增加banner");
}
     
     
function saveBanner(){
	debugger
	 if ($("#name").val()==null||$("#name").val()=='') {
		 $("#error").html("请输入小板块名称！");
		 return false;
	 }
	 if ($("#url").val()==null||$("#url").val()=='') {
		 $("#error").html("url不能为空！");
		 return false;
	 }
	 if ($("#type").val()==null||$("#type").val()=='') {
		 $("#error").html("banner类型不能为空！");
		 return false;
	 }
	//2020.08.11 miki 提交新增表单的时候，自增id不要加到表单中，因为新增表单中的id为空，会导致http 400状态码
	var formData = new FormData($("#fm")[0]);
	$.ajax({
		type: "POST",
		url: "${pageContext.request.contextPath}/admin/newsBanner/save",
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
					location.reload(true);
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
 
function updateBanner(){
	var bannerId=$("#sid").val();
	 if ($("#sname").val()==null||$("#sname").val()=='') {
		 $("#error").html("请输入名称！");
		 return false;
	 }
	 if ($("#stype").val()==null||$("#stype").val()=='') {
		 $("#error").html("请选择所属大板块！");
		 return false;
	 }
	 if ($("#surl").val()==null||$("#surl").val()=='') {
		 $("#error").html("请输入版主昵称！");
		 return false;
	 }
	 $.post("${pageContext.request.contextPath}/admin/newsBanner/update?bannerId="+bannerId, $("#fm1").serialize(),
			 function(result){
 			if(result.status == 200){
 				alert("修改成功！");
 				resetValue();
 				location.reload(true);
 			}else{	    				
 				alert("修改失败！");    			            				
 			}
 		},"json");
}

 function modifyBanner(id,name,url,logo,type,notice){
	 $("#myModalLabel1").html("修改banner");
	 $("#sid").val(id);
	 $("#sname").val(name);
	 $("#surl").val(url);
	 $("#stype").val(type);
	 $("#snotice").val(notice);
	 $("#sImgPr").attr("src","${pageContext.request.contextPath}/"+logo);
 }
 
 function bannerDelete(bannerId){	
		swal({
			title: "确定要删除这条数据吗?", 
			text: "拉黑之后，将永无回头之日..", 
			type: "warning",
			showCancelButton: true,
			closeOnConfirm: false,
			confirmButtonText: "是的，强行删除！",
			confirmButtonColor: "#ec6c62"
			}, function() {
				$.ajax({
					url: "${host}/admin/newsBanner/delete",
					data: {bannerId:bannerId},
					type: "POST",
				}).done(function(data) {
					if(data.status==200){
						tipOk("操作成功", function() {
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
				location.reload(true);
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
	$.post("Section_getUserByNickName.action",{nickName:userNickName},function(result){
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
<body style="background-color: #f5f6fa">
	<!--保持新版本上风格的统一 上面间距15px	，左右间距15px，背景色 #f5f6fa		旧版代码都要加上这样的样式		2020.08.14 miki  -->
	<div class="row" style="height:20px;width:100%;background-color: #f5f6fa"></div>
	<div class="container-fluid" style="background-color: #ffffff;width:97%">

	<!-- class="input-medium search-query"本论坛的搜索方法是"bootstrap模态框"搜索表单   2016.12.06 -->
	<div class="container-fluid">
		<div id="tooBar" style="padding: 10px 0px 0px 10px;">
			<button class="btn btn-primary" type="button" data-backdrop="static" data-toggle="modal" data-target="#dlg" onclick="return openAddDlg()">添加banner</button>&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#" role="button" class="btn btn-danger" onclick="javascrip:deleteSections()">批量删除</a><br>
			<font style="font-size:9pt;">*banner类型：download：下载社区首页banner	&nbsp;&nbsp;	recommend：资源下载页大神推荐图文板块</font>
		</div>
		<div class="row-fluid">
			<div class="span12">
				<div class="widget-box">
					<div class="widget-title">
						<!-- <span class="icon"> <input type="checkbox"
							id="title-checkbox" name="title-checkbox" />
						</span> -->
						<h5>banner列表</h5>
					</div>
					<div class="widget-content nopadding">
						<table class="table table-bordered table-striped with-check">
							<thead>
								<tr>
									<th><i class=""></i></th>
									<th>编号</th>
									<th>banner名称</th>
									<th>logo</th>
									<th class="th">url链接</th>
									<th>上传时间</th>
									<th>类型</th>
									<th>状态</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${bannerList }" var="banner">
									<tr>
										<td><input type="checkbox" /></td>
										<td style="text-align: center;vertical-align: middle;">${banner.id }</td>
										<td style="text-align: center;vertical-align: middle;">${banner.news_name }</td>
										<td style="text-align: center;vertical-align: middle;width: 110px;vertical-align: middle;">
											<img style="width: 100px;" src='${pageContext.request.contextPath}/${banner.news_img }'></img>
										</td>
										<td style="text-align: center;vertical-align: middle;">${banner.url }</td>
										<td style="text-align: center;vertical-align: middle;"><fmt:formatDate value="${banner.news_time }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
										<td style="text-align: center;vertical-align: middle;">${banner.type }</td>
										
										<c:choose>
											<c:when test="${banner.notice=='1' }">
												<td style="text-align: center;vertical-align: middle;">使用中</td>
											</c:when>
											<c:otherwise>
												<td style="text-align: center;vertical-align: middle;">停用</td>
											</c:otherwise>
										</c:choose>
										
										<td style="text-align: center;vertical-align: middle;">
											<a class="btn btn-xs btn-default submenuitem" type="button" data-backdrop="static" data-toggle="modal" data-target="#data" onclick="return modifyBanner(${banner.id},'${banner.news_name }','${banner.url }','${banner.news_img  }','${banner.type }','${banner.notice }')">
												<i class="ftsucai-edit-2"></i>
											</a>&nbsp;&nbsp;<a class="btn btn-xs btn-default submenuitem" type="button" onclick="javascript:bannerDelete(${banner.id})"><i class="ftsucai-del"></i></a>
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
		
		<!-- bootstarp 隐藏版块栏    添加小版块 	2017.05.28		  -->
		
	<div id="dlg" class="modal hide fade"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true" onclick="return resetValue()">×</button>
				<h3 id="myModalLabel">增加banner</h3>
			</div>

		<form id="fm" action="" method="post" enctype="multipart/form-data">
			<div class="modal-body">
				<table>
					<tr>
						<td>
							<label class="control-label" for="name">请输入banner名称：</label>
						</td>
						<td>
							<input id="name" type="text" name="news_name" placeholder="请输入…">
<%--								2020.08.11 miki 提交新增表单的时候，自增id不要加到表单中，因为新增表单中的id为空，会导致http 400状态码--%>
<%--								<input id="id" type="hidden" name="id">--%>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<img id="ImgPr" class="pull-left" style="width: 300px; height: 120px;" src="${pageContext.request.contextPath}/${banner.news_img }" />
						</td>

					</tr>
					<tr>
						<td>
							<label class="control-label" for="logo">上传logo(900*302px)：</label>
						</td>
						<td>
							<input type="file" id="image" name="image">
						</td>
					</tr>
					<tr>
						<td>
							<label class="control-label" for="url">图片对应url：</label>
						</td>
						<td>
							<input id="url" type="text" name="url" placeholder="请输入…">
						</td>
					</tr>
					<tr>
						<td>
							<label class="control-label" for="type">类型：</label>
						</td>
						<td>
<%--								<input id="type" type="text" name="type"  placeholder="请输入banner类型">--%>
							<select id="type" name="type" style="width: 195px;"><option value="">请选择banner类型...</option>
								<option value="topicBanner"}>topicBanner</option>
								<option value="recommend"}>recommend</option>
								<option value="download"}>download</option>
							</select>
							<font id="info" style="color: red;"></font>
						</td>
					</tr>
				</table>
			</div>
		</form>
		<div class="modal-footer">
			<font id="error" style="color: red;"></font>
			<button class="btn" data-dismiss="modal" aria-hidden="true"
					onclick="return resetValue()">关闭</button>
			<button class="btn btn-primary" onclick="javascript:saveBanner()">保存</button>
			<!-- <button class="btn btn-primary" type="submit">保存</button> -->
		</div>
	</div>
		
		<!-- bootstarp 隐藏版块栏2    修改 小版块 	2017.05.28		  -->
		
	<div id="data" class="modal hide fade"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
		<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true" onclick="return resetValue()">×</button>
				<h3 id="myModalLabel1">修改banner</h3>
			</div>
	
			<div class="modal-body">
					<form id="fm1" method="post" enctype="multipart/form-data">	
					<table>
						<tr>
							<td>
								<label class="control-label" for="name">请输入banner名称：</label>
							</td>
							<td>
								<input id="sname" type="text" name="news_name" placeholder="请输入…">
								<input id="sid" type="hidden" readonly="readonly" name="id">
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<img id="sImgPr" class="pull-left" style="width: 300px; height: 120px;" src="${pageContext.request.contextPath}/${banner.news_img }" />
							</td>					
						</tr>			
						<tr>
							<td>
								<label class="control-label" for="stype">banner类型：</label>
							</td>
							<td>
								<input id="stype" type="text" name="type" placeholder="请输入…">
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="stype">banner注释：</label>
							</td>
							<td>
								<input id="snotice" type="text" name="notice" placeholder="请输入…">
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="surl">url：</label>
							</td>
							<td>
								<input id="surl" type="text" name="url" placeholder="请输入_">
								<font id="info1" style="color: red;"></font>
							</td>
						</tr>
					</table>
				</form>
			</div>							
			<div class="modal-footer">
				<font id="error" style="color: red;"></font>
				<button class="btn" data-dismiss="modal" aria-hidden="true"
					onclick="return resetValue()">关闭</button>
				<button class="btn btn-primary" onclick="javascript:updateBanner()">保存</button>
				<!-- <button class="btn btn-primary" type="submit">保存</button> -->
			</div>
		</div>
		
		
		
		
		
	</div>
</body>
</html>