<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
	<script src="js/jquery-1.11.1.js" type="text/javascript"></script>
	<script src="js/jquery.emoticons.js" type="text/javascript"></script>
	
	<link href="${pageContext.request.contextPath}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />
	<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/bootstrap.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/bootstrap-responsive.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/userCenter/css/style.css">
    
    <script type="text/javascript">
	    $(function(){
	    	//放新浪微博表情txtAreaObj:$("#Content")
	        $("#message_face").jqfaceedit({txtAreaObj:$("#Content"),containerObj:$('#container'),top:25,left:-27});
	    	//CKEDITOR.instances.Content.setData();
	    	 //显示表情
	    	$(".show_e").emotionsToHtml();
	    });
    </script>
    <style>
    *{
        margin: 0;padding: 0;
        font-size: 12px;

    }
    body{
        background:#FFFFFF no-repeat;
        background-size: 100%;

    }
    @font-face {
        font-family: 'iconfont'; src: url('${pageContext.request.contextPath}/userCenter/font/iconfont.eot'); /* IE9*/
        src: url('${pageContext.request.contextPath}/userCenter/font/iconfont.eot?#iefix') format('${pageContext.request.contextPath}/userCenter/embedded-opentype'), /* IE6-IE8 */
        url('${pageContext.request.contextPath}/userCenter/font/iconfont.woff') format('woff'), /* chrome、firefox */ url('${pageContext.request.contextPath}/userCenter/font/iconfont.ttf') format('truetype'), /* chrome、firefox、opera、Safari, Android, iOS 4.2+*/
        url('${pageContext.request.contextPath}/userCenter/font/iconfont.svg#uxiconfont') format('svg'); /* iOS 4.1- */ }

    [data-icon]:before {
        font-family: iconfont;
        content: attr(data-icon);
        speak: none;
    }

    #stage {
        width: 100%;
        height: 100%;
        -webkit-transition: -webkit-transform 2s;
        -webkit-transform-style: preserve-3d;
        -moz-transition: -webkit-transform 2s;
        -moz-transform-style: preserve-3d;
    }

    #shape {
        position: relative;
        top: 160px;
        margin: 0 auto;
        height: 200px;
        width: 200px;
        -webkit-transform-style: preserve-3d;
        -moz-transform-style: preserve-3d;
        transform-style: preserve-3d;
    }

    .plane {
        position: absolute;
        left:0;
        top:0;
        height: 200px;
        width: 200px;
        border: 1px solid white;
        -webkit-border-radius: 12px;
        -webkit-box-sizing: border-box;
        -moz-border-radius: 12px;
        border-radius: 12px;
        -moz-box-sizing: border-box;
        text-align: center;
        font-family: Times, serif;
        font-size: 124pt;
        color: black;
        background-color: rgba(67, 181, 180, 0.60);
        -webkit-transition: -webkit-transform 2s, opacity 2s;
        -webkit-backface-visibility: hidden;
        -moz-transition: -webkit-transform 2s, opacity 2s;
        -moz-backface-visibility: hidden;
    }

    #shape.backfaces .plane {
        -webkit-backface-visibility: visible;
        -moz-backface-visibility: visible;
    }

    #shape {
        -webkit-animation: spin 7s infinite linear;
        -moz-animation: spin 7s infinite linear;

    }

    @-webkit-keyframes spin {
        from { -webkit-transform: rotateY(0);
            -moz-transform: rotateY(0);
        }
        to   { -webkit-transform: rotateY(-360deg);
            -moz-transform: rotateY(-360deg);
        }
    }

    </style>
</head>
<body>
<div style="margin-left:90px;border-bottom:1px solid red;margin-top:60px;">
<div style="width: 100%; margin: 0 auto;background:#F5F5F5;margin-top:10px;">

<div style="background:#F5F5F5;">
<div class="container-fluid">

		<div class="row-fluid">
			<div class="span12">
				<div class="widget-box">
					<div class="widget-title">
						<!-- <span class="icon"> <input type="checkbox"
							id="title-checkbox" name="title-checkbox" />
						</span> -->
						<h5>未读消息：<font style="font-size:8pt;color:red;">共${count}条</font></h5>
					</div>
					<div class="widget-content nopadding">
						<table class="table table-bordered table-striped with-check" style="width:75%;margin:0px auto;">
							<thead>
								<tr>
									<th colspan="3" style="text-align:center;font-size:10pt;">内容</th>					
									<th class="th"style="text-align:center;font-size:10pt;">操作</th>
									<th></th>							
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${unReplyList }" var="reply" varStatus="state">
									<tr>	
										<td colspan="3" style="text-align: left;vertical-align: middle;width: 110px;vertical-align: middle;font-size:10pt;">
											第<font color=red>${state.index+1 }</font>条:
										</td>																										
										<td style="text-align: center;vertical-align: middle;font-size:10pt;"><a href="${host}/admin/reply/update?replyId=${reply.id }">标为已读</a></td>
										<td><input type="checkbox"/></td>																
									</tr>
									<tr>
										<td colspan="5" style="text-align: left;vertical-align: middle;"  class="show_e">
												<font color=silver><fmt:formatDate value="${reply.publishTime }" pattern="yyyy-MM-dd HH:mm:ss "/></font>																																													
												<font style="color:gray;"><br>
												<img alt="" src="${pageContext.request.contextPath}/${uu.get(reply).face }"
													style="width: 25px; height: 25px;border-radius:50%;">${uu.get(reply).nickName }&nbsp;&nbsp;在您的帖子&nbsp;
												<a href="${host}/topic/detail/${to.get(reply).id }" target="_blank">${to.get(reply).title }</a>&nbsp;回复了您：<br>
												<br></font>${reply.content }<br><a href="${host}/topic/detail/${to.get(reply).id }" target="_blank">查看详细细节>></a>												
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
大笨蛋，被骗了
</div>
<div id="main">
        <div id="topDiv">
            <ul class="ul_top">
               <li><img alt="" src="${pageContext.request.contextPath}/${currentUser.face}"
								style="width: 40px; height: 40px;border-radius:50%;">${currentUser.nickName }</i>
                <li><a href="http://sharehoo.cn" target="_blank">网站首页<span data-icon="&#61555"></span></a></li>
               <li><a href="" target="_blank">更换换肤<span data-icon="&#61554"></span></a></li>
               <li><a href="" target="_blank">个性签名<span data-icon="&#61553"></span></a></li>
               <li><a href="" target="_blank">我的博客<span data-icon="&#61552"></span></a></li>
               <li><a href="" target="_blank">我的众筹<span data-icon="&#61551"></span></a></li>
            </ul>
        </div>

        <div id="rightDiv">
            <header><p>始终相信这段话</p></header>
            <div id="text_Div">
            <p class="p_1">&nbsp;&nbsp;&nbsp;&nbsp;故不能学者：遇师则不中，用心则不专，好之则不</br></br>深，就业则不疾，辩论则不审，教人则不精；於师愠，怀</br></br>於俗，羁神於世，矜势好尤，故湛於巧智，昏於小利，惑</br></br>於嗜欲；问事则前後相悖，以章则有异心，以简则有</br></br>相反；离则不能合，合则弗能离，事至则不能受。此不能</br></br>学者之患也!!!</p>
            </div>
        </div>
    <div id="right_1">
        <ul>
	    <li><a href="${host}/user/center?page=1"><span style="font-size:9pt;">回到首页</span></a></li>          
            <li><a href="${host}/user/topic?page=1"><span style="font-size:9pt;">我的帖子</span></a></li>
            <li><a href="${host}/user/answer?page=1"><span style="font-size:9pt;">我的提问</span></a></li>
             <li><a href="${host}/user/reply"><span style="font-size:9pt;font-weight:bold;color:yellow;">信箱(<font style="font-size:9pt;color:yellow;">${count}</font>)</span></a></li>
             <li><a href="${pageContext.request.contextPath }/blog/${currentUser.nickNameId}" target="_blank"><span style="font-size:9pt;">查看博客</span></a></li>
            <li><a href="${host}/blog/manage/article/list?page=1" target="_blank"><span style="font-size:9pt;">管理博客</span></a></li>
            <li><a href="${host}/user/modify"><span style="font-size:9pt;">个人资料</span></a></li>
            <li><a href="#"><span style="font-size:9pt;">我的好友</span></a></li>
        </ul>
    </div>
</div>


</body>
<script  type="text/javascript"src="${pageContext.request.contextPath}/userCenter/js/main.js"></script>
</html>