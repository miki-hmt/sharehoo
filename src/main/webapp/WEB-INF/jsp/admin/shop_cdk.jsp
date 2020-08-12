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
 function cdk(id,code,status,money,douNum){
	 $("#myModalLabel").html("修改兑换码");
	 $("#id").val(id);
	 $("#code").val(code);
	 $("#status").val(status);
	 $("#money").val(money);
	 $("#douNum").val(douNum);
 }
 
 
 /*2016.11.15  修改店铺功能的实现 ，最初做的时候功能不完善，无法实现修改用户 ，原因：未添加saveUser()函数  */
 function savecdk(){
	 var cdkId= $("#id").val();
		 $.post("${pageContext.request.contextPath}/shop/Cdk_save.action?cdkId="+cdkId, $("#fm").serialize(),
			 function(result){
 			if(result.success){
 				alert("发送成功！");
 				resetValue();
 				location.reload(true);
 			}else{	    				
 				alert("发送失败！");    			            				
 			}
 		},"json");
 }
function cddel(cdkId){
	if(confirm("确定要删除吗?")){
		$.post("${pageContext.request.contextPath}/shop/Cdk_delete.action",{cdkId:cdkId},
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

function addmore(){
	 var total= $("#total").val();
	 var num=$("#num").val();
	 if(num==""){
		 $("#error1").html("豆数不能为空！");
		 $("#num").focus();
	 }else{
		 $("#error1").html("");
	 }
	 if(total==""){
		 $("#error2").html("总数不能为空！");
		 $("#total").focus();
	 }else{
		 $("#error2").html("");
	 }
		 $.post("${pageContext.request.contextPath}/shop/Cdk_addCdk.action?total="+total+"&num="+num,
			 function(result){
			if(result.success){
				alert("批量添加成功！");
				resetValue();
				location.reload(true);
			}else{	    				
				alert("发送失败！");    			            				
			}
		},"json");
}

</script>
</head>
<body>
	<div class="container-fluid">
	
		<div id="tooBar" style="padding: 10px 0px 0px 10px;">
			
			<form action="" class="form-search" id="form2">
			<table cellpadding="5px;">
				<tr>
					<td>生成豆数:</td>
					<td><input name="cdk.douNum" id="num" type="text" class="input-medium search-query" placeholder="输入豆数..." style="width: 165px;"/><font id="error1" class="pull-right" color="red"></font></td>
					<td>生成数目:</td>
					<td><input name="total" id="total" type="text" class="input-medium search-query" placeholder="生成总数..." style="width: 165px;"/><font id="error2" class="pull-right" color="red"></font></td>
					<td></td>
					<td>
						<a  class="btn btn-primary" title="Search" onclick="javascript:addmore(total)">批量生成&nbsp;<i class="icon  icon-search"></i></a>
					</td>
				</tr>
			</table>
			</form>
			<a href="#" role="button" class="btn btn-danger" onclick="javascrip:deleteUsers()" style="font-size:9pt;">批量删除</a>
			<a href="#" role="button" class="btn btn-danger" onclick="javascrip:deleteUsers()" style="font-size:9pt;">只看未处理</a>
			<a href="#" role="button" class="btn btn-danger" onclick="javascrip:deleteUsers()" style="font-size:9pt;">只看已处理</a>
		</div>
	
		<div class="row-fluid">
			<div class="span12">
				<div class="widget-box">
					<div class="widget-title">
						<!-- <span class="icon"> <input type="checkbox"
							id="title-checkbox" name="title-checkbox" />
						</span> -->
						<h5>兑换码列表</h5>
					</div>
					<div class="widget-content nopadding">
						<table class="table table-bordered table-striped with-check">
							<thead>
								<tr>
									<th><i class=""></i></th>
									<th>编号</th>
									<th>code</th>									
									<th>状态</th>
									<th>金额</th>
									<th>豆数</th>								
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${cdkList }" var="cdk">
									<tr>
										<td><input type="checkbox" /></td>
										<td style="text-align: center;vertical-align: middle;">${cdk.id }</td>
										<td style="text-align: center;vertical-align: middle;">${cdk.code }</td>
										
										<td style="text-align: center;vertical-align: middle;">${cdk.status }</td>
										<td style="text-align: center;vertical-align: middle;">${cdk.money}</td>																						
										<td style="text-align: center;vertical-align: middle;">${cdk.douNum }</td>																								
										<td style="text-align: center;vertical-align: middle;">
											<button class="btn btn-info" type="button" data-backdrop="static" data-toggle="modal" data-target="#dlg"
											 onclick="return cdk(${cdk.id},'${cdk.code }','${cdk.status }','${cdk.money }','${cdk.douNum }')">修改</button>
											<button class="btn btn-danger" type="button" onclick="javascript:cddel(${cdk.id})">删除</button>
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
				<h3 id="myModalLabel">修改兑换码</h3>
			</div>
			<div class="modal-body">
				<form id="fm" action="User_save.action">
					<table>
						<tr>
							<td>
								<label class="control-label" for="code">兑换码：</label>
							</td>
							<td>
								<input id="code" type="text" name="cdk.code" placeholder="导入数据失败！">
							</td>
						</tr>								
											
						<tr>
							<td>
								<label class="control-label" for="status">兑换状态：</label>
							</td>
							<td>
								<input id="status" type="text" name="cdk.status" placeholder="导入数据失败！">
							</td>
						</tr>
						
						<tr>
							<td>
								<label class="control-label" for="money">金额：</label>
							</td>
							<td>
								<input id="money" type="text" name="cdk.money" placeholder="导入数据失败！">
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="douNum">豆数：</label>
							</td>
							<td>
								<input id="douNum" type="text" name="cdk.douNum" placeholder="导入数据失败！">
							</td>
						</tr>										
									
					</table>
					<input id="id" type="hidden" name="cdk.id">
				</form>
			</div>
			<div class="modal-footer">
				<font id="error" style="color: red;"></font>
				<button class="btn" data-dismiss="modal" aria-hidden="true"
					onclick="return resetValue()">关闭</button>
				<button class="btn btn-primary" onclick="javascript:savecdk()">保存</button>
			</div>
		</div>
	</div>
</body>
</html>