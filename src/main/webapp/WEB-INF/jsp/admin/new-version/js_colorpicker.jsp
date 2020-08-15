<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>颜色选择器 - bootstrap中文后台管理系统模板</title>
<link rel="icon" href="favicon.ico" type="image/ico">
<meta name="keywords" content="后台模板,后台管理系统,HTML模板">
<meta name="description" content="基于Bootstrap的后台管理系统模板">
<meta name="author" content="www.bootstrapmb.com">
<link href="${host }/admin/new-version/css/bootstrap.min.css" rel="stylesheet">
<link href="${host }/admin/new-version/css/fonts.css" rel="stylesheet">
<!--颜色选择插件-->
<link rel="stylesheet" href="${host }/admin/new-version/js/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css">
<link href="${host }/admin/new-version/css/style.css" rel="stylesheet">
</head>
  
<body>
    <!--页面主要内容-->
    <main class="ftdms-layout-content">
      
      <div class="container-fluid">
        
        <div class="row" style="margin-top:15px;">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-header"><h4>颜色选择</h4></div>
              <div class="card-body">
                
                <input class="form-control js-colorpicker m-b-10" type="text" id="example-colorpicker" name="text_color" placeholder="点击选择颜色" value="" />
                
                <div class="js-colorpicker input-group colorpicker-element">
                  <input class="form-control" type="text" id="example-colorpicker2" name="example-colorpicker2" value="#33cabb">
                  <span class="input-group-addon"><i style="background-color: rgb(51, 202, 187);"></i></span>
                </div>
       
              </div>
            </div>
          </div>
          
        </div>
        
      </div>
      
    </main>
    <!--End 页面主要内容-->

<script type="text/javascript" src="${host }/admin/new-version/js/jquery.min.js"></script>
<script type="text/javascript" src="${host }/admin/new-version/js/bootstrap.js"></script>
<script type="text/javascript" src="${host }/admin/new-version/js/perfect-scrollbar.min.js"></script>
<!--颜色选择插件-->
<script src="${host }/admin/new-version/js/bootstrap-colorpicker/bootstrap-colorpicker.min.js"></script>
<script type="text/javascript" src="${host }/admin/new-version/js/main.min.js"></script>
</body>
</html>
