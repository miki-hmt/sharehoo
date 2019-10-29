<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<!-- 2019.09.11	miki 自定义弹窗 -->
<link rel="stylesheet" type="text/css" href="${host}/sweetalert/sweetalert.css"/>
<script src="${host}/sweetalert/sweetalert.min.js"></script>
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
	
function modifySoft(id,soname,size,language,forSystem,downAdress,publishDate,count,good,hot,keyword,logo){
	 $("#myModalLabel").html("修改软件");
	 $("#id").val(id);
	 $("#soname").val(soname);
	 $("#size").val(size);
	 $("#language").val(language);
	 $("#forSystem").val(forSystem);
	 $("#logo").attr("src","${pageContext.request.contextPath}/"+logo); 
	 $("#downAdress").val(downAdress);
	 $("#publishDate").val(publishDate);
	 $("#count").val(count);
	 $("#good").val(good);
	 $("#hot").val(hot);
	 $("#keyword").val(keyword);
	}


	/*2016.11.15  修改用户功能的实现 ，最初做的时候功能不完善，无法实现修改用户 ，原因：未添加saveUser()函数  */
	function saveSoft() {
		var userId = $("#id").val();
		if ($("#soname").val() == null || $("#soname").val() == '') {
			$("#error").html("名称不能为空！");
			return false;
		}
		if ($("#size").val() == null || $("#size").val() == '') {
			$("#error").html("大小！");
			return false;
		}

		if ($("#language").val() == null || $("#language").val() == '') {
			$("#error").html("语言不能为空！");
			return false;
		}
		if ($("#forSystem").val() == null || $("#forSystem").val() == '') {
			$("#error").html("支持系统不能为空！");
			return false;
		}
		if ($("#downAdress").val() == null || $("#downAdress").val() == '') {
			$("#error").html("下载地址不能为空！");
			return false;
		}
		if ($("#publishDate").val() == null || $("#publishDate").val() == '') {
			$("#error").html("发布日期不能为空！");
			return false;
		}
		if ($("#count").val() == null || $("#count").val() == '') {
			$("#error").html("下载数不能为空！");
			return false;
		}

		var formData = new FormData($("#fm")[0]);
		$.ajax({
			type : "POST",
			url : "${host}/admin/soft/update",
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
	
	function userDelete(userId){
		swal({
			title: "您确定要删除这家伙吗？", 
			text: "删除之后，将不能进行下载..", 
			type: "warning",
			showCancelButton: true,
			closeOnConfirm: false,
			confirmButtonText: "是的，强行删除！",
			confirmButtonColor: "#ec6c62"
			}, function() {
				$.ajax({
					url: "${host}/admin/soft/delete/"+userId,
					data: {userId:userId},
					type: "POST",
				}).done(function(data) {
					if(data.status==200){
						tipOk("删除成功", function() {
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
		
		/* if(confirm("用户所发的帖子也将被删除，确定要删除这条数据吗?")){
			$.post("User_delete.action",{userId:userId},
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
											<button class="btn btn-info" type="button" data-backdrop="static" data-toggle="modal" data-target="#dlg" 
												onclick="return modifySoft(${soft.id},'${soft.soname }','${soft.size }',
													'${soft.language }','${soft.forSystem }','${soft.downAdress }','${soft.publishDate }','${soft.count }',
													'${soft.good}','${soft.hot}','${soft.keyword}','${soft.logo}')">
													修改
											</button>
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
		
		<!-- 2019.09.12 miki 修改弹出框 id,soname,size,language,forSystem,downAdress,publishDate,count,good,hot,keyword,logo-->
		<div id="dlg" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true" onclick="return resetValue()">×</button>
				<h3 id="myModalLabel">增加软件</h3>
			</div>
			<div class="modal-body">
				<form id="fm" action="">
					<table>
						<tr>
							<td>
								<label class="control-label" for="zoneName">请输入软件名称：</label>
							</td>
							<td>
								 <input id="soname" type="text" name="soname" placeholder="请输入…">
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="face">logo：</label>								
							</td>
							
							<td>
								<img id="logo" style="width: 50px;border-radius:50%;"></img>
							</td>		
					
						</tr>
						<tr>
							<td>
								<label class="control-label" for="zoneName">请输入软件大小：</label>
							</td>
							<td>
								 <input id="size" type="text" name="size" placeholder="请输入…">
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="zoneName">请输入软件语言：</label>
							</td>
							<td>
								 <input id="language" type="text" name="language" placeholder="请输入…">
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="zoneName">请输入软件支持系统：</label>
							</td>
							<td>
								 <input id="forSystem" type="text" name="forSystem" placeholder="请输入…">
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="zoneName">请输入下载地址：</label>
							</td>
							<td>
								 <input id="downAdress" type="text" name="downAdress" placeholder="请输入…">
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="zoneName">请输入发布日期：</label>
							</td>
							<td>
								<!-- 2019.09.12 miki 设置disabled为true，将不提交该属性 -->
								 <input id="publishDate" type="text" disabled="true" name="publishDate" placeholder="请输入…">
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="zoneName">请输入下载数：</label>
							</td>
							<td>
								 <input id="count" type="text" name="count" placeholder="请输入…">
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="zoneName">是否设为推荐：(1：是  0：否)</label>
							</td>
							<td>
								 <input id="good" type="text" name="good" placeholder="请输入…">
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="zoneName">是否设为热门：(1：是  0：否)</label>
							</td>
							<td>
								 <input id="hot" type="text" name="hot" placeholder="请输入…">
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="zoneName">请输入关键字：</label>
							</td>
							<td>
								 <input id="keyword" type="text" name="keyword" placeholder="请输入…">
							</td>
						</tr>
					</table>
					<!-- 2019.09.12 miki 此处因为保存和修改都使用一个form，所以给id一个默认值，修改时对其重新初始化，添加时后台会自动生成新的id -->
					<input id="id" type="hidden" name="id" value="0">
				</form>
			</div>
			<div class="modal-footer">
				<font id="error" style="color: red;"></font>
				<button class="btn" data-dismiss="modal" aria-hidden="true"
					onclick="return resetValue()">关闭</button>
				<button class="btn btn-primary" onclick="javascript:saveSoft()">保存</button>
			</div>
		</div>
				
	</div>
</body>
</html>