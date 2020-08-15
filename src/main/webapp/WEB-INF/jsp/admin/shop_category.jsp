<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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

<html>
<head>

	<!-- 2017.04.15
		author: miki
		project:后台公告页面的增删改查
 -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript">

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

function openAddDlg(){
	$("#myModalLabel").html("添加大模块");
}


function updateCategory(){
	var categoryId=$("#uid").val();
	if ($("#uname").val()==null||$("#uname").val()=='') {
		$("#uerror").html("名称不能为空！");
		return false;
	}
	$.post("${pageContext.request.contextPath}/amdin/shop/categoryUpdate?categoryId="+categoryId, $("#ufm").serialize(),
			function(result){
				if(result.status==200){
					tipOk("添加成功",function(){
						resetValue();
						location.reload(true);
					});
				}else{
					tipError(result.msg);
				}
			},"json");
}

//新建目录
 function saveCategory(){
	 var categoryId=$("#id").val();
	 if ($("#name").val()==null||$("#name").val()=='') {
		 $("#error").html("名称不能为空！");
		 return false;
	}
	 $.post("${pageContext.request.contextPath}/amdin/shop/categorySave", $("#fm").serialize(),
			 function(result){
				 if(result.status==200){
					 tipOk("添加成功",function(){
						 resetValue();
						 location.reload(true);
					 });
				 }else{
					 tipError(result.msg);
				 }
		},"json");
 }
 
/*2017.11.11	miki 添加二级模块实现方法*/ 
 
 function addSonCategory(id,name){
	 $("#fId").val(id);
	 $("#fName").val(name);
 }

function modifyCategory(id,name){
	$("#uid").val(id);
	$("#uname").val(name);
}
 
 function saveSonCate(){
	 var categoryId=$("#fId").val();
	 if ($("#sName").val()==null||$("#sName").val()=='') {
		 $("#serror").html("名称不能为空！");
		 return false;
	}
	 $.post("${pageContext.request.contextPath}/manage/source/saveMenu?categoryId="+categoryId, $("#sfm").serialize(),
			 function(result){
				 if(result.status==200){
					 tipOk("添加成功",function(){
						 resetValue();
						 location.reload(true);
					 });
				 }else{
					 tipError(result.msg);
				 }
		},"json");
 } 
 
 /*softSectionId对应SoftSection_delete.action里的变量，zoneId表示此处传 的值，softSectionId:zoneId表示将zoneId的值赋给softSectionId */	
function categoryDelete(categoryId){
	if(confirm("确定要删除这条数据吗?")){
		$.post("${pageContext.request.contextPath}/amdin/shop/categoryDelete",{categoryId:categoryId},				
				function(result){
					var result=eval(result);
					if(result.status==200){
						tipOk("添加成功",function(){
							resetValue();
							location.reload(true);
						});
					}else{
						tipError(result.msg);
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
<body style="background-color: #f5f6fa;height:1080px">
	<!--保持新版本上风格的统一 上面间距15px	，左右间距15px，背景色 #f5f6fa		旧版代码都要加上这样的样式		2020.08.14 miki  -->
	<div class="row" style="height:20px;width:100%;background-color: #f5f6fa"></div>
	<div class="container-fluid" style="background-color: #ffffff;width:97%">
	
		<div id="tooBar" style="padding: 10px 0px 0px 10px;">
			<button class="btn btn-primary" type="button" data-backdrop="static" data-toggle="modal" data-target="#dlg" onclick="return openAddDlg()">添加模块</button>&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
		<div class="row-fluid">
			<div class="span12">
				<div class="widget-box">
					<div class="widget-title">
						<!-- <span class="icon"> <input type="checkbox"
							id="title-checkbox" name="title-checkbox" />
						</span> -->
						<h5>资源模块列表</h5>
					</div>
					<div class="widget-content nopadding">
						<table class="table table-bordered table-striped with-check">
							<thead>
								<tr>
									<th><i class=""></i></th>
									<th>编号</th>
									<th>名称</th>						
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${categoryList }" var="category">
									<tr>
										<td><input type="checkbox" /></td>
										<td style="text-align: center;">${category.id }</td>
										<td style="text-align: center;">${category.name }</td>									
										<td style="text-align: center;">
											<a class="btn btn-xs btn-default submenuitem" type="button" data-backdrop="static" data-toggle="modal" data-target="#dlg2" onclick="return addSonCategory(${category.id},'${category.name }')">添加子模块
											</a>&nbsp;&nbsp;
											<a class="btn btn-xs btn-default submenuitem" type="button" data-backdrop="static" data-toggle="modal" data-target="#update_dlg" onclick="return modifyCategory(${category.id},'${category.name }')">
												<i class="ftsucai-edit-2"></i>
											</a>&nbsp;&nbsp;
											<a class="btn btn-xs btn-default submenuitem" type="button" onclick="javascript:categoryDelete(${category.id})"><i class="ftsucai-del"></i></a>
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

		<!--2020.08.11 miki 添加大模块-->
		<div id="dlg" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true" onclick="return resetValue()">×</button>
				<h3 id="myModalLabel">添加大模块</h3>
			</div>
			<div class="modal-body">
				<form id="fm" action="">
					<table>
						<tr>
							<td>
								<label class="control-label" for="name">请输入名称：</label>
							</td>
							<td>
								 <input id="name" type="text" name="name" placeholder="请输入…">
							</td>
						</tr>								
					</table>
<%--					新增操作不需要传id，否则会报http 400  2020.08.11 miki--%>
<%--					<input id="id" type="hidden" name="id">--%>
				</form>
			</div>
			<div class="modal-footer">
				<font id="error" style="color: red;"></font>
				<button class="btn" data-dismiss="modal" aria-hidden="true"
					onclick="return resetValue()">关闭</button>
				<button class="btn btn-primary" onclick="javascript:saveCategory()">保存</button>
			</div>
		</div>

		<!--2020.08.11 miki 修改大模块-->
		<div id="update_dlg" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true" onclick="return resetValue()">×</button>
				<h3 id="umyModalLabel">修改大模块</h3>
			</div>
			<div class="modal-body">
				<form id="ufm" action="">
					<table>
						<tr>
							<td>
								<label class="control-label" for="name">请输入名称：</label>
							</td>
							<td>
								<input id="uname" type="text" name="name" placeholder="请输入…">
							</td>
						</tr>
					</table>
					<input id="uid" type="hidden" name="id">
				</form>
			</div>
			<div class="modal-footer">
				<font id="uerror" style="color: red;"></font>
				<button class="btn" data-dismiss="modal" aria-hidden="true"
						onclick="return resetValue()">关闭</button>
				<button class="btn btn-primary" onclick="javascript:updateCategory()">保存</button>
			</div>
		</div>

		
		<!-- 2017.11.11	miki 添加子模块div -->
		<div id="dlg2" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true" onclick="return resetValue()">×</button>
				<h3 id="menuModalLabel">添加子模块</h3>
			</div>
			<div class="modal-body">
				<form id="sfm" action="">
					<table>
						<tr>
							<td>
								<label class="control-label" for="name">父级模块名：</label>
							</td>
							<td>
								 <input id="fName" read="readonly" type="text" name="categoryName">
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="sName">子模块名：</label>
							</td>
							<td>
								 <input id="sName" type="text" name="name" placeholder="请输入…">
							</td>
						</tr>								
					</table>
					<input id="fId" type="hidden" name="categoryId">
				</form>
			</div>
			<div class="modal-footer">
				<font id="serror" style="color: red;"></font>
				<button class="btn" data-dismiss="modal" aria-hidden="true"
					onclick="return resetValue()">关闭</button>
				<button class="btn btn-primary" onclick="javascript:saveSonCate()">保存</button>
			</div>
		</div>
		
		
		
	</div>
</body>
</html>