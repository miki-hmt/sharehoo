<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 2020.08.13 miki 新版bootstrap样式文件在旧的代码中不兼容，暂时不用	<link href="${host}/admin/new-version/css/bootstrap.min.css" rel="stylesheet"> -->
<link rel="stylesheet" href="${host}/admin/css/bootstrap.min.css" />
<link href="${host}/admin/new-version/css/theme.css" rel="stylesheet">
<link href="${host}/admin/new-version/css/fonts.css" rel="stylesheet">

<!--使用jquery的select2.js+select2.css插件实现下拉搜索框的五个插件（注意插件的先后顺序）	2020.08.15-->
<script src="${host}/js/jquery-1.7.2.min.js"></script>
<link rel="stylesheet" href="${host}/admin/css/select2.css" />
<link rel="stylesheet" href="${host}/admin/css/unicorn.main.css" />
<script src="${host}/admin/js/select2.min.js"></script>
<script src="${host}/admin/js/unicorn.js"></script>
<script src="${host}/admin/js/unicorn.tables.js"></script>

<!-- 引用该插件需要jQuery1.9以下的版本。否则报错方法找不到..
	 jQuery.browser()方法自jQuery 1.3以来已被取消，并在1.9中被删除。 -->
<script src="${host}/admin/js/jquery.uniform.js"></script>
<!-- checkbox样式管理  2020.08.15 miki -->
<link rel="stylesheet" href="${host}/admin/css/uniform.css" />

<script src="${host}/admin/new-version/js/tooltip.js"></script>
<script src="${host}/admin/js/jquery.ui.custom.js"></script>
<script src="${host}/admin/js/jquery.dataTables.min.js"></script>
<script src="${host}/admin/js/bootstrap.min.js"></script>

<!-- 2019.09.11	miki 自定义弹窗 -->
<link rel="stylesheet" type="text/css" href="${host}/sweetalert/sweetalert.css"/>
<script src="${host}/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript">
	function modifyType(id,name){
		 $("#myModalLabel").html("修改类型");
		 $("#id").val(id);
		 $("#name").val(name);
	 }
 
 function updateType(){
	 if ($("#name").val()==null||$("#name").val()=='') {
		 $("#error").html("请输入公告名称！");
		 return false;
	}
	var formData = new FormData($("#fm")[0]);
	$.ajax({
		type : "POST",
		url : "${host}/admin/shop/type/save",
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
 
 function resetValue(){
	 $("#id").val("");
	 $("#zoneName").val("");
}
 
</script>
<title>类型管理</title>
</head>
<body style="background-color: #f5f6fa">
	<!--保持新版本上风格的统一 上面间距15px	，左右间距15px，背景色 #f5f6fa		旧版代码都要加上这样的样式		2020.08.14 miki  -->
	<div class="row" style="height:20px;width:100%;background-color: #f5f6fa"></div>
	<div class="container-fluid" style="background-color: #ffffff;width:97%">
	
		<div id="tooBar" style="padding: 10px 0px 0px 10px;">
			<button class="btn btn-primary" type="button" data-backdrop="static" data-toggle="modal" data-target="#dlg" onclick="return openAddDlg()">管理资源类型</button>&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
		<div class="row-fluid">
			<div class="span12">
				<div class="widget-box">
					<div class="widget-title">
						<!-- <span class="icon"> <input type="checkbox"
							id="title-checkbox" name="title-checkbox" />
						</span> -->
						<h5>类型列表</h5>
					</div>
					<div class="widget-content nopadding">
						<table class="table table-bordered table-striped with-check">
							<thead>
								<tr>
									<th><i class=""></i></th>
									<th>编号</th>
									<th>类型名称</th>						
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${typeList }" var="type">
									<tr>
										<td><input type="checkbox" /></td>
										<td style="text-align: center;">${type.id }</td>
										<td style="text-align: center;">${type.name }</td>									
										<td style="text-align: center;">											
											<a class="btn btn-xs btn-default submenuitem" type="button" data-backdrop="static" data-toggle="modal" data-target="#dlg" onclick="return modifyType(${type.id},'${type.name }')">
												<i class="ftsucai-edit-2"></i>
											</a>&nbsp;&nbsp;<a class="btn btn-xs btn-default submenuitem" type="button" onclick="javascript:typeDelete(${type.id})"><i class="ftsucai-del"></i></a>
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
				<h3 id="myModalLabel">修改子模块</h3>
			</div>
			<div class="modal-body">
				<form id="fm" action="">
					<table>						
						<tr>
							<td>
								<label class="control-label" for="name">类型名称：</label>
							</td>
							<td>
								 <input id="name" type="text" name="name" placeholder="请输入…">
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
				<button class="btn btn-primary" onclick="javascript:updateType()">保存</button>
			</div>
		</div>
		
		
		<!-- 2017.11.11	miki 添加子模块div -->
		<div id="dlg2" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true" onclick="return resetValue()">×</button>
				<h3 id="myModalLabel">添加子模块</h3>
			</div>
			<div class="modal-body">
				<form id="sfm" action="">
					<table>	
						<tr>
							<td>
								<label class="control-label" for="sName">子模块名：</label>
							</td>
							<td>
								 <input id="sName" type="text" name=name" placeholder="请输入…">
							</td>
						</tr>								
					</table>
					<input id="fId" type="hidden" name="id" value="0">
				</form>
			</div>
			<div class="modal-footer">
				<font id="serror" style="color: red;"></font>
				<button class="btn" data-dismiss="modal" aria-hidden="true"
					onclick="return resetValue()">关闭</button>
				<button class="btn btn-primary" onclick="javascript:updateType()">保存</button>
			</div>
		</div>
		
		
		
	</div>
	
</body>
</html>