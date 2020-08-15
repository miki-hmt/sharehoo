<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>复选框 - bootstrap中文后台管理系统模板</title>
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
      
      <div class="container-fluid" style="margin-bottom:90px;">
        
        <div class="row" style="margin-top:15px;">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-header"><h4>基本样式</h4></div>
              <div class="card-body">
                
                <p>这很容易。将 <code>.checkbox</code> 类添加到<code>&lt;label&gt;</code>。</p>
                <div class="example-box">
                  <label class="ftdms-checkbox">
                    <input type="checkbox">
                    <span>默认复选框</span>
                  </label>
                  <label class="ftdms-checkbox m-t-10">
                    <input type="checkbox" checked="">
                    <span>选中的</span>
                  </label>
                  <label class="ftdms-checkbox checkbox-grey m-t-10">
                    <input type="checkbox">
                    <span>灰色背景复选框</span>
                  </label>
                  <label class="ftdms-checkbox m-t-10">
                    <input type="checkbox" disabled="">
                    <span>禁用的</span>
                  </label>
                </div>
                
                <p class="m-t-10">对于内联复选框 <code>.checkbox-inline</code>。</p>
                <div class="example-box">
                  <label class="ftdms-checkbox checkbox-inline checkbox-primary">
                    <input type="checkbox"><span>篮球</span>
                  </label>
                  <label class="ftdms-checkbox checkbox-inline checkbox-primary">
                    <input type="checkbox"><span>足球</span>
                  </label>
                  <label class="ftdms-checkbox checkbox-inline checkbox-primary">
                    <input type="checkbox"><span>排球</span>
                  </label>
                </div>
                
              </div>
            </div>
            
            <div class="card">
              <div class="card-header"><h4>颜色</h4></div>
              <div class="card-body">
                
                <p>添加 <code>.checkbox-*</code> 用于更改复选框的外观：<code>.checkbox-primary</code> <code>.checkbox-info</code>...</p>
                <div class="example-box">
                  <label class="ftdms-checkbox checkbox-primary m-t-10">
                    <input type="checkbox" checked=""><span>Primary（主色）</span>
                  </label>
                  <label class="ftdms-checkbox checkbox-success m-t-10">
                    <input type="checkbox" checked=""><span>Success（成功）</span>
                  </label>
                  <label class="ftdms-checkbox checkbox-secondary m-t-10">
                    <input type="checkbox" checked=""><span>Secondary（灰色）</span>
                  </label>
                  <label class="ftdms-checkbox checkbox-info m-t-10">
                    <input type="checkbox" checked=""><span>Info（一般信息）</span>
                  </label>
                  <label class="ftdms-checkbox checkbox-warning m-t-10">
                    <input type="checkbox" checked=""><span>Warning（警告）</span>
                  </label>
                  <label class="ftdms-checkbox checkbox-danger m-t-10">
                    <input type="checkbox" checked=""><span>Danger（危险）</span>
                  </label>
                  <label class="ftdms-checkbox checkbox-dark m-t-10">
                    <input type="checkbox" checked=""><span>Dark（黑色）</span>
                  </label>
                  <label class="ftdms-checkbox checkbox-purple m-t-10">
                    <input type="checkbox" checked=""><span>Purple（紫色）</span>
                  </label>
                  <label class="ftdms-checkbox checkbox-pink m-t-10">
                    <input type="checkbox" checked=""><span>Pink（粉红色）</span>
                  </label>
                  <label class="ftdms-checkbox checkbox-cyan m-t-10">
                    <input type="checkbox" checked=""><span>Cyan（青色）</span>
                  </label>
                  <label class="ftdms-checkbox checkbox-yellow m-t-10">
                    <input type="checkbox" checked=""><span>Yellow（黄色）</span>
                  </label>
                  <label class="ftdms-checkbox checkbox-brown m-t-10">
                    <input type="checkbox" checked=""><span>Brown（棕色）</span>
                  </label>
                </div>
                
              </div>
            </div>
            
          </div>
          
        </div>
        
      </div>
      
    </main>
    <!--End 页面主要内容-->

</body>
</html>
