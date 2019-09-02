<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- 					2017.04.04
						author:miki
						project:后台资源列表页面的增删改查
 -->

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
</style>
<script type="text/javascript">
 
function userDelete(userId){
	if(confirm("用户所发的帖子也将被删除，确定要删除这条数据吗?")){
		$.post("User_delete.action",{userId:userId},
				function(result){
					var result=eval(result);
					if(result.info){
						alert(result.info);
						window.location.reload(true);
					}
				}
			);
	}
}
function deleteUsers(){
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
	if(confirm("用户所发的帖子也将被删除，您确定要删除这"+selectedSpan.length+"条数据吗？")){
		$.post("User_deleteUsers.action",{ids:ids},function(result){
			var result=eval(result);
			if(result.info){
				alert(result.info);
				location.reload(true); 
			}
		});
	}else{
		return;
	}
}
function resetValue(){
	 $("#id").val("");
	 $("#userName").val("");
}

</script>
</head>
<body>
	<div class="container-fluid">
		<div id="tooBar" style="padding: 10px 0px 0px 10px;">
			<!-- <button class="btn btn-primary" type="button" data-backdrop="static" data-toggle="modal" data-target="#dlg" onclick="return openAddDlg()">添加小板块</button>&nbsp;&nbsp;&nbsp;&nbsp; -->
			<a href="#" role="button" class="btn btn-danger" onclick="javascrip:deleteUsers()">批量删除</a>
			
			
			
		</div>
		<div class="row-fluid">
			<div class="span12">
				<div class="widget-box">
					<div class="widget-title">
						<!-- <span class="icon"> <input type="checkbox"
							id="title-checkbox" name="title-checkbox" />
						</span> -->
						<h5>资源列表</h5>
					</div>
					<div class="widget-content nopadding">
						<table class="table table-bordered table-striped with-check">
							<thead>
								<tr>
									<th><i class=""></i></th>
									<th>编号</th>
									<th>名称</th>																	
									<th class="th">所属板块</th>
									<th>logo</th>
									<th>大小</th>
									<th>语言</th>
									<th>支持系统</th>									
									<th>下载地址</th>
									<th>发布时间</th>
									<th>下载量</th>
									<th>推荐</th>
									<th>热门</th>
									<th>关键字</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${softList }" var="soft">
									<tr>
										<td><input type="checkbox" /></td>
										<td style="text-align: center;vertical-align: middle;">${soft.id }</td>
										<td style="text-align: center;vertical-align: middle;">${soft.soname }</td>
										<td style="text-align: center;vertical-align: middle;">${soft.softSection.areaName }</td>												
										<td style="text-align: center;vertical-align: middle;">											
										<img src="${pageContext.request.contextPath}/${soft.logo}" style="width: 100px;height: 100px;border-radius:50%;">													
										</td>
										<td style="text-align: center;vertical-align: middle;">${soft.size }</td>
										<td style="text-align: center;vertical-align: middle;">${soft.language }</td>
										<td style="text-align: center;vertical-align: middle;">${soft.forSystem }</td>
																				
										<td style="text-alignLcenter; vertical-align:middle;">${soft.downAdress}</td>
										<td style="text-alignLcenter; vertical-align:middle;"><fmt:formatDate value="${soft.publishDate}" pattern="yyyy-MM-dd "/></td>
										<td style="text-alignLcenter; vertical-align:middle;">${soft.count}</td>
										<td style="text-alignLcenter; vertical-align:middle;">${soft.good}</td>
										<td style="text-alignLcenter; vertical-align:middle;">${soft.hot}</td>
										<td style="text-alignLcenter; vertical-align:middle;">${soft.keyword}</td>							
																		
										<td style="text-align: center;vertical-align: middle;">
											<a href="Soft_update.action?softId=${soft.id }"><button class="btn btn-info" type="button">修改</button></a>
											<button class="btn btn-danger" type="button" onclick="javascript:userDelete(${soft.id})">删除</button>
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
		
	</div>
</body>
</html>