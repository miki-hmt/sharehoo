
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
<title>卡片 - 后台管理系统模板</title>
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
          
          <div class="col-sm-6 col-lg-3">
            <div class="card">
              <div class="card-header bg-primary">
                <h4>标题</h4>
                <ul class="card-actions">
                  <li>
                    <button type="button"><i class="ftsucai-more"></i></button>
                  </li>
                </ul>
              </div>
              <div class="card-body">
                <p>内容...</p>
              </div>
            </div>
          </div>
          <!-- .col-sm-6 -->
          
          <div class="col-sm-6 col-lg-3">
            <div class="card">
              <div class="card-header bg-success">
                <h4>标题</h4>
                <ul class="card-actions">
                  <li>
                    <button type="button"><i class="ftsucai-more"></i></button>
                  </li>
                </ul>
              </div>
              <div class="card-body">
                <p>内容...</p>
              </div>
            </div>
          </div>
          <!-- .col-sm-6 -->
          
          <div class="col-sm-6 col-lg-3">
            <div class="card">
              <div class="card-header bg-info">
                <h4>标题</h4>
                <ul class="card-actions">
                  <li>
                    <button type="button"><i class="ftsucai-more"></i></button>
                  </li>
                </ul>
              </div>
              <div class="card-body">
                <p>内容...</p>
              </div>
            </div>
          </div>
          <!-- .col-sm-6 -->
          
          <div class="col-sm-6 col-lg-3">
            <div class="card">
              <div class="card-header bg-warning">
                <h4>标题</h4>
                <ul class="card-actions">
                  <li>
                    <button type="button"><i class="ftsucai-more"></i></button>
                  </li>
                </ul>
              </div>
              <div class="card-body">
                <p>内容...</p>
              </div>
            </div>
          </div>
          <!-- .col-sm-6 -->
          
          <div class="col-sm-6 col-lg-3">
            <div class="card">
              <div class="card-header bg-danger">
                <h4>标题</h4>
                <ul class="card-actions">
                  <li>
                    <button type="button"><i class="ftsucai-more"></i></button>
                  </li>
                </ul>
              </div>
              <div class="card-body">
                <p>内容...</p>
              </div>
            </div>
          </div>
          <!-- .col-sm-6 -->
          
          <div class="col-sm-6 col-lg-3">
            <div class="card">
              <div class="card-header bg-purple">
                <h4>标题</h4>
                <ul class="card-actions">
                  <li>
                    <button type="button"><i class="ftsucai-more"></i></button>
                  </li>
                </ul>
              </div>
              <div class="card-body">
                <p>内容...</p>
              </div>
            </div>
          </div>
          <!-- .col-sm-6 -->
          
          <div class="col-sm-6 col-lg-3">
            <div class="card">
              <div class="card-header bg-cyan">
                <h4>标题</h4>
                <ul class="card-actions">
                  <li>
                    <button type="button"><i class="ftsucai-more"></i></button>
                  </li>
                </ul>
              </div>
              <div class="card-body">
                <p>内容...</p>
              </div>
            </div>
          </div>
          <!-- .col-sm-6 -->
          
          <div class="col-sm-6 col-lg-3">
            <div class="card">
              <div class="card-header bg-brown">
                <h4>标题</h4>
                <ul class="card-actions">
                  <li>
                    <button type="button"><i class="ftsucai-more"></i></button>
                  </li>
                </ul>
              </div>
              <div class="card-body">
                <p>内容...</p>
              </div>
            </div>
          </div>
          <!-- .col-sm-6 -->
        
        </div>
        
        <div class="row">
          <div class="col-sm-6">
            <div class="card">
              <div class="card-header">
                <h4>标题</h4>
                <ul class="card-actions">
                  <li>
                    <button type="button" data-toggle="tooltip" title="修改"><i class="ftsucai-edit-2"></i></button>
                  </li>
                  <li class="dropdown">
                    <button type="button" data-toggle="dropdown">更多 <span class="caret"></span></button>
                    <ul class="dropdown-menu dropdown-menu-right">
                      <li> <a tabindex="-1" href="javascript:void(0)"><span class="badge pull-right">3</span> 通知</a> </li>
                      <li> <a tabindex="-1" href="javascript:void(0)"><span class="badge pull-right">1</span> 消息</a> </li>
                      <li class="divider"></li>
                      <li> <a tabindex="-1" href="javascript:void(0)">更新个人信息</a> </li>
                    </ul>
                  </li>
                </ul>
                <!-- .card-actions --> 
              </div>
              <div class="card-body">
                <p>内容...</p>
              </div>
            </div>
          </div>
          <!-- .col-sm-6 -->
          
          <div class="col-sm-6">
            <div class="card">
              <div class="card-header">
                <h4>标题</h4>
                <ul class="card-actions">
                  <li> <span>文本 1</span> </li>
                  <li> <span>文本 2</span> </li>
                  <li> <span>文本 3</span> </li>
                </ul>
              </div>
              <div class="card-body">
                <p>内容...</p>
              </div>
            </div>
          </div>
          <!-- .col-sm-6 --> 
        </div>
        <!-- .row --> 
        <!-- End Cards with Actions -->
        
      </div>
      
    </main>
    <!--End 页面主要内容-->

<script type="text/javascript" src="${host }/admin/new-version/js/jquery.min.js"></script>
<script type="text/javascript" src="${host }/admin/new-version/js/bootstrap.js"></script>
<script type="text/javascript" src="${host }/admin/new-version/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="${host }/admin/new-version/js/main.min.js"></script>
</body>
</html>