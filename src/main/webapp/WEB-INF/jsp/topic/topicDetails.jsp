
<%@page import="javax.swing.text.StyleContext.SmallAttributeSet"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <!--修改日期格式只显示年月日  -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>${topic.title}-IT帮-资讯传播社区讨论区</title>
<meta name="Keywords" content="${topic.title}">
<meta name="description" content="${topic.title}" />
<link href="${host}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />

<!--2018.07.18  miki  ckeditor代码高亮	开头这里的样式为默认的风格，可以根据自己的喜好更换风格-->
<!--我的高亮效果是zenburn-->
<link rel="stylesheet" href="${host}/highlight/styles/zenburn.css">
<script src="${host}/highlight/highlight.pack.js"></script>
<script>hljs.initHighlightingOnLoad();</script>

<script type="text/javascript" src="${host}/js/jquery-1.7.2.min.js"></script>

<link href="${host}/css/style3.css" rel="stylesheet" type="text/css" />

<link rel="alternate"  href="//sharehoo.cn/topic/detail/${topic.id}" >
<script src="${host}/js/jquery.emoticons.js" type="text/javascript"></script>

<link rel="stylesheet" type="text/css" href="${host}/css/emoticon.css" />
<link href="${host}/bootstrap/css/bootstrap.css" rel="stylesheet" />
<link href="${host}/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" />

<!--  2018.07.24 代码块样式 -->
<link href="${host}/css/popDrag.css" rel="stylesheet" type="text/css" />

<style type="text/css">
	.demo1 img{ width: 23px; height: 23px; position: absolute; bottom:auto; left: 84%; margin-left: -10px; }
	.demo2 img{ width: 23px; height: 23px; position: absolute; bottom: auto; left: 84%; margin-left: -10px; }
	.demo3 img{ width: 23px; height: 23px; position: absolute; bottom: auto; left: 84%; margin-left: -10px; }
	.demo4 img{ width: 23px; height: 23px; position: absolute; bottom: auto; left: 84%; margin-left: -10px; }
	.demo5 img{ width: 23px; height: 23px; position: absolute; bottom: auto; left: 84%; margin-left: -10px; }
	.demo6 img{ width: 23px; height: 23px; position: absolute; bottom: auto; left: 84%; margin-left: -10px; }
	.demo7 img{ width: 23px; height: 23px; position: absolute; bottom: auto; left: 84%; margin-left: -10px; }
	.demo8 img{ width: 23px; height: 23px; position: absolute; bottom: auto; left: 84%; margin-left: -10px; }
	.demo9 img{ width: 23px; height: 23px; position: absolute; bottom: auto; left: 84%; margin-left: -10px; }
	.demo10 img{ width: 23px; height: 23px; position: absolute; bottom: auto; left: 84%; margin-left: -10px; }
	.demo11 img{ width: 23px; height: 23px; position: absolute; bottom: auto; left: 88%; margin-left: -10px; }
	.demo12 img{ width: 23px; height: 23px; position: absolute; bottom: auto; left: 88%; margin-left: -10px; }
	.demo13 img{ width: 23px; height: 23px; position: absolute; bottom: auto; left: 88%; margin-left: -10px; }
	.demo14 img{ width: 23px; height: 23px; position: absolute; bottom: auto; left: 88%; margin-left: -10px; }
	.demo15 img{ width: 23px; height: 23px; position: absolute; bottom: auto; left: 88%; margin-left: -10px; }
	.demo16 img{ width: 23px; height: 23px; position: absolute; bottom: auto; left: 88%; margin-left: -10px; }
	.demo17 img{ width: 23px; height: 23px; position: absolute; bottom: auto; left: 88%; margin-left: -10px; }
	.demo18 img{ width: 23px; height: 23px; position: absolute; bottom: auto; left: 88%; margin-left: -10px; }
	.demo19 img{ width: 23px; height: 23px; position: absolute; bottom: auto; left: 88%; margin-left: -10px; }
	.demo20 img{ width: 23px; height: 23px; position: absolute; bottom: auto; left: 88%; margin-left: -10px; }
</style>
<link href="${host}/css/style.css" rel="stylesheet" />


<script type="text/javascript" src="${pageContext.request.contextPath }/js/timer.js"></script>
  <script type="text/javascript">
  $(document).ready(function(){
		for(var i=0;i<11;i++){
			var date=$(".time_reply"+i).text();
			$(".time_reply"+i).text(diaplayTime(date));
		}
		var date1=$(".time_topic").text();
		$(".time_topic").text(diaplayTime(date1));
	});
function saveRep(){
     if ('${currentUser.nickName}'==null||'${currentUser.nickName}'=="") {
		tipError("您还未登陆！");
		return false;
	}
     saveReply();		
}

</script>
<script>
	// 网站链接自动推送js代码      2017.09.07
(function(){
    var bp = document.createElement('script');
    var curProtocol = window.location.protocol.split(':')[0];
    if (curProtocol === 'https') {
        bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';        
    }
    else {
        bp.src = 'http://push.zhanzhang.baidu.com/push.js';
    }
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(bp, s);
})();
</script>


<script type="text/javascript">

</script>

<style type="text/css">
.yin{
	display:none;
}
</style>



</head>
<body>

<div class="wrap" style="margin: 0 auto;">
	<jsp:include page="../common/top3.jsp"/>
</div>


                 <!-- 设置背景图片的尺寸2016.08.25 background:url('images/123.jpg') -->
<div style=" width: 1200px;height:100%;margin: 0 auto; background-color:#FFFFFF;">
<div style="width: 1200px; margin: 0 auto;border:1px;">
	<div class="container-fluid" style="padding-left: 0px;padding-right: 2px;">
		<div class="row-fluid" >
			<div class="span2">
				<table style="width: 80%;border:1px solid silver; background-color:#EFF4FB;" cellpadding="5px;">
					<tr>
						<td>
							★楼主&nbsp;
						</td>
					</tr>
					<tr>
						<td>
							<c:choose>
									<c:when test="${(topic.user.face==null||topic.user.face=='')&&topic.user.sex=='男'}">
										<img alt="" src="${host}/images/user/user0.gif" style="width: 50px;height:500px;border-radius:50%;">
									</c:when>
									<c:when test="${(topic.user.face==null||topic.user.face=='')&&topic.user.sex=='女'}">
										<img alt="" src="${host}/images/user/female.gif" style="width: 50px;height: 50px;border-radius:50%;">
									</c:when>
									<c:otherwise>
										<img alt="" src="${host}/${topic.user.face}" style="width: 50px;height: 50px;border-radius:50%;">
									</c:otherwise>
							</c:choose>
							<a href="#" style="font-size: 8pt;color: black;">${topic.user.nickName }</a>
						</td>
					</tr>					
					<tr>
						<td>
							<a href="#" style="font-size: 8pt;color: black;"><strong>性别：${topic.user.sex }</strong></a><br>
							<a href="#" style="font-size: 8pt;color: black;"><strong>积分：${topic.user.score }</strong></a><br>
		
							<c:choose>
									<c:when test="${topic.user.sectionList.size()==0&&topic.user.type!=2 }">
										<font style="font-size: 8pt;color: black;">普通用户</font>
									</c:when>
									<c:when test="${topic.user.sectionList.size()!=0&&topic.user.type!=2 }">
										<font style="font-size: 8pt;color: blue;">版主</font>
										【<c:forEach items="${topic.user.sectionList }" var="section">
					                  	  				${section.name }；
					                  	 </c:forEach>】
					                </c:when>
									<c:otherwise>
										<font style="font-size: 8pt;color: red;">管理员</font>
									</c:otherwise>
								</c:choose>
							</td>
					</tr>
				</table>
			</div>
			<div class="span10">
				<table style="width: 100%;border:1px solid #A9CBEE;">
					<tr style="height: 44px;">
						<td style="background-color:#EFF4FB;">
							【主题】:<strong><font color="red">${topic.title }</font></strong>
						</td>
						
					</tr>
					
					<tr>
						<td>
							<div style="height:auto; width: 975px;padding:4px;font-size:10pt;" class="show_e">
								${topic.content }
							</div>
						</td>
					</tr>
					
					<tr>
						<td style="text-align: right;height: 40px;color:gray;font-size:9pt;background-color:#EFF4FB;">
							&nbsp;<a href="#1" style="font-size: 9pt;margin-right:;color:gray;">发表评论</a>
							&nbsp;&nbsp;&nbsp;<a style="text-align: right;color:gray;font-size:9pt;"> 发表时间:『<span class="time_topic" title="2018-10-30 00:02:32"><fmt:formatDate value="${topic.publishTime }" pattern="yyyy-MM-dd HH:mm:ss "/></span>』</a>
						</td>
					</tr>
					
				</table>
			</div>
		</div>
			
		 <!-- 回复列表2016.08.24 -->
		<c:forEach items="${replyList }" var="reply" varStatus="status">
			<div class="row-fluid" style="margin-top: 20px;">
				<div class="span2">	
				  <!-- 楼主信息所占表格      2016.09.22     -->
					<!-- cellpadding指定单元表格之间的距离 -->
					<table  style="width: 80%; border:1px solid #A9CBEE; background-color:#EFF4FB;" cellpadding="0px;">
						<tr>
							<td>
								▲${(page-1)*10+status.index+1 }楼&nbsp;			
								<a href="#" style="font-size: 8pt;color:gray;text-align:right;" >+关注好友</a>										
							</td>
						</tr>
						<tr>
							<td>
								<c:choose>
										<c:when test="${(reply.user.face==null||reply.user.face=='')&&reply.user.sex=='男'}">
											<img alt="" src="${host}/images/user/user0.gif" style="width: 50px;height: 50px;border-radius:50%;">
										</c:when>
										<c:when test="${(reply.user.face==null||reply.user.face=='')&&reply.user.sex=='女'}">
											<img alt="" src="${host}/images/user/female.gif" style="width: 50px;height: 50px;border-radius:50%;">
										</c:when>
										<c:otherwise>
											<img alt="" src="${host}/${reply.user.face}" style="width: 50px;height: 50px;border-radius:50%;">
										</c:otherwise>
								</c:choose>																			
								
								 <!-- 加载楼主姓名，可以把全部个人信息放入此处，减少空间     2016.09.27-->						                 				                  
								<a href="#" style="font-size: 8pt;color: gray; text-align:right;">						
									<strong>${reply.user.nickName }<br> 性别：${reply.user.sex }&nbsp;&nbsp;&nbsp;<br>
										<c:choose>
												<c:when test="${reply.user.sectionList.size()==0&&reply.user.type!=2 }">
													<font style="color: gray;">用户</font>
												</c:when>
												<c:when test="${reply.user.sectionList.size()!=0&&reply.user.type!=2 }">
													<font style="color: gray;">版主</font>
													<c:forEach items="${reply.user.sectionList }" var="section">
								                  	  				${section.name }
								                  	 </c:forEach>
								                </c:when>
												<c:otherwise>
													<font style="color: red;">管理</font>
												</c:otherwise>
										</c:choose><br>
										积分：${reply.user.score }
									</strong>
								</a>																		
							</td>
						</tr>									
						<!-- 此处存楼主放个人信息  已将表格移到别处 -->				
					</table>
					
				</div>
				
				<!-- 回复帖子所占表格   2016.08.22 -->		                              
				<div class="span10">
					<table style="width: 90%;border:1px solid #A9CBEE;">
						<tr>
							<td style="text-align:left;border:1px solid #A9CBEE;background-color:#EFF4FB; padding:6px;" class="show_e">
							
								<c:choose>
									<c:when test="${currentUser.id==section.master.id && currentUser.id!=null }">
										<button class="btn btn-danger" onclick="javascript:deleteReply(${reply.id })">删除</button>
									</c:when>
									<c:when test="${currentUser.type==2 }">
										<button class="btn btn-danger" onclick="javascript:deleteReply(${reply.id })">删除</button>
									</c:when>
									<c:otherwise>
									</c:otherwise>
								</c:choose>
								<a href="#" style="font-size: 9pt;color:gray;">回复于：<span class="time_reply${status.count}" title="2018-10-30 00:02:32"><fmt:formatDate value="${reply.publishTime }" pattern="yyyy-MM-dd HH:mm:ss "/></span></a>
							</td>
						</tr>
						<tr>
							<td>
								<div style="width: 975px;height:auto;padding:9px;font-size:10pt;" class="show_e">
									${reply.content }<div class="demo${status.index+1 }"></div><div class="demo${status.index+11 }"></div>
								</div>
							</td>
						</tr>
						
						<tr>
							<td style="background-color:#EFF4FB;border:1px solid #A9CBEE;">
								<div style="width: 980px;padding:4px;text-align:right;">
								
								&nbsp;<a href="" style="font-size: 9pt;text-align:right;color:gray;">评论:<font style="color:blue;">[${son.get(reply) }]</font>条</a>
								&nbsp;<a href="#1" style="font-size: 9pt;text-align:right;color:gray;"onclick='replySon("${reply.user.nickName }","${reply.user.id }","${reply.id }")'>回复</a>	
									
								&nbsp;<a href="#1" style="font-size: 9pt;text-align:right;color:gray;"onclick='copy("<c:out value="${reply.content }" escapeXml="true"/>","${(page-1)*10+status.index+1 }")'>引用</a>&nbsp;						
								<a href="javascript:void();" onclick='zan("${status.index+1 }","${reply.id }","${reply.good }")' style="font-size: 9pt;text-align:right;color:gray;text-decoration:none;">
									<span id="good${status.index+1 }">
										<img alt="" src="${host}/images/icon/thumbs10.png" style="width: 16px;height: 16px;">
											[<font id="gd${status.index+1}" style="font-weight:bold;color:red;">${reply.good }</font>]
									</span>
								</a>
																																										
								<a href="javascript:void();" onclick='bad("${status.index+1 }","${reply.id }","${reply.bad}")' style="font-size: 9pt;text-align:right;color:gray;text-decoration:none;">
									<span id="bad${status.index+1}">
										<img alt="" src="${host}/images/icon/dislike3.png" style="width: 32px;height: 25px;">
											[<font id="bd${status.index+1}"	style="font-weight:bold;color:red;">${reply.bad }</font>]
									</span>
								</a>
																																																																																																						
							    &nbsp;<a href="#1" style="font-size: 9pt;text-align:right;color:gray;">举报</a>
		
		
		                           <!-- 引用“回复框”表格    2016.08.24   将其设为display，点击的时候显示此模块 -->
		                           
		 
								</div>
							</td>
						</tr>
						<c:choose>
								<c:when test="${fn:length(sonReplyList.get(reply))>0}">
									<tr style="background:#EFF4FB;">
									<td>							
										<div style="background:#EFF4FB;font-size:9pt;width:67%;" class="show_e">
											<ul>
											<c:forEach items="${sonReplyList.get(reply) }" var="sonReply">
												<dd style="margin-bottom:8px;">
												<table width=100%;>
													<tr>
														<td style="width:78%;">
															<a href="${pageContext.request.contextPath }/blog/${sonReply.user.nickNameId}" target="_blank">
																<img alt="" src="${host}/${sonReply.user.face}" style="width: 27px;height: 27px;border:2px solid #85735F;">${sonReply.user.nickName }</a>&nbsp;回复&nbsp; 
																	<a href="${pageContext.request.contextPath }/blog/${sonReply.sonUser.nickNameId}" target="_blank">
																		<img alt="" src="${host}/${sonReply.sonUser.face}" style="width: 27px;height: 27px;border:2px solid #85735F;">${sonReply.sonUser.nickName}
																	</a>：<pre><code class="language-java hljs"	style="background-color:#FFFFFF;color:gray;">${sonReply.content }</code></pre>
														</td>					
														<td style="width:21%;">
															<fmt:formatDate value="${sonReply.publishTime }" pattern="yy-MM-dd HH:mm "/>&nbsp;
																<a href="#1" style="font-size: 9pt;text-align:right;color:gray;"onclick='replySon("${sonReply.user.nickName }","${sonReply.user.id }","${reply.id }")'>回复</a>
														</td>
													</tr>
												</table>
												</dd>
											</c:forEach>
												<dd>
												<c:choose>
												<c:when test="${son.get(reply)-6>0 }">
												.............................................................................
												还有(${son.get(reply)-6 })条，<a href="/reply/details/${reply.id }" style="font-size: 9pt;text-align:right;color:blue;" target="_blank">查看更多</a>
												</c:when>
												<c:otherwise>
												</c:otherwise>
												</c:choose>
											</dd>	
										</div>
										
									</td>
								</tr>
								</c:when>
								<c:otherwise>
								
								</c:otherwise>
							</c:choose>
					</table>
				</div>
			</div>
		</c:forEach>
	</div>
	<div class="pagination alternate" align="center">
		<c:choose>
			<c:when test="${pageCode =='未查询到数据'}">
				<font style="color:gray;font-size:10pt;">......本帖还没有人回复，说出你的梦想.....</font>
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
				<td style="width: 20%;color:gray;font-size:10pt;">		
				</td>
				<td style="width: 80%;">
					<form id="replyForm" class="form-horizontal" style="margin-top: 10px;">
						<table style="width: 100%;" cellpadding="10px;">
							<input type="hidden" id="title" name="title" style="width: 800px;"/>
							<tr>
								<td style="color:gray;font-size:10pt;">							
								</td>
								<td>
									<div id="container">
									<a href="JavaScript:void(0)" id="message_face">【添加表情包】</a>
									&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="JavaScript:void(0)" onclick="popWin()">【添加代码块】</a>
									</div>
								</td>
							</tr>
							<tr>
								<td style="vertical-align: top;color:gray;font-size:10pt;">						
								</td>
								
								<td>
								<pre id="btn"><code class="language-java hljs">System.out.println("请输入你的代码块...");</code></pre>
								<a name="1"><textarea name="content" id="Content" cols="50" style="height:200px;width: 800px;"placeholder="----发表你的看法----开开心心交流----和和气气讨论----" ></textarea></a>
								</td>						
							</tr>
							<tr>
								<td>
									<input id="userId" name="user.id" value="${currentUser.id }" type="hidden"/>
									<input id="topicId" name="topic.id" value="${topic.id }" type="hidden"/>
									<input id="replySonId" name="sonId" type="hidden"/>
								</td>
								<td>
									<Button class="btn btn-primary " id="okBtn" data-dismiss="modal" aria-hidden="true" type="button">提交</Button>
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


<!-- 自定义弹出框 -->  
<div id="textPopBox" class="popBox">  
    <h3 class="popBoxHandle">请插入代码块</h3>  
    <form action="" method="post">  
        <table width="100%" cellspacing="5">  
                
            <tr rowspan="3" id="reasonText" style="display:block;">  
                <td align="left" width="18"></td> 
                <td align="left"><textarea style="background:transparent;width:420px;height:200px;" id="backReason" name="backReason"></textarea></td>  
            </tr>  
            <tr>  
                <td colspan="2" align="center">  
                    <br />  
                    <input id='ok' type="button" class="button green" value="        确    认        " />        
                    <input id='cancel' type="button" class="button blue" value="        取    消        " />  
                </td>  
            </tr>  
        </table>  
    </form>  
</div>

<script src="${host}/js/PopDrag.js" type="text/javascript"></script>

<script type="text/javascript">  
    //初始化弹出框  
    var p = new PopUp({  
        //isScroll:'disabled'  
        //enableDrag:'disabled'  
        //enableShadow:'disabled'  
        //id为你自己自定义的弹出框div的id  
        id:"textPopBox"  
    });  
  
    //缩放窗口时重新定位弹出框及遮罩层的宽度和高度  
    EventUtil.addEvent(window,'resize', function() {  
        p.setPosition();  
        //如果开启遮罩层，遮罩层元素存在，则重新定位遮罩层  
        p.enableShadow && p.enableShadow.shadow && p.enableShadow.setProperty(p.enableShadow.shadow);  
    });  
    EventUtil.addEvent(EventUtil._$('btn'),'click', function() {  
        p.show({//定义坐标，如果缺省则居中显示  
//            x:100,  
//            y:100  
        });  
    }); 

	function popWin(){
			p.show({//定义坐标，如果缺省则居中显示  
	//            x:100,  
	//            y:100  
	        });
		} 
    EventUtil.addEvent(EventUtil._$('ok'),'click', function() {  
        //自定义点击确定按钮之后得操作  
        var t =$("#backReason").val();
		var content="<pre><code class='language-java hljs'>"+t+"</code></pre>";
		var comment=$("#Content").val();
		$("#Content").val(comment+"<br>"+content);
        //alert(t);  
        //隐藏弹出框  
        p.hide();  
    });  
    EventUtil.addEvent(EventUtil._$('cancel'),'click', function() {  
        //自定义点击取消按钮之后得操作  
          
        //隐藏弹出框  
        p.hide();  
    });  
  
    //当按下ESC键时关闭弹出框  
//    EventUtil.addEvent(document,'keyup',function(e) {  
//        e = e || window.event;  
//        e.keyCode == 27 && p.hide();  
//    });  
  
    EventUtil.addEvent(window,'load',function() {  
        if((isIE6 || isOpera) && p.isScroll != null && p.isScroll == 'enabled') {  
            EventUtil.addEvent(window,'scroll', function() {  
                setTimeout(function() {  
                    p.setPosition();  
                },100);  
            });  
        }  
    });  
      
    //单选按钮的点击切换事件  
    function openText(self) {  
        var value = $(self).val();  
        if ("true"==value) {  
            $('#reasonText').css("display", "");  
        } else {  
            $('#reasonText').css("display", "none");  
        }  
    }  
</script>


                      <!-- 微信二维玛        2017.03.02               -->

<%-- <script src="${host}/js/fun.js" type="text/javascript">
</script> --%>
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
    
    
    //************************ 点赞，踩功能
	var x=0;
	var y=0;
	function zan(order,rid,num){
		var goodx="gd" + order;
		var goody="good" + order;
		var n=$("#"+goodx).text();
		n++;
		x=x+1;
		 if(x>10){
			tipError("点赞过于频繁，歇一歇吧！");
			x=x-1;
		 }else{
			$("#"+goodx).text(n);
			$.post("${host}/reply/dianzan",{rid:rid,num:n},
			function(result){
				if(!result.success){
					tipError("点赞失败，请重试");
				}
			},"json");
		
		 }
		
	}
	
	function zan1(order,rid,num){
	
		var n=$("#gd1").text();
		n++;
		x=x+1;
		if(x>10){
			tipError("点赞过于频繁，歇一歇吧！");
			x=x-1;
		 }else{
			$("#gd1").text(n);
			$.post("${host}/reply/dianzan",{rid:rid,num:n},
			function(result){
				if(!result.success){
					tipError("点赞失败，请重试");
				}
			},"json");
		
		 }
		
		
	}
	
	function bad1(order,rid,num){
		
		var n=$("#bd1").text();
		n++;
		$("#bd1").text(n);
		$.post("${host}/reply/cai",{rid:rid,num:n},
				function(result){
					if(!result.success){
						tipError("出错咯，请重试");
					}
				},"json");
	}
	
	
	function bad(order,rid,num){
		var goodx="bd" + order;
		var goody="bad" + order;
		var n=$("#"+goodx).text();
		n++;
		y=y+1;
		if(y>10){
			tipError("点赞过于频繁，歇一歇吧！");
			y=y-1;
		 }else{
			$("#"+goodx).text(n);
			$.post("${host}/reply/cai",{rid:rid,num:n},
				function(result){
					if(!result.success){
						tipError("出错咯，请重试");
					}
				},"json");
		
		 }
		
	}
	
	$(function () {        
		   $("#good1").click(function(){
		   	 	var x = 100;       
		 		var y = 900;  
		   		var nb = Math.floor(Math.random() * 7 + 1);
		   		var index=$('.demo1').children('img').length;
		   		var rand = parseInt(Math.random() * (x - y + 1) + y); 
		   		
		   		$(".demo1").append("<img src=''>");
		   		$('.demo1 img:eq(' + index + ')').attr('src','${host}/topic/zan/'+nb+'.gif')
		   		$(".demo1 img").animate({
		   			bottom:"800px",
		   			opacity:"0",
		   			left: rand,
		   		},3000)
		   		
		   })
		});
	
	$(function () {        
		   $("#good2").click(function(){
		   	 	var x = 100;       
		 		var y = 900;  
		   		var nb = Math.floor(Math.random() * 7 + 1);
		   		var index=$('.demo2').children('img').length;
		   		var rand = parseInt(Math.random() * (x - y + 1) + y); 
		   		
		   		$(".demo2").append("<img src=''>");
		   		$('.demo2 img:eq(' + index + ')').attr('src','${host}/topic/zan/'+nb+'.gif')
		   		$(".demo2 img").animate({
		   			bottom:"800px",
		   			opacity:"0",
		   			left: rand,
		   		},3000)
		   		
		   })
		});
	
	$(function () {        
		   $("#good3").click(function(){
		   	 	var x = 100;       
		 		var y = 900;  
		   		var nb = Math.floor(Math.random() * 7 + 1);
		   		var index=$('.demo3').children('img').length;
		   		var rand = parseInt(Math.random() * (x - y + 1) + y); 
		   		
		   		$(".demo3").append("<img src=''>");
		   		$('.demo3 img:eq(' + index + ')').attr('src','${host}/topic/zan/'+nb+'.gif')
		   		$(".demo3 img").animate({
		   			bottom:"800px",
		   			opacity:"0",
		   			left: rand,
		   		},3000)
		   		
		   })
		});
	
	$(function () {        
		   $("#good4").click(function(){
		   	 	var x = 100;       
		 		var y = 900;  
		   		var nb = Math.floor(Math.random() * 7 + 1);
		   		var index=$('.demo4').children('img').length;
		   		var rand = parseInt(Math.random() * (x - y + 1) + y); 
		   		//var offset=-$(document).scrollTop()+200;
		   		//tipError(offset);
		   		//$(".demo img").css("bottom",offset);
		   		$(".demo4").append("<img src=''>");
		   		$('.demo4 img:eq(' + index + ')').attr('src','${host}/topic/zan/'+nb+'.gif')
		   		$(".demo4 img").animate({
		   			bottom:"800px",
		   			opacity:"0",
		   			left: rand,
		   		},3000)
		   		
		   })
		});
	
	$(function () {        
		   $("#good5").click(function(){
		   	 	var x = 100;       
		 		var y = 900;  
		   		var nb = Math.floor(Math.random() * 7 + 1);
		   		var index=$('.demo5').children('img').length;
		   		var rand = parseInt(Math.random() * (x - y + 1) + y); 
		   		//var offset=$("#good5").position().top-$(document).scrollTop();
		   		//tipError(offset);
		   		//var offset=$("#good5").position().top;
		   		//alert(offset);
		   		$(".demo5").append("<img src=''>");
		   		$('.demo5 img:eq(' + index + ')').attr('src','${host}/topic/zan/'+nb+'.gif')
		   		$(".demo5 img").animate({
		   			bottom:"800px",
		   			opacity:"0",
		   			left: rand,
		   		},3000)
		   		
		   })
		});
	
	$(function () {        
		   $("#good6").click(function(){
		   	 	var x = 100;       
		 		var y = 900;  
		   		var nb = Math.floor(Math.random() * 7 + 1);
		   		var index=$('.demo6').children('img').length;
		   		var rand = parseInt(Math.random() * (x - y + 1) + y); 
		   		
		   		$(".demo6").append("<img src=''>");
		   		$('.demo6 img:eq(' + index + ')').attr('src','${host}/topic/zan/'+nb+'.gif')
		   		$(".demo6 img").animate({
		   			bottom:"800px",
		   			opacity:"0",
		   			left: rand,
		   		},3000)
		   		
		   })
		});
	
	$(function () {        
		   $("#good7").click(function(){
		   	 	var x = 100;       
		 		var y = 900;  
		   		var nb = Math.floor(Math.random() * 7 + 1);
		   		var index=$('.demo7').children('img').length;
		   		var rand = parseInt(Math.random() * (x - y + 1) + y); 
		   		
		   		$(".demo7").append("<img src=''>");
		   		$('.demo7 img:eq(' + index + ')').attr('src','${host}/topic/zan/'+nb+'.gif')
		   		$(".demo7 img").animate({
		   			bottom:"800px",
		   			opacity:"0",
		   			left: rand,
		   		},3000)
		   		
		   })
		});
	
	$(function () {        
		   $("#good8").click(function(){
		   	 	var x = 100;       
		 		var y = 900;  
		   		var nb = Math.floor(Math.random() * 7 + 1);
		   		var index=$('.demo8').children('img').length;
		   		var rand = parseInt(Math.random() * (x - y + 1) + y); 
		   		
		   		$(".demo8").append("<img src=''>");
		   		$('.demo8 img:eq(' + index + ')').attr('src','${host}/topic/zan/'+nb+'.gif')
		   		$(".demo8 img").animate({
		   			bottom:"800px",
		   			opacity:"0",
		   			left: rand,
		   		},3000)
		   		
		   })
		});
	
	$(function () {        
		   $("#good9").click(function(){
		   	 	var x = 100;       
		 		var y = 900;  
		   		var nb = Math.floor(Math.random() * 7 + 1);
		   		var index=$('.demo9').children('img').length;
		   		var rand = parseInt(Math.random() * (x - y + 1) + y); 
		   		
		   		$(".demo9").append("<img src=''>");
		   		$('.demo9 img:eq(' + index + ')').attr('src','${host}/topic/zan/'+nb+'.gif')
		   		$(".demo9 img").animate({
		   			bottom:"800px",
		   			opacity:"0",
		   			left: rand,
		   		},3000)
		   		
		   })
		});
	
	$(function () {        
		   $("#good10").click(function(){
		   	 	var x = 100;       
		 		var y = 900;  
		   		var nb = Math.floor(Math.random() * 7 + 1);
		   		var index=$('.demo10').children('img').length;
		   		var rand = parseInt(Math.random() * (x - y + 1) + y); 
		   		
		   		$(".demo10").append("<img src=''>");
		   		$('.demo10 img:eq(' + index + ')').attr('src','${host}/topic/zan/'+nb+'.gif')
		   		$(".demo10 img").animate({
		   			bottom:"800px",
		   			opacity:"0",
		   			left: rand,
		   		},3000)
		   		
		   })
		});
	
	
	$(function () {        
		   $("#bad1").click(function(){
		   	 	var x = 100;       
		 		var y = 900;  
		   		var nb = Math.floor(Math.random() * 7 + 1);
		   		var index=$('.demo11').children('img').length;
		   		var rand = parseInt(Math.random() * (x - y + 1) + y); 
		   		
		   		$(".demo11").append("<img src=''>");
		   		$('.demo11 img:eq(' + index + ')').attr('src','${host}/topic/bad/'+nb+'.gif')
		   		$(".demo11 img").animate({
		   			bottom:"800px",
		   			opacity:"0",
		   			left: rand,
		   		},3000)
		   		
		   })
		});
	
	$(function () {        
		   $("#bad2").click(function(){
		   	 	var x = 100;       
		 		var y = 900;  
		   		var nb = Math.floor(Math.random() * 7 + 1);
		   		var index=$('.demo12').children('img').length;
		   		var rand = parseInt(Math.random() * (x - y + 1) + y); 
		   		
		   		$(".demo12").append("<img src=''>");
		   		$('.demo12 img:eq(' + index + ')').attr('src','${host}/topic/bad/'+nb+'.gif')
		   		$(".demo12 img").animate({
		   			bottom:"800px",
		   			opacity:"0",
		   			left: rand,
		   		},3000)
		   		
		   })
		});
	
	$(function () {        
		   $("#bad3").click(function(){
		   	 	var x = 100;       
		 		var y = 900;  
		   		var nb = Math.floor(Math.random() * 7 + 1);
		   		var index=$('.demo13').children('img').length;
		   		var rand = parseInt(Math.random() * (x - y + 1) + y); 
		   		
		   		$(".demo13").append("<img src=''>");
		   		$('.demo13 img:eq(' + index + ')').attr('src','${host}/topic/bad/'+nb+'.gif')
		   		$(".demo13 img").animate({
		   			bottom:"800px",
		   			opacity:"0",
		   			left: rand,
		   		},3000)
		   		
		   })
		});
	
	$(function () {        
		   $("#bad4").click(function(){
		   	 	var x = 100;       
		 		var y = 900;  
		   		var nb = Math.floor(Math.random() * 7 + 1);
		   		var index=$('.demo14').children('img').length;
		   		var rand = parseInt(Math.random() * (x - y + 1) + y); 
		   		
		   		$(".demo14").append("<img src=''>");
		   		$('.demo14 img:eq(' + index + ')').attr('src','${host}/topic/bad/'+nb+'.gif')
		   		$(".demo14 img").animate({
		   			bottom:"800px",
		   			opacity:"0",
		   			left: rand,
		   		},3000)
		   		
		   })
		});
	
	$(function () {        
		   $("#bad5").click(function(){
		   	 	var x = 100;       
		 		var y = 900;  
		   		var nb = Math.floor(Math.random() * 7 + 1);
		   		var index=$('.demo15').children('img').length;
		   		var rand = parseInt(Math.random() * (x - y + 1) + y); 
		   		
		   		$(".demo15").append("<img src=''>");
		   		$('.demo15 img:eq(' + index + ')').attr('src','${host}/topic/bad/'+nb+'.gif')
		   		$(".demo15 img").animate({
		   			bottom:"800px",
		   			opacity:"0",
		   			left: rand,
		   		},3000)
		   		
		   })
		});
	
	
	$(function () {        
		   $("#bad6").click(function(){
		   	 	var x = 100;       
		 		var y = 900;  
		   		var nb = Math.floor(Math.random() * 7 + 1);
		   		var index=$('.demo16').children('img').length;
		   		var rand = parseInt(Math.random() * (x - y + 1) + y); 
		   		
		   		$(".demo16").append("<img src=''>");
		   		$('.demo16 img:eq(' + index + ')').attr('src','${host}/topic/bad/'+nb+'.gif')
		   		$(".demo16 img").animate({
		   			bottom:"800px",
		   			opacity:"0",
		   			left: rand,
		   		},3000)
		   		
		   })
		});
	
	$(function () {        
		   $("#bad7").click(function(){
		   	 	var x = 100;       
		 		var y = 900;  
		   		var nb = Math.floor(Math.random() * 7 + 1);
		   		var index=$('.demo17').children('img').length;
		   		var rand = parseInt(Math.random() * (x - y + 1) + y); 
		   		
		   		$(".demo17").append("<img src=''>");
		   		$('.demo17 img:eq(' + index + ')').attr('src','${host}/topic/bad/'+nb+'.gif')
		   		$(".demo17 img").animate({
		   			bottom:"800px",
		   			opacity:"0",
		   			left: rand,
		   		},3000)
		   		
		   })
		});
	
	$(function () {        
		   $("#bad8").click(function(){
		   	 	var x = 100;       
		 		var y = 900;  
		   		var nb = Math.floor(Math.random() * 7 + 1);
		   		var index=$('.demo18').children('img').length;
		   		var rand = parseInt(Math.random() * (x - y + 1) + y); 
		   		
		   		$(".demo18").append("<img src=''>");
		   		$('.demo18 img:eq(' + index + ')').attr('src','${host}/topic/bad/'+nb+'.gif')
		   		$(".demo18 img").animate({
		   			bottom:"800px",
		   			opacity:"0",
		   			left: rand,
		   		},3000)
		   		
		   })
		});
	
	$(function () {        
		   $("#bad9").click(function(){
		   	 	var x = 100;       
		 		var y = 900;  
		   		var nb = Math.floor(Math.random() * 7 + 1);
		   		var index=$('.demo19').children('img').length;
		   		var rand = parseInt(Math.random() * (x - y + 1) + y); 
		   		
		   		$(".demo19").append("<img src=''>");
		   		$('.demo19 img:eq(' + index + ')').attr('src','${host}/topic/bad/'+nb+'.gif')
		   		$(".demo19 img").animate({
		   			bottom:"800px",
		   			opacity:"0",
		   			left: rand,
		   		},3000)
		   		
		   })
		});
	
	$(function () {        
		   $("#bad10").click(function(){
		   	 	var x = 100;       
		 		var y = 900;  
		   		var nb = Math.floor(Math.random() * 7 + 1);
		   		var index=$('.demo20').children('img').length;
		   		var rand = parseInt(Math.random() * (x - y + 1) + y); 
		   		
		   		$(".demo20").append("<img src=''>");
		   		$('.demo20 img:eq(' + index + ')').attr('src','${host}/topic/bad/'+nb+'.gif')
		   		$(".demo20 img").animate({
		   			bottom:"800px",
		   			opacity:"0",
		   			left: rand,
		   		},3000)
		   		
		   })
		});
	
	  // 楼层回复传参功能实现      2017.02.28     
	function reply(b,a,c){
		 document.getElementById("title").value = c;
	}
	
	//楼层回复传参功能实现      2017.02.28     
	function replySon(b,a,c){
		 document.getElementById("title").value = c;
		 document.getElementById("replySonId").value = a;
		   
	}
	
	
		//引用评论
	function copy(c,d){
			var text4 ="引用【 ";
			var text5="】楼：";
			var text6="：";
			document.getElementById("Content").value = text4+d+text5+c+text6;
			CKEDITOR.instances.Content.setData(text4+d+text5+c+text6);
	
		}
	
	  //简单的 敏感词汇验证  2016.12.13 ....时间允许，可以建一个数据库表，存储相关词汇 
	//定义敏感字符     
	var forbiddenArray =['傻逼','滚','黄色','畜生','sb','尼玛','妈的','反共','草泥马'];
	//定义函数
	function forbiddenStr(str){
	//    var destString = trim(str);
	    var re = '';
	    
	    for(var i=0;i<forbiddenArray.length;i++){
	        if(i==forbiddenArray.length-1)
	            re+=forbiddenArray[i];
	        else
	            re+=forbiddenArray[i]+"|";
	    }
	    //定义正则表示式对象
	    //利用RegExp可以动态生成正则表示式
	    var pattern = new RegExp(re,"g");
	    if(pattern.test(str)){
	        return false;
	    }else{
	        return true;
	    }
	}
	
	$(function(){
	    $("#message_face").jqfaceedit({txtAreaObj:$("#Content"),containerObj:$('#container'),top:25,left:-27});
		 //显示表情
		$(".show_e").emotionsToHtml();
	});
	
	
	//springboot框架提交表单实体对象到后台尽量使用ajax提交，将表单序列化提交	2019.08.31 miki
	$("#okBtn").on("click", function() {
			
		if('${currentUser.nickName}'==null || '${currentUser.nickName}'==''){
			tipError("请先登陆，再回帖！");
			return false;
		}
		if ($("#Content").val().length<10) {
			tipError("最少输入10个字符！");
			return false;
		}
		if ($("#Content").val().length>1000) {
			tipError("最多输入1000个字符！");
			return false;	
		}
		
		//敏感词汇判断   2016.12.13@miki 
		
		if(forbiddenStr($("#Content").val())==true){
			var sonId=$("#replySonId").val();
			if(sonId==""){
				sonId = "0";
			}
			var formData = new FormData($("#replyForm")[0]);
				$.ajax({
					type : "POST",
					url : "${host}/reply/save?sonId="+sonId,
					data : formData,
					cache : false,
					async : false,
					processData : false, //必须false才会避开jQuery对 formdata 的默认处理
					contentType : false, //必须false才会自动加上正确的Content-Type
					success : function(data) {
						if (data.status == 200) {
							tipOk("回复成功!!",function(){
								location.reload();
							});
						} else {
							tipError("回复失败!!" + data.msg);
						}
					}
				});
				return false;	//阻止ajax结束自动刷新页面
		}else{
	        tipError("内容含敏感词汇！请修改后发表 ");
	        return false;
		}
	});
		
			
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
	
	function tipError(content){
		swal("发表失败", content, "error");
	};
	
	/* function saveReply(){
		if('${currentUser.nickName}'==null){
			alert("请先登陆，再回帖！");
			return false;
		}
		if ($("#Content").val().length<10) {
			alert("最少输入10个字符！");
			return false;
		}
		if ($("#Content").val().length>1000) {
			alert("最多输入1000个字符！");
			return false;	
		}
		
		//敏感词汇判断   2016.12.13@miki 
		
		if(forbiddenStr($("#Content").val())==true){
			var sonId=$("#replySonId").val();
			$.post("${host}/reply/save",$("#replyForm").serialize(),function(result){
				if(result.success){
					alert("回复成功！");
					location.reload(true);
				}else{
					alert("回复失败！");
				}
			},"json");
			
		}else{
	        alert("内容含敏感词汇！请修改后发表 ");
	        return false;
		}
		
	} */
	
	function deleteReply(replyId){
		swal({
			title: "您确定要删除这条回复吗？", 
			text: "您确定要删除这条数据？", 
			type: "warning",
			showCancelButton: true,
			closeOnConfirm: false,
			confirmButtonText: "是的，它太碍眼",
			confirmButtonColor: "#ec6c62"
			}, function() {
				$.ajax({
					url: "${host}/reply/delete",
					data: {replyId:replyId},
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

</script>
<br><div style="text-align:center;clear:both"><br>
</div>

<div style="text-align:center;margin:0px 0">
<!--浮动面板-->
<div id="floatPanel">
	<div class="ctrolPanel">
		<a class="arrow" href="#"><span>顶部</span></a>
		
		<a class="contact" href="sharehoo.cn/shop/Shop_home.ation" target="_blank"><span></span></a>
		<a class="qrcode" href="#"><span>文章打赏</span></a>
		<a class="arrow" href="#"><span>底部</span></a></div>

	<div class="popPanel">
		<div class="popPanel-inner">
			<div class="qrcodePanel">
				<img src="${host}/images/miki.jpg" /><span>扫描二维码打赏小编</span></div>
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