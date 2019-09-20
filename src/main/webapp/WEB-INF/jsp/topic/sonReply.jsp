
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
<title>IT帮-资讯传播社区--回复帖子页面</title>
<script src="${pageContext.request.contextPath}/js/ckeditor/ckeditor.js"></script>
<link href="css/style3.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<link href="${pageContext.request.contextPath}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />

<script src="js/jquery-1.11.1.js" type="text/javascript"></script>
<script src="js/jquery.emoticons.js" type="text/javascript"></script>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/emoticon.css" />
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
<link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />

<script src="bootstrap/js/jquery.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="bootstrap/js/bootstrap.js"></script>
<script src="js/fun.js" type="text/javascript"></script>

<script type="text/javascript">

</script>

<style type="text/css">
.yin{
	display:none;
}
.demo1 img{ width: 23px; height: 23px; position: absolute; bottom:auto; left: 84%; margin-left: -10px; }
.demo11 img{ width: 23px; height: 23px; position: absolute; bottom: auto; left: 88%; margin-left: -10px; }
</style>



</head>
<body>

<div class="wrap" style="margin: 0 auto;">
	<jsp:include page="../common/top_sonReply.jsp"/>
</div>


                 <!-- 设置背景图片的尺寸2016.08.25 background:url('images/123.jpg') -->
<div style=" width: 1200px;height:100%;margin: 0 auto; background-color:#FFFFFF;">
<div style="width: 1200px; margin: 0 auto;border:1px;">
	<div class="container-fluid" style="padding-left: 0px;padding-right: 2px;">
			
		                          <!-- 回复列表2016.08.24 -->
		<div class="row-fluid" style="margin-top: 20px;">
			<div class="span2">
												
			                      <!-- 楼主信息所占表格      2016.09.22     -->
								<!-- cellpadding指定单元表格之间的距离 -->
				<table  style="width: 100%; border:1px solid #A9CBEE; background-color:#EFF4FB;" cellpadding="0px;">
					<tr>
						<td>
										
							<a href="#" style="font-size: 8pt;color:gray;text-align:right;" >+关注好友</a>										
						</td>
					</tr>
					<tr>
						<td>
							<c:choose>
									<c:when test="${(reply.user.face==null||reply.user.face=='')&&reply.user.sex=='男'}">
										<img alt="" src="${pageContext.request.contextPath}/images/user/user0.gif" style="width: 100px;height: 100px;border-radius:50%;">
									</c:when>
									<c:when test="${(reply.user.face==null||reply.user.face=='')&&reply.user.sex=='女'}">
										<img alt="" src="${pageContext.request.contextPath}/images/user/female.gif" style="width: 100px;height: 100px;border-radius:50%;">
									</c:when>
									<c:otherwise>
										<img alt="" src="${pageContext.request.contextPath}/${reply.user.face}" style="width: 100px;height: 100px;border-radius:50%;">
									</c:otherwise>
							</c:choose>
																												
							                  <!-- 加载楼主姓名，可以把全部个人信息放入此处，减少空间     2016.09.27-->
							                  					                  
								<a href="#" style="font-size: 8pt;color: gray; text-align:right;">
								
									<strong>${reply.user.nickName }<br> 邮箱：${reply.user.email }<br>性别：${reply.user.sex }&nbsp;&nbsp;&nbsp;<br>
										<c:choose>
												<c:when test="${reply.user.sectionList.size()==0&&reply.user.type!=2 }">
													<font style="color: gray;">普通用户</font>
												</c:when>
												<c:when test="${reply.user.sectionList.size()!=0&&reply.user.type!=2 }">
													<font style="color: gray;">版主:</font>
													<c:forEach items="${reply.user.sectionList }" var="section">
								                  	  				${section.name }
								                  	 </c:forEach>
								                </c:when>
												<c:otherwise>
													<font style="color: red;">管理员</font>
												</c:otherwise>
										</c:choose>
									</strong>
								</a>																			
						</td>
					</tr>																																		
				</table>
			</div>
			
			
			                              <!-- 回复帖子所占表格   2016.08.22 -->
			                              
			                              
			<div class="span10">
				<table style="width: 90%;border:1px solid #A9CBEE;">
					<tr>
						<td style="text-align:left;border:1px solid #A9CBEE;background-color:#EFF4FB; padding:6px;" class="show_e">
						
							<c:choose>
								<c:when test="${currentUser.id==section.master.id && currentUser.id!=null}">
									<button class="btn btn-danger" onclick="javascript:deleteReply(${reply.id })">删除</button>
								</c:when>
								<c:when test="${currentUser.type==2 }">
									<button class="btn btn-danger" onclick="javascript:deleteReply(${reply.id })">删除</button>
								</c:when>
								<c:otherwise>
								</c:otherwise>
							</c:choose>
							<a href="#" style="font-size: 9pt;color:gray;">回复于：<fmt:formatDate value="${reply.publishTime }" pattern="yyyy-MM-dd HH:mm:ss "/></a>
						</td>
					</tr>
					<tr>
						<td>
							<div style="width: 975px;height:auto;padding:6px;font-size:10pt;" class="show_e">
								${reply.content }<div class="demo1"></div><div class="demo11"></div>
							</div>
						</td>
					</tr>
					
					<tr>
						<td style="background-color:#EFF4FB;border:1px solid #A9CBEE;">
							<div style="width: 980px;padding:6px;text-align:right;">
							
							&nbsp;<a href="" style="font-size: 9pt;text-align:right;color:gray;">评论:<font style="color:blue;">[${count }]</font>条</a>
							&nbsp;<a href="#1" style="font-size: 9pt;text-align:right;color:gray;"onclick='replySon("${reply.user.nickName }","${reply.user.id }","${reply.id }")'>回复</a>	
								
							&nbsp;<a href="#1" style="font-size: 9pt;text-align:right;color:gray;"onclick='copy("${reply.content }","${(page-1)*10+status.index+1 }")'>引用</a>						
							<a href="javascript:void();" onclick='zan1("1","${reply.id }","${reply.good }")' style="font-size: 9pt;text-align:right;color:gray;text-decoration:none;">
								<span id="good1">
									<img alt="" src="${pageContext.request.contextPath}/images/icon/thumbs10.png" style="width: 16px;height: 16px;">
										[<font id="gd1">${reply.good }</font>]
								</span>
							</a>
																																									
							<a href="javascript:void();" onclick='bad1("1","${reply.id }","${reply.bad}")' style="font-size: 9pt;text-align:right;color:gray;text-decoration:none;">
								<span id="bad1">
									<img alt="" src="${pageContext.request.contextPath}/images/icon/dislike3.png" style="width: 32px;height: 25px;">
										[<font id="bd1">${reply.bad }</font>]
								</span>
							</a>
																																																																																																					
						    &nbsp;<a href="#1" style="font-size: 9pt;text-align:right;color:gray;">举报</a>
	
	
	                           <!-- 引用“回复框”表格    2016.08.24   将其设为display，点击的时候显示此模块 -->
	                           
	 
							</div>
						</td>
					</tr>
					<tr style="background:#EFF4FB;">
						<td>							
							<div style="background:#EFF4FB;font-size:9pt;width:67%;" class="show_e">
								<ul>
								<c:forEach items="${sonList }" var="sonReply">
									<dd style="margin-bottom:8px;">
									<table width=100%;>
										<tr>
											<td style="width:78%;">
												<a href="${pageContext.request.contextPath }/blog/${sonReply.user.nickNameId}" target="_blank">
													<img alt="" src="${pageContext.request.contextPath}/${sonReply.user.face}" style="width: 27px;height: 27px;border:2px solid #85735F;">${sonReply.user.nickName }</a>&nbsp;回复&nbsp; 
														<a href="${pageContext.request.contextPath }/blog/${sonReply.sonUser.nickNameId}" target="_blank">
															<img alt="" src="${pageContext.request.contextPath}/${sonReply.sonUser.face}" style="width: 27px;height: 27px;border:2px solid #85735F;">${sonReply.sonUser.nickName}
														</a>：${sonReply.content }
											</td>					
											<td style="width:21%;">
												<fmt:formatDate value="${sonReply.publishTime }" pattern="yy-MM-dd HH:mm "/>&nbsp;
													<a href="#1" style="font-size: 9pt;text-align:right;color:gray;"onclick='replySon("${sonReply.user.nickName }","${sonReply.user.id }","${Reply.id }")'>回复</a>
											</td>
										</tr>
									</table>
									</dd>
								</c:forEach>
									
							</div>
							
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div class="pagination alternate" align="center">
		<c:choose>
			<c:when test="${pageCode =='未查询到数据'}">
				本帖还没有人回复
			</c:when>
			<c:otherwise>
				<ul class="clearfix">
					${pageCode }
				</ul>
			</c:otherwise>
		</c:choose>
	</div>
	
	
	
	
	<div>
	
	
	                           <!-- 回复框表格    2016.08.24 -->
	                           
	                           
	                           
		<table >
			<tr>
				<td style="width: 20%;">
					回帖事项：开开心心交流<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;和和气气讨论
				</td>
				<td style="width: 80%;">
					<form id="replyForm" class="form-horizontal" style="margin-top: 10px;">
					<table style="width: 100%;" cellpadding="10px;">
						
						<input type="hidden" id="title" name="reply.title" value="${reply.id }" style="width: 800px;">
						<tr>
							<td>
								【表情】:
							</td>
							<td>
								<div id="container">
								<a href="JavaScript:void(0)" id="message_face">请选择...</a>
								</div>
							</td>
						</tr>
						<tr>
							<td style="vertical-align: top;">
								<a name="1">【我也说一句】:</a>
							</td>
							<td>
							<textarea name="reply.content" id="Content" cols="50" style="height:200px;width: 800px;" ></textarea>
							</td>
						</tr>
						<tr>
							<td>
								<input id="userId" name="reply.user.id" value="${currentUser.id }" type="hidden"/>			
								<input id="topicId" name="reply.topic.id" value="${reply.topic.id }" type="hidden"/>
								<input id="replySonId" name="sonId" type="hidden"/>
							</td>
							<td>
								<Button class="btn btn-primary " data-dismiss="modal" aria-hidden="true" type="button" onclick="javascript:saveReply()">提交</Button>
								<font id="error"></font>
							</td>
						</tr>
					</table>
					</form>
				</td>
			</tr>
		</table>
	</div>
</div>
</div>



                      <!-- 返回顶部 代码        2017.03.02               -->


<script type="text/javascript">

	    $(function(){

        // 页面浮动面板
        $("#floatPanel > .ctrolPanel > a.arrow").eq(0).click(function(){$("html,body").animate({scrollTop :0}, 800);return false;});
        $("#floatPanel > .ctrolPanel > a.arrow").eq(1).click(function(){$("html,body").animate({scrollTop : $(document).height()}, 800);return false;});

        var objPopPanel = $("#floatPanel > .popPanel");	
        var w = objPopPanel.outerWidth();
        $("#floatPanel > .ctrolPanel > a.qrcode").bind({
            mouseover : function(){
                        objPopPanel.css("width","0px").show();
                        objPopPanel.animate({"width" : w + "px"},300);return false;
                },
                mouseout : function(){
                        objPopPanel.animate({"width" : "0px"},300);return false;
                        objPopPanel.css("width",w + "px");
            }	
        });
    });
</script>
<br><div style="text-align:center;clear:both"><br>
</div>

<div style="text-align:center;margin:0px 0">
<!--浮动面板-->
<div id="floatPanel">
	<div class="ctrolPanel">
		<a class="arrow" href="#"><span>顶部</span></a>
		
		<a class="contact" href="http://www.baidu.com/" target="_blank"><span></span></a>
		<a class="qrcode" href="#"><span>微信二维码</span></a>
		<a class="arrow" href="#"><span>底部</span></a></div>

	<div class="popPanel">
		<div class="popPanel-inner">
			<div class="qrcodePanel">
				<img src="images/miki.png" /><span>扫描二维码关注网站最新动态</span></div>
			<div class="arrowPanel">
				<div class="arrow01">
				</div>
				<div class="arrow02">
				</div>
			</div>
		</div>
	</div>
</div>
</div>




        <!-- 回复界面不需要底部管理员登录选项footer.jsp       2016.09.27-->

<script type="text/javascript">
       
</script>
</body>
</html>