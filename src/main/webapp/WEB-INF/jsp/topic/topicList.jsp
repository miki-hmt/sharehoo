<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
 <!--修改日期格式只显示年月日  -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="Author" content="miki">
  <meta name="Keywords" content="课设,下载,博客,论坛,IT资讯,开发心得,干货分享,代码,源码">
  <meta name="Description" content="sharehoo.cn资讯交流平台--专注于程序员开发道路的技术分享，问题解决。
	会员可以发帖交流与讨论，每个人都有一个个人博客，可以在上面写下自己的心得与感悟。同时提供资源下载，开源源码下载，课程设计，专注于服务大学生。">
<title>IT帮-资讯传播社区--技术交流_干货分享-百家争鸣</title>
         
 <link rel="stylesheet" href="${host}/css/style5.css">                
  <link href="${host}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />              
<link rel="stylesheet" href="${host}/admin/css/bootstrap.css" />
<link rel="stylesheet" href="${host}/admin/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="${host}/admin/css/uniform.css" />

<script src="${host}/js/jquery-1.11.1.js" type="text/javascript"></script>
<script src="${host}/admin/js/jquery.ui.custom.js"></script>

<script type="text/javascript" src="${host}/js/timer.js"></script>
  <script type="text/javascript">
  $(document).ready(function(){
  debugger
	for(var i=0;i<21;i++){
		var date=$(".time"+i).text();
		$(".time"+i).text(diaplayTime(date));
	}
	});
  </script>

<script type="text/javascript">
	function delTopic(topicId){
	
		swal({
			title: "您确定要删除吗？", 
			text: "您确定要删除这条数据？", 
			type: "warning",
			showCancelButton: true,
			closeOnConfirm: false,
			confirmButtonText: "是的，忍痛删除",
			confirmButtonColor: "#ec6c62"
			}, function() {
				$.ajax({
					url: "${host}/topic/delete/",
					data: {topicId:topicId},
					type: "POST",
				}).done(function(data) {
					if(data.status==200){
						tipOk("删除成功", function() {
							location.reload(true);
						});
						//swal("操作成功!", "已成功删除数据！", "success");
					}else{
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
				imageUrl: "${host}/sweetalert/images/thumbs-up.jpg",
				html: true,
				timer: 2000,   
				showConfirmButton: false
			},function(){
				if (callback) {
					callback();
				}
			});
		};
</script>


<script type="text/javascript">
	function modifyTopic(topicId){
	
		swal({
			title: "确定撤销该帖所有荣誉吗？", 
			text: "撤销之后，将成为普通的帖子呦", 
			type: "warning",
			showCancelButton: true,
			closeOnConfirm: false,
			confirmButtonText: "是的，忍痛撤销",
			confirmButtonColor: "#ec6c62"
			}, function() {
				$.ajax({
					url: "${host}/topic/modify/"+topicId,
					data: {topicId:topicId},
					type: "POST",
				}).done(function(data) {
					if(data.status==200){
						tipOk("撤销成功", function() {
							location.reload(true);
						});
						//swal("操作成功!", "已成功删除数据！", "success");
					}else{
						swal("OMG", "撤销操作失败了!", "error");
					}					
				}).error(function(data) {
					swal("OMG", "撤销操作失败了!", "error");
				});
			});
	}
	
	function setHot(topicId){
	
		swal({
			title: "确定要将该贴设为热门吗？", 
			text: "设为热门之后，可以让更多人看到哦", 
			type: "warning",
			showCancelButton: true,
			closeOnConfirm: false,
			confirmButtonText: "是的，我要热门",
			confirmButtonColor: "#ec6c62"
			}, function() {
				$.ajax({
					url: "${host}/topic/hot/"+topicId,
					data: {topicId:topicId},
					type: "POST",
				}).done(function(data) {
					if(data.status==200){
						tipOk("设置成功", function() {
							location.reload(true);
						});
						//swal("操作成功!", "已成功删除数据！", "success");
					}else{
						swal("OMG", "已经精华了不要再射了！", "error");
					}					
				}).error(function(data) {
					swal("OMG", "已经精华了不要再射了！", "error");
				});
			});
			
	}
	
	function setTop(topicId){
	
		swal({
			title: "确定要将该贴设为置顶吗？", 
			text: "设为置顶之后，可以让更多人看到哦", 
			type: "warning",
			showCancelButton: true,
			closeOnConfirm: false,
			confirmButtonText: "是的，我要热门",
			confirmButtonColor: "#ec6c62"
			}, function() {
				$.ajax({
					url: "${host}/topic/top/"+topicId,
					data: {topicId:topicId},
					type: "POST",
				}).done(function(data) {
					if(data.status==200){
						tipOk("设置成功", function() {
							location.reload(true);
						});
						//swal("操作成功!", "已成功删除数据！", "success");
					}else{
						swal("OMG", data.msg, "error");
					}					
				}).error(function(data) {
					swal("OMG", data.msg, "error");
				});
			});
	}
	
</script>


<script type="text/javascript">

//游客进入帖子页面，只能浏览不能评论，若是强行评论，会跳出提示2016.09.24
	function checkForm(){
		if('${currentUser.nickName}'==''){
			alert("请先登陆，再发帖！");
		return false;
		}
	}

</script>


<style>

p{
padding:-4px 0;
}

</style>




</head>
<body style="background-color:#FFFFFF;">
<div class="wrap" style="margin: 0 auto;">
	<jsp:include page="../common/top2.jsp"/>
</div>


                                 <!-- 2020.02.07修改 移除:height:900px;自适应长度-->
                                 
<div style=" width: 1200px; margin: 0 auto;background:url('${host}/images/rw2.png');margin-top:-9px;background-color:#FFFFFF;border:0px solid #AC9B8B;box-shadow:2px 5px 5px rgba(0,0,0,0.8);">

<div style="width: 1200px; margin: 0 auto;">
	<div style="margin-bottom: 10px;">	
	    <!-- a class="" href="Topic_preSave.action验证发帖时，用户是否登录，如果没登录，自动跳转到指定页面2016.10.06 -->	                   
		<a class="" href="${host}/topic/write?sectionId=${section.id }"><img alt="随便说说" src="${pageContext.request.contextPath}/images/post.jpg"></a>
		<div class="pagination alternate pull-right" align="center" style="margin: 0px;">
			<ul class="clearfix">
				${pageCode }
			</ul>
		</div>
	</div>
	
	
		<!-- 在这放一个轮播图    可以对图片增删改查   注意：下面的div的border：不能设为1px，否则会被挤走      2017.04.09                   -->
	
	<div style="width:25%;float:left;border:0px solid silver;height:500px;">

	<div class="demo">
	<a class="control prev"></a><a class="control next abs"></a><!--自定义按钮，移动端可不写-->
	<div class="slider" style="border:4px solid white "><!--主体结构，请用此类名调用插件，此类名可自定义-->
		<ul style="margin:0 0 10px 0px;padding:0">
			<c:forEach items="${bannerList }" var="banner">
				<li><a href="${banner.url}" style="overflow:auto"><img src="${host}/${banner.news_img}" alt="${banner.news_name }" /></a></li>
			</c:forEach>
		</ul>
	</div>
</div>
<script src="${host}/js/jquery.min.js"></script>
<script src="${host}/js/YuxiSlider.jQuery.min.js"></script>
<script>
$(".slider").YuxiSlider({
	width:290, //容器宽度
	height:164, //容器高度
	control:$('.control'), //绑定控制按钮
	during:4000, //间隔4秒自动滑动
	speed:800, //移动速度0.8秒
	mousewheel:true, //是否开启鼠标滚轮控制
	direkey:true //是否开启左右箭头方向控制
});
</script>
		
	
	</div>
	<table border="0" width="75%" cellspacing="0" cellpadding="0" style="margin-top: 8;margin-left:25%;">
		<!-- 置顶帖子 -->
		<!-- <tr height="30">
			<td style="text-indent:5;" background="images/index/classT.jpg"><b><font color="white">■ 置顶帖子</font></b></td>
		</tr> -->
		<tr height=30px;>
			<td>
				<table class="table table-bordered" width="100%" cellspacing="0" cellpadding="0" style="margin-top: 8;">
					<tr style="height:26px;">
						
						<th style="text-align: center;vertical-align: middle;font-size:10pt;">
							帖子标题
						</th>
						<th style="text-align: center;vertical-align: middle; width: 50px;font-size:10pt;">
							回复数 	
						</th>
						<th style="text-align: center;vertical-align: middle; width: 80px;font-size:10pt;">
							发表者
						</th>
						<th style="text-align: center;vertical-align: middle; width: 200px;font-size:10pt;">
							最后回复
						</th>
						<th style="text-align: center;vertical-align: middle; width: 100px;font-size:10pt;">
							操作
						</th>
					</tr>
					<c:forEach items="${zdTopicList }" var="topic">
						<tr style="height:25px;"> 
							
							<td style="text-align:left;vertical-align:middle;font-size:9pt;">
								<div style="width:85%;position:absolute;">
								<c:choose>
									<c:when test="${topic.good==0 }">
										
									</c:when>
									<c:otherwise>
										<img src="${host}/images/icon/hot.png">
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${topic.top==1 }">
										<img src="${host}/images/icon/ding.gif">
									</c:when>
									<c:otherwise></c:otherwise>
								</c:choose>
																															
								<a href="${host}/topic/detail/${topic.id}" target="_blank">${topic.title }</a></div>
							<div style="border:0px solid red;width:15%;float:right;text-align:right;">
							<a href="#"><font style="font-size:8pt;">
								<fmt:formatDate value="${topic.publishTime}" pattern="yy-MM-dd"/></font></a>
							</div>
							</td>
							<td style="text-align: center;vertical-align:middle;font-size:9pt;color:gray;">
								${topicReplyCount.get(topic) }
							</td>
							<td style="text-align: center;vertical-align:middle;font-size:9pt;color:gray;">
								${topic.user.nickName }
							</td>
							<td style="text-align: center;vertical-align:middle; width: 200px;font-size:9pt;color:gray;">
								<strong>${topicLastReply.get(topic).user.nickName }</strong>
								<fmt:formatDate value="${topicLastReply.get(topic).publishTime }" pattern="yy-MM-dd HH:mm:ss "/>
							</td>
							<td style="text-align: center;vertical-align:middle;font-size:9pt;">
							                      <!-- 非版主或者发帖人不能执行修改功能        2016.11.07 -->
								<c:choose>
									
									<c:when test="${currentUser.type==2 }">
										<button style="background-color:#4EB4D2;color:white;border-radius:40%;" type="button" data-backdrop="static" onclick="javascript:setHot(${topic.id }) ">精华</button>	
									    <a href="javascript:void(0)" onclick="javascript:modifyTopic(${topic.id })">撤销</a>	
									</c:when>								                                 
									<c:when test="${currentUser.id==topic.user.id&&currentUser.id!=section.master.id }">									                          									                                
										限制操作己帖
									</c:when>
									<c:when test="${currentUser.id==section.master.id }">
										<button style="background-color:#4EB4D2;color:white;border-radius:40%;" type="button" data-backdrop="static" onclick="javascript:setHot(${topic.id }) ">精华</button>	
									    	<a href="javascript:void(0)" onclick="javascript:modifyTopic(${topic.id })">撤销</a>	
									</c:when>
																		                         									
									<c:otherwise>
										<font style="font-size:9pt;color:gray;">
										无权限操作
										</font>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</c:forEach>
				</table>
			</td>
		</tr>
		
		<!-- 其他帖子 -->
		<!-- <tr height="30">
			<td style="text-indent:5;" background="images/index/classT.jpg"><b><font color="white">■ 其它帖子</font></b></td>
		</tr> -->
		
		<tr>
			<td>
				
				
				<table class="table table-bordered" width="100%" cellspacing="0" cellpadding="0" style="margin-top: 8;">
											
				                          <!--html静态页面做活2016.08.24  -->				                          
					<!-- <tr>
						<th style="text-align: center;vertical-align: middle; width: 150px;">状态</th>
						<th style="text-align: center;vertical-align: middle;">	帖子标题		</th>
						<th style="text-align: center;vertical-align: middle; width: 100px;">回复数 </th>
						<th style="text-align: center;vertical-align: middle; width: 100px;">发表者	</th>
						<th style="text-align: center;vertical-align: middle; width: 200px;">最后回复</th>
						<th style="text-align: center;vertical-align: middle; width: 150px;">操作</th>	
																												
			  2016.11.07       版块分为置顶帖列表和普通帖子列表      此处为普通帖子列表    2016.11.07
					</tr> -->										
					<c:forEach items="${ptTopicList }" var="topic" varStatus="status">
						<tr style="height:30px;">
							
							<td style="text-align:left;vertical-align:middle;font-size:9pt;">

								<div style="width:85%;position:absolute;">																
								<c:choose>
									<c:when test="${topic.good==0 }">
										
									</c:when>
									<c:otherwise>
										<img src="${host}/images/icon/hot.png">
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${topic.top==1 }">
										<img src="${host}/images/icon/ding.gif">
									</c:when>
									<c:otherwise></c:otherwise>
								</c:choose>																
								<a href="${host}/topic/detail/${topic.id}" style="blue" target="_blank">${topic.title }</a></div>
								<div style="border:0px solid red;width:15%;float:right;text-align:right;"><a href="#"><font style="font-size:8pt">
									<span class="time${status.count}" title=""><fmt:formatDate value="${topic.publishTime}" pattern="yyyy-MM-dd HH:mm:ss"/></font></a></div>
							</td>
							<td style="text-align: center;vertical-align:middle;width: 50px;font-size:9pt;color:gray;">
								${topicReplyCount.get(topic) }
							</td>
							<td style="text-align: center;vertical-align:middle;width: 80px;font-size:9pt;color:gray;">
								${topic.user.nickName }
							</td>
							<td style="text-align: center;vertical-align:middle;width: 200px;font-size:9pt;color:gray;">
								<strong>${topicLastReply.get(topic).user.nickName }</strong>
								<fmt:formatDate value="${topicLastReply.get(topic).publishTime }" pattern="yy-MM-dd HH:mm:ss "/>
							</td>
							<td style="text-align: center;vertical-align:middle;width: 100px;font-size:9pt;">
								<c:choose>
									
									<c:when test="${currentUser.type==2 }">
										<button style="background-color:#4EB4D2;color:white;border-radius:40%;" type="button" data-backdrop="static" onclick="javascript:setTop(${topic.id }) ">置顶</button>	
										<a href="javascript:void(0)" onclick="javascript:delTopic(${topic.id })">删除</a>
									</c:when>
									<c:when test="${currentUser.id==topic.user.id&&currentUser.id!=section.master.id }">
										限制操作己帖
									</c:when>
									<c:when test="${currentUser.id==section.master.id }">
										<button style="background-color:#4EB4D2;color:white;border-radius:40%;" type="button" data-backdrop="static" onclick="javascript:setTop(${topic.id }) ">置顶</button>	
										<a href="javascript:void(0)" onclick="javascript:delTopic(${topic.id })">删除</a>
									</c:when>
									
									<c:otherwise>
										<font style="font-size:9pt;color:gray;">
										无权限操作
										</font>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</c:forEach>
				</table>	
				
			
				
				
			</td>
		</tr>
	</table>
	
</div>

                                     <!-- bootstrap浮动框布局及设计  2016.11.07 -->
<div id="dlg" class="modal hide fade"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true" onclick="return resetValue()">×</button>
				<h3 id="myModalLabel">修改主题</h3>
			</div>
			<div class="modal-body">
				<form id="fm" action="#" method="post" enctype="multipart/form-data">
					<table>
						<tr>
							<td>
								<label class="control-label" for="top">置顶：</label>
							</td>
							<td>
								<select id="topicTop">
									<option value="0">非置顶</option>
									<option value="1">置顶</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="good">精华：</label>
							</td>
							<td>
								<select id="topicGood">
									<option value="0">非精华</option>
									<option value="1">精华</option>
								</select>
							</td>
						</tr>						
					</table>
					<input id="id"  type="hidden" name="topic.id" >
				</form>
			</div>
			
			<div class="modal-footer">
				<font id="error" style="color: red;"></font>
				<button class="btn" data-dismiss="modal" aria-hidden="true"
					onclick="return resetValue()">关闭</button>
				<button class="btn btn-primary" onclick="javascript:saveTopic()">保存</button>
			</div>
	</div>
</div>	 
		


</body>
</html>