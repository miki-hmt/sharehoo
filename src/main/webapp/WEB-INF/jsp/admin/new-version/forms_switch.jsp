<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>开关 - bootstrap中文后台管理系统模板</title>
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
          <div class="col-xs-12 col-sm-6">
            <div class="card">
              <div class="card-header"><h4>默认开关样式</h4></div>
              <div class="card-body">
                <p>添加 <code>.switch-*</code> 以更改开关的外观：<code>.switch-success</code> <code>.switch-pink</code>...</p>
                <div class="example-box">
                  <div class="form-group row m-b-10">
                    <div class="col-xs-6">默认</div>
                    <div class="col-xs-6">
                      <label class="ftdms-switch">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                    </div>
                  </div>
                  <div class="form-group row m-b-10">
                    <div class="col-xs-6">Primary（主色）</div>
                    <div class="col-xs-6">
                      <label class="ftdms-switch switch-primary">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                    </div>
                  </div>
                  <div class="form-group row m-b-10">
                    <div class="col-xs-6">Success（成功）</div>
                    <div class="col-xs-6">
                      <label class="ftdms-switch switch-success">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                    </div>
                  </div>
                  <div class="form-group row m-b-10">
                    <div class="col-xs-6">Secondary（灰色）</div>
                    <div class="col-xs-6">
                      <label class="ftdms-switch switch-secondary">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                    </div>
                  </div>
                  <div class="form-group row m-b-10">
                    <div class="col-xs-6">Info（一般信息）</div>
                    <div class="col-xs-6">
                      <label class="ftdms-switch switch-info">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                    </div>
                  </div>
                  <div class="form-group row m-b-10">
                    <div class="col-xs-6">Warning（警告）</div>
                    <div class="col-xs-6">
                      <label class="ftdms-switch switch-warning">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                    </div>
                  </div>
                  <div class="form-group row m-b-10">
                    <div class="col-xs-6">Danger（危险）</div>
                    <div class="col-xs-6">
                      <label class="ftdms-switch switch-danger">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                    </div>
                  </div>
                  <div class="form-group row">
                    <div class="col-xs-6">Dark（黑色）</div>
                    <div class="col-xs-6">
                      <label class="ftdms-switch switch-dark">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                    </div>
                  </div>
                  <div class="form-group row">
                    <div class="col-xs-6">Purple（紫色）</div>
                    <div class="col-xs-6">
                      <label class="ftdms-switch switch-purple">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                    </div>
                  </div>
                  <div class="form-group row">
                    <div class="col-xs-6">Pink（粉红色）</div>
                    <div class="col-xs-6">
                      <label class="ftdms-switch switch-pink">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                    </div>
                  </div>
                  <div class="form-group row">
                    <div class="col-xs-6">Cyan（青色）</div>
                    <div class="col-xs-6">
                      <label class="ftdms-switch switch-cyan">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                    </div>
                  </div>
                  <div class="form-group row">
                    <div class="col-xs-6">Yellow（黄色）</div>
                    <div class="col-xs-6">
                      <label class="ftdms-switch switch-yellow">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                    </div>
                  </div>
                  <div class="form-group row">
                    <div class="col-xs-6">Brown（棕色）</div>
                    <div class="col-xs-6">
                      <label class="ftdms-switch switch-brown">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                    </div>
                  </div>
                </div>
				<br><br><br>
                <!-- end example-box -->
              </div>
            </div>
          </div>
          <div class="col-xs-12 col-sm-6">
            <div class="card">
              <div class="card-header"><h4>纯色风格开关</h4></div>
              <div class="card-body">
                <div class="example-box">
                  <p>给开关添加 <code>.switch-solid</code>。</p>
                  <div class="form-group row m-b-10">
                    <div class="col-xs-6">默认</div>
                    <div class="col-xs-6">
                      <label class="ftdms-switch switch-solid">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                    </div>
                  </div>
                  <div class="form-group row m-b-10">
                    <div class="col-xs-6">Primary（主色）</div>
                    <div class="col-xs-6">
                      <label class="ftdms-switch switch-solid switch-primary">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                    </div>
                  </div>
                  <div class="form-group row m-b-10">
                    <div class="col-xs-6">Success（成功）</div>
                    <div class="col-xs-6">
                      <label class="ftdms-switch switch-solid switch-success">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                    </div>
                  </div>
                  <div class="form-group row m-b-10">
                    <div class="col-xs-6">Secondary（灰色）</div>
                    <div class="col-xs-6">
                      <label class="ftdms-switch switch-solid switch-secondary">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                    </div>
                  </div>
                  <div class="form-group row m-b-10">
                    <div class="col-xs-6">Info（一般信息）</div>
                    <div class="col-xs-6">
                      <label class="ftdms-switch switch-solid switch-info">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                    </div>
                  </div>
                  <div class="form-group row m-b-10">
                    <div class="col-xs-6">Warning（警告）</div>
                    <div class="col-xs-6">
                      <label class="ftdms-switch switch-solid switch-warning">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                    </div>
                  </div>
                  <div class="form-group row m-b-10">
                    <div class="col-xs-6">Danger（危险）</div>
                    <div class="col-xs-6">
                      <label class="ftdms-switch switch-solid switch-danger">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                    </div>
                  </div>
                  <div class="form-group row m-b-10">
                    <div class="col-xs-6">Dark（黑色）</div>
                    <div class="col-xs-6">
                      <label class="ftdms-switch switch-solid switch-dark">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                    </div>
                  </div>
                  <div class="form-group row">
                    <div class="col-xs-6">Purple（紫色）</div>
                    <div class="col-xs-6">
                      <label class="ftdms-switch switch-solid switch-purple">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                    </div>
                  </div>
                  <div class="form-group row">
                    <div class="col-xs-6">Pink（粉红色）</div>
                    <div class="col-xs-6">
                      <label class="ftdms-switch switch-solid switch-pink">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                    </div>
                  </div>
                  <div class="form-group row">
                    <div class="col-xs-6">Cyan（青色）</div>
                    <div class="col-xs-6">
                      <label class="ftdms-switch switch-solid switch-cyan">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                    </div>
                  </div>
                  <div class="form-group row">
                    <div class="col-xs-6">Yellow（黄色）</div>
                    <div class="col-xs-6">
                      <label class="ftdms-switch switch-solid switch-yellow">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                    </div>
                  </div>
                  <div class="form-group row">
                    <div class="col-xs-6">Brown（棕色）</div>
                    <div class="col-xs-6">
                      <label class="ftdms-switch switch-solid switch-brown">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                    </div>
                  </div>
                </div>
                <!-- end example-box -->
              </div>
            </div>
          </div>
        </div>
        
        <div class="row">
          <div class="col-xs-12 col-sm-6">
            <div class="card">
              <div class="card-header"><h4>浅色背景开关样式</h4></div>
              <div class="card-body">
                <p>添加 <code>.switch-light</code> 以改变背景颜色。</p>
                <div class="example-box">
                  <div class="form-group row m-b-10">
                    <div class="col-xs-6">默认</div>
                    <div class="col-xs-6">
                      <label class="ftdms-switch switch-light">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                    </div>
                  </div>
                  <div class="form-group row m-b-10">
                    <div class="col-xs-6">Primary（主色）</div>
                    <div class="col-xs-6">
                      <label class="ftdms-switch switch-primary switch-light">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                    </div>
                  </div>
                  <div class="form-group row m-b-10">
                    <div class="col-xs-6">Success（成功）</div>
                    <div class="col-xs-6">
                      <label class="ftdms-switch switch-success switch-light">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                    </div>
                  </div>
                  <div class="form-group row m-b-10">
                    <div class="col-xs-6">Secondary（灰色）</div>
                    <div class="col-xs-6">
                      <label class="ftdms-switch switch-secondary switch-light">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                    </div>
                  </div>
                  <div class="form-group row m-b-10">
                    <div class="col-xs-6">Info（一般信息）</div>
                    <div class="col-xs-6">
                      <label class="ftdms-switch switch-info switch-light">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                    </div>
                  </div>
                  <div class="form-group row m-b-10">
                    <div class="col-xs-6">Warning（警告）</div>
                    <div class="col-xs-6">
                      <label class="ftdms-switch switch-warning switch-light">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                    </div>
                  </div>
                  <div class="form-group row m-b-10">
                    <div class="col-xs-6">Danger（危险）</div>
                    <div class="col-xs-6">
                      <label class="ftdms-switch switch-danger switch-light">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                    </div>
                  </div>
                  <div class="form-group row m-b-10">
                    <div class="col-xs-6">Dark（黑色）</div>
                    <div class="col-xs-6">
                      <label class="ftdms-switch switch-dark switch-light">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                    </div>
                  </div>
                  <div class="form-group row">
                    <div class="col-xs-6">Purple（紫色）</div>
                    <div class="col-xs-6">
                      <label class="ftdms-switch switch-light switch-purple">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                    </div>
                  </div>
                  <div class="form-group row">
                    <div class="col-xs-6">Pink（粉红色）</div>
                    <div class="col-xs-6">
                      <label class="ftdms-switch switch-light switch-pink">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                    </div>
                  </div>
                  <div class="form-group row">
                    <div class="col-xs-6">Cyan（青色）</div>
                    <div class="col-xs-6">
                      <label class="ftdms-switch switch-light switch-cyan">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                    </div>
                  </div>
                  <div class="form-group row">
                    <div class="col-xs-6">Yellow（黄色）</div>
                    <div class="col-xs-6">
                      <label class="ftdms-switch switch-light switch-yellow">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                    </div>
                  </div>
                  <div class="form-group row">
                    <div class="col-xs-6">Brown（棕色）</div>
                    <div class="col-xs-6">
                      <label class="ftdms-switch switch-light switch-brown">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                    </div>
                  </div>
                </div>
                <!-- end example-box -->
              </div>
            </div>
          </div>
          <div class="col-xs-12 col-sm-6">
            <div class="card">
              <div class="card-header"><h4>边框风格开关</h4></div>
              <div class="card-body">
                <div class="example-box">
                  <p>给开关添加 <code>.switch-outline</code>。</p>
                  <div class="form-group row m-b-10">
                    <div class="col-xs-6">默认</div>
                    <div class="col-xs-6">
                      <label class="ftdms-switch switch-outline">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                    </div>
                  </div>
                  <div class="form-group row m-b-10">
                    <div class="col-xs-6">Primary（主色）</div>
                    <div class="col-xs-6">
                      <label class="ftdms-switch switch-outline switch-primary">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                    </div>
                  </div>
                  <div class="form-group row m-b-10">
                    <div class="col-xs-6">Success（成功）</div>
                    <div class="col-xs-6">
                      <label class="ftdms-switch switch-outline switch-success">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                    </div>
                  </div>
                  <div class="form-group row m-b-10">
                    <div class="col-xs-6">Secondary（灰色）</div>
                    <div class="col-xs-6">
                      <label class="ftdms-switch switch-outline switch-secondary">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                    </div>
                  </div>
                  <div class="form-group row m-b-10">
                    <div class="col-xs-6">Info（一般信息）</div>
                    <div class="col-xs-6">
                      <label class="ftdms-switch switch-outline switch-info">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                    </div>
                  </div>
                  <div class="form-group row m-b-10">
                    <div class="col-xs-6">Warning（警告）</div>
                    <div class="col-xs-6">
                      <label class="ftdms-switch switch-outline switch-warning">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                    </div>
                  </div>
                  <div class="form-group row m-b-10">
                    <div class="col-xs-6">Danger（危险）</div>
                    <div class="col-xs-6">
                      <label class="ftdms-switch switch-outline switch-danger">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                    </div>
                  </div>
                  <div class="form-group row m-b-10">
                    <div class="col-xs-6">Dark（黑色）</div>
                    <div class="col-xs-6">
                      <label class="ftdms-switch switch-outline switch-dark">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                    </div>
                  </div>
                  <div class="form-group row">
                    <div class="col-xs-6">Purple（紫色）</div>
                    <div class="col-xs-6">
                      <label class="ftdms-switch switch-outline switch-purple">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                    </div>
                  </div>
                  <div class="form-group row">
                    <div class="col-xs-6">Pink（粉红色）</div>
                    <div class="col-xs-6">
                      <label class="ftdms-switch switch-outline switch-pink">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                    </div>
                  </div>
                  <div class="form-group row">
                    <div class="col-xs-6">Cyan（青色）</div>
                    <div class="col-xs-6">
                      <label class="ftdms-switch switch-outline switch-cyan">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                    </div>
                  </div>
                  <div class="form-group row">
                    <div class="col-xs-6">Yellow（黄色）</div>
                    <div class="col-xs-6">
                      <label class="ftdms-switch switch-outline switch-yellow">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                    </div>
                  </div>
                  <div class="form-group row">
                    <div class="col-xs-6">Brown（棕色）</div>
                    <div class="col-xs-6">
                      <label class="ftdms-switch switch-outline switch-brown">
                        <input type="checkbox" checked="">
                        <span></span>
                      </label>
                    </div>
                  </div>
                </div>
                <!-- end example-box -->
              </div>
            </div>
          </div>
        </div>
        
      </div>
      
    </main>
    <!--End 页面主要内容-->

</body>
</html>
