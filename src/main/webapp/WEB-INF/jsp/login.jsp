<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>IT帮-资讯传播社区--登陆</title>
<link href="${pageContext.request.contextPath}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />
<script type="text/javascript" src="login-style/js/jquery-1.12.3.min.js"></script>
<style>
</style>
<script type="text/javascript">
function loadimage(){
	document.getElementById("randImage").src = "imageCode?"+Math.random();
}

function checkForm(){
	 var imageCode=$("#txtCode").val();
	 
	 if(imageCode==""){
		 Tip('验证码不能为空！');
		 return false;
	 }
	 return;
}

</script>


<link type="text/css" href="login-style/css/base.css" rel="stylesheet" />
<link href="login-style/css/style.css" rel="stylesheet" />

</head>

<body style="background: #f6f6f6">

<div class="wrapper" id="login_head" style="display:">
	<div class="log_head">
		<h1 class="log_logo left"><a href="javascript:;"><span>欢迎登录</span></a></h1>
	</div>
</div>
<div class="login_wrap" style="width:; background:#fff url(login-style/images/20161209115754_5628.png) no-repeat center top; padding:40px 0;">
	<div class="wrapper" id="login_body" style="width:;">
		<div class="log_ad" style="display:"><a href="javascript:;"></a></div>
		<div class="login_border" style="padding:8px;">
		<form method="post" action="user/login" onsubmit="return checkForm()" id="login_form">
			<div class="login" style="display: block;">
				<div style="position:absolute; right:30px; top:14px;">
					<a href="register.jsp" target="_blank">账号注册
					<em style="width:16px; height:16px; background:#999; float:right; color:#fff; border-radius:100%; text-align:center; line-height:16px; margin:1px 0 0 5px; font-family:'宋体'; font-weight:bold;">&gt;</em>
					</a>
				</div>
				<ul class="login-tab">
					<li class="login-on">普通登录</li>
					<li>手机登录</li>
				</ul>
				<div class="login-body">
					<div class="login-style" style="display: block;">
						<dl><dd><input id="txtUser" type="text" name="nickName" placeholder="用户名/邮箱/手机号" /></dd></dl>
						<dl>
							<dd><input type="password" name="password" id="Userpwd" placeholder="请输入您的密码" /></dd>
						</dl>
					    <dl id="logincode" style="display: block;">
						<dd><input type="text" value="${imageCode }" id="txtCode" name="imageCode" style="width: 133px; margin-right: 10px;" placeholder="验证码" />
						<!-- <div class="mui-content">
            				<div class="mui-input-row login_input">
								<div id="verificationCode" class="verificationCode">
	                    			<canvas width="100" height="40" id="verifyCanvas"></canvas>
	                    			<img id="code_img">
	                			</div>
	                			</div>
	                			</div> -->
							<img id="randImage" src="imageCode" width="90" height="34" name="randImage" title="点击换一个" 
								style="vertical-align: middle; margin-top: -56px;margin-left:177px;" onclick="javascript:loadimage();" />
							</dd>
						</dl>
						<div class="psword" style="margin-top:15px;"><a href="user/forget" onClick="zhaohui(this)" tabindex="-1" class="right" target="_blank">忘记密码?</a></div>
						<div class="remember">
							<input type="checkbox" id="issave" checked /><label for="issave">下次自动登录</label>
						</div>
						<div class="tishi">${error }</div>
						<button  onClick="cliLogin()" id="logbtn" style="outline:none">登 录</button>
					</div>
					<div class="login-style">
						<dl><dd><input name="phone" type="text" id="phone" placeholder="您的手机号码" /></dd></dl>
						<!-- <dl id="yz-code" style="display: none;">
						<dd><input type="text" id="txtCode2" name="txtCode2" style="width: 133px; margin-right: 10px;" placeholder="验证码" /><img id="Img1" src="" width="90" height="34" title="点击换一个" style="vertical-align: middle; margin-top: -4px;" onclick="this.src='/ImgCode.aspx?t='+Math.random()*100" /></dd>
						</dl> -->
						<dl>
							<dd><input type="text" id="dynamicPWD" onKeyDown="enterHandler(event)" style="width: 133px;" placeholder="短信验证码" /><input type="button" id="btn" class="btn_mfyzm" value="获取动态密码" onClick="Sendpwd(this)" /></dd>
						</dl>
						<div class="remember">
							<input type="checkbox" id="issave1" checked /><label for="issave1">下次自动登录</label>
						</div>
						<div class="tishi"></div>
						<button id="dynamicLogon" style="outline:none" onclick="javascript:login()">登 录</button>
					</div>
				</div>
				<div class="hezuo">
					<h3>使用合作网站的账号登录：</h3>
					<p>
						<a href="javascript:;" onClick="showWxlog()"><i class="wx"></i>微信</a>
						<a href="javascript:;" onClick="qqLogin()"><i class="qq"></i>QQ号</a>
					</p>
				</div>
				<div class="qiehuan"></div>
				<div id="zhishi" style="position:absolute; right:-185px; bottom:0; cursor:pointer;"><img src="login-style/images/zhishi2.png" /></div>
			</div>
			<div class="login" style="display: none;">
				<i class="qiehuan" style="background-position:left bottom;"></i>
				<div class="app_login">
					<h1><i>-</i>登录失败，请刷新二维码后重试！</h1>
					<h2>使用社区APP&nbsp;&nbsp;扫码安全登录</h2>
				</div>
				<div class="app_code"><img id="appLoginCode" src="" /></div>
				<div class="shuaxin">
					<span>刷新二维码</span>
					<p><a href="javascript:;" target="_blank">查看使用帮助</a></p>
				</div>
			</div>
		</form>
		</div>
		<div class="clear" id="clear"></div>
	</div>
</div>
<div class="wxlogma">
	<a class="close" onClick="closewx()"></a>
	<h3>微信扫一扫二维码登录</h3>
	<iframe width="200" height="200" scrolling="no" frameborder="0" id="weixinCode"></iframe>
</div>
<div id="bindweixin" style="display:none;">
	<div class="bindWeixin">
		<p class="login-success">登录成功！</p>
		<div class="login-tips">为了您的帐号安全，建议绑定微信号</div>
		<img id="twocodetemp" src="#" />
	</div>
</div>
<div class="bottom">
	<div class="wrapper">
		<div class="foot_nav">
			<a href="http://sharehoo.cn" rel="nofollow">sharehoo社区</a><i>|</i>
			<a href="http://sharehoo.cn/shop/Shop_home.action" rel="nofollow">sharehoo下载频道</a><i>|</i>
			<a href="http://sharehoo.cn/shop/Source_search.action" rel="nofollow">资源搜索</a><i>|</i>
			<a href="http://sharehoo.cn/blog/Blog_show.action?userId=21" rel="nofollow">博客</a><i>|</i>
			<a href="http://sharehoo.cn/Topic_list.action?sectionId=2" rel="nofollow">二手集市</a><i>|</i>
			<a href="http://sharehoo.cn/Topic_list.action?sectionId=21" rel="nofollow">原创社区</a><i>|</i>
			<a href="http://sharehoo.cn/Topic_leaveList.action" rel="nofollow">吐槽树洞</a><i>|</i>
			<a href="http://sharehoo.cn/Topic_list.action?sectionId=4" rel="nofollow">集思广益</a><i>|</i>
			<a href="http://sharehoo.cn/Topic_list.action?sectionId=11" rel="nofollow">发帖求助</a><i>|</i>
			<a href="http://sharehoo.cn/login.jsp?prePage=http://sharehoo.cn/shop/Shop_home.action" rel="nofollow">我的店铺</a><i>|</i>
		</div>
		<div class="copy">
			<p>sharehoo.cn资讯交流平台--专注于程序员开发道路的技术分享，问题解决。
	会员可以发帖交流与讨论，每个人都有一个个人博客，可以在上面写下自己的心得与感悟。同时提供资源下载，开源源码下载，课程设计，专注于服务大学生。 &nbsp;&nbsp;&nbsp;&nbsp; </p>
			<p>网站ICP备案号：<a rel="nofollow" href="http://www.miitbeian.gov.cn/" target="_blank">豫ICP备17017216号-1</a> &nbsp;&nbsp;&nbsp;&nbsp; </p>
			<p>Copyright © 2016 - 2018 IT帮-资讯传播社区 All Rights Reserved</p>
		</div>
	</div>
</div>
<script type="text/javascript" src="login-style/js/style.js"></script>

<script type="text/javascript">

 function login(){
	 $.ajax({
       type: "POST",
       url: "user/login",
       data: $("#login_form").serialize(),
       success: function (data) {}
   	});
	 //$.post("user/login", $("#fm").serialize());
	 alert("保存成功！");
 }
 
</script>
</body>


</html>