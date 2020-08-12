<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 2019.09.11	miki 自定义弹窗 -->
<link rel="stylesheet" type="text/css" href="${host}/sweetalert/sweetalert.css"/>
<script src="${host}/sweetalert/sweetalert.min.js"></script>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<!-- 2017.04.15
		author:miki
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
<body>
	<div class="container-fluid">
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
											<button class="btn btn-info" type="button" data-backdrop="static" data-toggle="modal" data-target="#dlg2" onclick="return addSonCategory(${category.id},'${category.name }')">添加子模块
											</button>&nbsp;&nbsp;
											<button class="btn btn-info" type="button" data-backdrop="static" data-toggle="modal" data-target="#update_dlg" onclick="return modifyCategory(${category.id},'${category.name }')">修改
											</button>&nbsp;&nbsp;<button class="btn btn-danger" type="button" onclick="javascript:categoryDelete(${category.id})">删除</button>
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