<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<!-- 2019.09.03 自定义弹窗所需插件 -->
<link rel="stylesheet" type="text/css" href="${host}/sweetalert/sweetalert.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
<script src="${host}/sweetalert/sweetalert.min.js"></script>

<script type="text/javascript" src="${host}/ckeditor4.12/ckeditor/ckeditor.js"></script>

<title>网站后台管理</title>
<script type="text/javascript">
	$(function () {
		//2019.09.04 miki 初始化ckeditor编辑器，修改上传文件地址，记得去掉class="ckeditor"
		CKEDITOR.replace('#ucontent', {
			filebrowserImageUploadUrl :"${host}/topic/ckupload?",
			codeSnippet_theme: 'zenburn',
			height:'500'
		});
	});


	function modifyTopic(topicId,topicTop,topicGood){
		$("#topicId").val(topicId);
		$("#topicTop").val(topicTop);
		$("#topicGood").val(topicGood);
	}
// $("#fm").serialize()  {topicId:topicId,topicTop:topicTop,topicGood:topicGood}  ,"json"  2016.11.15


//saveTopic()函数变量定义在外面  

function saveTopic(){
	alert("调用保存函数！");
	var topicId=$("#topicId").val();
	var topicTop=$("#topicTop").val();
	var topicGood=$("#topicGood").val();

	$.post("Topic_modify.action",{topicId:topicId,topicTop:topicTop,topicGood:topicGood},function(result){
		if (result.success) {
			alert("数据已成功修改！");
			location.reload(true);
		} else {
			alert("数据修改失败！");
		}
	},"json");
}



function deleteTopic(topicId){
	if(confirm("确定要删除这条数据吗?")){
		$.post("Topic_delete.action",{topicId:topicId},
				function(result){
					var result=eval(result);
					if(result.error){
						alert(result.error);
					}else{
						alert("删除成功！");
						window.location.reload(true);
					}
				}
			);
	}
}
function deleteTopics(){
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
	if(confirm("您确定要删除这"+selectedSpan.length+"条数据吗？")){
		$.post("Topic_delete1.action",{ids:ids},function(result){
			if(result.success){
				alert("数据已成功删除！");
				location.reload(true);
			}else{
				alert("数据删除失败！");
			}
		},"json");
	}else{
		return;
	}
}


</script>
</head>
<body>
	<div class="container-fluid">
		<!--2020.08.12 miki 表头样式-->
		<div id="tooBar" style="padding: 10px 0px 0px 10px;">
			<a href="#" role="button" class="btn btn-danger" onclick="javascrip:deleteTopics()">批量删除</a>
			<form action="Topic_listAdmin.action" method="post" class="form-search">
			<table cellpadding="5px;">
				<tr>
					<td>帖子标题:</td>
					<td><input name="s_topic.title" value="${s_topic.title }" type="text" class="input-medium search-query" placeholder="输入帖子标题..." style="width: 165px;"/></td>
					<td>发帖人:</td>
					<td><input name="s_topic.user.nickName" value="${s_topic.user.nickName }" type="text" class="input-medium search-query" placeholder="输入发帖人..." style="width: 165px;"/></td>
					<td>所属小板块:</td>
					<td>
						<select id="section" name="s_topic.section.id" style="width: 165px;"><option value="0">请选择板块...</option>
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
					<td>是否置顶:</td>
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
		</div>

		<!--2020.08.12 miki 表数据样式-->
		<div class="row-fluid">
			<div class="span12">
				<div class="widget-box">
					<div class="widget-title">
						<!-- <span class="icon"> <input type="checkbox"
							id="title-checkbox" name="title-checkbox" />
						</span> -->
						<h5>主题列表</h5>
					</div>
					<div class="widget-content nopadding">
						<table class="table table-bordered table-striped with-check">
							<thead>
								<tr>
									<th><i class=""></i></th>
									<th>编号</th>
									<th>帖子标题</th>
									<th>发帖人</th>
									<th class="th">所属小板块</th>
									<th>发帖时间</th>
									<th>最后修改时间</th>
									<th>是否置顶</th>
									<th>是否精华</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${topicList }" var="topic">
									<tr>
										<td><input type="checkbox" /></td>
										<td style="text-align: center;vertical-align: middle;">${topic.id }</td>
										<td style="text-align: center;vertical-align: middle;">${topic.title }</td>
										<td style="text-align: center;vertical-align: middle;width: 110px;vertical-align: middle;">
											${topic.user.nickName }
										</td>
										<td style="text-align: center;vertical-align: middle;">${topic.section.name }</td>
										<td style="text-align: center;vertical-align: middle;"><fmt:formatDate value="${topic.publishTime }" pattern="yyyy-MM-dd "/></td>
										<td style="text-align: center;vertical-align: middle;"><fmt:formatDate value="${topic.modifyTime }" pattern="yyyy-MM-dd "/></td>
										<td style="text-align: center;vertical-align: middle;">
											<c:choose>
												<c:when test="${topic.top==1 }"><font style="color: red;">置顶</font></c:when>
												<c:otherwise>非置顶</c:otherwise>
											</c:choose>
										</td>
										<td style="text-align: center;vertical-align: middle;">
											<c:choose>
												<c:when test="${topic.good==1 }"><font style="color: red;">精华</font></c:when>
												<c:otherwise>非精华</c:otherwise>
											</c:choose>
										</td>
										<td style="text-align: center;vertical-align: middle;">    
																												
										<!--  2016.12.16   s设计模块，button未触发的原因：button按钮里 有这几个参数data-backdrop="static" data-toggle="modal" data-target="#dlg"时，
										      a href超链接未能跳转，删除之后，实现了跳转 -->
											<button class="btn btn-info" type="button" data-backdrop="static" data-toggle="modal" data-target="#dlg" onclick="return modifyTopic(this)">修改</button>
											<button class="btn btn-danger" type="button" onclick="javascript:deleteTopic(${topic.id})">删除</button>
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

		<!--2020.08.12 miki 弹窗样式-->
		<!-- bootstarp 隐藏版块栏2    修改 小版块 	2017.05.28		  -->

		<div id="dlg" class="modal hide fade"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true" onclick="return resetValue()">×</button>
				<h3 id="myModalLabel1">修改小板块</h3>
			</div>
			<form id="fm1" action="Section_save.action" method="post" enctype="multipart/form-data">
				<div class="modal-body">

					<table>
						<tr>
							<td>
								<label class="control-label" for="utitle">请输入话题名称：</label>
							</td>
							<td>
								<input id="utitle" type="text" name="title" placeholder="请输入…">
								<input id="uid" type="hidden" readonly="readonly" name="id">
							</td>
						</tr>

						<!--2020.08.12 miki ckeditor弹窗-->
						<tr>
							<table>
								<tr>
									<td><textarea id="ucontent" name="content" style ="height:150px; width:700px;bg-color:gray;" placeholder="您的内容"></textarea>
									</td>
								</tr>
							</table>
						</tr>

						<tr>
							<td>
								<label class="control-label" for="usection">请选择所属大板块：</label>
							</td>
							<td>
								<select id="usection" name="section.id"><option value="">请选择...</option>
									<c:forEach var="section" items="${sectionList }">
										<option value="${section.id }">${section.name }</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="utop">是否置顶：</label>
							</td>
							<td>
								<select id="utop" name="top"><option value="">请选择...</option>
									<option value="1">是</option>
									<option value="0">否</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="ugood">是否精华：</label>
							</td>
							<td>
								<select id="ugood" name="good"><option value="">请选择...</option>
									<option value="1">是</option>
									<option value="0">否</option>
								</select>
							</td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<font id="error" style="color: red;"></font>
					<button class="btn" data-dismiss="modal" aria-hidden="true"
							onclick="return resetValue()">关闭</button>
					<button class="btn btn-primary" type="submit">保存</button>
					<!-- <button class="btn btn-primary" type="submit">保存</button> -->
				</div>

			</form>

		</div>

	</div>
</body>
</html>