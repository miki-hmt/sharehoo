<!DOCTYPE html>
<!-- saved from url=(0100)https://user.skyeye.qianxin.com/user/forgot-password?next=https%3A//wangzhan.qianxin.com/login/login -->
<html lang="zh">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta id="meta-user-id" data-name="">
<meta id="meta-user" data-name="">
<title>密码找回&nbsp;IT帮-资讯交流社区</title>
<link href="${pageContext.request.contextPath}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />
<!-- styles -->
<link rel="stylesheet" type="text/css"
	href="${host}/userCenter/find/css/pure&amp;&amp;nprogress.min.css">
<link rel="stylesheet" type="text/css"
	href="${host}/userCenter/find/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="${host}/userCenter/find/css/animate.min.css">
<link rel="stylesheet" type="text/css"
	href="${host}/userCenter/find/css/bootstrap.min.css">

<!-- scripts -->
<!-- 2019.09.03 自定义弹窗所需插件 -->
<link rel="stylesheet" type="text/css" href="${host}/sweetalert/sweetalert.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
<script src="${host}/sweetalert/sweetalert.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.messages_cn.js"></script>

<script type="text/javascript"
	src="${host}/userCenter/find/js/browser-polyfill.min.js"></script>
<script type="text/javascript"
	src="${host}/userCenter/find/js/d3.min.js"></script>
<script type="text/javascript"
	src="${host}/userCenter/find/js/moment.min.js"></script>
<script type="text/javascript"
	src="${host}/userCenter/find/js/jquery.raty-fa&amp;&amp;scrollTo.js"></script>
<script type="text/javascript"
	src="${host}/userCenter/find/js/highcharts.js"></script>
<script type="text/javascript" src="${host}/userCenter/find/js/map.js"></script>
<script type="text/javascript" src="${host}/userCenter/find/js/world.js"></script>
<script type="text/javascript"
	src="${host}/userCenter/find/js/tinymce.min.js"></script>

<link rel="stylesheet" href="${host}/userCenter/find/css/layer.css"/>
<script type="text/javascript"
	src="${host}/userCenter/find/js/require.min.js"></script>
<script type="text/javascript"
	src="${host}/userCenter/find/js/bootstrap.min.js"></script>
<style type="text/css">
a:hover, a:focus {
	color: #42a9f4;
}

input[type=button] {
	width: 136px;
	height: 32px;
	padding: 0;
	line-height: 16px;
}

.form-captcha {
	color: #465360;
}

.label-captcha, .label-captcha-register-en, .label-captcha-register-zh,
	.label-captcha-login {
	display: inline-block;
	width: 136px;
	color: #465360;
}

.label-captcha-register-zh::after {
	content: '*';
	color: red;
	position: relative;
	left: 78px;
}

.label-captcha-register-en::after {
	content: '*';
	color: red;
	position: relative;
	left: 62px;
}

.input-captcha {
	border: 1px solid #e7eaf1;
	border-radius: 2px;
	padding: 3px 8px;
	line-height: 36px;
	height: 36px;
}

.captcha-img {
	float: right;
	cursor: pointer;
	margin: 0 auto;
}

.layui-layer-title {
	color: #fff;
	background-color: #121d32;
}

.layui-layer-setwin {
	display: none;
}

.register-notice {
	font-size: 14px;
}

.user-protocol {
	cursor: pointer;
}

.title {
	margin-top: 36px;
	font-weight: 700;
	padding: 0 36px;
}

.p-head-login {
	padding: 10px 36px;
	font-weight: 700;
}

.p-login {
	margin-top: 10px;
	padding: 0 36px;
}

.signature {
	margin-top: 30px;
}

.ti {
	float: right;
	margin-right: 36px;
}

.now-register img {
	width: 16px;
	height: 16px;
	margin-top: 10px;
}

.checkbox-bg {
	background: url(/static/resources/checkbox-normal.png) no-repeat;
}

.checkbox-checked {
	background: url(/static/resources/checkbox-click.png) no-repeat;
}

.readStatus {
	display: inline-block;
	width: 14px;
	height: 14px;
	margin-left: 30px;
	vertical-align: middle;
}

.read-state {
	display: inline-block;
	font-size: 12px;
	color: #6d6b6b;
	cursor: pointer;
}
</style>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="main.min"
	src="${host}/userCenter/find/js/main.min.js"></script>
<style type="text/css">
#ti-message {
	font-size: 14px;
	position: fixed;
	z-index: 10006;
	top: 40px;
	left: calc(50% - 180px);
	width: 360px;
	word-wrap: break-word;
	word-break: break-all;
	color: rgba(255, 255, 255, .8)
}

#ti-message .message-body {
	position: relative;
	width: 100%;
	margin-bottom: 10px;
	padding: 10px;
	text-align: center;
	border-radius: 3px
}

#ti-message .message-success {
	background: #1cb841
}

#ti-message .message-danger {
	background: #ca3c3c
}

#ti-message .message-info {
	background: #42b8dd
}

#ti-message .message-warning {
	background: #df7514
}

#bases-modal {
	position: fixed;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	z-index: 10004;
	overflow: hidden;
	min-width: 1024px
}

#bases-modal .bases-modal {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	outline: 0;
	background: rgba(0, 0, 0, .4);
	overflow: auto;
	-webkit-overflow-scrolling: touch
}

#bases-modal .bases-modal .modal-dialog {
	width: 80%;
	min-width: 600px;
	margin: 10px auto
}

#bases-modal .bases-modal .modal-dialog .modal-content {
	box-shadow: 0 27px 24px 0 rgba(0, 0, 0, .2), 0 40px 77px 0
		rgba(0, 0, 0, .22);
	border-radius: 2px;
	border: 0;
	position: relative;
	background-color: #fff
}

#bases-modal .bases-modal .modal-dialog .modal-content .modal-header {
	border-bottom: 0;
	padding: 24px 24px 0
}

#bases-modal .bases-modal .modal-dialog .modal-content .modal-header .close
	{
	float: right;
	cursor: pointer;
	border: 0;
	background: 0 0
}

#bases-modal .bases-modal .modal-dialog .modal-content .modal-header .close span
	{
	display: inline-block;
	height: 12px;
	width: 12px;
	background:
		url("/static/resources/bab4204b6c12898a18b37a30a4935e74.close.png")
}

#bases-modal .bases-modal .modal-dialog .modal-content .modal-header .modal-title
	{
	margin: 0
}

#bases-modal .bases-modal .modal-dialog .modal-content .modal-body {
	padding: 24px 24px 16px
}

#bases-dialog {
	position: fixed;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	z-index: 10005;
	overflow: hidden;
	-webkit-overflow-scrolling: touch;
	outline: 0;
	background: rgba(0, 0, 0, .6)
}

#bases-dialog .modal-dialog {
	width: 40%;
	min-width: 300px;
	margin: 10px auto
}

#bases-dialog .modal-dialog .modal-content {
	box-shadow: 0 27px 24px 0 rgba(0, 0, 0, .2), 0 40px 77px 0
		rgba(0, 0, 0, .22);
	border-radius: 2px;
	border: 0;
	position: relative;
	background-color: #fff
}

#bases-dialog .modal-dialog .modal-content .modal-header {
	border-bottom: 0;
	padding: 24px 24px 0
}

#bases-dialog .modal-dialog .modal-content .modal-header .close {
	float: right;
	cursor: pointer;
	border: 0;
	background: 0 0
}

#bases-dialog .modal-dialog .modal-content .modal-header .close span {
	display: inline-block;
	height: 12px;
	width: 12px;
	background:
		url("/static/resources/bab4204b6c12898a18b37a30a4935e74.close.png")
}

#bases-dialog .modal-dialog .modal-content .modal-header .modal-title {
	margin: 0
}

#bases-dialog .modal-dialog .modal-content .modal-body {
	padding: 24px 24px 16px
}

#bases-dialog .modal-dialog .modal-content .modal-footer {
	padding: 0 23px 20px;
	font-size: 12px;
	text-align: right
}

#bases-dialog .modal-dialog .modal-content .modal-footer .modal-button-no
	{
	padding: 0;
	height: 24px;
	width: 60px;
	background: #dadee6;
	color: #5c6773
}

#bases-dialog .modal-dialog .modal-content .modal-footer .modal-button-yes
	{
	padding: 0;
	height: 24px;
	width: 60px;
	color: #fff;
	background: #42a9f4
}

html, body, h1, h2, h3, div, p, form, ul, ol, li, table, th, td, label,
	pre, input, select, textarea {
	margin: 0;
	padding: 0;
	box-sizing: border-box
}

li {
	list-style: none
}

a {
	text-decoration: none;
	color: #42a9f4
}

button, input {
	outline: 0
}

* {
	font-family: 'Microsoft YaHei', '微软雅黑', arial, helvetica, sans-serif
}

html, body {
	font-size: 14px;
	position: absolute;
	top: 0;
	left: 0;
	overflow-x: hidden;
	width: 100%;
	min-width: 1280px;
	height: 100%;
	margin: 0;
	padding: 0;
	background: #e4e7f1
}

#flash-messages {
	font-size: 14px;
	position: fixed;
	z-index: 4;
	top: 40px;
	left: calc(50% - 180px);
	width: 360px;
	word-wrap: break-word;
	word-break: break-all;
	color: rgba(255, 255, 255, .8)
}

#flash-messages .message-body {
	position: relative;
	width: 100%;
	margin-bottom: 10px;
	padding: 10px;
	text-align: center;
	border-radius: 3px
}

#flash-messages .message-success {
	background: #1cb841
}

#flash-messages .message-error {
	background: #ca3c3c
}

#block-header {
	position: relative;
	width: 100%;
	height: 30px;
	background: #111d33;
	visibility: visible !important;
	z-index: 10
}

#block-header .header-links {
	display: block;
	float: left;
	margin-bottom: 0;
	margin-left: 41px;
	padding-left: 0;
	list-style: none
}

#block-header .header-links.header-links-right {
	float: right;
	margin-right: 41px;
	margin-left: 0
}

#block-header .header-links li {
	line-height: 30px;
	position: relative;
	display: block;
	float: left;
	padding-right: 10px;
	padding-left: 10px
}

#block-header .header-links li:nth-child(n+2) {
	margin-left: 15px
}

#block-header .header-links li a {
	color: #fff
}

#block-header .header-lang {
	float: right;
	margin-right: 15px;
	height: 100%;
	width: 80px;
	display: inline-block;
	text-align: center
}

#block-header .header-lang .curr-lang {
	width: 100%;
	height: 100%;
	border: 0;
	background: 0 0;
	padding: 0;
	color: #fff
}

#block-header .header-lang .dropdown-menu {
	top: 30px;
	width: 100%;
	display: none;
	transition: display .3s;
	background: #111d33
}

#block-header .header-lang .dropdown-menu a {
	display: inline-block;
	width: 100%;
	height: 100%;
	color: #8f9daa !important;
	line-height: 25px;
	border-top: 1px solid
}

#block-header .header-lang .dropdown-menu a.active {
	background: #42a9f4;
	color: #fff !important
}

#block-header .header-lang:hover {
	border-top: 2px solid #42a9f4
}

#block-header .header-lang:hover .dropdown-menu {
	display: block
}

#block-header .header-user {
	z-index: 2;
	display: block;
	float: right;
	width: 80px;
	height: 100%
}

#block-header .header-user .header-user-icon {
	line-height: 30px;
	width: 100%;
	padding: 0;
	cursor: pointer;
	border: 0;
	background: 0
}

#block-header .header-user .header-user-icon:before {
	display: inline-block;
	width: 18px;
	height: 18px;
	margin: 0 5px;
	content: '';
	vertical-align: middle;
	background:
		url("/static/resources/a0966304b02e9fc730ffa4652c6e16a2.admin.png")
		no-repeat
}

#block-header .header-links li:hover, #block-header .header-links li.header-link-active,
	#block-header .header-user:hover .header-user-icon, #block-header .header-user.header-user-active .header-user-icon
	{
	line-height: 28px;
	border-top: 2px solid #42a9f4
}

#block-header .header-userinfo {
	font-size: 12px;
	position: absolute;
	z-index: 1000;
	right: -240px;
	width: 239px;
	transition: right .3s;
	color: #465360;
	background: #fff;
	border: 1px solid #42a9f4;
	border-top: 0;
	border-right: 0
}

#block-header .header-user:hover .header-userinfo {
	right: 0
}

#block-header .header-userinfo-top {
	display: -webkit-box;
	display: -moz-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex
}

#block-header .header-userinfo-top .header-userinfo-icon {
	width: 36px;
	height: 36px;
	margin-right: 20px;
	background:
		url("/static/resources/dd505766e0917fc396e5a466df7fb687.user.png")
}

#block-header .header-userinfo-top .header-userinfo-info {
	flex: 1
}

#block-header .header-userinfo-top .header-userinfo-info p {
	line-height: 20px
}

#block-header .header-userinfo-middle {
	padding-top: 0 !important;
	padding-left: 68px !important;
	border-bottom: 1px solid #aaa
}

#block-header .header-userinfo-bottom {
	text-align: right
}

#block-header .header-userinfo-top, #block-header .header-userinfo-middle,
	#block-header .header-userinfo-bottom {
	padding: 12px
}

#block-content {
	position: relative;
	overflow: auto;
	width: 100%;
	height: -webkit-calc(100% - 30px);
	height: -mos-calc(100% - 30px);
	height: calc(100% - 30px);
	padding-bottom: 20px;
	visibility: visible !important
}

#block-footer {
	position: fixed;
	bottom: 15px;
	left: 0;
	width: 100%;
	text-align: center;
	color: #999;
	font-size: 12px;
	line-height: 25px
}

#block-footer .ghs-img {
	display: inline-block;
	height: 20px;
	width: 20px;
	background:
		url("/static/resources/28d6c6ed04c75d5b0b654db4d33bff3b.ghs.png");
	margin-right: 5px;
	vertical-align: middle
}

#contractus {
	position: fixed;
	bottom: 15px;
	left: 15px;
	width: 106px;
	height: 128px;
	transition: width .3s, height .3s;
	background: url("/upload/erweima.png") no-repeat;
	background-size: cover
}

::-webkit-scrollbar {
	width: 8px;
	height: 8px
}

::-webkit-scrollbar-thumb {
	background: #bbc1cf;
	-webkit-border-radius: 4px
}
</style>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="amd/components/user/index"
	src="${host}/userCenter/find/js/index.js"></script>
<style type="text/css">
#ti-user {
	visibility: visible !important;
	color: red;
}

.form-warp {
	padding: 30px 40px;
	width: 500px;
	margin: 0 auto;
	padding-top: 20px;
	background: #fff
}

.form-title {
	display: -webkit-box;
	display: -moz-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	padding: 50px 0;
	justify-content: center;
	-webkit-justify-content: center;
	align-items: center;
	-webkit-align-items: center
}

.form-title .form-title-logo {
	display: inline-block;
	background:
		url("${host}/images/banner/ti.jpg");
	width: 96px;
	height: 45px
}

.form-title .form-title-logo-en {
	display: inline-block;
	background:
		url("${host}/images/banner/ti.jpg");
	width: 96px;
	height: 45px
}

.title-tips {
	text-align: center;
	margin-bottom: 50px;
	margin-top: -30px
}

.form-warp .error {
	padding: 0 20px 20px;
	text-align: center;
	color: red
}

.form-title .form-title-text {
	font-size: 24px;
	color: #45525f;
	margin-left: 25px
}

.form-group {
	position: relative;
	line-height: 36px;
	display: flex;
	margin-bottom: 24px;
	color: #465360;
	height: 36px
}

#remember_me {
	margin-top: 10px
}

.captcha-img {
	margin: 0 auto;
	cursor: pointer
}

.now-register {
	justify-content: center
}

.form-control {
	height: 38px;
	border: 1px solid #e7eaf1;
	border-radius: 2px;
	-webkit-box-flex: 2 1;
	-moz-box-flex: 2 1;
	-webkit-flex: 2 1;
	-ms-flex: 2 1;
	flex: 2 1;
	padding: 3px 8px
}

.control-label {
	display: inline-block;
	width: 140px
}

.required-label:after {
	content: '*';
	color: red;
	position: absolute;
	left: 120px
}

.form-control.empty-error {
	border-color: red
}

input[type=button] {
	position: absolute;
	padding: 8px 10px;
	right: 0;
	color: #fff;
	border: 0;
	background: #42a9f4
}

.forgot_password {
	position: absolute;
	right: 0
}
</style>
</head>

<body>
    <!-- message -->
    <div id="flash-messages"></div>
    <!-- body -->
    
    <!-- header -->
    <header id="block-header" class="pure-menu-horizontal" style="visibility: hidden;">
        <ul class="header-links">
            <li class="">
                <a href="" class="to_decode">sharehoo社区</a>
            </li>
        </ul>
        
        <ul class="header-links header-links-right">
			<li><a href="">注册</a></li>
			<li><a href="">登录</a></li>
		</ul>
        
    </header>
    <!-- content -->
    <div id="block-content" style="visibility: hidden;">
        


<div class="form-container" id="ti-user" style="visibility: hidden;">
    <div class="form-title">
        <span class="form-title-logo"></span>
        <b class="form-title-text">忘记密码</b>
    </div>
    <div class="form-warp">
        <div class="error">
            

        </div>
        <form action="" method="POST" role="form" id="forget_form">
       
            <div class="form-group  ">
		            <label for="email" class="control-label">真实姓名：</label>
		        	<input class="form-control" type="text" tabindex="10" id="trueName" name="trueName" 
		        		onblur="checkTrueName(this.value)" value="${user.trueName }">
            	<span class="pull-left"></span><font id="userErrorInfo" class="pull-right" color="red"></font>	       
		        <!--  -->
		    </div>
            <div class="form-group  ">
		            <label for="email" class="control-label">您的邮箱地址</label>
		        
		        	<input class="form-control" id="email" name="email" tabindex="10" type="text" value="">
		        	<font id="userErrorInfo" class="pull-right" color="red"></font>
		        <!--  -->
		    </div>
            
            <div class="form-captcha">
            	<label for="captcha" class="label-captcha">         		
            		 验证码 
            	</label>
        		<input id="captcha" value="${imageCode }" name="imageCode" id="imageCode" class="input-captcha" tabindex="20" type="text">
        		<img class="captcha-img" id="randImage" src="${host}/imageCode" onclick="javascript:loadimage();">
        		<font id="codeErrorInfo" class="pull-right" color="red"></font>
        	</div>
            <div class="form-group">
                <a href="">
                    &lt; 返回
                </a>
            </div>
            <!--<div class="form-group captcha">
                 <img class="captcha-img" src="/captcha" />
            </div>-->
            <div class="form-group">               
    			<input type="button" id="okbtn" value="发送重置密码邮件" tabindex="90">
            </div>
        </form>
    </div>
</div>

    </div>
    
    <div id="ti-base"><div id="ti-message" style="display: none;">
    
</div>
<div id="bases-modal" style="display: none;">
    
</div>
<div class="animated bounceLR-transition" id="bases-dialog" style="display: none;">
    <div class="modal-dialog" style="width: 30%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close">
                    <span></span>
                </button>
                <h4 class="modal-title">请确认</h4>
            </div>
            <div class="modal-body">
            	
            </div>
            <div class="modal-footer">
                <button type="button" class="pure-button modal-button-no">不</button>
                <button type="button" class="pure-button modal-button-yes">是</button>
            </div>
        </div>
    </div>
</div></div>
     
    <script src="${host}/userCenter/find/js/1cc9966316db6ad9.js"></script>
    <script type="text/javascript">
    $(function() {
        //monitor.setProject('360_ti').getTrack().getClickAndKeydown();
        
    });
    function loadimage(){
			document.getElementById("randImage").src = "${host}/imageCode?"+Math.random();
		}
    function checkForm(){
		 var trueName=$("#trueName").val();
		 var imageCode=$("#imageCode").val();
		 if(trueName==""){
			 $("#error").html("姓名不能为空！");
			 return false;
		 }
		 if(imageCode==""){
			 $("#error").html("验证码不能为空！");
			 return false;
		 }
		 return true;
	}

	function checkTrueName(trueName){
		
		$.post("${host}/user/truename",{trueName:trueName},
				function(result){
					var result=eval(result);
					if(result.exist){
						$("#userErrorInfo").html("该用户存在！");
						
					}else{
						$("#userErrorInfo").html("该用户不存在，请重新输入！");
						$("#trueName").focus();
					}
				}
		);
	}
	
	$("#okbtn").on("click", function() {
		var trueName=$("#trueName").val();
		 var imageCode=$("#imageCode").val();
		 if(trueName==""){
			 $("#userErrorInfo").html("姓名不能为空！");
			 return false;
		 }
		 if(imageCode==""){
			 $("#error").html("验证码不能为空！");
			 return false;
		 }
		$.ajax({
	       type: "POST",
	       url: "${host}/user/find",
	       data: $("#forget_form").serialize(),
	       success: function (data) {
	       		if(data.status=='200' || data.status==200){
	       			tipOk("临时密码已重置请登录邮箱查看，请尽快修改", function() {
	       				//swal.close();
	       			});
	       		}else{
	       			tipError("密码找回失败，原因："+data.msg);
	       		}
	       }
	   	});
	   	return false;
   });
    
    	function tipError(content) {
    		swal("操作失败", content, "error");
    	}
    	function tipOk(content,callback){
		swal({   
			title: content,   
			text: '来自<span style="color:red">sharehoo社区</span>、<a href="#">温馨提示</a>。<br/>2秒后自动关闭..',   
			imageUrl: "${host}/sweetalert/images/thumbs-up.jpg",
			html: true,
			timer: 2000,   
			showConfirmButton: true
		},function(){
			if (callback) {
				callback();
			}
		});
	};
    </script>


</body></html>