<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>登录页面 - 后台管理系统模板</title>
<link rel="icon" href="favicon.ico" type="image/ico">
<meta name="keywords" content="后台模板,后台管理系统,HTML模板">
<meta name="description" content="基于Bootstrap的后台管理系统模板">
<meta name="author" content="www.bootstrapmb.com">
<link href="${host }/admin/new-version/css/bootstrap.min.css" rel="stylesheet">
<link href="${host }/admin/new-version/css/fonts.css" rel="stylesheet">
<link href="${host }/admin/new-version/css/style.css" rel="stylesheet">
<style>
.loginpage {
    position: relative;
}
.login {
    display: flex !important;
    min-height: 100vh;
    align-items: center !important;
    justify-content: center !important;
}
.login-center {
    background: #fff;
    min-width: 38rem;
    padding: 2em 3em;
    border-radius: 10px;
    margin: 2em 0;
}
.login-header {
    margin-bottom: 2rem !important;
}
.login-center .has-feedback.feedback-left .form-control {
    padding-left: 38px;
    padding-right: 12px;
}
.login-center .has-feedback.feedback-left .form-control-feedback {
    left: 0;
    right: auto;
    width: 38px;
    height: 38px;
    line-height: 38px;
    z-index: 4;
    color: #dcdcdc;
}
.login-center .has-feedback.feedback-left.row .form-control-feedback {
    left: 15px;
}
</style>
</head>
  
<body>
<div class="loginpage">
  <div class="login">
    <div class="login-center">
      <div class="login-header text-center">
        <a href="index.html"> <img src="images/admin_logo.png"> </a>
      </div>
      <form action="#" method="post">
        <div class="form-group has-feedback feedback-left">
          <input type="text" placeholder="请输入您的用户名" class="form-control" name="username" id="username" />
          <span class="ftsucai-65 form-control-feedback" aria-hidden="true"></span>
        </div>
        <div class="form-group has-feedback feedback-left">
          <input type="password" placeholder="请输入密码" class="form-control" id="password" name="password" />
          <span class="ftsucai-216 form-control-feedback" aria-hidden="true"></span>
        </div>
        <div class="form-group has-feedback feedback-left row">
          <div class="col-xs-7">
            <input type="text" name="captcha" class="form-control" placeholder="验证码">
            <span class="ftsucai-mao form-control-feedback" aria-hidden="true"></span>
          </div>
          <div class="col-xs-5">
            <img src="images/yzm.png" class="pull-right" id="captcha" style="cursor: pointer;" onclick="this.src=this.src+'?d='+Math.random();" title="点击刷新" alt="captcha">
          </div>
        </div>
        <div class="form-group">
          <button class="btn btn-block btn-primary" type="button" onclick="location.href='index.html'">立即登录</button>
        </div>
      </form>
      <hr>
      <footer class="col-sm-12 text-center">
        <p class="m-b-0">Copyright © 2019 <a href="http://www.www.bootstrapmb.com">bootstrap中文</a> All right reserved</p>
      </footer>
    </div>
  </div>
</div>
<script type="text/javascript" src="${host }/admin/new-version/js/jquery.min.js"></script>
<script type="text/javascript" src="${host }/admin/new-version/js/bootstrap.js"></script>
</body>
</html>