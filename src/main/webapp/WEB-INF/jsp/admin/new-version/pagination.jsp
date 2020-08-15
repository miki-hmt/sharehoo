
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
<title>分页 - bootstrap中文后台管理系统模板</title>
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
              <div class="card-header"><h4>分页</h4></div>
              <div class="card-body">
                <h5>基本样式</h5>
                <nav>
                  <ul class="pagination">
                    <li class="disabled">
                      <a href="#">
                        <span><i class="ftsucai-146"></i></span>
                      </a>
                    </li>
                    <li class="active"><a href="#">1</a></li>
                    <li><a class="submenuitem" href="pagination.html#2">2</a></li>
                    <li><a class="submenuitem" href="pagination.html#3">3</a></li>
                    <li><a class="submenuitem" href="pagination.html#4">4</a></li>
                    <li><a class="submenuitem" href="pagination.html#5">5</a></li>
                    <li>
                      <a href="#"><span><i class="ftsucai-139"></i></span></a>
                    </li>
                  </ul>
                </nav>
                
                <hr>
                <h5>无边框 <code>.no-border</code></h5>
                <nav>
                  <ul class="pagination no-border">
                    <li class="disabled">
                      <a href="#">
                        <span><i class="ftsucai-146"></i></span>
                      </a>
                    </li>
                    <li class="active"><a href="#">1</a></li>
                    <li><a class="submenuitem" href="pagination.html#2">2</a></li>
                    <li><a class="submenuitem" href="pagination.html#3">3</a></li>
                    <li><a class="submenuitem" href="pagination.html#4">4</a></li>
                    <li><a class="submenuitem" href="pagination.html#5">5</a></li>
                    <li>
                      <a href="#">
                        <span><i class="ftsucai-139"></i></span>
                      </a>
                    </li>
                  </ul>
                </nav>
                
                <hr>
                <h5>圆角边框 <code>.pagination-circle</code></h5>
                <nav>
                  <ul class="pagination pagination-circle">
                    <li class="disabled">
                      <a href="#">
                        <span><i class="ftsucai-146"></i></span>
                      </a>
                    </li>
                    <li class="active"><a href="#">1</a></li>
                    <li><a class="submenuitem" href="pagination.html#2">2</a></li>
                    <li><a class="submenuitem" href="pagination.html#3">3</a></li>
                    <li><a class="submenuitem" href="pagination.html#4">4</a></li>
                    <li><a class="submenuitem" href="pagination.html#5">5</a></li>
                    <li>
                      <a href="#">
                        <span><i class="ftsucai-139"></i></span>
                      </a>
                    </li>
                  </ul>
                </nav>
                
                <hr>
                <h5>无间隔 <code>.no-gutters</code></h5>
                <nav>
                  <ul class="pagination no-gutters">
                    <li class="disabled">
                      <a href="#">
                        <span><i class="ftsucai-146"></i></span>
                      </a>
                    </li>
                    <li class="active"><a href="#">1</a></li>
                    <li><a class="submenuitem" href="pagination.html#2">2</a></li>
                    <li><a class="submenuitem" href="pagination.html#3">3</a></li>
                    <li><a class="submenuitem" href="pagination.html#4">4</a></li>
                    <li><a class="submenuitem" href="pagination.html#5">5</a></li>
                    <li>
                      <a href="#">
                        <span><i class="ftsucai-139"></i></span>
                      </a>
                    </li>
                  </ul>
                </nav>
                
                <hr>
                <h5>大小尺寸 <code>.pagination-sm</code> <code>.pagination-lg</code></h5>
                <nav>
                  <ul class="pagination pagination-sm">
                    <li class="disabled">
                      <a href="#">
                        <span><i class="ftsucai-146"></i></span>
                      </a>
                    </li>
                    <li class="active"><a href="#">1</a></li>
                    <li><a class="submenuitem" href="pagination.html#2">2</a></li>
                    <li><a class="submenuitem" href="pagination.html#3">3</a></li>
                    <li><a class="submenuitem" href="pagination.html#4">4</a></li>
                    <li><a class="submenuitem" href="pagination.html#5">5</a></li>
                    <li>
                      <a href="#">
                        <span><i class="ftsucai-139"></i></span>
                      </a>
                    </li>
                  </ul>
                </nav>
                <nav>
                  <ul class="pagination">
                    <li class="disabled">
                      <a href="#">
                        <span><i class="ftsucai-146"></i></span>
                      </a>
                    </li>
                    <li class="active"><a href="#">1</a></li>
                    <li><a class="submenuitem" href="pagination.html#2">2</a></li>
                    <li><a class="submenuitem" href="pagination.html#3">3</a></li>
                    <li><a class="submenuitem" href="pagination.html#4">4</a></li>
                    <li><a class="submenuitem" href="pagination.html#5">5</a></li>
                    <li>
                      <a href="#">
                        <span><i class="ftsucai-139"></i></span>
                      </a>
                    </li>
                  </ul>
                </nav>
                <nav>
                  <ul class="pagination pagination-lg">
                    <li class="disabled">
                      <a href="#">
                        <span><i class="ftsucai-146"></i></span>
                      </a>
                    </li>
                    <li class="active"><a href="#">1</a></li>
                    <li><a class="submenuitem" href="pagination.html#2">2</a></li>
                    <li><a class="submenuitem" href="pagination.html#3">3</a></li>
                    <li><a class="submenuitem" href="pagination.html#4">4</a></li>
                    <li><a class="submenuitem" href="pagination.html#5">5</a></li>
                    <li>
                      <a href="#">
                        <span><i class="ftsucai-139"></i></span>
                      </a>
                    </li>
                  </ul>
                </nav>
                
              </div>
            </div>
          </div>
        </div>
        
      </div>
      
    </main>
    <!--End 页面主要内容-->

</body>
</html>