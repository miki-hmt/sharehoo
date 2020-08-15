<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>系统配置 - bootstrap中文后台管理系统模板</title>
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
          <div class="col-lg-12">
            <div class="card">
              <ul class="nav nav-tabs page-tabs">
                <li> <a href="pages_config.html">基本信息</a> </li>
                <li class="active"> <a href="ftdms-config.html">系统设置</a> </li>
              </ul>
              <div class="tab-content">
                <div class="tab-pane active">
                  
                  <form action="#!" method="post" name="edit-form" class="edit-form">
                    <div class="form-group">
                      <label for="config_group">网站介绍</label>
<textarea class="form-control" id="config_group" rows="5" name="config_group" placeholder="请输入配置分组" ></textarea>
                    </div>
                    <div class="form-group">
                      <label for="form_item_type">版本说明</label>
<textarea class="form-control" id="form_item_type" rows="5" name="form_item_type" placeholder="请输入配置类型" ></textarea>
                    </div>
                    <div class="form-group">
                      <label for="wipe_cache_type">清除缓存类型</label>
                      <div class="controls-box">
                        <label class="ftdms-checkbox checkbox-inline checkbox-primary">
                          <input type="checkbox" name="wipe_cache_type[]" checked><span>应用缓存</span>
                        </label>
                        <label class="ftdms-checkbox checkbox-inline checkbox-primary">
                          <input type="checkbox" name="wipe_cache_type[]"><span>应用日志</span>
                        </label>
                        <label class="ftdms-checkbox checkbox-inline checkbox-primary">
                          <input type="checkbox" name="wipe_cache_type[]"><span>模板缓存</span>
                        </label>
                      </div>
                      <small class="help-block">清除缓存时，要删除的缓存类型</small>
                    </div>
                    <div class="form-group">
                      <label for="develop_mode">开发模式</label>
                      <div class="controls-box">
                        <label class="ftdms-radio radio-inline radio-primary">
                          <input type="radio" name="develop_mode" value="0" checked><span>关闭</span>
                        </label>
                        <label class="ftdms-radio radio-inline radio-primary">
                          <input type="radio" name="develop_mode" value="1"><span>开启</span>
                        </label>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="app_trace">显示页面Trace</label>
                      <div class="controls-box">
                        <label class="ftdms-radio radio-inline radio-primary">
                          <input type="radio" name="app_trace" value="0" checked><span>否</span>
                        </label>
                        <label class="ftdms-radio radio-inline radio-primary">
                          <input type="radio" name="app_trace" value="1"><span>是</span>
                        </label>
                      </div>
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

<script type="text/javascript" src="${host }/admin/new-version/js/jquery.min.js"></script>
<script type="text/javascript" src="${host }/admin/new-version/js/bootstrap.js"></script>
</body>
</html>
