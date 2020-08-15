<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>店铺资源管理</title>

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
		 $.post("${pageContext.request.contextPath}/admin/shop/sourceSave?sourceId="+sourceId, $("#fm").serialize(),
			 function(result){
 			if(result.status == 200){
 				alert("修改成功！");
 				resetValue();
 				location.reload(true);
 			}else{	    				
 				alert("修改失败！");    			            				
 			}
 		},"json");
 }
 
 //2020.08.15	处理功能就是后台删除店铺违法的资源
	function sourceDelete(sourceId) {
		swal({
			title : "该资源关联的所有信息都要删除，确定要删除吗?",
			text : "您确定要删除这条数据？",
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
<body style="background-color: #f5f6fa;height:1300px">
	<!--保持新版本上风格的统一 上面间距15px	，左右间距15px，背景色 #f5f6fa		旧版代码都要加上这样的样式		2020.08.14 miki  -->
	<div class="row" style="height:20px;width:100%;background-color: #f5f6fa"></div>
	<div class="container-fluid" style="background-color: #ffffff;width:97%">
	
		<div id="tooBar" style="padding: 10px 0px 0px 10px;">
			
			<form action="Topic_listAdmin.action" method="post" class="form-search">
			<!--cellpadding负责调节搜素框之间的高度	2020.06.14-->
			<table cellpadding="15px;">
				<tr>
					<!--使用jquery的select2.js+select2.css插件实现下拉搜索框	2020.06.14-->
					<td>资源标题:</td>
					<td><input name="name" type="text" class="input-medium search-query" placeholder="输入资源名字..." style="width: 165px;"/></td>
					<td>所属店铺:</td>
					<td><input name="user.nickName" type="text" class="input-medium search-query" placeholder="输入店铺id..." style="width: 165px;"/></td>
					<td>所属类型:</td>
					<td>
						<select id="type" name="type.id" style="width: 165px;"><option value="0">请选择类型...</option>
							<c:forEach var="type" items="${typeList }">
								<option value="${type.id }" ${source.type.id==type.id?'selected':'' }>${type.name }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>上传时间:</td>
					<td>
						<input type="text" id="publishTime" class="input-medium search-query Wdate" onClick="WdatePicker()" 
							name="s_topic.publishTime" value="<fmt:formatDate value="${s_topic.publishTime }" type="date" pattern="yyyy-MM-dd"/>" style="width: 165px;"/>
					</td>
					<%-- <td>发帖时间:</td>				
					<td>最后修改时间:</td>
					<td><input type="text" id="modifyTime" class="input-medium search-query Wdate" onClick="WdatePicker()" name="s_topic.modifyTime" value="<fmt:formatDate value="${s_topic.modifyTime }" type="date" pattern="yyyy-MM-dd"/>" style="width: 165px;"/></td> --%>
					<td>所属大类:</td>
					<td>
						<select id="category" name="category.id" style="width: 195px;"><option value="0">请选择类变...</option>
							<c:forEach var="category" items="${categoryList }">
								<option value="${category.id }" ${source.category.id==category.id?'selected':'' }>${category.name }</option>
							</c:forEach>
						</select>
					</td>
					<td>二级菜单:</td>
					<td>
						<select id="menu" name="menu.id" style="width: 195px;"><option value="0">请选择菜单...</option>
							<c:forEach var="menu" items="${allMenuList }">
								<option value="${menu.id }" ${source.menu.id==menu.id?'selected':'' }>${menu.name }</option>
							</c:forEach>
						</select>
					</td>					
					<td></td>
					<td>
						<button type="submit" class="btn btn-primary" title="Search">查询&nbsp;<i class="icon  icon-search"></i></button>
					</td>
				</tr>
			</table>
			</form>
			<a href="#" role="button" class="btn btn-danger" onclick="javascrip:deleteUsers()">批量删除</a>
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
									<th>名称</th>
									<th>资源logo</th>
									<th>所属店铺</th>
									<th>下载数</th>
									<th>上传时间</th>																		
									<th>豆儿数</th>
									<th>所属分类</th>
									<th>所属版块</th>
									<th>二级菜单</th>
									<th>资源标签</th>
									<th>是否精品</th>								
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${sourceList }" var="source">
									<tr>
										<td><input type="checkbox" /></td>
										<td style="text-align: center;vertical-align: middle;">${source.id }</td>
										<td style="text-align: center;vertical-align: middle;">
											<a href="${host}/shop/source/${message.source.id}" style="color: green;text-decoration: revert;" target="_blank">${source.name}</a>
										</td>
										<td style="text-align: center;vertical-align: middle;">
											<img src="${pageContext.request.contextPath}/shop/images/logo/zip.svg" alt="img">
										</td>
										<td style="text-align: center;vertical-align: middle;">${source.shop.shop_name }</td>
										<td style="text-align: center;vertical-align: middle;">${source.downNum}</td>																						
										<td style="text-align: center;vertical-align: middle;"><fmt:formatDate value="${source.upload_time }" pattern="yyyy-MM-dd "/></td>
										<td style="text-align: center;vertical-align: middle;">${source.douNum}</td>
										<td style="text-align: center;vertical-align: middle;">${source.type.name }</td>
										<td style="text-alignLcenter; vertical-align:middle;">${source.category.name}</td>
										<td style="text-alignLcenter; vertical-align:middle;">${source.menu.name}</td>
										<td style="text-alignLcenter; vertical-align:middle;">${source.tag}</td>	
										<td style="text-alignLcenter; vertical-align:middle;">
											<c:if test="${source.good==1 }">
												精品
											</c:if>
											<c:if test="${source.good==0 }">
												否
											</c:if>										
										</td>									
										<td style="text-align: center;vertical-align: middle;">
											<a class="btn btn-xs btn-default submenuitem" type="button" data-backdrop="static" data-toggle="modal" data-target="#dlg"
											 	onclick="return modifySource(${source.id},'${source.tag }','${source.name }','${source.douNum }','${source.size }','${source.good}' )">
											 <i class="ftsucai-edit-2"></i>
											 </a>
											<a class="btn btn-xs btn-default submenuitem" type="button" onclick="javascript:sourceDelete(${source.id})"><i class="ftsucai-del"></i></a>
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
								<label class="control-label" for="name">资源名称：</label>
							</td>
							<td>
								<input id="name" type="text" name="name" placeholder="导入数据失败！">
							</td>
						</tr>								
											
						<tr>
							<td>
								<label class="control-label" for="tag">资源标签：</label>
							</td>
							<td>
								<input id="tag" type="text" name="tag" placeholder="导入数据失败！">
							</td>
						</tr>
						
						<tr>
							<td>
								<label class="control-label" for="size">资源大小：</label>
							</td>
							<td>
								<input id="size" type="text" name="size" placeholder="导入数据失败！">
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="douNum">所需豆数数：</label>
							</td>
							<td>
								<input id="douNum" type="text" name="douNum" placeholder="导入数据失败！">
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="good">是否设为推荐：</label>
							</td>
							<td>
								<input id="good" type="text" name="good" placeholder="导入数据失败！">								
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
				<button class="btn btn-primary" onclick="javascript:saveSource()">保存</button>
			</div>
		</div>
	</div>
</body>
</html>