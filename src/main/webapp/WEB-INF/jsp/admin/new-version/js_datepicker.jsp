<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>日期选择器 - bootstrap中文后台管理系统模板</title>
<link rel="icon" href="favicon.ico" type="image/ico">
<meta name="keywords" content="后台模板,后台管理系统,HTML模板">
<meta name="description" content="基于Bootstrap的后台管理系统模板">
<meta name="author" content="www.bootstrapmb.com">
<link href="${host }/admin/new-version/css/bootstrap.min.css" rel="stylesheet">
<link href="${host }/admin/new-version/css/fonts.css" rel="stylesheet">
<!--时间选择插件-->
<link rel="stylesheet" href="${host }/admin/new-version/js/bootstrap-datetimepicker/bootstrap-datetimepicker.min.css">
<!--日期选择插件-->
<link rel="stylesheet" href="${host }/admin/new-version/js/bootstrap-datepicker/bootstrap-datepicker3.min.css">
<link href="${host }/admin/new-version/css/style.css" rel="stylesheet">
</head>
  
<body>
    <!--页面主要内容-->
    <main class="ftdms-layout-content">
      
      <div class="container-fluid">
        
        <div class="row" style="margin-top:15px;">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-header"><h4>时间选择</h4></div>
              <div class="card-body">
                
                <input class="form-control js-datetimepicker" type="text" id="example-datetimepicker" name="add_time" placeholder="请选择具体时间" value="" data-side-by-side="true" data-locale="zh-cn" data-format="YYYY-MM-DD HH:mm" />
                
              </div>
            </div>
          </div>
          
          <div class="col-lg-12">
            <div class="card">
              <div class="card-header"><h4>日期选择</h4></div>
              <div class="card-body">
                
                <input class="form-control js-datepicker m-b-10" type="text" id="example-datepicker" name="example-datepicker" placeholder="yyyy-mm-dd" value="" data-date-format="yyyy-mm-dd" />
                
                <input class="form-control js-datepicker m-b-10" type="text" id="example-datepicker1" name="example-datepicker1" data-date-format="yyyy/mm/dd" placeholder="yyyy/mm/dd">
                
                <input class="form-control js-datepicker m-b-10" type="text" id="example-datepicker2" name="example-datepicker2" data-date-format="yy/mm/dd" placeholder="yy/mm/dd">
                
                <div class="input-daterange input-group">
                  <input class="form-control js-datepicker" data-date-format="yyyy-mm-dd" type="text" id="example-daterange1" name="example-daterange1" placeholder="从">
                  <span class="input-group-addon"><i class="mdi mdi-chevron-right"></i></span>
                  <input class="form-control js-datepicker" data-date-format="yyyy-mm-dd" type="text" id="example-daterange2" name="example-daterange2" placeholder="至">
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
<!--时间选择插件-->
<script src="${host }/admin/new-version/js/bootstrap-datetimepicker/moment.min.js"></script>
<script src="${host }/admin/new-version/js/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>
<script src="${host }/admin/new-version/js/bootstrap-datetimepicker/locale/zh-cn.js"></script>
<!--日期选择插件-->
<script src="${host }/admin/new-version/js/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
<script src="${host }/admin/new-version/js/bootstrap-datepicker/locales/bootstrap-datepicker.zh-CN.min.js"></script>
<script type="text/javascript" src="${host }/admin/new-version/js/main.min.js"></script>
</body>
</html>
