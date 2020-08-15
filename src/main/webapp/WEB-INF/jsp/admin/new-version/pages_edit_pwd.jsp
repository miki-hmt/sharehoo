<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>修改密码 - bootstrap中文后台管理系统模板</title>
<link rel="icon" href="favicon.ico" type="image/ico">
<meta name="keywords" content="后台模板,后台管理系统,HTML模板">
<meta name="description" content="基于Bootstrap的后台管理系统模板">
<meta name="author" content="www.bootstrapmb.com">
<link href="${host }/admin/new-version/css/bootstrap.min.css" rel="stylesheet">
<link href="${host }/admin/new-version/css/fonts.css" rel="stylesheet">
<link href="${host }/admin/new-version/css/style.css" rel="stylesheet">
</head>
  
<body>
    <!--页面主要内容-->
    <main class="ftdms-layout-content">
      
      <div class="container-fluid">
        
        <div class="row" style="margin-top:15px;">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-body">
                
                <form method="post" action="#!" class="site-form">
                  <div class="form-group">
                    <label for="old-password">旧密码</label>
                    <input type="password" class="form-control" name="oldpwd" id="old-password" placeholder="输入账号的原登录密码">
                  </div>
                  <div class="form-group">
                    <label for="new-password">新密码</label>
                    <input type="password" class="form-control" name="newpwd" id="new-password" placeholder="输入新的密码">
                  </div>
                  <div class="form-group">
                    <label for="confirm-password">确认新密码</label>
                    <input type="password" class="form-control" name="confirmpwd" id="confirm-password" placeholder="请输入正确的邮箱地址">
                  </div>
                  <button type="submit" class="btn btn-primary">修改密码</button>
                </form>
       
              </div>
            </div>
          </div>
          
        </div>
        
      </div>
      
    </main>
    <!--End 页面主要内容-->


</body>
</html>
