<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/bootstrap.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/bootstrap-responsive.min.css" />
	<link href="${pageContext.request.contextPath}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/userCenter/css/style.css">
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
<div style="height:10px;"></div>
<div style="width: 100%; margin: 0 auto;background:#F5F5F5;margin-top:10px;">

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
</div>
sharehoo.cn
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
	    <li><a href="User_userCenter.action"><span style="font-size:9pt;">回到首页</span></a></li>
            <li><a href="User_center.action"><span style="font-size:9pt;font-weight:bold; color:yellow;">个人资料</span></a></li>
            <li><a href="User_topic.action"><span style="font-size:9pt;">我的帖子</span></a></li>
            <li><a href="User_answer.action"><span style="font-size:9pt;">我的提问</span></a></li>
             <li><a href="User_unReply.action"><span style="font-size:9pt;">站内信箱</span></a></li>
              <li><a href="${pageContext.request.contextPath }/blog/Blog_show.action?userId=${currentUser.id}" target="_blank"><span style="font-size:9pt;">查看博客</span></a></li>
            <li><a href="${pageContext.request.contextPath }/blog/manage/Article_list.action?userId=${currentUser.id}" target="_blank"><span style="font-size:9pt;">管理博客</span></a></li>
            <li><a href="#"><span style="font-size:9pt;">我的好友</span></a></li>
        </ul>
    </div>
</div>


</body>
<script  type="text/javascript"src="${pageContext.request.contextPath}/userCenter/js/main.js"></script>
</html>