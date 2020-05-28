<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
	<script src="${host}/js/jquery-1.11.1.js" type="text/javascript"></script>
	<script src="${host}/js/jquery.emoticons.js" type="text/javascript"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.messages_cn.js"></script>
	
	<link href="${pageContext.request.contextPath}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />
	<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/bootstrap.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/bootstrap-responsive.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/userCenter/css/style.css">
    
    <!-- 2019.09.03 自定义弹窗所需插件 -->
	<link rel="stylesheet" type="text/css" href="${host}/sweetalert/sweetalert.css" />
	<script src="${host}/sweetalert/sweetalert.min.js"></script>
    
    <script type="text/javascript">
	    $(function(){
	    	//放新浪微博表情txtAreaObj:$("#Content")
	        $("#message_face").jqfaceedit({txtAreaObj:$("#Content"),containerObj:$('#container'),top:25,left:-27});
	    	//CKEDITOR.instances.Content.setData();
	    	 //显示表情
	    	$(".show_e").emotionsToHtml();
	    });
    </script>
    
    <style type="text/css">
		button{cursor:pointer;width:100%;height:44px;padding:0;background:#ef4300;border:1px solid #ff730e;border-radius:6px;font-weight:700;color:#fff;font-size:24px;letter-spacing:15px;margin-top:10px; text-shadow:0 1px 2px rgba(0,0,0,.1)}
		span{color:Red;font-size:12px}
	</style>

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
		function checkForm(){
			var nickName=$("#nickName").val();
			var sex=$("#sex").val();
			var password=$("#password").val();
			var rePassWord=$("#rePassWord").val();
			var mobile=$("#mobile").val();
			var email=$("#email").val();
			if (nickName=="") {
				$("#error").html("昵称不能为空！");
				return false;
			}else if (sex=="") {
				$("#error").html("请选择性别！");
				return false;
			}else if (password=="") {
				$("#error").html("密码不能为空！");
				return false;
			}
			else if (rePassWord=="") {
				$("#error").html("确认密码不能为空！");
				return false;
			}
			else if (password!=rePassWord) {
				$("#error").html("密码和确认密码不一致，请重新输入！");
				return false;
			}
			else if (mobile=="") {
				$("#error").html("联系电话不能为空！");
				return false;
			}
			else if (email=="") {
				$("#error").html("邮箱不能为空！");
				return false;
			}
			return true;
		}
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
        url('${pageContext.request.contextPath}/userCenter/font/iconfont.svg#uxiconfont') format('svg'); /* iOS 4.1- */ 
        }
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
									<h5>
										用户信息修改：<font style="font-size:8pt;color:red;">${user.nickName }</font>
										上次修改时间：<font style="font-size:8pt;color:red;">
											<fmt:formatDate value="${user.updateTime }" pattern="yyyy-MM-dd HH:mm:ss "/>
											</font>
									</h5>
								</div>
								<div class="widget-content nopadding">
									
									<form id="regForm" style="width: 700px;" enctype="multipart/form-data" class="form-horizontal form-inline" method="post">
										<div class="control-group">
											<label class="control-label" for="nickName">昵称(*)：</label>
											<div class="controls">
												<input class="input-block-level" type="text" id="nickName" name="nickName" value="${user.nickName }"/><span class="pull-left"></span>
												<font id="userErrorInfo" class="pull-right" color="red"></font>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="trueName">真实姓名(*)：</label>
											<div class="controls">
												<input class="input-block-level" type="text" id="trueName" name="trueName" onblur="checkTrueName(this.value)" value="${user.trueName }"/><span class="pull-left"></span>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="sex">性别(*)：</label>
											<div class="controls">
												<label class="radio" style="margin-right: 50px;">
													<select id="sex" name="sex"><option value="">请选择...</option>
														<option value="女" ${user.sex=='女'?'selected':'' }>女</option>
														<option value="男" ${user.sex=='男'?'selected':'' }>男</option>
													</select> <span class="pull-left"></span>
												</label>
											</div>
										</div>
										<div class="control-group" id="preDiv" style="width: 700px; height: 120px;margin-left: 80px;">
											<c:choose>
												<c:when test="${user.face!='' }">
											<img id="ImgPr" class="pull-left" style="width: 120px; height: 120px;" src="${pageContext.request.contextPath}/${user.face }" />
												</c:when>
												<c:otherwise>
													<img id="ImgPr" class="pull-left" style="width: 120px; height: 120px;" src="${pageContext.request.contextPath}/images/user/female.gif" />
												</c:otherwise>
											</c:choose>
										</div>
										<div class="control-group">
											<label class="control-label" for="face">上传头像(*)：</label>
											<div class="controls">
												<input type="hidden" name="face" value="${user.face }">
												<input type="file" id="face" name="facelogo">
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="password">登录密码(*)：</label>
											<div class="controls">
												<input class="input-block-level" type="password" id="password"
													name="password" value="${user.password }"/><span class="pull-left"></span>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="rePassWord">确认密码(*)：</label>
											<div class="controls">
												<input class="input-block-level" type="password" id="rePassWord" name="rePassWord" value="${user.password }"/><span class="pull-left"></span>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="moble">联系电话(*)：</label>
											<div class="controls">
												<input class="text input-block-level" type="text" id="mobile"
													name="mobile" value="${user.mobile }"/><span class="pull-left"></span>
											</div>
										
										</div>
										
										<div class="control-group">
											<label class="control-label" for="mobile">积分(*)：</label>
											<div class="controls">
												<input readonly="readonly" class="text input-block-level" type="text" id="score"
													name="score" value="${user.score }"/><span class="pull-left"></span>
											</div>
											
										</div>
							
										<div class="control-group">
											<label class="control-label" for="email">电子邮箱(*)：</label>
											<div class="controls">
												<input class="text input-block-level" type="text" id="email"
													name="email" value="${user.email }"/><span class="pull-left"></span>
											</div>
										</div>
										<input type="hidden" name="type" value="${user.type }">
										<input type="hidden" name="id" value="${user.id }">
										<input type="hidden" name="levelId" value="${user.levelId }">
										<input type="hidden" name="status" value="${user.status}">
										<input type="hidden" name="activationCode" value="${user.activationCode}">
									</form>
		
									<div class="control-group" style="margin: 0px;width:700px;">
										<div style="margin-left: 70px;">
											<button id="okbtn" tabindex="5" onclick="updateUser()">保存修改</button> &nbsp;&nbsp;&nbsp;&nbsp;
										</div>
									</div>
									<font id="error" color="red"></font>
									
								</div>
							</div>
							<div class="pagination alternate">
								<ul class="clearfix">
									${pageCode }
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
<script type="text/javascript">
	//springboot框架提交表单实体对象到后台尽量使用ajax提交，将表单序列化提交	2019.08.31 miki
	function updateUser(){
		if(checkForm()){
			var faceFileName = $('#ImgPr')[0].src;
		 	 var formData = new FormData($("#regForm")[0]);
			 $.ajax({
		       type: "POST",
		       url: "${host}/user/update?faceFileName="+faceFileName,
		       data: formData,
		       cache: false,
		       async: false,
		       processData : false,  //必须false才会避开jQuery对 formdata 的默认处理
		       contentType : false,  //必须false才会自动加上正确的Content-Type
		       success: function (data) {
		       		console.log("成功");
		       		if(data.status==200){
		       			tipOk("修改成功,请重新登录",function(){
		       				window.location.href = "${host}/user/logout";
		       			});
		       		}
		       }       
		   	});
			return false;
		}
		return false;
	}
	 
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
			swal("修改失败", content, "error");
		};
</script>

<script  type="text/javascript"src="${pageContext.request.contextPath}/userCenter/js/main.js"></script>
</html>