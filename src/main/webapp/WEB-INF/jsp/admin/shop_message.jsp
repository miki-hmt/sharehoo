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
 function sendMessage(id,content,sourceId,shopName,sourceName){
	 $("#myModalLabel").html("处理商家");
	 $("#id").val(id);
	 $("#sourceId").val(sourceId);
	 $("#sourceName").val(sourceName);
	 $("#shopName").val(shopName);
	 $("#description").val("您的店铺由于以下原因被举报:【"+content+"】经审核确实属实，暂如下处理：下架店铺该资源，并收回您之前该资源所有收入的豆并还将80%收入转给真正版权拥有者，如有不合理之处，请联系管理员。");
 }
 
 
 /*2016.11.15  修改店铺功能的实现 ，最初做的时候功能不完善，无法实现修改用户 ，原因：未添加saveUser()函数  */
 function send(){
	 var sourceId= $("#sourceId").val();
	 var messageId=$("#id").val();
		 $.post("${pageContext.request.contextPath}/shop/manage/MesManage_save.action?sourceId="+sourceId+"&id="+messageId, $("#fm").serialize(),
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
function messageUpdate(sourceId){
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
			
			<form action="Topic_listAdmin.action" method="post" class="form-search">
			<table cellpadding="5px;">
				<tr>
					<td>资源标题:</td>
					<td><input name="s_topic.title" value="${s_topic.title }" type="text" class="input-medium search-query" placeholder="输入资源名字..." style="width: 165px;"/></td>
					<td>所属店铺:</td>
					<td><input name="s_topic.user.nickName" value="${s_topic.user.nickName }" type="text" class="input-medium search-query" placeholder="输入店铺id..." style="width: 165px;"/></td>
					<td>所属类型:</td>
					<td>
						<select id="section" name="s_topic.section.id" style="width: 165px;"><option value="0">请选择类型...</option>
							<c:forEach var="section" items="${sectionList }">
								<option value="${section.id }" ${s_topic.section.id==section.id?'selected':'' }>${section.name }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<%-- <td>发帖时间:</td>
					<td><input type="text" id="publishTime" class="input-medium search-query Wdate" onClick="WdatePicker()" name="s_topic.publishTime" value="<fmt:formatDate value="${s_topic.publishTime }" type="date" pattern="yyyy-MM-dd"/>" style="width: 165px;"/></td>
					<td>最后修改时间:</td>
					<td><input type="text" id="modifyTime" class="input-medium search-query Wdate" onClick="WdatePicker()" name="s_topic.modifyTime" value="<fmt:formatDate value="${s_topic.modifyTime }" type="date" pattern="yyyy-MM-dd"/>" style="width: 165px;"/></td> --%>
					<td>所属大类:</td>
					<td>
						<select name="s_topic.top" style="width: 195px;"><option value="2">全部</option>
							<option value="1" ${s_topic.top==1?'selected':'' }>置顶</option>
							<option value="0" ${s_topic.top==0?'selected':'' }>非置顶</option>
						</select>
					</td>
					<td>二级菜单:</td>
					<td>
						<select name="s_topic.top" style="width: 195px;"><option value="2">全部</option>
							<option value="1" ${s_topic.top==1?'selected':'' }>置顶</option>
							<option value="0" ${s_topic.top==0?'selected':'' }>非置顶</option>
						</select>
					</td>
					<td>是否精华:</td>
					<td>
						<select name="s_topic.good" style="width: 195px;"><option value="2">全部</option>
							<option value="1" ${s_topic.good==1?'selected':'' }>精华</option>
							<option value="0" ${s_topic.good==0?'selected':'' }>非精华</option>
						</select>
					</td>
					<td></td>
					<td>
						<button type="submit" class="btn btn-primary" title="Search">查询&nbsp;<i class="icon  icon-search"></i></button>
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
										<td style="text-align: center;vertical-align: middle;">${message.status}</td>														
										<td style="text-align: center;vertical-align: middle;">
											<button class="btn btn-info" type="button" data-backdrop="static" data-toggle="modal" data-target="#dlg"
											 onclick="return sendMessage(${message.id},'${message.name}','${message.source.id }','${message.shop.shop_name }','${message.source.name }')">回复</button>
											<button class="btn btn-danger" type="button" onclick="javascript:messageUpdate(${source.id})">处理</button>
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
								<input id="shopName" type="text" name="message.shop.shop_name" placeholder="导入数据失败！">
							</td>
						</tr>								
											
						<tr>
							<td>
								<label class="control-label" for="sourceName">投诉资源名：</label>
							</td>
							<td>
								<input id="sourceName" type="text" name="message.source.name" placeholder="导入数据失败！">
							</td>
						</tr>
						
						<tr>
							<td>
								<label class="control-label" for="description">处理内容：</label>
							</td>
							<td>
								<textarea rows="5" cols="50" style="width: 405px;" id="description" name="message.content"></textarea>
							</td>
						</tr>
																
									
					</table>
					<input id="id" type="hidden" name="message.id">
					<input id="sourceId" type="hidden" name="message.source.id">
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