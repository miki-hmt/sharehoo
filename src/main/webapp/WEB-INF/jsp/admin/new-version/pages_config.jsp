<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>系统设置</title>
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
              <ul class="nav nav-tabs page-tabs">
                <li class="active"> <a href="#">基本信息</a> </li>
                <li> <a href="ftdms-config.html">系统设置</a> </li>
              </ul>
              <div class="tab-content">
                <div class="tab-pane active">
                  
                  <form action="#!" method="post" name="edit-form" class="edit-form">
                    <div class="form-group">
                      <label for="web_site_title">网站名称</label>
                      <input class="form-control" type="text" id="web_site_title" name="web_site_title" value="bootstrap中文" >
                    </div>
                    <div class="form-group">
                      <label for="web_site_logo">LOGO图片</label>
                      <div class="input-group">
                        <input type="text" class="form-control" name="web_site_logo" id="web_site_logo" value="/images/logo.png" />
                        <div class="input-group-btn"><button class="btn btn-default" type="button">上传图片</button></div>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="web_site_keywords">站点关键词</label>
                      <input class="form-control" type="text" id="web_site_keywords" name="web_site_keywords" value="下载系统,CMS系统,素材下载系统,源码下载,模板下载,bootstrap后台模板,响应式后台模板">
                    </div>
                    <div class="form-group">
                      <label for="web_site_description">站点描述</label>
                      <textarea class="form-control" id="web_site_description" rows="5" name="web_site_description">下载系统,CMS系统,素材下载系统,源码下载,模板下载,bootstrap后台模板,响应式后台模板,响应式后台管理模板,html5后台管理模板,oa系统模板,统计后台,ui框架</textarea>
                    </div>
                    <div class="form-group">
                      <label for="web_site_copyright">版权信息</label>
                      <input class="form-control" type="text" id="web_site_copyright" name="web_site_copyright" value="" placeholder="请输入版权信息" >
                    </div>
                    <div class="form-group">
                      <label for="web_site_icp">备案信息</label>
                      <input class="form-control" type="text" id="web_site_icp" name="web_site_icp" value="" placeholder="请输入备案信息" >
                    </div>
                    <div class="form-group">
                      <label class="btn-block" for="web_site_status">设置开关</label>
                      <label class="ftdms-switch switch-solid switch-primary">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                      <small class="help-block">站点关闭后将不能访问，后台可正常登录</small>
                    </div>
                    <div class="form-group">
                      <button type="submit" class="btn btn-primary m-r-5">确 定</button>
                      <button type="button" class="btn btn-default" onclick="javascript:history.back(-1);return false;">返 回</button>
                    </div>
                  </form>
                  
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
