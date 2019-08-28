<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.Date" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="${pageContext.request.contextPath}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />
<link href="css/csshake.min.css" rel="stylesheet" type="text/css" />
                                 <!-- 回复消息弹窗提醒     2016.12.12-->
<style type="text/css">
body { background:#333333;}
#winpop { width:200px; height:0px; position:absolute; right:0; bottom:0; border:1px solid #999999; margin:0; padding:1px; overflow:hidden; display:none; background:#FFFFFF}
#winpop .title { width:100%; height:20px; line-height:20px; background:#FFCC00; font-weight:bold; text-align:center; font-size:12px;}
#winpop .con { width:100%; height:80px; line-height:80px; font-weight:bold; font-size:12px; color:#FF0000; text-decoration:underline; text-align:center}
#silu { font-size:13px; color:#999999; position:absolute; right:0; margin-left:0px; text-decoration:underline; line-height:22px;}
.close { position:absolute; right:4px; top:-1px; color:#FFFFFF; cursor:pointer}
</style>
<script type="text/javascript">
function tips_pop(){
var MsgPop=document.getElementById("winpop");//获取窗口这个对象,即ID为winpop的对象
var popH=parseInt(MsgPop.style.height);//用parseInt将对象的高度转化为数字,以方便下面比较
if (popH==0){//如果窗口的高度是0
MsgPop.style.display="block";//那么将隐藏的窗口显示出来
show=setInterval("changeH('up')",2);//开始以每0.002秒调用函数changeH("up"),即每0.002秒向上移动一次
}
else {//否则
hide=setInterval("changeH('down')",2);//开始以每0.002秒调用函数changeH("down"),即每0.002秒向下移动一次
}
}
function changeH(str) {
var MsgPop=document.getElementById("winpop");
var popH=parseInt(MsgPop.style.height);
if(str=="up"){//如果这个参数是UP
if (popH<=100){//如果转化为数值的高度小于等于100
MsgPop.style.height=(popH+4).toString()+"px";//高度增加4个象素
}
else{
clearInterval(show);//否则就取消这个函数调用,意思就是如果高度超过100象度了,就不再增长了
}
}
if(str=="down"){
if (popH>=4){//如果这个参数是down
MsgPop.style.height=(popH-4).toString()+"px";//那么窗口的高度减少4个象素
}
else{//否则
clearInterval(hide);//否则就取消这个函数调用,意思就是如果高度小于4个象度的时候,就不再减了
MsgPop.style.display="none";//因为窗口有边框,所以还是可以看见1~2象素没缩进去,这时候就把DIV隐藏掉
}
}
}
window.onload=function(){//加载
document.getElementById('winpop').style.height='0px';//初始化这个高度,CSS初始化
setTimeout("tips_pop()",800);//3秒后调用tips_pop()这个函数
}
</script>



<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>个人中心</title>

<link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
<link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet" />

<script src="bootstrap/js/jquery.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="bootstrap/js/bootstrap.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/bootstrap-responsive.min.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
<style type="text/css">
</style>
<script type="text/javascript">
</script>

</head>
<body>
<div id="header" class="wrap" style="width: 1200px; margin: 0 auto;">
	<jsp:include page="../common/top.jsp"/>
</div>
<div style="width: 1200px; margin: 0 auto;background:#F5F5F5;">



                     <!-- 动态消息提醒版块               2016.12.12 -->
<div class="shake-slow shake-constant shake-constant--hover"  id="winpop">
	<div class="title">敬爱的论坛小主:${currentUser.nickName }<span class="close" onclick="tips_pop()">X</span></div>
	<div class="con"><a href="${host}/topic/detail/38">您有(1)条未读信息</a></div>
</div>

	<table class="table table-bordered table-striped with-check"style="font-size:10pt;">
		<tr>
			<th style="text-align: center;vertical-align: middle;">ID</th>
			<th style="text-align: center;vertical-align: middle;">头像</th>
			<th style="text-align: center;vertical-align: middle;">真实姓名</th>
			<th style="text-align: center;vertical-align: middle;">密码</th>
			<th style="text-align: center;vertical-align: middle;">积分</th>
			<th style="text-align: center;vertical-align: middle;">性别</th>
			<th style="text-align: center;vertical-align: middle;">昵称</th>
			<th style="text-align: center;vertical-align: middle;">邮箱</th>
			<th style="text-align: center;vertical-align: middle;">联系电话</th>
			<th style="text-align: center;vertical-align: middle;">注册时间</th>
			<th style="text-align: center;vertical-align: middle;">用户类型</th>
			<th style="text-align: center;vertical-align: middle;">操作</th>
		</tr>
		<tr>
			<td style="text-align: center;vertical-align: middle;">${currentUser.id }</td>
			<td style="text-align: center;vertical-align: middle;">
				<c:choose>
						<c:when test="${(currentUser.face==null||currentUser.face=='')&&currentUser.sex=='男'}">
							<img alt=""
								src="${pageContext.request.contextPath}/images/user/user0.gif"
								style="width: 80px; height: 80px;border-radius:50%;">
						</c:when>
						<c:when test="${(currentUser.face==null||currentUser.face=='')&&currentUser.sex=='女'}">
							<img alt=""
								src="${pageContext.request.contextPath}/images/user/female.gif"
								style="width: 80px; height: 80px;border-radius:50%;">
						</c:when>
						<c:otherwise>
							<img alt="" src="${pageContext.request.contextPath}/${currentUser.face}"
								style="width: 80px; height: 80px;border-radius:50%;">
						</c:otherwise>
					</c:choose>
				</td>
			
			<td style="text-align: center;vertical-align: middle;">${currentUser.trueName }</td>
			<td style="text-align: center;vertical-align: middle;"><input type="password" readonly="readonly" value="${currentUser.password }"/></td>
			<td style="text-align: center;vertical-align: middle;">${currentUser.score }</td>
			<td style="text-align: center;vertical-align: middle;">${currentUser.sex }</td>
			<td style="text-align: center;vertical-align: middle;">${currentUser.nickName }</td>
			<td style="text-align: center;vertical-align: middle;">${currentUser.email }</td>
			<td style="text-align: center;vertical-align: middle;">${currentUser.mobile }</td>
			<td style="text-align: center;vertical-align: middle;"><fmt:formatDate value="${currentUser.regTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			<td style="text-align: center;vertical-align: middle;">
				<c:choose>
						<c:when test="${currentUser.sectionList.size()==0&&currentUser.type!=2 }">
							<font style="color: black;">普通用户</font>
						</c:when>
						<c:when test="${currentUser.sectionList.size()!=0&&currentUser.type!=2 }">
							<font style="color: blue;">版主</font>
					                       【<c:forEach items="${currentUser.sectionList }" var="section">
					            ${section.name }；
					         </c:forEach>】
					    </c:when>
						<c:otherwise>
							<font style="color: red;">管理员</font>
						</c:otherwise>
					</c:choose>
				</td>
				<td style="text-align:center; vertical-align: middle;">					
					<a class="btn btn-info" type="button" href="User_preSave.action">修改</a>&nbsp;&nbsp;
					<button class="btn btn-info"  onclick="tips_pop()">收件箱</button>&nbsp;&nbsp;
				</td>
		</tr>
	</table>
	<div style="height:700px;">
	<font style="font-size:10pt;">最近登录：<% out.println(""+new Date()); %></font>
	<table style="border:1px solid silver;width:17.3%;text-align:center;color:#0088CC;font-size:10pt;">
	<tr style="border:1px solid silver;height:40px;">
	<td style="border:1px solid silver;height:40px;"><a href="#">我的博客</a></td>
	<td style="border:1px solid silver;height:40px;"><a href="#">写博客</a></td>
	</tr>
	<tr style="border:1px solid silver;height:40px;">
	<td style="border:1px solid silver;height:40px;"><a href="#">帖子(${count1})</a></td>
	<td style="border:1px solid silver;height:40px;"><a href="#">关注(0)</a></td>
	</tr>
	<tr style="border:1px solid silver;height:40px;">
	<td style="border:1px solid silver;height:40px;"><a href="#">好友(0)</a></td>
	<td style="border:1px solid silver;height:40px;"><a href="#">博客(8)</a></td>
	</tr>
	<tr style="border:1px solid silver;height:40px;">
	<td style="border:1px solid silver;height:40px;"><a href="#">心情(3)</a></td>
	<td style="border:1px solid silver;height:40px;"><a href="#">收藏(10)</a></td>
	</tr style="border:1px solid silver;height:40px;">
	</table>
	<div style="background:#F5F5F5;">
<div class="container-fluid">

		<div class="row-fluid">
			<div class="span12">
				<div class="widget-box">
					<div class="widget-title">
						<!-- <span class="icon"> <input type="checkbox"
							id="title-checkbox" name="title-checkbox" />
						</span> -->
						<h5>发帖历史记录</h5>
					</div>
					<div class="widget-content nopadding">
						<table class="table table-bordered table-striped with-check">
							<thead>
								<tr>																		
									<th style="text-align:center;font-size:10pt;">帖子标题</th>
									<th style="text-align:center;font-size:10pt;">发帖人</th>
									<th class="th"style="text-align:center;font-size:10pt;">所属小板块</th>
									<th style="text-align:center;font-size:10pt;">发帖时间</th>									
									<th style="text-align:center;font-size:10pt;">是否置顶</th>
									<th style="text-align:center;font-size:10pt;">是否精华</th>									
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${TopicList }" var="topic">
									<tr>																			
										<td style="text-align: center;vertical-align: middle;font-size:10pt;"><a href="${host}/topic/detail/${topic.id }">${topic.title }</a></td>
										<td style="text-align: center;vertical-align: middle;width: 110px;vertical-align: middle;font-size:10pt;">
											${topic.user.nickName }
										</td>
										<td style="text-align: center;vertical-align: middle;font-size:10pt;">${topic.section.name }</td>
										<td style="text-align: center;vertical-align: middle;font-size:10pt;"><fmt:formatDate value="${topic.publishTime }" pattern="yyyy-MM-dd "/></td>									
										<td style="text-align: center;vertical-align: middle;font-size:10pt;">
											<c:choose>
												<c:when test="${topic.top==1 }"><font style="color: red;font-size:10pt;">置顶</font></c:when>
												<c:otherwise><font style="font-size:10pt;">非置顶</font></c:otherwise>
											</c:choose>
										</td>
										<td style="text-align: center;vertical-align: middle;">
											<c:choose>
												<c:when test="${topic.good==1 }"><font style="color: red;font-size:10pt;">精华</font></c:when>
												<c:otherwise><font style="font-size:10pt;">非精华</font></c:otherwise>
											</c:choose>
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
	</div>
	</div>
	</div>
	</div>
</div>
<div id="footer" style="width: 1200px; margin: 0 auto;">
	<jsp:include page="../common/footer.jsp"/>
</div>
</body>
</html>