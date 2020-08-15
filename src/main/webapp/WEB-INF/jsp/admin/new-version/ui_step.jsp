
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
<title>步骤 - bootstrap中文后台管理系统模板</title>
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
        <div class="alert alert-info" role="alert">
          实际应用中，给a标签加上 <code>data-toggle="tab"</code> ，可查看<a href="pages_guide.html">表单向导</a>。
        </div>
        <div class="row" style="margin-top:15px;">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-header"><h4>步骤</h4></div>
              <div class="card-body">
                
                <ul class="nav-step step-dots">
                  <li class="nav-step-item active">
                    <span>步骤一</span>
                    <a class="active" href="#"></a>
                  </li>
      
                  <li class="nav-step-item">
                    <span>步骤三</span>
                    <a href="#"></a>
                  </li>
      
                  <li class="nav-step-item">
                    <span>步骤四</span>
                    <a href="#"></a>
                  </li>
      
                  <li class="nav-step-item">
                    <span>步骤五</span>
                    <a href="#"></a>
                  </li>
                </ul>
                
                <ul class="nav-step step-dots">
                  <li class="nav-step-item complete">
                    <span>步骤一</span>
                    <a class="active" href="#"></a>
                  </li>
      
                  <li class="nav-step-item active">
                    <span>步骤三</span>
                    <a href="#"></a>
                  </li>
      
                  <li class="nav-step-item">
                    <span>步骤四</span>
                    <a href="#"></a>
                  </li>
      
                  <li class="nav-step-item">
                    <span>步骤五</span>
                    <a href="#"></a>
                  </li>
                </ul>
                
                <ul class="nav-step step-anchor">
                  <li class="nav-step-item active">
                    <a href="#step-1">
                      <h6>步骤一</h6>
                      <p class="m-0">步骤一说明</p>
                    </a>
                  </li>
                  <li class="nav-step-item">
                    <a href="#step-2">
                      <h6>步骤二</h6>
                      <p class="m-0">步骤二说明</p>
                    </a>
                  </li>
                  <li class="nav-step-item">
                    <a href="#step-3">
                      <h6>步骤三</h6>
                      <p class="m-0">步骤三说明</p>
                    </a>
                  </li>
                  <li class="nav-step-item">
                    <a href="#step-4">
                      <h6>步骤四</h6>
                      <p class="m-0">步骤四说明</p>
                    </a>
                  </li>
                </ul>
                
                <ul class="nav-step step-anchor">
                  <li class="nav-step-item complete">
                    <a href="#step-1">
                      <h6>步骤一</h6>
                      <p class="m-0">步骤一说明</p>
                    </a>
                  </li>
                  <li class="nav-step-item active">
                    <a href="#step-2">
                      <h6>步骤二</h6>
                      <p class="m-0">步骤二说明</p>
                    </a>
                  </li>
                  <li class="nav-step-item">
                    <a href="#step-3">
                      <h6>步骤三</h6>
                      <p class="m-0">步骤三说明</p>
                    </a>
                  </li>
                  <li class="nav-step-item">
                    <a href="#step-4">
                      <h6>步骤四</h6>
                      <p class="m-0">步骤四说明</p>
                    </a>
                  </li>
                </ul>
                
              </div>
            </div>
          </div>
        </div>
        <!-- .row --> 
        
      </div>
      
    </main>
    <!--End 页面主要内容-->

</body>
</html>