<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>店铺管理</title>

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
		
		var formData = new FormData($("#fm")[0]);
		$.ajax({
			type : "POST",
			url : "${host}/admin/shop/update?shopId="+shopId,
			data : formData,
			cache : false,
			async : false,
			processData : false, //必须false才会避开jQuery对 formdata 的默认处理
			contentType : false, //必须false才会自动加上正确的Content-Type
			success : function(data) {
				if (data.status == 200) {
					tipOk("修改成功", function() {
						resetValue();
						location.reload(true);
					});
				} else {
					tipError("修改失败!!" + data.msg);
				}
			}
		});
		return false; //阻止ajax结束自动刷新页面
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
 
	function shopDelete(shopId){
		swal({
			title: "您确定要关闭这家店铺吗？", 
			text: "关闭之后，将不能行驶登录权限..", 
			type: "warning",
			showCancelButton: true,
			closeOnConfirm: false,
			confirmButtonText: "是的，强行关闭！",
			confirmButtonColor: "#ec6c62"
			}, function() {
				$.ajax({
					url: "${host}/admin/shop/delete",
					data: {shopId:shopId},
					type: "POST",
				}).done(function(data) {
					if(data.status==200){
						tipOk("拉黑成功", function() {
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
				
		/* if(confirm("店铺关联的所有信息都要删除，确定要删除吗?")){
			$.post("${pageContext.request.contextPath}/shop/manage/ShopManage_delete.action",{shopId:shopId},
					function(result){
						var result=eval(result);
						if(result.info){
							alert(result.info);
							window.location.reload(true);
						}
					}
				);
		} */
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
<body style="background-color: #f5f6fa;height:1080px">
	<!--保持新版本上风格的统一 上面间距15px	，左右间距15px，背景色 #f5f6fa		旧版代码都要加上这样的样式		2020.08.14 miki  -->
	<div class="row" style="height:20px;width:100%;background-color: #f5f6fa"></div>
	<div class="container-fluid" style="background-color: #ffffff;width:97%">
	
		<div id="tooBar" style="padding: 10px 0px 0px 10px;">
			<form action="${host}/admin/shop/search" method="post" class="form-search">
			<!--cellpadding负责调节搜素框之间的高度	2020.06.14-->
			<table cellpadding="15px;">
				<tr>
					<td>店铺名称:</td>
					<!--使用jquery的select2.js+select2.css插件实现下拉搜索框	2020.06.14-->
					<td><input name="shop_name" type="text" value="${s_shop.shop_name }" class="input-medium search-query" placeholder="输入店铺名字..." style="width: 165px;"/></td>
					<td>店铺主人:</td>
					<td><input name="user.nickName" type="text" value="${s_shop.user.nickName }" class="input-medium search-query" placeholder="输入主人昵称..." style="width: 165px;"/></td>
					<td>店铺标签:</td>
					<td><input name="tag" type="text" value="${s_shop.tag }" class="input-medium search-query" placeholder="输入店铺标签..." style="width: 165px;"/></td>
					<td></td>
					<td>
						<button type="submit" class="btn btn-primary" title="Search">查询&nbsp;<i class="icon  icon-search"></i></button>
					</td>
				</tr>					
			</table>
			</form>
			<a href="#" role="button" class="btn btn-danger" onclick="javascrip:deleteUsers()">批量删除</a>	&nbsp;&nbsp;&nbsp;&nbsp;
			
			<a href="#" role="button" class="btn btn-danger" onclick="javascrip:deleteUsers()">按下载量排序</a>
			<a href="#" role="button" class="btn btn-danger" onclick="javascrip:deleteUsers()">按日期排序</a>
			<a href="#" role="button" class="btn btn-danger" onclick="javascrip:deleteUsers()">按精品排序</a>									
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
														<img alt="" src="${pageContext.request.contextPath}/images/user/user0.gif" style="width: 80px;height: 80px;border-radius:50%;">
													</c:when>
													<c:when test="${(shop.user.face==null||shop.user.face=='')&&shop.user.sex=='女'}">
														<img alt="" src="${pageContext.request.contextPath}/images/user/female.gif" style="width: 80px;height: 80px;border-radius:50%;">
													</c:when>
													<c:otherwise>
														<img alt="" src="${pageContext.request.contextPath}/shop/${shop.face}" style="width: 80px;height: 80px;border-radius:50%;">
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
											<a class="btn btn-xs btn-default submenuitem" type="button" data-backdrop="static" data-toggle="modal" data-target="#dlg"
											 	onclick="return modifyShop(${shop.id},'${shop.tag }','${shop.shop_name }','${shop.downNum }','${shop.douNum }','${shop.sourceNum }','${shop.maxNum }','${shop.status }' )">
											<i class="ftsucai-edit-2"></i>
											 </a>
											<a class="btn btn-xs btn-default submenuitem" type="button" onclick="javascript:shopDelete(${shop.id})"><i class="ftsucai-del"></i></a>
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
				<form id="fm" action="">
					<table>
						<tr>
							<td>
								<label class="control-label" for="name">店铺下载数：</label>
							</td>
							<td>
								<input id="name" type="text" name="shop_name" placeholder="导入数据失败！">
							</td>
						</tr>
						
						<tr>
							<td>
								<label class="control-label" for="status">注销店铺：</label>(false:注销)
							</td>
							<td>
								<input id="status" type="text" name="status" placeholder="导入数据失败！">
							</td>
						</tr>
						
						<tr>
							<td>
								<label class="control-label" for="downNum">店铺下载数：</label>
							</td>
							<td>
								<input id="downNum" type="text" name="downNum" placeholder="导入数据失败！">
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="tag">店铺标签：</label>
							</td>
							<td>
								<input id="tag" type="text" name="tag" placeholder="导入数据失败！">
							</td>
						</tr>
						
						<tr>
							<td>
								<label class="control-label" for="douNum">店铺豆数：</label>
							</td>
							<td>
								<input id="douNum" type="text" name="douNum" placeholder="导入数据失败！">
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="sourceNum">店铺资源数：</label>
							</td>
							<td>
								<input id="sourceNum" type="text" readonly="readonly" name="sourceNum" placeholder="导入数据失败！">
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="maxNum">店铺最大资源数：</label>
							</td>
							<td>
								<input id="maxNum" type="text" name="maxNum" placeholder="导入数据失败！">								
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
				<button class="btn btn-primary" onclick="javascript:saveShop()">保存</button>
			</div>
		</div>
	</div>
</body>
</html>