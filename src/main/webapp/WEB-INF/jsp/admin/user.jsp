<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

<!-- 2020.08.13 miki 新版bootstrap样式文件在旧的代码中不兼容，暂时不用 -->
<!-- <link href="${host}/admin/new-version/css/bootstrap.min.css" rel="stylesheet"> -->
<link rel="stylesheet" href="${host}/admin/css/bootstrap.min.css" />
<link href="${host}/admin/new-version/css/theme.css" rel="stylesheet">
<link href="${host}/admin/new-version/css/fonts.css" rel="stylesheet">

<!--使用jquery的select2.js+select2.css插件实现下拉搜索框	2020.06.14-->
<link rel="stylesheet" href="${host}/admin/css/select2.css" />
<link rel="stylesheet" href="${host}/admin/css/unicorn.main.css" />
<link rel="stylesheet" href="${host}/admin/css/uniform.css" />


<script src="${host}/js/jquery-1.7.2.min.js"></script>
<script src="${host}/admin/js/jquery.ui.custom.js"></script>

<!-- 引用该插件需要jQuery1.9以下的版本。
	 $.browser方法已从jQuery 1.9中删除。jQuery.browser() removed
	 jQuery.browser()方法自jQuery 1.3以来已被取消，并在1.9中被删除。 -->
<script src="${host}/admin/js/jquery.uniform.js"></script>
<script src="${host}/admin/js/select2.min.js"></script>

<script src="${host}/admin/js/jquery.dataTables.min.js"></script>
<script src="${host}/admin/js/bootstrap.min.js"></script>
<script src="${host}/admin/js/unicorn.js"></script>
<script src="${host}/admin/js/unicorn.tables.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploadPreview.min.js"></script>
<script src="${pageContext.request.contextPath}/js/My97DatePicker/WdatePicker.js"></script>

<!-- 2019.09.11	miki 自定义弹窗 -->
<link rel="stylesheet" type="text/css" href="${host}/sweetalert/sweetalert.css"/>
<script src="${host}/sweetalert/sweetalert.min.js"></script>
<style type="text/css">
</style>
<script type="text/javascript">
 function modifyUser(id,nickName,trueName,password,sex,face,email,mobile,regTime,levelId,score,status,nickNameId){
	 $("#myModalLabel").html("修改用户");
	 $("#id").val(id);
	 $("#nickName").val(nickName);
	 $("#trueName").val(trueName);
	 $("#password").val(password);
	 $("#sex").val(sex);
	 $("#face").attr("src","${pageContext.request.contextPath}/"+face); 
	 $("#email").val(email);
	 $("#mobile").val(mobile);
	 $("#regTime").val(regTime);
	 $("#levelId").val(levelId);
	 $("#score").val(score);
	 $("#status").val(status);
	 $("#nickNameId").val(nickNameId);
	}


	/*2016.11.15  修改用户功能的实现 ，最初做的时候功能不完善，无法实现修改用户 ，原因：未添加saveUser()函数  */
	function saveUser() {
		var userId = $("#id").val();
		if ($("#nickName").val() == null || $("#nickName").val() == '') {
			$("#error").html("昵称不能为空！");
			return false;
		}
		if ($("#sex").val() == null || $("#sex").val() == '') {
			$("#error").html("请选择性别！");
			return false;
		}

		if ($("#password").val() == null || $("#password").val() == '') {
			$("#error").html("密码不能为空！");
			return false;
		}
		if ($("#mobile").val() == null || $("#mobile").val() == '') {
			$("#error").html("联系电话不能为空！");
			return false;
		}
		if ($("#email").val() == null || $("#email").val() == '') {
			$("#error").html("邮箱不能为空！");
			return false;
		}
		if ($("#levelId").val() == null || $("#levelId").val() == '') {
			$("#error").html("用户等级不能为空！");
			return false;
		}
		if ($("#score").val() == null || $("#score").val() == '') {
			$("#error").html("积分不能为空！");
			return false;
		}

		var formData = new FormData($("#fm")[0]);
		$.ajax({
			type : "POST",
			url : "${host}/admin/user/add/"+userId,
			data : formData,
			cache : false,
			async : false,
			processData : false, //必须false才会避开jQuery对 formdata 的默认处理
			contentType : false, //必须false才会自动加上正确的Content-Type
			success : function(data) {
				if (data.status == 200) {
					tipOk("保存成功", function() {
						resetValue();
						location.reload(true);
					});
				} else {
					tipError("保存失败!!" + data.msg);
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

	function userDelete(userId){	
		swal({
			title: "您确定要拉黑这家伙吗？", 
			text: "拉黑之后，将不能行驶登录权限..", 
			type: "warning",
			showCancelButton: true,
			closeOnConfirm: false,
			confirmButtonText: "是的，强行拉黑！",
			confirmButtonColor: "#ec6c62"
			}, function() {
				$.ajax({
					url: "${host}/admin/user/limit/"+userId,
					data: {userId:userId},
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
	}
	
	function deleteUsers() {
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
			<!-- <button class="btn btn-primary" type="button" data-backdrop="static" data-toggle="modal" data-target="#dlg" onclick="return openAddDlg()">添加小板块</button>&nbsp;&nbsp;&nbsp;&nbsp; -->
			<a href="#" role="button" class="btn btn-danger" onclick="javascrip:deleteUsers()">批量删除</a>
			<form action="" method="post" class="form-search">
				<table cellpadding="5px;">
					<tr>
						<td>用户名:</td>
						<td><input name="nickName" value="${s_user.nickName }" type="text" class="input-medium search-query" placeholder="输入用户名..." style="width: 165px;"/></td>
						<td>邮箱:</td>
						<td><input name="email" value="${s_user.eamil }" type="text" class="input-medium search-query" placeholder="输入邮箱..." style="width: 165px;"/></td>
						<td>手机号:</td>
						<td><input name="phone" value="${s_user.phone }" type="text" class="input-medium search-query" placeholder="输入手机号..." style="width: 165px;"/></td>

					</tr>
					<tr>
						<td>性别:</td>
						<td>
							<select id="section" name="sex" style="width: 165px;"><option value="0">请选择性别...</option>
								<option value="1">男</option>
								<option value="0">女</option>
							</select>
						</td>
						<td></td>
						<td>
							<button type="submit" class="btn btn-primary" title="Search">查询&nbsp;<i class="icon  icon-search"></i></button>
						</td>
					</tr>
				</table>
			</form>
			
			
		</div>
		<div class="row-fluid">
			<div class="span12">
				<div class="widget-box">
					<div class="widget-title">
						<!-- <span class="icon"> <input type="checkbox"
							id="title-checkbox" name="title-checkbox" />
						</span> -->
						<h5>用户列表</h5>
					</div>
					<div class="widget-content nopadding">
						<table class="table table-bordered table-striped with-check">
							<thead>
								<tr>
									<th><i class=""></i></th>
									<th>编号</th>
									<th>昵称</th>
									<th>真实姓名</th>									
									<th>性别</th>
									<th>头像</th>
									<th>注册时间</th>
									<th>邮箱</th>
									<th>联系电话</th>
									<th>用户等级</th>
									<th>用户积分</th>
									<th>用户类型</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${userList }" var="user">
									<tr>
										<td><input type="checkbox" /></td>
										<td style="text-align: center;vertical-align: middle;">${user.id }</td>
										<td style="text-align: center;vertical-align: middle;">${user.nickName }</td>
										<td style="text-align: center;vertical-align: middle;">${user.trueName }</td>							
										<td style="text-align: center;vertical-align: middle;">${user.sex }</td>
										<td style="text-align: center;vertical-align: middle;">
											<c:choose>
													<c:when test="${(user.face==null||user.face=='')&&user.sex=='男'}">
														<img alt="" src="${pageContext.request.contextPath}/images/user/user0.gif" style="width: 100px;height: 100px;border-radius:50%;">
													</c:when>
													<c:when test="${(user.face==null||user.face=='')&&user.sex=='女'}">
														<img alt="" src="${pageContext.request.contextPath}/images/user/female.gif" style="width: 100px;height: 100px;border-radius:50%;">
													</c:when>
													<c:otherwise>
														<img alt="" src="${pageContext.request.contextPath}/${user.face}" style="width: 100px;height: 100px;border-radius:50%;">
													</c:otherwise>
											</c:choose>
										</td>
										<td style="text-align: center;vertical-align: middle;"><fmt:formatDate value="${user.regTime }" pattern="yyyy-MM-dd "/></td>
										<td style="text-align: center;vertical-align: middle;">${user.email }</td>
										<td style="text-align: center;vertical-align: middle;">${user.mobile }</td>
										<td style="text-alignLcenter; vertical-align:middle;">${user.levelId }</td>
										<td style="text-alignLcenter; vertical-align:middle;">${user.score }</td>
										<td style="text-align: center;vertical-align: middle;width: 150px;">
											<c:choose>
					                  	  		<c:when test="${user.sectionList.size()==0&&user.type!=2 }">
					                  	  			<font style="color: black;">普通用户</font>	
					                  	  		</c:when>
					                  	  		<c:when test="${user.sectionList.size()!=0&&user.type!=2 }">
					                  	  			<font style="color: blue;">版主</font>
					                  	  			【<c:forEach items="${user.sectionList }" var="section">
					                  	  				${section.name }；
					                  	  			</c:forEach>】
					                  	  		</c:when>
					                  	  		<c:otherwise>
					                  	  			<font style="color: red;">管理员</font>
					                  	  		</c:otherwise>
					                  	  	</c:choose>
										</td>
										<td style="text-align: center;vertical-align: middle;">
											<a class="btn btn-xs btn-default submenuitem" data-backdrop="static" data-toggle="modal" data-target="#dlg" 
											onclick="return modifyUser(${user.id},'${user.nickName }','${user.trueName }','${user.password }','${user.sex }',
												'${user.face }','${user.email }','${user.mobile }','${user.regTime }','${user.levelId }','${user.score }',
												'${user.status }','${user.nickNameId}' )"><i class="ftsucai-edit-2"></i></a>
											<a class="btn btn-xs btn-default submenuitem" onclick="javascript:userDelete(${user.id})"><i class="ftsucai-del"></i></a>
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
				<h3 id="myModalLabel">修改用户</h3>
			</div>
			<div class="modal-body">
				<form id="fm" action="User_save.action">
					<table>
					
						<tr>
							<td>
								<label class="control-label" for="status">注销用户：</label>(false:注销)
							</td>
							<td>
								<input id="status" type="text" name="status" placeholder="导入数据失败！">
							</td>
						</tr>
						
						<tr>
							<td>
								<label class="control-label" for="userName">用户昵称：</label>
							</td>
							<td>
								<input id="nickName" type="text" name="nickName" placeholder="导入数据失败！">
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="userName">用户昵称ID：</label>
							</td>
							<td>
								<input id="nickNameId" type="text" name="nickNameId" placeholder="导入数据失败！">
							</td>
						</tr>
						
						
						<tr>
							<td>
								<label class="control-label" for="trueName">真实姓名：</label>
							</td>
							<td>
								<input id="trueName" type="text" readonly="readonly" name="trueName" placeholder="导入数据失败！">
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="password">登录密码：</label>
							</td>
							<td>
								<input id="password" type="text" readonly="readonly" name="password" placeholder="导入数据失败！">
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="sex">性别：</label>
							</td>
							<td>
								<input id="sex" type="text" readonly="readonly" name="sex" placeholder="导入数据失败！">								
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="face">头像：</label>								
							</td>
							
							<td>
								<img id="face" style="width: 50px;border-radius:50%;"></img>
							</td>		
					
						</tr>
						<tr>
							<td>
								<label class="control-label" for="email">邮箱：</label>
							</td>
							<td>
								<input id="email" type="text" name="email" placeholder="导入数据失败！">
							</td>
						</tr>
	
						<tr>
							<td>
								<label class="control-label" for="mobile">联系电话：</label>
							</td>
							<td>
								<input id="mobile" type="text" name="mobile" placeholder="导入数据失败！">
							</td>																	
						</tr>
						
						<tr>
							<td>
								<label class="control-label" for="regTime">注册时间：</label>
							</td>
							<td>
								<!-- 2019.09.12 miki 设置disabled为true，将不提交该属性 -->
								<input id="regTime" type="text" name="regTime" disabled="true" placeholder="导入数据失败！">
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="levelId">用户等级：</label>
							</td>
							<td>
								<input id="levelId" type="text" name="levelId" placeholder="导入数据失败！">
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="score">用户积分：</label>
							</td>
							<td>
								<input id="score" type="text" name="score" placeholder="导入数据失败！">
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
				<button class="btn btn-primary" onclick="javascript:saveUser()">保存</button>
			</div>
		</div>
	</div>
</body>
</html>