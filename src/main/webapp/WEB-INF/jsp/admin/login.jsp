<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>IT帮-资讯传播社区--后台登陆</title>
<link href="${pageContext.request.contextPath}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="css/unicorn.login.css" />

<!-- <script src="js/jquery.min.js"></script>  
<script src="js/unicorn.login.js"></script>  -->
</head>
<body>
	<div id="logo">
        <img src="img/hh.png" alt="" />  <!-- 后台登陆logo图片插入 2016.08.19-->
    </div>
    <div id="loginbox">
		<form id="loginform" class="form-vertical" action="${host}/admin/user/login" method="post">
			<p>输入用户昵称和密码进入后台.</p>
			<div class="control-group">
				<div class="controls">
					<div class="input-prepend">
						<span class="add-on"><i class="icon-user"></i></span><input
							type="text" name="nickName" value="${user.nickName }" placeholder="昵称" />
					</div>
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<div class="input-prepend">
						<span class="add-on"><i class="icon-lock"></i></span><input
							type="password" name="password" value="${user.password }" placeholder="密码" />
					</div>
				</div>
			</div>
			<div class="form-actions">
				 <span class="pull-right">
				 	<font id="error" style="font-size: 20px;" color="red">${error }</font>
				 	<input type="submit" class="btn btn-inverse" value="进入后台" />
				 </span>
			</div>
		</form>
	</div>
	<div style="text-align:center;margin-top:200px;">
	<font style="font-size:18pt;font-family:News Cycle;color:#F6ED08;"><i>陪 菜 比 康 度 过 漫 长 成 长 岁 月！</i></font>
	</div>
</body>
</html>