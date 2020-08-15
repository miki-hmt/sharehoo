<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>cdk兑换券管理</title>

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

<script src="${pageContext.request.contextPath}/js/My97DatePicker/WdatePicker.js"></script>

<script src="${host}/admin/new-version/js/tooltip.js"></script>
<script src="${host}/admin/js/jquery.ui.custom.js"></script>
<script src="${host}/admin/js/jquery.dataTables.min.js"></script>
<script src="${host}/admin/js/bootstrap.min.js"></script>

<!-- 2019.09.10 增加自定义弹窗  miki-->
<link rel="stylesheet" type="text/css" href="${host}/sweetalert/sweetalert.css"/>
<script src="${host}/sweetalert/sweetalert.min.js"></script>

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
		 $.post("${pageContext.request.contextPath}/shop/cdk/update?cdkId="+cdkId, $("#fm").serialize(),
			 function(result){
 			if(result.status==200){
 				tipOk("操作成功！", function() {
 					resetValue();
 					location.reload(true);
 				})				
 			}else{	    				
 				alert("发送失败！");    			            				
 			}
 		},"json");
 	}
	function cddel(cdkId){	
		swal({
				title : "确定要删除吗?",
				text : "您确定要删除这条数据？",
				type : "warning",
				showCancelButton : true,
				closeOnConfirm : false,
				confirmButtonText : "是的，删除",
				confirmButtonColor : "#ec6c62"
			}, function() {
				$.ajax({
					url : "${host}/shop/cdk/delete",
					data : {
						cdkId : cdkId,
						id: cdkId
					},
					type : "POST",
				}).done(function(data) {
					if (data.status == 200) {
						tipOk("删除成功", function() {
							resetValue();
							location.reload(true);
						});
					//swal("操作成功!", "已成功删除数据！", "success");
					} else {
						swal("OMG", "删除操作失败了!", "error");
					}
				}).error(function(data) {
					swal("OMG", "删除操作失败了!", "error");
				});
			});
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
<body style="background-color: #f5f6fa;">
	<!--保持新版本上风格的统一 上面间距15px	，左右间距15px，背景色 #f5f6fa		旧版代码都要加上这样的样式		2020.08.14 miki  -->
	<div class="row" style="height:20px;width:100%;background-color: #f5f6fa"></div>
	<div class="container-fluid" style="background-color: #ffffff;width:97%">
	
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
										
										<td style="text-align: center;vertical-align: middle;">${cdk.status eq "1" ?"已兑换":"未兑换" }</td>
										<td style="text-align: center;vertical-align: middle;">${cdk.money}</td>																						
										<td style="text-align: center;vertical-align: middle;">${cdk.douNum }</td>																								
										<td style="text-align: center;vertical-align: middle;">
											<a class="btn btn-xs btn-default submenuitem" type="button" data-backdrop="static" data-toggle="modal" data-target="#dlg"
											 onclick="return cdk(${cdk.id},'${cdk.code }','${cdk.status }','${cdk.money }','${cdk.douNum }')"><i class="ftsucai-edit-2"></i></a>
											<a class="btn btn-xs btn-default submenuitem" type="button" onclick="javascript:cddel(${cdk.id})"><i class="ftsucai-del"></i></a>
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
				<form id="fm" action="">
					<table>
						<tr>
							<td>
								<label class="control-label" for="code">兑换码：</label>
							</td>
							<td>
								<input id="code" type="text" name="code" placeholder="导入数据失败！">
							</td>
						</tr>								
											
						<tr>
							<td>
								<label class="control-label" for="status">兑换状态：</label>
							</td>
							<td>
								<input id="status" type="text" name="status" placeholder="导入数据失败！">
							</td>
						</tr>
						
						<tr>
							<td>
								<label class="control-label" for="money">金额：</label>
							</td>
							<td>
								<input id="money" type="text" name="money" placeholder="导入数据失败！">
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="douNum">豆数：</label>
							</td>
							<td>
								<input id="douNum" type="text" name="douNum" placeholder="导入数据失败！">
							</td>
						</tr>																		
					</table>
					<input id="id" type="hidden" name="id">
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