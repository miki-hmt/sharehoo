<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>找回密码</title>
<link href="${pageContext.request.contextPath}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />
<style type="text/css">
html{overflow-y:scroll;vertical-align:baseline;}
body{font-family:Microsoft YaHei,Segoe UI,Tahoma,Arial,Verdana,sans-serif;font-size:12px;color:#fff;height:100%;line-height:1;background:#999}
*{margin:0;padding:0}
ul,li{list-style:none}
h1{font-size:30px;font-weight:700;text-shadow:0 1px 4px rgba(0,0,0,.2)}
.login-box{width:410px;margin:120px auto 0 auto;text-align:center;padding:30px;background:url(../images/mask.png);border-radius:10px;}
.login-box .name,.login-box .password,.login-box .code,.login-box .remember{font-size:16px;text-shadow:0 1px 2px rgba(0,0,0,.1)}
.login-box .remember input{box-shadow:none;width:15px;height:15px;margin-top:25px}
.login-box .remember{padding-left:40px}
.login-box .remember label{display:inline-block;height:42px;width:70px;line-height:34px;text-align:left}
.login-box label{display:inline-block;width:100px;text-align:right;vertical-align:middle}
.login-box #imageCode{width:120px}
.login-box .codeImg{float:right;margin-top:26px;}
.login-box img{width:140px;height:42px;border:none}
input[type=text],input[type=password]{width:270px;height:42px;margin:12.5px auto;padding:0px 15px;border:1px solid rgba(255,255,255,.15);border-radius:6px;color:#fff;letter-spacing:2px;font-size:16px;background:transparent;}
button{cursor:pointer;width:100%;height:44px;padding:0;background:#ef4300;border:1px solid #ff730e;border-radius:6px;font-weight:700;color:#fff;font-size:24px;letter-spacing:15px;margin-top:10px; text-shadow:0 1px 2px rgba(0,0,0,.1)}
input:focus{outline:none;box-shadow:0 2px 3px 0 rgba(0,0,0,.1) inset,0 2px 7px 0 rgba(0,0,0,.2)}
button:hover{box-shadow:0 15px 30px 0 rgba(255,255,255,.15) inset,0 2px 7px 0 rgba(0,0,0,.2)}

    /*实现图片交替特效 */
.screenbg{position:fixed;bottom:0;left:0;z-index:-999;overflow:hidden;width:100%;height:100%;min-height:100%;}
.screenbg ul li{display:block;list-style:none;position:fixed;overflow:hidden;top:0;left:0;width:100%;height:100%;z-index:-1000;float:right;}
.screenbg ul a{left:0;top:0;width:100%;height:100%;display:inline-block;margin:0;padding:0;cursor:default;}
.screenbg a img{vertical-align:middle;display:inline;border:none;display:block;list-style:none;position:fixed;overflow:hidden;top:0;left:0;width:100%;height:100%;z-index:-1000;float:right;}
.bottom{margin:8px auto 0 auto;width:100%;position:fixed;text-align:center;bottom:0;left:0;overflow:hidden;padding-bottom:8px;color:#ccc;word-spacing:3px;zoom:1;}

.bottom a{color:#FFF;text-decoration:none;}
.bottom a:hover{text-decoration:underline;}
</style>
  
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.messages_cn.js"></script>

<script type="text/javascript">

    //js函数 实现图片切换特效
$(function(){
	$(".screenbg ul li").each(function(){
		$(this).css("opacity","0");
	});
	$(".screenbg ul li:first").css("opacity","1");
	var index = 0;
	var t;
	var li = $(".screenbg ul li");	
	var number = li.size();
	function change(index){
		li.css("visibility","visible");
		li.eq(index).siblings().animate({opacity:0},3000);
		li.eq(index).animate({opacity:1},3000);
	}
	function show(){
		index = index + 1;
		if(index<=number-1){
			change(index);
		}else{
			index = 0;
			change(index);
		}
	}
	t = setInterval(show,8000);
	
	
	    //根据窗口宽度生成图片宽度
	var width = $(window).width();
	$(".screenbg ul img").css("width",width+"px");
});
function loadimage(){
	document.getElementById("randImage").src = "${pageContext.request.contextPath}/image.jsp?"+Math.random();
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
	
	$.post("User_existUserWithTrueName.action",{trueName:trueName},
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

</script>
</head>
<body>

<div class="login-box">
	<h1>找回密码&nbsp;&nbsp;&nbsp;</h1>
	<form method="post" action="User_find.action" enctype="multipart/form-data">
		<table>
			<tr class="name">
				<td><label>真实姓名：</label></td>
				<td><input type="text" id="trueName" name="user.trueName" onblur="checkTrueName(this.value)" value="${user.trueName }" tabindex="1" autocomplete="off" /><span class="pull-left"></span>
					<font id="userErrorInfo" class="pull-right" color="yellow"></font></td>
			</tr>
			<tr class="code">
				<td><label>验证码：</label></td>
				<td>
					<input  class="text" style="margin-right: 10px;"
							type=text value="${imageCode }" name="imageCode" id="imageCode"><img
							onclick="javascript:loadimage();" title="换一张试试" name="randImage"
							id="randImage" src="${pageContext.request.contextPath}/image.jsp" border="1"
							align="absmiddle">
				</td>
				
			</tr>		
			<tr>
				<td colspan="2">
					<button type="submit" tabindex="5">验证</button> &nbsp;&nbsp;&nbsp;&nbsp;
						<font id="error" style="font-size: 20px;" color="yellow">${error }</font>
			</td>
			</tr>
		</table>
	</form>
</div>

<div class="bottom"><font color="yellow">©2016.miki</font><a href="javascript:;" target="_blank"><font color="yellow">关于</font></a> <span><font color="yellow">城建java论坛</font></span><img width="13" height="16" src="${pageContext.request.contextPath}/images/copy_rignt_24.png" /></div>


        <!-- 管理员登录界面背景 -->
<div class="screenbg">
	<ul>
		<li><a href="javascript:;"><img src="${pageContext.request.contextPath}/images/0.jpg"></a></li>
		<li><a href="javascript:;"><img src="${pageContext.request.contextPath}/images/1.jpg"></a></li>
		<li><a href="javascript:;"><img src="${pageContext.request.contextPath}/images/2.jpg"></a></li>
	</ul>
</div>
</body>
</html>