<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>通知消息 - bootstrap中文后台管理系统模板</title>
<link rel="icon" href="favicon.ico" type="image/ico">
<meta name="keywords" content="后台模板,后台管理系统,HTML模板">
<meta name="description" content="基于Bootstrap的后台管理系统模板">
<meta name="author" content="www.bootstrapmb.com">
<link href="${host }/admin/new-version/css/bootstrap.min.css" rel="stylesheet">
<link href="${host }/admin/new-version/css/fonts.css" rel="stylesheet">
<link href="${host }/admin/new-version/css/animate.css" rel="stylesheet">
<link href="${host }/admin/new-version/css/style.css" rel="stylesheet">
</head>
  
<body>
    <!--页面主要内容-->
    <main class="ftdms-layout-content">
      
      <div class="container-fluid">
        
        <div class="row" style="margin-top:15px;">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-header"><h4>通知消息</h4></div>
              <div class="card-body">
                
                <button type="button" class="btn btn-primary" id="example-success-notify">确认修改</button>
                <button type="button" class="btn btn-dark" id="example-error-notify">修改失败</button>
                
                <p class="m-t-10">页面加载等待效果</p>
                <pre><code>tips.loading('show');  // 显示
tips.loading('hide');  // 隐藏</code></pre>
                
                <p class="m-t-10">消息提示</p>
                <table class="table table-bordered">
                  <tr>
                    <th>参数</th>
                    <th>说明</th>
                  </tr>
                  <tr>
                    <td>$msg</td>
                    <td>提示信息</td>
                  </tr>
                  <tr>
                    <td>$type</td>
                    <td>提示类型：'info', 'success', 'warning', 'danger'</td>
                  </tr>
                  <tr>
                    <td>$delay</td>
                    <td>定义消息提示消失的时间，毫秒数</td>
                  </tr>
                  <tr>
                    <td>$icon</td>
                    <td>图标，具体参考<a href="ui_icons.html">图标</a> </td>
                  </tr>
                  <tr>
                    <td>$from</td>
                    <td>'top' 或 'bottom'</td>
                  </tr>
                  <tr>
                    <td>$align</td>
                    <td>'left', 'right', 'center'</td>
                  </tr>
                </table>
                <pre><code>tips.notify('修改成功，页面即将自动跳转~', 'success', 5000, 'ftsucai-name', 'top', 'center');</code></pre>
              </div>
            </div>
          </div>
          
        </div>
        
      </div>
      
    </main>
    <!--End 页面主要内容-->

<script type="text/javascript" src="${host }/admin/new-version/js/jquery.min.js"></script>
<!--消息提示-->
<script src="${host }/admin/new-version/js/bootstrap-notify.min.js"></script>
<script type="text/javascript" src="${host }/admin/new-version/js/tips.js"></script>
<script type="text/javascript" src="${host }/admin/new-version/js/main.min.js"></script>

<script type="text/javascript">
// 消息提示示例
$('#example-success-notify').on('click', function(){
    tips.loading('show');
    // 假设ajax提交操作
    setTimeout(function() {
        tips.loading('hide');
        tips.notify('修改成功，页面即将自动跳转~', 'success', 3000);
    }, 1e3)
});
$('#example-error-notify').on('click', function(){
    tips.loading('show');
    // 假设ajax提交操作
    setTimeout(function() {
        tips.loading('hide');
        tips.notify('服务器错误，请稍后再试~', 'danger', 100);
    }, 1e3)
});
</script>
</body>
</html>
