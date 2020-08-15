<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>站内私信</title>

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

<!-- 2019.09.10 增加自定义弹窗  miki-->
<link rel="stylesheet" type="text/css" href="${host}/sweetalert/sweetalert.css"/>
<script src="${host}/sweetalert/sweetalert.min.js"></script>
<style type="text/css">
</style>
<script type="text/javascript">	
 function sendMessage(id,content,sourceId,shopName,sourceName){
	 $("#myModalLabel").html("处理商家");
	 $("#id").val(id);
	 $("#sourceId").val(sourceId);
	 $("#sourceName").val(sourceName);
	 $("#shopName").val(shopName);
	 $("#description").val("您的店铺由于以下原因被举报:【"+content+"】经审核确实属实，暂如下处理：下架店铺该资源，并收回您之前该资源所有收入的豆并还将80%收入转给真正版权拥有者，如有不合理之处，请联系管理员。");
	}


	/*2016.11.15  修改店铺功能的实现 ，最初做的时候功能不完善，无法实现修改用户 ，原因：未添加saveUser()函数  */
	function send() {
		var sourceId = $("#sourceId").val();
		var messageId = $("#id").val();

		var formData = new FormData($("#fm")[0]);
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/admin/message/save?sourceId=" + sourceId + "&id=" + messageId,
			data : formData,
			cache : false,
			async : false,
			processData : false, //必须false才会避开jQuery对 formdata 的默认处理
			contentType : false, //必须false才会自动加上正确的Content-Type
			success : function(data) {
				if (data.status == 200) {
					tipOk("回复成功", function() {
						resetValue();
						location.reload(true);
					});
				} else {
					tipError("回复失败!!" + data.msg);
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

	//2019.09.10	消息处理功能就是后台删除店铺违法的资源
	function messageUpdate(sourceId) {
		swal({
			title : "违法资源关联的所有信息都要删除，确定要删除吗?",
			text : "您正在处理当前的违法投诉资源，确定要认定该资源为违法资源吗？",
			type : "warning",
			showCancelButton : true,
			closeOnConfirm : false,
			confirmButtonText : "是的，删除",
			confirmButtonColor : "#ec6c62"
		}, function() {
			$.ajax({
				url : "${host}/admin/shop/sourceDelete",
				data : {
					sourceId : sourceId
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


	function deleteBatch() {
		var selectedSpan = $(".checked").parent().parent().next("td");
		if (selectedSpan.length == 0) {
			alert("请选择要删除的数据！");
			return;
		}
		var strIds = [];
		for (var i = 0; i < selectedSpan.length; i++) {
			strIds.push(selectedSpan[i].innerHTML);
		}
		var ids = strIds.join(",");
		if (confirm("用户所发的帖子也将被删除，您确定要删除这" + selectedSpan.length + "条数据吗？")) {
			$.post("User_deleteUsers.action", {
				ids : ids
			}, function(result) {
				var result = eval(result);
				if (result.info) {
					alert(result.info);
					location.reload(true);
				}
			});
		} else {
			return;
		}
	}
	
	
	function resetValue() {
		$("#id").val("");
		$("#userName").val("");
	}
</script>
</head>
<body style="background-color: #f5f6fa;">
	<!--保持新版本上风格的统一 上面间距15px	，左右间距15px，背景色 #f5f6fa		旧版代码都要加上这样的样式		2020.08.14 miki  -->
	<div class="row" style="height:20px;width:100%;background-color: #f5f6fa"></div>
	<div class="container-fluid" style="background-color: #ffffff;width:97%">
	
		<div id="tooBar" style="padding: 10px 0px 0px 10px;">			
			<form action="Topic_listAdmin.action" method="post" class="form-search">
			<table cellpadding="5px;">
				<tr>
					<td>资源标题:</td>
					<td><input name="title" value="${s_topic.title }" type="text" class="input-medium search-query" placeholder="输入资源名字..." style="width: 165px;"/></td>
					<td>所属店铺:</td>
					<td><input name="s_topic.user.nickName" value="${s_topic.user.nickName }" type="text" class="input-medium search-query" placeholder="输入店铺id..." style="width: 165px;"/></td>
					<td>所属类型:</td>
					<td>
						<select id="type" name="type" style="width: 165px;"><option value="0">请选择类型...</option>
							<option value="1">已处理</option>
							<option value="0">未处理</option>
						</select>
					</td>
					<td></td><td></td><td></td><td></td><td></td><td></td><td></td>
					<td>
						<button style="margin-top:9px;" type="submit" class="btn btn-primary" title="Search">查询&nbsp;<i class="icon  icon-search"></i></button>
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
						<h5>店铺列表</h5>
					</div>
					<div class="widget-content nopadding">
						<table class="table table-bordered table-striped with-check">
							<thead>
								<tr>
									<th><i class=""></i></th>
									<th>编号</th>
									<th>时间</th>									
									<th>举报店铺</th>
									<th>举报人</th>
									<th>举报类型</th>
									<th>举报内容</th>
									<th>违法资源</th>																										
									<th>处理状态</th>								
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${mesList }" var="message">
									<tr>
										<td><input type="checkbox" /></td>
										<td style="text-align: center;vertical-align: middle;">${message.id }</td>
										<td style="text-align: center;vertical-align: middle;"><fmt:formatDate value="${message.time }" pattern="yyyy-MM-dd hh:mm:ss"/></td>
										
										<td style="text-align: center;vertical-align: middle;">${message.shop.shop_name }</td>
										<td style="text-align: center;vertical-align: middle;">${message.user.nickName}</td>																						
										<td style="text-align: center;vertical-align: middle;">${message.name }</td>
										<td style="text-align: center;vertical-align: middle;">${message.content }</td>
										<td style="text-align: center;vertical-align: middle;">
											<a href="${host}/shop/source/${message.source.id}" style="color: green;text-decoration: revert;" target="_blank">${message.source.name}</a>
										</td>
										<td style="text-align: center;vertical-align: middle;">${message.status}</td>														
										<td style="text-align: center;vertical-align: middle;">
											<a class="btn btn-xs btn-default submenuitem" type="button" data-backdrop="static" data-toggle="modal" data-target="#dlg"
											 	onclick="return sendMessage(${message.id},'${message.name}','${message.source.id }','${message.shop.shop_name }','${message.source.name }')">
											<i class="ftsucai-edit-2"></i></a>
											<a class="btn btn-xs btn-default submenuitem" type="button" onclick="javascript:messageUpdate(${source.id})"><i class="ftsucai-del"></i></a>
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
				<h3 id="myModalLabel">处理商家</h3>
			</div>
			<div class="modal-body">
				<form id="fm" action="User_save.action">
					<table>
						<tr>
							<td>
								<label class="control-label" for="shopName">处理商家名称：</label>
							</td>
							<td>
								<input id="shopName" type="text" name="shop.shop_name" placeholder="导入数据失败！">
							</td>
						</tr>								
											
						<tr>
							<td>
								<label class="control-label" for="sourceName">投诉资源名：</label>
							</td>
							<td>
								<input id="sourceName" type="text" name="source.name" placeholder="导入数据失败！">
							</td>
						</tr>
						
						<tr>
							<td>
								<label class="control-label" for="description">处理内容：</label>
							</td>
							<td>
								<textarea rows="5" cols="50" style="width: 405px;" id="description" name="content"></textarea>
							</td>
						</tr>
																
									
					</table>
					<input id="id" type="hidden" name="id" value="0">
					<input id="sourceId" type="hidden" name="source.id">
				</form>
			</div>
			<div class="modal-footer">
				<font id="error" style="color: red;"></font>
				<button class="btn" data-dismiss="modal" aria-hidden="true"
					onclick="return resetValue()">关闭</button>
				<button class="btn btn-primary" onclick="javascript:send()">保存</button>
			</div>
		</div>
	</div>
</body>
</html>