<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>IT帮-资讯传播社区--用户注册</title>
<link href="${host}/bootstrap/css/bootstrap.css" rel="stylesheet" />
<link href="${host}/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" />
<link href="${host}/bootstrap/css/docs.css" rel="stylesheet" />

<!-- 2019.09.03 自定义弹窗所需插件 -->
<link rel="stylesheet" type="text/css" href="${host}/sweetalert/sweetalert.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
<script src="${host}/sweetalert/sweetalert.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.messages_cn.js"></script>
<link href="${pageContext.request.contextPath}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />
<style type="text/css">
button{cursor:pointer;width:100%;height:44px;padding:0;background:#ef4300;border:1px solid #ff730e;border-radius:6px;font-weight:700;color:#fff;font-size:24px;letter-spacing:15px;margin-top:10px; text-shadow:0 1px 2px rgba(0,0,0,.1)}
span{color:Red;font-size:12px}
.header1 {
	margin:0px auto;
	position: relative;
	overflow: hidden;
	text-align: center;
}
</style>

<!-- 密码强度检测   2017.03.31    -->

<script type="text/javascript">

	function Charstring(iN){              
		if (iN>=48 && iN <=57)                
		return 1; 
		if (iN>=65 && iN <=90)              
		return 2;
		if (iN>=97 && iN <=122)             
		return 4;
		else
		return 8;         
	}

	function modetotal(num){      
		modes=0;
		for (i=0;i<4;i++){
		if (num & 1) 
			modes++;
			num>>>=1;
		}
		return modes;
	}

	function checkpwd(spwd){   
		if (spwd.length<=4)
		return 0;                         
		Modes=0;
		for (i=0;i<spwd.length;i++){         
			Modes|=Charstring(spwd.charCodeAt(i));
		}
		return modetotal(Modes);
	}

	function pwdstrong(pwd) {
		O_color = "#cccccc";
		L_color = "#ffff00";
		M_color = "#DC440F";
		H_color = "#FF0000";
		if (pwd == null || pwd == '') {
			Lcolor = Mcolor = Hcolor = O_color;
		} else {
			S_level = checkpwd(pwd);
			switch (S_level) {
			case 0:
				Lcolor = Mcolor = Hcolor = O_color;
			case 1:
				Lcolor = L_color;
				Mcolor = Hcolor = O_color;
				break;
			case 2:
				Lcolor = Mcolor = M_color;
				Hcolor = O_color;
				break;
			default:
				Lcolor = Mcolor = Hcolor = H_color;
			}
		}
		document.getElementById("pwd_L").style.background = Lcolor;
		document.getElementById("pwd_M").style.background = Mcolor;
		document.getElementById("pwd_H").style.background = Hcolor;
		return;
	}
</script>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploadPreview.min.js"></script>
<script type="text/javascript">
$(function () {
	$("#face").uploadPreview({ Img: "ImgPr", Width: 220, Height: 220 });   
});
</script>
<script type="text/javascript">
	$(function () {
		$("#regForm").validate(
	            {
	                /*自定义验证规则*/
	                rules: {
	                	"nickName": { required: true, minlength: 2 },
	                	"trueName":{ required: true, minlength: 2 },
	                	"sex":{ required: true },
	                	"password":{ required: true, minlength: 8 },
	                	"rePassWord":{ required: true, equalTo:password},
	                	"mobile":{ required: true,number:true },
	                	"email": { required: true, email: true }
	                },
	                /*错误提示位置*/
	                errorPlacement: function(error, element) {
	                    error.appendTo(element.siblings("span"));
	                }
	            }
	          );
	});
	function checkNickName(nickName) {
		$.post("${host}/user/nickname", {
			nickName : nickName
		},
			function(data) {
				var result = eval(data);
				debugger
				if (result.exist) {
					$("#userErrorInfo").html("用户名已存在，请重新输入！");
					$("#nickName").focus();
				} else {
					$("#userErrorInfo").html("");
				}
			}
		);
	}

	function checkEmail(email){	
		$.post("${host}/user/truename",{email:email},
			function(data){
				var result=eval(data);
				if(result.exist){
					$("#emailErrorInfo").html("邮箱已存在，请重新输入！");
					$("#email").focus();
				}else{
					$("#emailErrorInfo").html("");
				}
			}
		);
	}
	
	function checkTrueName(trueName){	
		$.post("${host}/user/email",{trueName:trueName},
			function(data){
				var result=eval(data);
				if(result.exist){
					$("#userTrueNameErrorInfo").html("真实姓名用来找回密码，该标识已存在，请重新输入！");
					$("#trueName").focus();
				}else{
					$("#userTrueNameErrorInfo").html("");
				}
			}
		);
	}

</script>
</head>
<body>
	<div class="header1">
	<div  class="wrap" style="margin: 0 auto;">
		<jsp:include page="common/top_register.jsp"/>
	</div>
	</div>
	<div class="" align="center" style="width: 1200px; margin:0px auto;background-color:#F8F8F8;background: url(${host}/images/rw_register.png);">
			<h1 style="margin-bottom: 30px;">欢迎注册
				<font style="font-size:9pt;">╮(╯▽╰)(**本站采用邮件激活方式注册，请认真填写邮箱!*)</font></h1>
		<form id="regForm" style="width: 700px;" enctype="multipart/form-data" class="form-horizontal form-inline" method="post" action="">
			<div class="control-group">
				<div class="controls">
					<input class="input-block-level" type="text" id="nickName" name="nickName" onblur="checkNickName(this.value)" value="${user.nickName }" placeholder="昵称"/><span class="pull-left"></span>
					<font id="userErrorInfo" class="pull-right" color="red"></font>
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<input class="input-block-level" type="text" id="trueName" name="trueName" onblur="checkTrueName(this.value)" value="${user.trueName }" placeholder="真实姓名"/><span class="pull-left"></span>
					<font id="userTrueNameErrorInfo" class="pull-right" color="red"></font>
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<label class="radio" style="margin-right: 50px;">
						<select id="sex" name="sex"><option value="">...性别...</option>
							<option value="女" ${user.sex=='女'?'selected':'' }>女</option>
							<option value="男" ${user.sex=='男'?'selected':'' }>男</option>
						</select> <span class="pull-left"></span>
					</label>
				</div>
			</div>
			<div class="control-group" id="preDiv" style="width: 700px; height: 80px;margin-left: 305px;">
				<img id="ImgPr" class="pull-left" style="width: 80px; height: 80px;" src="${pageContext.request.contextPath}/${user.face }" />
			</div>
			<div class="control-group">
				<div class="controls">
					<font style="color:gray;">头像:</font><input type="file" id="face" name="facelogo">
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<input class="input-block-level" type="password" id="password"
						name="password" value="${user.password }" onKeyUp=pwdstrong(this.value) onBlur=pwdstrong(this.value) placeholder="用户密码" /><span class="pull-left"></span>																																												
				</div>
			</div>
			
			<div class="control-group">
				<div class="controls">
					<table border=0 cellspacing=0 cellpadding=1 bordercolor=#cccccc height=22 style='display:inline'>
						<tr align="center" bgcolor="#eeeeee"> 
							<td width=110 id="pwd_L"><font style="font-size:9pt;"> 弱   -_-|||辣鸡</font> </td>
							<td width=110 id="pwd_M"><font style="font-size:9pt;"> 中   ╮(╯▽╰)呵呵</font></td>
							<td width=110 id="pwd_H"><font style="font-size:9pt;"> 强   (☆▽☆)哇塞</font></td>
						</tr>
					</table>	
				</div>
			</div>
			
			
			
			
			<div class="control-group">
				<div class="controls">
					<input class="input-block-level" type="password" id="rePassWord" name="rePassWord" placeholder="--确认密码--"/><span class="pull-left"></span>
				</div>
			</div>

			<div class="control-group">
				<div class="controls">
					<input class="text input-block-level" type="text" id="email"
						name="email" onblur="checkEmail(this.value)" value="${user.email }" placeholder="电子邮箱"/><span class="pull-left"></span>
						<font id="emailErrorInfo" class="pull-right" color="red"></font>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="moble"></label>
				<div class="controls">
					<input class="text input-block-level" type="text" id="mobile"
						name="mobile" value="${user.mobile }" placeholder="联系方式"/><span class="pull-left"></span>
				</div>
			</div>
			
			<div class="control-group" style="margin: 0px;">
				<div style="margin-left: 70px;">
					<button tabindex="5" style="" id="okbtn">提交注册</button> &nbsp;&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			<font id="error" color="red"></font>
			<input type="hidden" name="type" value="1">
			<input type="hidden" id="faceFileName" name="faceFileName">
		</form>
	</div>
	
	
	
<script type="text/javascript">
	function addFileName(){
		var uploadfile = $("#face").val();
		var fileName= getFileName(uploadfile);
		$("#faceFileName").val(fileName);
	}
	//获取文件名方式一
	  function getFileName(file){		//通过第一种方式获取文件名
	    var pos=file.lastIndexOf("\\");//查找最后一个\的位置
		return file.substring(pos+1); //截取最后一个\位置到字符长度，也就是截取文件名 
	 }
	//springboot框架提交表单实体对象到后台尽量使用ajax提交，将表单序列化提交	2019.08.31 miki
	$("#okbtn").on("click", function() {
	 	 addFileName();
		 if(checkForm()){
			var nickName = $("#nickName").val();
	 		var faceFileName = $('#ImgPr')[0].src;
	 		var formData = new FormData($("#regForm")[0]);
			 $.ajax({
			   type: "POST",
			   url: "user/register?faceFileName="+faceFileName,
			   data: formData,
			   cache: false,
			   async: false,
			   processData : false,  //必须false才会避开jQuery对 formdata 的默认处理
			   contentType : false,  //必须false才会自动加上正确的Content-Type
			   success: function (data) {
					console.log("成功");
					if(data.status==200){
						tipOk("注册成功",function(){
							window.location.href = "${host}/user/welcome?nickName="+nickName;
						});
					}
			   }       
			});
			return false;
		 }
	 	 return false;
	 });
	 
	function checkForm() {
		var nickName = $("#nickName").val();
		var sex = $("#sex").val();
		var password = $("#password").val();
		var rePassWord = $("#rePassWord").val();
		var mobile = $("#mobile").val();
		var email = $("#email").val();
		var errorInfo = $("#emailErrorInfo").html();
		var userErrorInfo = $("#userErrorInfo").html();
		if (errorInfo.length>0) {
			$("#error").html("邮箱账号已经被注册，请确认！");
			return false;
		}

		if (userErrorInfo.length>0) {
			$("#error").html("该昵称已经被使用，请确认！");
			return false;
		}

		if (nickName == "") {
			$("#error").html("昵称不能为空！");
			return false;
		}
		if (sex == "") {
			$("#error").html("请选择性别！");
			return false;
		}
		if (password == "") {
			$("#error").html("密码不能为空！");
			return false;
		}
		if (rePassWord == "") {
			$("#error").html("确认密码不能为空！");
			return false;
		}
		if (password != rePassWord) {
			$("#error").html("密码和确认密码不一致，请重新输入！");
			return false;
		}
		if (mobile == "") {
			$("#error").html("联系电话不能为空！");
			return false;
		}
		if (email == "") {
			$("#error").html("邮箱不能为空！");
			return false;
		}
		return true;
	}

	 function tipOk(content,callback){
			swal({   
				title: content,   
				text: '来自<span style="color:red">sharehoo社区</span>、<a href="#">温馨提示</a>。<br/>2秒后自动关闭..',   
				imageUrl: "${host}/sweetalert/images/thumbs-up.jpg",
				html: true,
				timer: 3000,   
				showConfirmButton: false
			},function(){
				if (callback) {
					callback();
				}
			});
		};
		function tipError(content){
			swal("登录失败", content, "error");
		};
</script>
</body>
</html>