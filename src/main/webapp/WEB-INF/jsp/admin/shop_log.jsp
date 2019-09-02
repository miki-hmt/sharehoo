<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
</style>
<script type="text/javascript">	
 function modifySource(id,tag,name,douNum,size,good){
	 $("#myModalLabel").html("修改资源");
	 $("#id").val(id);
	 $("#name").val(name);
	 $("#tag").val(tag);
	 $("#douNum").val(douNum);
	 $("#size").val(size);
	 $("#good").val(good);
 }
 
 
 /*2016.11.15  修改店铺功能的实现 ，最初做的时候功能不完善，无法实现修改用户 ，原因：未添加saveUser()函数  */
 function saveSource(){
	 var sourceId= $("#id").val();
	 if ($("#name").val()==null||$("#name").val()=='') {
			$("#error").html("名称不能为空！");
			return false;
		}
		if ($("#tag").val()==null||$("#tag").val()=='') {
			$("#error").html("标签不能为空！");
			return false;
		}
		
		if ($("#douNum").val()==null||$("#douNum").val()=='') {
			$("#error").html("豆数不能为空！");
			return false;
		}
		if ($("#size").val()==null||$("#size").val()=='') {
			$("#error").html("资源大小不能为空！");
			return false;
		}
		if ($("#good").val()==null||$("#good").val()=='') {
			$("#error").html("设为推荐不能为空！");
			return false;
		}
		 $.post("${pageContext.request.contextPath}/shop/manage/SourceManage_saveSource.action?sourceId="+sourceId, $("#fm").serialize(),
			 function(result){
 			if(result.success){
 				alert("修改成功！");
 				resetValue();
 				location.reload(true);
 			}else{	    				
 				alert("修改失败！");    			            				
 			}
 		},"json");
 }
function sourceDelete(sourceId){
	if(confirm("店铺关联的所有信息都要删除，确定要删除吗?")){
		$.post("${pageContext.request.contextPath}/shop/manage/SourceManage_delete.action",{sourceId:sourceId},
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
			<a href="#" role="button" class="btn btn-danger" onclick="javascrip:deleteUsers()">批量删除</a>
			<a href="#" role="button" class="btn btn-danger" onclick="javascrip:deleteUsers()">按访问类排序</a>
			<a href="#" role="button" class="btn btn-danger" onclick="javascrip:deleteUsers()">按登录类排序</a>
		</div>
	
		<div class="row-fluid">
			<div class="span12">
				<div class="widget-box">
					<div class="widget-title">
						<!-- <span class="icon"> <input type="checkbox"
							id="title-checkbox" name="title-checkbox" />
						</span> -->
						<h5>店铺列表</h5>
					</div>
					<div class="widget-content nopadding">
						<table class="table table-bordered table-striped with-check">
							<thead>
								<tr>
									<th><i class=""></i></th>
									<th>编号</th>
									<th>记录对象</th>
									<th>执行操作</th>
									<th>ip</th>
									<th>ip地址</th>
									<th>时间</th>
									<th>log类型</th>																		
									<th>被访店铺</th>																										
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${logList }" var="log">
									<tr>
										<td><input type="checkbox" /></td>
										<td style="text-align: center;vertical-align: middle;">${log.id }</td>
										<td style="text-align: center;vertical-align: middle;">${log.user.nickName }</td>									
										<td style="text-align: center;vertical-align: middle;">${log.operation_log }</td>
										<td style="text-align: center;vertical-align: middle;">${log.ip}</td>
										<td style="text-align: center;vertical-align: middle;">${log.address}</td>																						
										<td style="text-align: center;vertical-align: middle;"><fmt:formatDate value="${log.time }" pattern="yyyy-MM-dd HH:mm:ss "/></td>
										
										<td style="text-align: center;vertical-align: middle;">${log.type}</td>
										<td style="text-alignLcenter; vertical-align:middle;">${log.shop.shop_name}</td>																							
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
		<div id="dlg" class="modal hide fade"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true" onclick="return resetValue()">×</button>
				<h3 id="myModalLabel">修改</h3>
			</div>
			<div class="modal-body">
				<form id="fm" action="User_save.action">
					<table>
						<tr>
							<td>
								<label class="control-label" for="name">资源名称：</label>
							</td>
							<td>
								<input id="name" type="text" name="source.name" placeholder="导入数据失败！">
							</td>
						</tr>								
											
						<tr>
							<td>
								<label class="control-label" for="tag">资源标签：</label>
							</td>
							<td>
								<input id="tag" type="text" name="source.tag" placeholder="导入数据失败！">
							</td>
						</tr>
						
						<tr>
							<td>
								<label class="control-label" for="size">资源大小：</label>
							</td>
							<td>
								<input id="size" type="text" name="source.size" placeholder="导入数据失败！">
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="douNum">所需豆数数：</label>
							</td>
							<td>
								<input id="douNum" type="text" name="source.douNum" placeholder="导入数据失败！">
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="good">是否设为推荐：</label>
							</td>
							<td>
								<input id="good" type="text" name="source.good" placeholder="导入数据失败！">								
							</td>
						</tr>					
									
					</table>
					<input id="id" type="hidden" name="source.id">
				</form>
			</div>
			<div class="modal-footer">
				<font id="error" style="color: red;"></font>
				<button class="btn" data-dismiss="modal" aria-hidden="true"
					onclick="return resetValue()">关闭</button>
				<button class="btn btn-primary" onclick="javascript:saveSource()">保存</button>
			</div>
		</div>
	</div>
</body>
</html>