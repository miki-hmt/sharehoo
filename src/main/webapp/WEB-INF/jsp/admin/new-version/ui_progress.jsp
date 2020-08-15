
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
<title>进度条 - bootstrap中文后台管理系统模板</title>
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
              <div class="card-header"><h4>进度条</h4></div>
              <div class="card-body">
                <h5>基本样式</h5>
                <div class="progress">
                  <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <div class="progress">
                  <div class="progress-bar" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <div class="progress">
                  <div class="progress-bar" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <div class="progress">
                  <div class="progress-bar" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <div class="progress">
                  <div class="progress-bar" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                
                <hr>
                <h5>带有提示标签的进度条</h5>
                <div class="progress">
                  <div class="progress-bar" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
                    25%
                  </div>
                </div>
                <div class="progress">
                  <div class="progress-bar" role="progressbar" style="width: 60%;" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100">
                    60%
                  </div>
                </div>
                
                <hr>
                <h5>不同颜色的</h5>
                <div class="progress">
                  <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                    <span class="sr-only">40% Complete (success)</span>
                  </div>
                </div>
                <div class="progress">
                  <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                    <span class="sr-only">20% Complete</span>
                  </div>
                </div>
                <div class="progress">
                  <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                    <span class="sr-only">60% Complete (warning)</span>
                  </div>
                </div>
                <div class="progress">
                  <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                    <span class="sr-only">80% Complete (danger)</span>
                  </div>
                </div>
                
                <div class="progress">
                  <div class="progress-bar progress-bar-secondary" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                    <span class="sr-only">40% Complete (success)</span>
                  </div>
                </div>
                <div class="progress">
                  <div class="progress-bar progress-bar-gray" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                    <span class="sr-only">60% Complete (warning)</span>
                  </div>
                </div>
                <div class="progress">
                  <div class="progress-bar progress-bar-dark" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                    <span class="sr-only">80% Complete (danger)</span>
                  </div>
                </div>
                <div class="progress">
                  <div class="progress-bar progress-bar-pink" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                    <span class="sr-only">20% Complete</span>
                  </div>
                </div>
                <div class="progress">
                  <div class="progress-bar progress-bar-purple" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                    <span class="sr-only">60% Complete (warning)</span>
                  </div>
                </div>
                <div class="progress">
                  <div class="progress-bar progress-bar-brown" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                    <span class="sr-only">80% Complete (danger)</span>
                  </div>
                </div>
                <div class="progress">
                  <div class="progress-bar progress-bar-cyan" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                    <span class="sr-only">40% Complete (success)</span>
                  </div>
                </div>
                <div class="progress">
                  <div class="progress-bar progress-bar-yellow" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                    <span class="sr-only">20% Complete</span>
                  </div>
                </div>
                
                <hr>
                <h5>条纹效果</h5>
                <div class="progress">
                  <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                    <span class="sr-only">40% Complete (success)</span>
                  </div>
                </div>
                <div class="progress">
                  <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                    <span class="sr-only">20% Complete</span>
                  </div>
                </div>
                <div class="progress">
                  <div class="progress-bar progress-bar-warning progress-bar-striped" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                    <span class="sr-only">60% Complete (warning)</span>
                  </div>
                </div>
                <div class="progress">
                  <div class="progress-bar progress-bar-danger progress-bar-striped" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                    <span class="sr-only">80% Complete (danger)</span>
                  </div>
                </div>
                
                <hr>
                <h5>堆叠效果</h5>
                <div class="progress">
                  <div class="progress-bar progress-bar-success" style="width: 35%">
                    <span class="sr-only">35% Complete (success)</span>
                  </div>
                  <div class="progress-bar progress-bar-warning progress-bar-striped" style="width: 20%">
                    <span class="sr-only">20% Complete (warning)</span>
                  </div>
                  <div class="progress-bar progress-bar-danger" style="width: 10%">
                    <span class="sr-only">10% Complete (danger)</span>
                  </div>
                </div>
                
                <hr>
                <h5>动画效果</h5>
                <div class="progress">
                  <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%">
                    <span class="sr-only">75% Complete</span>
                  </div>
                </div>
                
                <hr>
                <h5>进度条高度</h5>
                <div class="progress progress-sm"><div class="progress-bar" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div></div>
                <div class="progress progress-lg"><div class="progress-bar" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div></div>
                
              </div>
            </div>
          </div>
        </div>
        
      </div>
      
    </main>
    <!--End 页面主要内容-->

</body>
</html>