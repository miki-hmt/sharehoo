<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>标签插件 - bootstrap中文后台管理系统模板</title>
<link rel="icon" href="favicon.ico" type="image/ico">
<meta name="keywords" content="后台模板,后台管理系统,HTML模板">
<meta name="description" content="基于Bootstrap的后台管理系统模板">
<meta name="author" content="www.bootstrapmb.com">
<link href="${host }/admin/new-version/css/bootstrap.min.css" rel="stylesheet">
<link href="${host }/admin/new-version/css/fonts.css" rel="stylesheet">
<!--标签插件-->
<link rel="stylesheet" href="${host }/admin/new-version/js/jquery-tags-input/jquery.tagsinput.min.css">
<link href="${host }/admin/new-version/css/style.css" rel="stylesheet">
</head>
  
<body>
<div class="ftdms-layout-web">
  <div class="ftdms-layout-container">
    
    <!--页面主要内容-->
    <main class="ftdms-layout-content">
      
      <div class="container-fluid">
        
        <div class="row" style="margin-top:15px;">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-header"><h4>标签插件</h4></div>
              <div class="card-body">
                <input class="form-control js-tags-input" type="text" id="example-tags" name="tags" placeholder="请输入标签" value="光年,黄金瞳">
              </div>
            </div>
          </div>
        </div>

		<div class="row">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-header"><h4>多色标签</h4></div>
              <div class="card-body">
                <span class="label label-default">青春校园</span>
                <span class="label label-primary">历史小说</span>
                <span class="label label-success">当代小说</span>
                <span class="label label-info">都市小说</span>
                <span class="label label-warning">科幻小说</span>
                <span class="label label-danger">名人传记</span>
                <span class="label label-dark">悬疑小说</span>
                <span class="label label-secondary">古文典籍</span>
                <span class="label label-purple">玄幻仙侠</span>
                <span class="label label-pink">言情小说</span>
                <span class="label label-cyan">国外名著</span>
                <span class="label label-yellow">武侠小说</span>
                <span class="label label-brown">儿童文学</span> 
              </div>
            </div>
          </div>
        </div>
        
      </div>
      
    </main>
    <!--End 页面主要内容-->

<script type="text/javascript" src="${host }/admin/new-version/js/jquery.min.js"></script>
<!--标签插件-->
<script src="${host }/admin/new-version/js/jquery-tags-input/jquery.tagsinput.min.js"></script>
<script type="text/javascript" src="${host }/admin/new-version/js/main.min.js"></script>
</body>
</html>
