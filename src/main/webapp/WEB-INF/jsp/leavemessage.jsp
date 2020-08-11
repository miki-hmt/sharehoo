<%@page import="javax.swing.text.StyleContext.SmallAttributeSet"%>
<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <!--修改日期格式只显示年月日  -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>IT帮-资讯传播社区--秘密墙专栏</title>
<link href="${pageContext.request.contextPath}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
<link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<link rel="stylesheet" href="css/style6.css">
<script type="text/javascript">


             //游客进入留言页面，只能浏览不能留言 ，若是强行留言 ，会跳出提示2016.09.24
function checkForm(){
	if('${currentUser.nickName}'==''){
		alert("请先登陆或注册，再留言！");
		return false;
	}
	if (CKEDITOR.instances.Content.getData().length<10) {
		alert("留言内容最少10个字符！");
		return false;
	}
}
</script>
</head>
<body>
<div class="wrap" style="margin: 0 auto;">
	<jsp:include page="./common/top5.jsp"/>
</div>
<div style="width: 1200px; margin: 0 auto;background-color:#FFFFFF">
	<table border="0" width="100%" cellspacing="0" cellpadding="0" style="width: 1200px;" align="center">
		<tr height="20" style="background:#AD393A">
			<td style="text-indent:5;">
				<b><font color="white">■ 秘密墙</font></b>
			</td>
			<td></td>
		</tr>
		<tr>
			<td colspan="2">                            
			
			
							 <!--******网站留言2016.10.13********* 后台处理message_save.action方法 -->
			
			
				<form class="form-horizontal" style="margin-top: 10px;" method="post" onsubmit="return checkForm()">
					<div class="control-group">
						<ul class='-center'>
							<c:forEach items="${leaveList }" var="topic" varStatus="state">
							<c:choose>
							<c:when test="${state.index<2 }">
							  <li>				
							    <div class='w'>
							      <div class='f'>
							        <svg viewBox='0 0 180 180'>
							          <image height='100%' preserveAspectRatio='xMidYMid slice' width='100%' xlink:href='./images/img/i-angus.png'></image>
							        </svg>
							      </div>
							      <div class='b'>
							        <font style="font-size:7pt;">
							          <img alt="" src="${pageContext.request.contextPath}/${topic.user.face}"
											style="width:25px; height:25px;margin-right:5px;border:1px solid #85735F;"><br>${topic.content }
											<br><fmt:formatDate value="${topic.publishTime }" pattern="yyyy-MM-dd HH:mm:ss "/>
							        </font>
							      </div>
							    </div>
							  </li>
							  </c:when>
							  
							  <c:when test="${state.index<3 }">
							  <li>				
							    <div class='w'>
							      <div class='f'>
							        <svg viewBox='0 0 180 180'>
							          <image height='100%' preserveAspectRatio='xMidYMid slice' width='100%' xlink:href='./images/img/i-aurora.png'></image>
							        </svg>
							      </div>
							      <div class='b'>
							        <font style="font-size:7pt;">
							          <img alt="" src="${pageContext.request.contextPath}/${topic.user.face}"
											style="width:25px; height:25px;margin-right:5px;border:1px solid #85735F;"><br>${topic.content }
											<br><fmt:formatDate value="${topic.publishTime }" pattern="yyyy-MM-dd HH:mm:ss "/>
							        </font>
							      </div>
							    </div>
							  </li>
							  </c:when>
							  
							 <c:when test="${state.index<4 }">
							  <li>				
							    <div class='w'>
							      <div class='f'>
							        <svg viewBox='0 0 180 180'>
							          <image height='100%' preserveAspectRatio='xMidYMid slice' width='100%' xlink:href='./images/img/i-bride.png'></image>
							        </svg>
							      </div>
							      <div class='b'>
							        <font style="font-size:7pt;">
							          <img alt="" src="${pageContext.request.contextPath}/${topic.user.face}"
											style="width:25px; height:25px;margin-right:5px;border:1px solid #85735F;"><br>${topic.content }
											<br><fmt:formatDate value="${topic.publishTime }" pattern="yyyy-MM-dd HH:mm:ss "/>
							        </font>
							      </div>
							    </div>
							  </li>
							  </c:when>
							  
							  <c:when test="${state.index<5 }">
							  <li>				
							    <div class='w'>
							      <div class='f'>
							        <svg viewBox='0 0 180 180'>
							          <image height='100%' preserveAspectRatio='xMidYMid slice' width='100%' xlink:href='./images/img/i-d.png'></image>
							        </svg>
							      </div>
							      <div class='b'>
							        <font style="font-size:7pt;">
							          <img alt="" src="${pageContext.request.contextPath}/${topic.user.face}"
											style="width:25px; height:25px;margin-right:5px;border:1px solid #85735F;"><br>${topic.content }
											<br><fmt:formatDate value="${topic.publishTime }" pattern="yyyy-MM-dd HH:mm:ss "/>
							        </font>
							      </div>
							    </div>
							  </li>
							  </c:when>
							  
							  <c:when test="${state.index<6 }">
							  <li>				
							    <div class='w'>
							      <div class='f'>
							        <svg viewBox='0 0 180 180'>
							          <image height='100%' preserveAspectRatio='xMidYMid slice' width='100%' xlink:href='./images/img/i-dali.png'></image>
							        </svg>
							      </div>
							      <div class='b'>
							       <font style="font-size:7pt;">
							          <img alt="" src="${pageContext.request.contextPath}/${topic.user.face}"
											style="width:25px; height:25px;margin-right:5px;border:1px solid #85735F;"><br>${topic.content }
											<br><fmt:formatDate value="${topic.publishTime }" pattern="yyyy-MM-dd HH:mm:ss "/>
							        </font>
							      </div>
							    </div>
							  </li>
							  </c:when>
							  
							  <c:when test="${state.index<7 }">
							  <li>				
							    <div class='w'>
							      <div class='f'>
							        <svg viewBox='0 0 180 180'>
							          <image height='100%' preserveAspectRatio='xMidYMid slice' width='100%' xlink:href='./images/img/i-huitzi.png'></image>
							        </svg>
							      </div>
							      <div class='b'>
							        <font style="font-size:7pt;">
							          <img alt="" src="${pageContext.request.contextPath}/${topic.user.face}"
											style="width:25px; height:25px;margin-right:5px;border:1px solid #85735F;"><br>${topic.content }
											<br><fmt:formatDate value="${topic.publishTime }" pattern="yyyy-MM-dd HH:mm:ss "/>
							        </font>
							      </div>
							    </div>
							  </li>
							  </c:when>
							  
							  <c:when test="${state.index<8 }">
							  <li>				
							    <div class='w'>
							      <div class='f'>
							        <svg viewBox='0 0 180 180'>
							          <image height='100%' preserveAspectRatio='xMidYMid slice' width='100%' xlink:href='./images/img/i-man.png'></image>
							        </svg>
							      </div>
							      <div class='b'>
							        <font style="font-size:7pt;">
							          <img alt="" src="${pageContext.request.contextPath}/${topic.user.face}"
											style="width:25px; height:25px;margin-right:5px;border:1px solid #85735F;"><br>${topic.content }
											<br><fmt:formatDate value="${topic.publishTime }" pattern="yyyy-MM-dd HH:mm:ss "/>
							        </font>
							      </div>
							    </div>
							  </li>
							  </c:when>
							  
							  <c:when test="${state.index<9 }">
							  <li>				
							    <div class='w'>
							      <div class='f'>
							        <svg viewBox='0 0 180 180'>
							          <image height='100%' preserveAspectRatio='xMidYMid slice' width='100%' xlink:href='./images/img/i-v.png'></image>
							        </svg>
							      </div>
							      <div class='b'>
							        <font style="font-size:7pt;">
							          <img alt="" src="${pageContext.request.contextPath}/${topic.user.face}"
											style="width:25px; height:25px;margin-right:5px;border:1px solid #85735F;"><br>${topic.content }
											<br><fmt:formatDate value="${topic.publishTime }" pattern="yyyy-MM-dd HH:mm:ss "/>
							        </font>
							      </div>
							    </div>
							  </li>
							  </c:when>
							  
							  <c:when test="${state.index<10 }">
							  <li>				
							    <div class='w'>
							      <div class='f'>
							        <svg viewBox='0 0 180 180'>
							          <image height='100%' preserveAspectRatio='xMidYMid slice' width='100%' xlink:href='./images/img/i-v2.png'></image>
							        </svg>
							      </div>
							      <div class='b'>
							        <font style="font-size:7pt;">
							          <img alt="" src="${pageContext.request.contextPath}/${topic.user.face}"
											style="width:25px; height:25px;margin-right:5px;border:1px solid #85735F;"><br>${topic.content }
											<br><fmt:formatDate value="${topic.publishTime }" pattern="yyyy-MM-dd HH:mm:ss "/>
							        </font>
							      </div>
							    </div>
							  </li>
							  </c:when>
							  
							  <c:when test="${state.index<11 }">
							  <li>				
							    <div class='w'>
							      <div class='f'>
							        <svg viewBox='0 0 180 180'>
							          <image height='100%' preserveAspectRatio='xMidYMid slice' width='100%' xlink:href='./images/img/i-v3.png'></image>
							        </svg>
							      </div>
							      <div class='b'>
							        <font style="font-size:7pt;">
							          <img alt="" src="${pageContext.request.contextPath}/${topic.user.face}"
											style="width:25px; height:25px;margin-right:5px;border:1px solid #85735F;"><br>${topic.content }
											<br><fmt:formatDate value="${topic.publishTime }" pattern="yyyy-MM-dd HH:mm:ss "/>
							        </font>
							      </div>
							    </div>
							  </li>
							  </c:when>
							  
							  <c:when test="${state.index<12 }">
							  <li>				
							    <div class='w'>
							      <div class='f'>
							        <svg viewBox='0 0 180 180'>
							          <image height='100%' preserveAspectRatio='xMidYMid slice' width='100%' xlink:href='./images/img/i-worms.png'></image>
							        </svg>
							      </div>
							      <div class='b'>
							        <font style="font-size:7pt;">
							          <img alt="" src="${pageContext.request.contextPath}/${topic.user.face}"
											style="width:25px; height:25px;margin-right:5px;border:1px solid #85735F;"><br>${topic.content }
											<br><fmt:formatDate value="${topic.publishTime }" pattern="yyyy-MM-dd HH:mm:ss "/>
							        </font>
							      </div>
							    </div>
							  </li>
							  </c:when>
							  
							   <c:when test="${state.index<13 }">
							  <li>				
							    <div class='w'>
							      <div class='f'>
							        <svg viewBox='0 0 180 180'>
							          <image height='100%' preserveAspectRatio='xMidYMid slice' width='100%' xlink:href='./images/img/i-xrays.png'></image>
							        </svg>
							      </div>
							      <div class='b'>
							        <font style="font-size:7pt;">
							          <img alt="" src="${pageContext.request.contextPath}/${topic.user.face}"
											style="width:25px; height:25px;margin-right:5px;border:1px solid #85735F;"><br>${topic.content }
											<br><fmt:formatDate value="${topic.publishTime }" pattern="yyyy-MM-dd HH:mm:ss "/>
							        </font>
							      </div>
							    </div>
							  </li>
							  </c:when>
							  <c:otherwise>
							  <li>				
							    <div class='w'>
							      <div class='f'>
							        <svg viewBox='0 0 180 180'>
							          <image height='100%' preserveAspectRatio='xMidYMid slice' width='100%' xlink:href='./images/img/i-huitzi.png'></image>
							        </svg>
							      </div>
							      <div class='b'>
							        <font style="font-size:7pt;">
							          <img alt="" src="${pageContext.request.contextPath}/${topic.user.face}"
											style="width:25px; height:25px;margin-right:5px;border:1px solid #85735F;"><br>${topic.content }
											<br><fmt:formatDate value="${topic.publishTime }" pattern="yyyy-MM-dd HH:mm:ss "/>
							        </font>
							      </div>
							    </div>
							  </li>
							  </c:otherwise>
							 </c:choose>
							  </c:forEach>
						</ul>
																																
					</div>
											
					<div class="pagination alternate">
						<ul class="clearfix">${pageCode }
						</ul>
				  	 </div>
					<input id="user" name="topic.user.id" value="${currentUser.id }" type="hidden"/>
					<%-- <input id="section" type="hidden" name="topic.section.id" value="${curSection.id }"/> --%>
					
				</form>
				<div class="control-group">
						<div class="controls">
							<a href="topic/leftsecret"><Button  class="btn btn-primary " data-dismiss="modal" aria-hidden="true" type="submit">我要留言</Button></a>
							<font id="error"></font>
						</div>
				</div>
			</td>
		</tr>
	</table>
</div>
<div id="footer" style="width: 1200px; margin: 0 auto;">
	<jsp:include page="./common/footer.jsp"/>
</div>
	
</body>
<script src="js/index.js"></script>
<script src="${pageContext.request.contextPath }/shop/alert/jquery-1.2.6.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.funkyUI.js"></script>
<script src="${pageContext.request.contextPath}/js/ckeditor/ckeditor.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/emoticon.css" />
</html>