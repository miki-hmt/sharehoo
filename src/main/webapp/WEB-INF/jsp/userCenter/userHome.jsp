<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.Date" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link href="${pageContext.request.contextPath}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/userCenter/css/style.css">
    <style>
    *{
        margin: 0;padding: 0;
        font-size: 12px;

    }
    body{
        background: url("${pageContext.request.contextPath}/userCenter/img/1494593195348.jpg") no-repeat;
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
        background-color: rgba(67, 181, 180, 0.70);
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

        /* ---------- cube styles ------------- */
    .cube > .one {
        opacity: 0.8;
        -webkit-transform: scale3d(1.2, 1.2, 1.2) rotateX(90deg) translateZ(100px);
        -moz-transform: scale3d(1.2, 1.2, 1.2) rotateX(90deg) translateZ(100px);
    }

    .cube > .two {
        opacity: 0.8;   /* 2017.05.12  设置图片的透明性  */
        -webkit-transform: scale3d(1.2, 1.2, 1.2) translateZ(100px);
        -moz-transform: scale3d(1.2, 1.2, 1.2) translateZ(100px);
    }

    .cube > .three {
        opacity: 0.8;
        -webkit-transform: scale3d(1.2, 1.2, 1.2) rotateY(90deg) translateZ(100px);
        -moz-transform: scale3d(1.2, 1.2, 1.2) rotateY(90deg) translateZ(100px);
    }

    .cube > .four {
        opacity: 0.8;
        -webkit-transform: scale3d(1.2, 1.2, 1.2) rotateY(180deg) translateZ(100px);
        -moz-transform: scale3d(1.2, 1.2, 1.2) rotateY(180deg) translateZ(100px);
    }

    .cube > .five {
        opacity: 0.8;
        -webkit-transform: scale3d(1.2, 1.2, 1.2) rotateY(-90deg) translateZ(100px);
        -moz-transform: scale3d(1.2, 1.2, 1.2) rotateY(-90deg) translateZ(100px);
    }

    .cube > .six {
        opacity: 0.6;
        -webkit-transform: scale3d(1.2, 1.2, 1.2) rotateX(-90deg) translateZ(100px) rotate(180deg);
        -moz-transform: scale3d(1.2, 1.2, 1.2) rotateX(-90deg) translateZ(100px) rotate(180deg);
    }


    .cube > .seven {
        -webkit-transform: scale3d(0.5, 0.5, 0.5) rotateX(90deg) translateZ(100px) rotate(180deg);
    }

    .cube > .eight {
        -webkit-transform: scale3d(0.5, 0.5, 0.5) translateZ(100px);
    }

    .cube > .nine {
        -webkit-transform: scale3d(0.5, 0.5, 0.5) rotateY(90deg) translateZ(100px);
    }

    .cube > .ten {
        -webkit-transform: scale3d(0.5, 0.5, 0.5) rotateY(180deg) translateZ(100px);
    }

    .cube > .eleven {
        -webkit-transform: scale3d(0.5, 0.5, 0.5) rotateY(-90deg) translateZ(100px);
    }

    .cube > .twelve {
        -webkit-transform: scale3d(0.5, 0.5, 0.5) rotateX(-90deg) translateZ(100px);
    }
    #shape img{
        width:200px;
        height: 200px;
    }

    </style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人主页</title>
</head>
<body>
<div id="main">
        <div id="topDiv">
            <ul class="ul_top">
               <li><img alt="" src="${pageContext.request.contextPath}/${currentUser.face}"
								style="width: 40px; height: 40px;border-radius:50%;">${currentUser.nickName }</i>
               
            </ul>
        </div>

    <div id="leftDiv">
        <div id="stage">
            <div id="shape" class="cube backfaces">
                <div class="plane one"><img src="${pageContext.request.contextPath}/${currentUser.face}"></div>
                <div class="plane two"><img src="${pageContext.request.contextPath}/${currentUser.face}"></div>
                <div class="plane three"><img src="${pageContext.request.contextPath}/${currentUser.face}"></div>
                <div class="plane four"><img src="${pageContext.request.contextPath}/${currentUser.face}"></div>
                <div class="plane five"><img src="${pageContext.request.contextPath}/${currentUser.face}"></div>
                <div class="plane six"><img src="${pageContext.request.contextPath}/${currentUser.face}"></div>
                <!--<div class="plane seven"><img src="img/1.jpg"></div>-->
                <!--<div class="plane eight"><img src="img/1.jpg"></div>-->
                <!--<div class="plane nine"><img src="img/1.jpg"></div>-->
                <!--<div class="plane ten"><img src="img/1.jpg"></div>-->
                <!--<div class="plane eleven"><img src="img/1.jpg"></div>-->
                <!--<div class="plane twelve"><img src="img/1.jpg"></div>-->

            </div>
            <div id="meDiv">
                <label class="lableMiss">I LOVE YOU</label><br>
                <input  class="input_in" type="text" placeholder="鼠标请移到屏幕最右边">
                <div id="in_ease" onclick="login()">
                <span data-icon="&#304"></span>
                </div>
            </div>
    </div>
    </div>
        <div id="rightDiv">
            <header><p>始终相信这段话</p></header>
            <div id="text_Div">
            <p class="p_1">&nbsp;&nbsp;&nbsp;&nbsp;故不能学者：遇师则不中，用心则不专，好之则不</br></br>深，就业则不疾，辩论则不审，教人则不精；於师愠，怀</br></br>於俗，羁神於世，矜势好尤，故湛於巧智，昏於小利，惑</br></br>於嗜欲；问事则前後相悖，以章则有异心，以简则有</br></br>相反；离则不能合，合则弗能离，事至则不能受。此不能</br></br>学者之患也!!!</p>
            </div>
        </div>
    <div id="right_1">
        <ul>
	   <li><a href="User_userCenter.action"><span style="font-size:9pt;font-weight:bold;color:yellow;">回到首页</span></a></li>        
            <li><a href="User_topic.action"><span style="font-size:9pt;">我的帖子</span></a></li>
            <li><a href="User_answer.action"><span style="font-size:9pt;">我的提问</span></a></li>
             <li><a href="User_unReply.action"><span style="font-size:9pt;">信箱(<font style="font-size:9pt;color:yellow;">${count }</font>)</span></a></li>
             <li><a href="${pageContext.request.contextPath }/blog/Blog_show.action?userId=${currentUser.id}" target="_blank"><span style="font-size:9pt;">查看博客</span></a></li>
            <li><a href="${pageContext.request.contextPath }/blog/manage/Article_list.action?userId=${currentUser.id}" target="_blank"><span style="font-size:9pt;">管理博客</span></a></li>
            <li><a href="User_center.action"><span style="font-size:9pt;">个人资料</span></a></li>
            <li><a href="#"><span style="font-size:9pt;">我的好友</span></a></li>
        </ul>
    </div>
</div>
<div id="cava"><canvas id="myCanvas" width="230"height="230"></canvas></div>
<div id="missyou"><label>sharehoo.cn</label></div>
<div id="login">
sharehoo.cn
</div>

</body>
<script  type="text/javascript"src="${pageContext.request.contextPath}/userCenter/js/main.js"></script>
</html>