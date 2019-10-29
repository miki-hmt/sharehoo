<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<!-- 					2017.11.11
						author:miki
						project:后台子模块页面的增删改查
 -->
	
	
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript">
function openAddDlg(){
	$("#myModalLabel").html("修改子模块");
}
 function saveMenu(){
	 var MenuId=$("#id").val();
	 if ($("#name").val()==null||$("#name").val()=='') {
		 $("#error").html("名称不能为空！");
		 return false;
	}
	 $.post("${pageContext.request.contextPath}/shop/manage/Menu_update.action?MenuId="+MenuId, $("#fm").serialize(),
			 function(result){
			if(result){
				alert("修改成功！");
				resetValue();
				location.reload(true);
			}else{	    				
				alert("修改失败！");    			            				
			}
		},"json");
 }
 function modifyCategory(id,cname,name){
	 $("#myModalLabel").html("修改模块");
	 $("#id").val(id);
	 $("#cname").val(cname);
	 $("#name").val(name);
 }
 

 /*softSectionId对应SoftSection_delete.action里的变量，zoneId表示此处传 的值，softSectionId:zoneId表示将zoneId的值赋给softSectionId */	
function menuDelete(menuId){
	if(confirm("确定要删除这条数据吗?")){
		$.post("${pageContext.request.contextPath}/shop/Menu_delete.action",{menuId:menuId},				
				function(result){
					var result=eval(result);
					if(result.error){
						alert("删除成功！");
						window.location.reload(true);
					}else{
						alert("删除失败");
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
			<button class="btn btn-primary" type="button" data-backdrop="static" data-toggle="modal" data-target="#dlg" onclick="return openAddDlg()">管理子模块</button>&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
		<div class="row-fluid">
			<div class="span12">
				<div class="widget-box">
					<div class="widget-title">
						<!-- <span class="icon"> <input type="checkbox"
							id="title-checkbox" name="title-checkbox" />
						</span> -->
						<h5>子模块列表</h5>
					</div>
					<div class="widget-content nopadding">
						<table class="table table-bordered table-striped with-check">
							<thead>
								<tr>
									<th><i class=""></i></th>
									<th>编号</th>
									<th>所属目录</th>
									<th>名称</th>						
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${MenuList }" var="menu">
									<tr>
										<td><input type="checkbox" /></td>
										<td style="text-align: center;">${menu.id }</td>
										<td style="text-align: center;">${menu.category.name }</td>	
										<td style="text-align: center;">${menu.name }</td>									
										<td style="text-align: center;">											
											<button class="btn btn-info" type="button" data-backdrop="static" data-toggle="modal" data-target="#dlg" onclick="return modifyCategory(${menu.id},'${menu.category.name }','${menu.name }')">修改
											</button>&nbsp;&nbsp;<button class="btn btn-danger" type="button" onclick="javascript:menuDelete(${menu.id})">删除</button>
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
								<label class="control-label" for="name">父级模块名：</label>
							</td>
							<td>
								 <input id="cname" read="readonly" type="text" name="menu.category.name">
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="name">子模块名称：</label>
							</td>
							<td>
								 <input id="name" type="text" name="menu.name" placeholder="请输入…">
							</td>
						</tr>								
					</table>
					<input id="id" type="hidden" name="menu.id">
				</form>
			</div>
			<div class="modal-footer">
				<font id="error" style="color: red;"></font>
				<button class="btn" data-dismiss="modal" aria-hidden="true"
					onclick="return resetValue()">关闭</button>
				<button class="btn btn-primary" onclick="javascript:saveMenu()">保存</button>
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
								<label class="control-label" for="name">父级模块名：</label>
							</td>
							<td>
								 <input id="fName" read="readonly" type="text" name="category.name">
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="sName">子模块名：</label>
							</td>
							<td>
								 <input id="sName" type="text" name="menu.name" placeholder="请输入…">
							</td>
						</tr>								
					</table>
					<input id="fId" type="hidden" name="category.id">
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