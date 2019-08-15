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
 function modifyShop(id,tag,name,downNum,douNum,sourceNum,maxNum,status){
	 $("#myModalLabel").html("修改店铺");
	 $("#id").val(id);
	 $("#name").val(name);
	 $("#tag").val(tag);
	 $("#downNum").val(downNum);
	 $("#douNum").val(douNum);
	 $("#sourceNum").val(sourceNum);
	 $("#maxNum").val(maxNum);
	 $("#status").val(status);
 }
 
 
 /*2016.11.15  修改店铺功能的实现 ，最初做的时候功能不完善，无法实现修改用户 ，原因：未添加saveUser()函数  */
 function saveShop(){
	 var shopId= $("#id").val();
	 if ($("#name").val()==null||$("#name").val()=='') {
			$("#error").html("昵称不能为空！");
			return false;
		}
		if ($("#tag").val()==null||$("#tag").val()=='') {
			$("#error").html("标签不能为空！");
			return false;
		}
		
		if ($("#downNum").val()==null||$("#downNum").val()=='') {
			$("#error").html("下载数不能为空！");
			return false;
		}
		if ($("#douNum").val()==null||$("#douNum").val()=='') {
			$("#error").html("豆数不能为空！");
			return false;
		}
		if ($("#sourceNum").val()==null||$("#sourceNum").val()=='') {
			$("#error").html("资源数不能为空！");
			return false;
		}
		if ($("#maxNum").val()==null||$("#maxNum").val()=='') {
			$("#error").html("最大容量不能为空！");
			return false;
		}
		 $.post("${pageContext.request.contextPath}/shop/manage/ShopManage_saveShop.action?shopId="+shopId, $("#fm").serialize(),
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
function shopDelete(shopId){
	if(confirm("店铺关联的所有信息都要删除，确定要删除吗?")){
		$.post("${pageContext.request.contextPath}/shop/manage/ShopManage_delete.action",{shopId:shopId},
				function(result){
					var result=eval('('+result+')');
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
			var result=eval('('+result+')');
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
						<h5>店铺列表</h5>
					</div>
					<div class="widget-content nopadding">
						<table class="table table-bordered table-striped with-check">
							<thead>
								<tr>
									<th><i class=""></i></th>
									<th>编号</th>
									<th>logo</th>
									<th>店名</th>
									<th>注册人</th>
									<th>注册时间</th>									
									<th>下载数</th>
									<th>总豆数</th>
									<th>店铺标签</th>
									<th>资源数</th>
									<th>店铺容量</th>
									<th>店铺状态</th>								
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${shopList }" var="shop">
									<tr>
										<td><input type="checkbox" /></td>
										<td style="text-align: center;vertical-align: middle;">${shop.id }</td>
										<td style="text-align: center;vertical-align: middle;">
											<c:choose>
													<c:when test="${(shop.user.face==null||shop.user.face=='')&&shop.user.sex=='男'}">
														<img alt="" src="${pageContext.request.contextPath}/images/user/user0.gif" style="width: 100px;height: 100px;border-radius:50%;">
													</c:when>
													<c:when test="${(shop.user.face==null||shop.user.face=='')&&shop.user.sex=='女'}">
														<img alt="" src="${pageContext.request.contextPath}/images/user/female.gif" style="width: 100px;height: 100px;border-radius:50%;">
													</c:when>
													<c:otherwise>
														<img alt="" src="${pageContext.request.contextPath}/shop/${shop.face}" style="width: 100px;height: 100px;border-radius:50%;">
													</c:otherwise>
											</c:choose>
										</td>
										<td style="text-align: center;vertical-align: middle;">${shop.shop_name }</td>
										<td style="text-align: center;vertical-align: middle;">${shop.user.nickName}</td>																						
										<td style="text-align: center;vertical-align: middle;"><fmt:formatDate value="${shop.registerTime }" pattern="yyyy-MM-dd "/></td>
										<td style="text-align: center;vertical-align: middle;">${shop.downNum}</td>
										<td style="text-align: center;vertical-align: middle;">${shop.douNum }</td>
										<td style="text-alignLcenter; vertical-align:middle;">${shop.tag}</td>
										<td style="text-alignLcenter; vertical-align:middle;">${shop.sourceNum }</td>
										<td style="text-alignLcenter; vertical-align:middle;">${shop.maxNum }</td>	
										<td style="text-alignLcenter; vertical-align:middle;">
											<c:if test="${shop.status==1 }">
												已激活
											</c:if>
											<c:if test="${shop.status==0 }">
												已列入黑名单
											</c:if>										
										</td>									
										<td style="text-align: center;vertical-align: middle;">
											<button class="btn btn-info" type="button" data-backdrop="static" data-toggle="modal" data-target="#dlg"
											 onclick="return modifyShop(${shop.id},'${shop.tag }','${shop.shop_name }','${shop.downNum }','${shop.douNum }','${shop.sourceNum }','${shop.maxNum }','${shop.status }' )">修改</button>
											<button class="btn btn-danger" type="button" onclick="javascript:shopDelete(${shop.id})">删除</button>
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
		<div id="dlg" class="modal hide fade"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true" onclick="return resetValue()">×</button>
				<h3 id="myModalLabel">修改店铺</h3>
			</div>
			<div class="modal-body">
				<form id="fm" action="User_save.action">
					<table>
						<tr>
							<td>
								<label class="control-label" for="name">店铺下载数：</label>
							</td>
							<td>
								<input id="name" type="text" name="shop.shop_name" placeholder="导入数据失败！">
							</td>
						</tr>
						
						<tr>
							<td>
								<label class="control-label" for="status">注销店铺：</label>(false:注销)
							</td>
							<td>
								<input id="status" type="text" name="shop.status" placeholder="导入数据失败！">
							</td>
						</tr>
						
						<tr>
							<td>
								<label class="control-label" for="downNum">店铺下载数：</label>
							</td>
							<td>
								<input id="downNum" type="text" name="shop.downNum" placeholder="导入数据失败！">
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="tag">店铺标签：</label>
							</td>
							<td>
								<input id="tag" type="text" name="shop.tag" placeholder="导入数据失败！">
							</td>
						</tr>
						
						<tr>
							<td>
								<label class="control-label" for="douNum">店铺豆数：</label>
							</td>
							<td>
								<input id="douNum" type="text" name="shop.douNum" placeholder="导入数据失败！">
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="sourceNum">店铺资源数：</label>
							</td>
							<td>
								<input id="sourceNum" type="text" readonly="readonly" name="shop.sourceNum" placeholder="导入数据失败！">
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="maxNum">店铺最大资源数：</label>
							</td>
							<td>
								<input id="maxNum" type="text" name="shop.maxNum" placeholder="导入数据失败！">								
							</td>
						</tr>					
									
					</table>
					<input id="id" type="hidden" name="shop.id">
				</form>
			</div>
			<div class="modal-footer">
				<font id="error" style="color: red;"></font>
				<button class="btn" data-dismiss="modal" aria-hidden="true"
					onclick="return resetValue()">关闭</button>
				<button class="btn btn-primary" onclick="javascript:saveShop()">保存</button>
			</div>
		</div>
	</div>
</body>
</html>