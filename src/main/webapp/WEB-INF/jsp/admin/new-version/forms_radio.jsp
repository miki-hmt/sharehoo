<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>单选框 - bootstrap中文后台管理系统模板</title>
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
                
                <p>将 <code>.checkbox</code> 类添加到<code>&lt;label&gt;</code>。</p>
                <div class="example-box">
                  <label class="ftdms-radio">
                    <input type="radio" name="r1">
                    <span>默认单选框</span>
                  </label>
                  <label class="ftdms-radio radio-grey m-t-10">
                    <input type="radio" name="r1">
                    <span>灰色单选框</span>
                  </label>
                  <label class="ftdms-radio radio-primary m-t-10">
                    <input type="radio" checked="" name="r1">
                    <span>主色单选框</span>
                  </label>
                  <label class="ftdms-radio m-t-10">
                    <input type="radio" disabled="" name="r1">
                    <span>禁用的</span>
                  </label>
                </div>
                
                <p class="m-t-10">对于内联复选框 <code>.checkbox-inline</code>。</p>
                <div class="example-box">
                  <label class="ftdms-radio radio-inline radio-primary">
                    <input type="radio" name="e"><span>羽毛球</span>
                  </label>
                  <label class="ftdms-radio radio-inline radio-primary">
                    <input type="radio" name="e"><span>冰球</span>
                  </label>
                  <label class="ftdms-radio radio-inline radio-primary">
                    <input type="radio" name="e"><span>网球</span>
                  </label>
                </div>
                
              </div>
            </div>
            
            <div class="card">
              <div class="card-header"><h4>颜色</h4></div>
              <div class="card-body">
                
                <p>添加 <code>.checkbox-*</code> 用于更改复选框的外观：<code>.checkbox-primary</code> <code>.checkbox-info</code>...</p>
                <div class="example-box">
                  <label class="ftdms-radio radio-primary">
                    <input type="radio" checked="">
                    <span>Primary（主色）</span>
                  </label>
                  <label class="ftdms-radio radio-success m-t-10">
                    <input type="radio" checked="">
                    <span>Success（成功）</span>
                  </label>
                  <label class="ftdms-radio radio-secondary m-t-10">
                    <input type="radio" checked="">
                    <span>Secondary（灰色）</span>
                  </label>
                  <label class="ftdms-radio radio-info m-t-10">
                    <input type="radio" checked="">
                    <span>Info（一般信息）</span>
                  </label>
                  <label class="ftdms-radio radio-warning m-t-10">
                    <input type="radio" checked="">
                    <span>Warning（警告）</span>
                  </label>
                  <label class="ftdms-radio radio-danger m-t-10">
                    <input type="radio" checked="">
                    <span>Danger（警告）</span>
                  </label>
                  <label class="ftdms-radio radio-dark m-t-10">
                    <input type="radio" checked="">
                    <span>Dark（黑色）</span>
                  </label>
                  <label class="ftdms-radio radio-purple m-t-10">
                    <input type="radio" checked="">
                    <span>Purple（紫色）</span>
                  </label>
                  <label class="ftdms-radio radio-pink m-t-10">
                    <input type="radio" checked="">
                    <span>Pink（粉红色）</span>
                  </label>
                  <label class="ftdms-radio radio-cyan m-t-10">
                    <input type="radio" checked="">
                    <span>Cyan（青色）</span>
                  </label>
                  <label class="ftdms-radio radio-yellow m-t-10">
                    <input type="radio" checked="">
                    <span>Yellow（黄色）</span>
                  </label>
                  <label class="ftdms-radio radio-brown m-t-10">
                    <input type="radio" checked="">
                    <span>Brown（棕色）</span>
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
