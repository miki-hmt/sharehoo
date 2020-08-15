
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
<title>个人信息 - bootstrap中文后台管理系统模板</title>
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
                
                <div class="edit-avatar">
                  <img src="images/user.png" alt="..." class="img-avatar">
                  <div class="avatar-divider"></div>
                  <div class="edit-avatar-content">
                    <button class="btn btn-default">修改头像</button>
                    <p class="m-0">选择一张你喜欢的图片,上传图片大小不能超过2M。</p>
                  </div>
                </div>
                <hr>
                <form method="post" action="#!" class="site-form">
                  <div class="form-group">
                    <label for="username">用户名</label>
                    <input type="text" class="form-control" name="username" id="username" value="ftdms" disabled="disabled" />
                  </div>
                  <div class="form-group">
                    <label for="nickname">昵称</label>
                    <input type="text" class="form-control" name="nickname" id="nickname" placeholder="输入您的昵称" value="bootstrap中文">
                  </div>
                  <div class="form-group">
                    <label for="email">邮箱</label>
                    <input type="email" class="form-control" name="email" id="email" aria-describedby="emailHelp" placeholder="请输入正确的邮箱地址" value="">
                  </div>
                  <div class="form-group">
                    <label for="remark">简介</label>
                    <textarea class="form-control" name="remark" id="remark" rows="3"></textarea>
                  </div>
                  <button type="submit" class="btn btn-primary">保存</button>
                </form>
       
              </div>
            </div>
          </div>
          
        </div>
        
      </div>
      
    </main>
    <!--End 页面主要内容-->
<script type="text/javascript" src="${host }/admin/new-version/js/jquery.min.js"></script>
<script type="text/javascript" src="${host }/admin/new-version/js/bootstrap.js"></script>
</body>
</html>