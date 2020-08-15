
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
<title>按钮 - 后台管理系统模板</title>
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
              <div class="card-header"><h4>按钮</h4></div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table table-bordered table-striped table-vcenter">
                    <thead>
                      <tr>
                        <th class="w-15">按钮</th>
                        <th>class=""</th>
                        <th class="w-15">按钮</th>
                        <th>class=""</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td><button class="btn btn-default btn-w-md" type="button">默认按钮</button></td>
                        <td><code>btn btn-default</code></td>
                        <td><button class="btn btn-primary btn-w-md" type="button">主要颜色按钮</button></td>
                        <td><code>btn btn-primary</code></td>
                      </tr>
                      <tr>
                        <td><button class="btn btn-success btn-w-md" type="button">绿色按钮</button></td>
                        <td><code>btn btn-success</code></td>
                        <td><button class="btn btn-info btn-w-md" type="button">一般信息按钮</button></td>
                        <td><code>btn btn-info</code></td>
                      </tr>
                      <tr>
                        <td><button class="btn btn-warning btn-w-md" type="button">橙色按钮</button></td>
                        <td><code>btn btn-warning</code></td>
                        <td><button class="btn btn-danger btn-w-md" type="button">红色按钮</button></td>
                        <td><code>btn btn-danger</code></td>
                      </tr>
                      <tr>
                        <td><button class="btn btn-secondary btn-w-md" type="button">次要颜色按钮</button></td>
                        <td><code>btn btn-secondary</code></td>
                        <td><button class="btn btn-dark btn-w-md" type="button">黑色按钮</button></td>
                        <td><code>btn btn-dark</code></td>
                      </tr>
                      <tr>
                        <td><button class="btn btn-purple btn-w-md" type="button">紫色按钮</button></td>
                        <td><code>btn btn-purple</code></td>
                        <td><button class="btn btn-pink btn-w-md" type="button">粉红色按钮</button></td>
                        <td><code>btn btn-pink</code></td>
                      </tr>
                      <tr>
                        <td><button class="btn btn-cyan btn-w-md" type="button">青色按钮</button></td>
                        <td><code>btn btn-cyan</code></td>
                        <td><button class="btn btn-yellow btn-w-md" type="button">黄色按钮</button></td>
                        <td><code>btn btn-yellow</code></td>
                      </tr>
                      <tr>
                        <td><button class="btn btn-brown btn-w-md" type="button">棕色按钮</button></td>
                        <td><code>btn btn-brown</code></td>
                        <td><button class="btn btn-link" type="button">链接形式</button></td>
                        <td><code>btn btn-link</code></td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>  
          </div>
          
          <div class="col-lg-12">
            <div class="card">
              <div class="card-header"><h4>其他按钮样式</h4></div>
              <div class="card-body">
                <div class="row">
                  <div class="col-lg-6">
                    <h5>圆角按钮</h5>
                    <p><code>class</code> 中增加 <code>.btn-round</code>。</p>
                    <div class="example-box">
                      <button class="btn btn-w-md btn-round btn-primary">主色按钮</button>
                      <button class="btn btn-w-md btn-round btn-secondary">次色按钮</button>
                      <button class="btn btn-w-md btn-round btn-success">绿色按钮</button>
                      <button class="btn btn-w-md btn-round btn-info">信息按钮</button>
                    </div>
                  </div>
                  <div class="col-lg-6">
                    <h5>带图标的按钮</h5>
                    <p><code>class</code> 中增加 <code>.btn-label</code>，<code>button</code> 元素中增加 <code>label</code> 元素。</p>
                    <div class="example-box">
                      <button class="btn btn-label btn-primary"><label><i class="ftsucai-gou-2"></i></label> 确认提交</button>
                      <button class="btn btn-label btn-warning"><label><i class="ftsucai-del-1"></i></label> 清空数据</button>
                      <button class="btn btn-label btn-danger"><label><i class="ftsucai-close-5"></i></label> 删除</button>
                    </div>
                  </div>
                </div>
                
                <div class="row">
                  <div class="col-lg-12">
                    <hr>
                    <h5>指定按钮宽度</h5>
                    <p>可使用 <code>.btn-w-xs</code>, <code>.btn-w-sm</code>, <code>.btn-w-md</code>, <code>.btn-w-lg</code> 和 <code>.btn-w-xl</code> 类指定按钮宽度。</p>
                    <div class="example-box">
                      <button class="btn btn-w-xs btn-primary">极小宽</button>
                      <button class="btn btn-w-sm btn-primary">小的</button>
                      <button class="btn btn-w-md btn-primary">中等宽度</button>
                      <button class="btn btn-w-lg btn-primary">宽按钮</button>
                      <button class="btn btn-w-xl btn-primary">超宽</button>
                    </div>
                    <hr>
                  </div>
                  <div class="col-lg-6">
                    <h5>按钮大小</h5>
                    <p>使用 <code>.btn-lg</code>, <code>.btn-sm</code> 和 <code>.btn-xs</code> 类指定按钮的大小。</p>
                    <div class="example-box">
                      <button class="btn btn-lg btn-primary">大的按钮</button>
                      <button class="btn btn-primary">默认按钮</button>
                      <button class="btn btn-sm btn-primary">小按钮</button>
                      <button class="btn btn-xs btn-primary">极小的按钮</button>
                    </div>
                  </div>
                  <div class="col-lg-6">
                    <h5>块级元素按钮</h5>
                    <p>加上 <code>.btn-block</code> 类可以使得按钮变成一个块级元素按钮。</p>
                    <button class="btn btn-block btn-primary">块级元素按钮</button>
                  </div>
                </div>
                
              </div>
            </div>
          </div>
          
          <div class="col-lg-12">
            <div class="card">
              <div class="card-header"><h4>切换选择按钮</h4></div>
              <div class="card-body">
                <div class="row"> 
                  
                  <div class="col-lg-4">
                    <h5>单个按钮</h5>
                    <button class="btn btn-primary" data-toggle="button">单按钮切换</button>
                  </div>
                  
                  <div class="col-lg-4">
                    <h5>多选</h5>
                    <div class="btn-group btn-group-toggle" data-toggle="buttons">
                      <label class="btn btn-primary active">
                        <input type="checkbox" checked autocomplete="off">
                        <i class="ftsucai-ren"></i>
                      </label>
                      <label class="btn btn-primary">
                        <input type="checkbox" autocomplete="off">
                        <i class="ftsucai-ren"></i>
                      </label>
                      <label class="btn btn-primary">
                        <input type="checkbox" autocomplete="off">
                        <i class="ftsucai-ren"></i>
                      </label>
                    </div>
                  </div>
                  
                  <div class="col-lg-4">
                    <h5>单选</h5>
                    <div class="btn-group btn-group-toggle" data-toggle="buttons">
                      <label class="btn btn-primary active">
                        <input type="radio" name="options" id="option1" autocomplete="off" checked>
                        <i class="ftsucai-paragraph-left"></i> </label>
                      <label class="btn btn-primary">
                        <input type="radio" name="options" id="option2" autocomplete="off">
                        <i class="ftsucai-paragraph-justify"></i> </label>
                      <label class="btn btn-primary">
                        <input type="radio" name="options" id="option3" autocomplete="off">
                        <i class="ftsucai-paragraph-right"></i> </label>
                      <label class="btn btn-primary">
                        <input type="radio" name="options" id="option3" autocomplete="off">
                        <i class="ftsucai-edit-2"></i> </label>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          
          <div class="col-lg-12">
            <div class="card">
              <div class="card-header"><h4>按钮组</h4></div>
              <div class="card-body">
                
                <div class="row">
                  <div class="col-lg-4">
                    <h5>默认</h5>
                    <div class="btn-group">
                      <button class="btn btn-default">左</button>
                      <button class="btn btn-default">中</button>
                      <button class="btn btn-default">右</button>
                    </div>
                    <hr>
                    <h5>圆角</h5>
                    <div class="btn-group btn-group-round">
                      <button class="btn btn-default">左</button>
                      <button class="btn btn-default">中</button>
                      <button class="btn btn-default">右</button>
                    </div>
                    <hr>
                    <h5>两端对齐的</h5>
                    <div class="btn-group btn-group-justified">
                      <button class="btn btn-default">左</button>
                      <button class="btn btn-default">中</button>
                      <button class="btn btn-default">右</button>
                    </div>
                  </div>
                  <div class="col-lg-4 text-center">
                    <h5>垂直的</h5>
                    <div class="btn-group-vertical">
                      <button class="btn btn-default">上</button>
                      <button class="btn btn-default">中</button>
                      <button class="btn btn-default">下</button>
                    </div>
                    <hr>
                    <h5>嵌套的</h5>
                    <div class="btn-group">
                      <div class="btn-group">
                        <button id="btnGroupDrop1" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          导出 <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu">
                          <li><a href="#"><i class="ftsucai-file-openoffice"></i> Zip</a></li>
                          <li><a href="#"><i class="ftsucai-file-pdf"></i> PDF</a></li>
                          <li><a href="#"><i class="ftsucai-file-excel"></i> Excel</a></li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-4">
                    <h5>大小尺寸</h5>
                    <div class="btn-group btn-group-xs">
                      <button class="btn btn-default">左</button>
                      <button class="btn btn-default">中</button>
                      <button class="btn btn-default">右</button>
                    </div>
                    <br><br>
                    <div class="btn-group btn-group-sm">
                      <button class="btn btn-default">左</button>
                      <button class="btn btn-default">中</button>
                      <button class="btn btn-default">右</button>
                    </div>
                    <br><br>
                    <div class="btn-group">
                      <button class="btn btn-default">左</button>
                      <button class="btn btn-default">中</button>
                      <button class="btn btn-default">右</button>
                    </div>
                    <br><br>
                    <div class="btn-group btn-group-lg">
                      <button class="btn btn-default">左</button>
                      <button class="btn btn-default">中</button>
                      <button class="btn btn-default">右</button>
                    </div>
                  </div>
                </div>
                
              </div>
            </div>
          </div>
          
          <div class="col-lg-12">
            <div class="card">
              <div class="card-header"><h4>下拉菜单按钮</h4></div>
              <div class="card-body">
                
                <div class="row">
                  <!--单按钮下拉菜单-->
                  <div class="col-lg-6">
                    <h5>单按钮下拉菜单</h5>
                    <div class="btn-group">
                      <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        分类 <span class="caret"></span>
                      </button>
                      <ul class="dropdown-menu">
                        <li><a href="#">分类</a></li>
                        <li><a href="#">分类</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">分类2</a></li>
                      </ul>
                    </div>
                    <div class="btn-group">
                      <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        分类 <span class="caret"></span>
                      </button>
                      <ul class="dropdown-menu">
                        <li><a href="#">分类</a></li>
                        <li><a href="#">分类</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">分类2</a></li>
                      </ul>
                    </div>
                    <div class="btn-group">
                      <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        分类 <span class="caret"></span>
                      </button>
                      <ul class="dropdown-menu">
                        <li><a href="#">分类</a></li>
                        <li><a href="#">分类</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">分类2</a></li>
                      </ul>
                    </div>
                    <div class="btn-group">
                      <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        分类 <span class="caret"></span>
                      </button>
                      <ul class="dropdown-menu">
                        <li><a href="#">分类</a></li>
                        <li><a href="#">分类</a></li>
                        <li><a href="#">分类</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">分类2</a></li>
                      </ul>
                    </div>
                  </div>
                  
                  <!--拆分按钮下拉菜单-->
                  <div class="col-lg-6">
                    <h5>拆分按钮下拉菜单</h5>
                    <div class="btn-group">
                      <button type="button" class="btn btn-primary">分类</button>
                      <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="caret"></span>
                        <span class="sr-only">切换下拉列表</span>
                      </button>
                      <ul class="dropdown-menu">
                        <li><a href="#">分类</a></li>
                        <li><a href="#">分类</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">分类2</a></li>
                      </ul>
                    </div>
                    <div class="btn-group">
                      <button type="button" class="btn btn-success">分类</button>
                      <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="caret"></span>
                        <span class="sr-only">切换下拉列表</span>
                      </button>
                      <ul class="dropdown-menu">
                        <li><a href="#">分类</a></li>
                        <li><a href="#">分类</a></li>
                        <li><a href="#">分类</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">分类2</a></li>
                      </ul>
                    </div>
                    <div class="btn-group">
                      <button type="button" class="btn btn-info">分类</button>
                      <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="caret"></span>
                        <span class="sr-only">切换下拉列表</span>
                      </button>
                      <ul class="dropdown-menu">
                        <li><a href="#">分类</a></li>
                        <li><a href="#">分类</a></li>
                        <li><a href="#">分类</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">分类2</a></li>
                      </ul>
                    </div>
                    <div class="btn-group">
                      <button type="button" class="btn btn-secondary">分类</button>
                      <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="caret"></span>
                        <span class="sr-only">切换下拉列表</span>
                      </button>
                      <ul class="dropdown-menu">
                        <li><a href="#">分类</a></li>
                        <li><a href="#">分类</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">分类2</a></li>
                      </ul>
                    </div>
                  </div>
                  
                  <!--向上弹出菜单按钮-->
                  <div class="col-lg-6">
                    <hr>
                    <h5>向上弹出菜单按钮</h5>
                    <div class="btn-group dropup">
                      <button type="button" class="btn btn-primary">分类</button>
                      <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="caret"></span>
                        <span class="sr-only">切换下拉列表</span>
                      </button>
                      <ul class="dropdown-menu">
                        <li><a href="#">分类</a></li>
                        <li><a href="#">分类</a></li>
                        <li><a href="#">分类</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">分类2</a></li>
                      </ul>
                    </div>
                    <div class="btn-group dropup">
                      <button type="button" class="btn btn-success">分类</button>
                      <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="caret"></span>
                        <span class="sr-only">切换下拉列表</span>
                      </button>
                      <ul class="dropdown-menu">
                        <li><a href="#">分类</a></li>
                        <li><a href="#">分类</a></li>
                        <li><a href="#">分类</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">分类2</a></li>
                      </ul>
                    </div>
                    <div class="btn-group dropup">
                      <button type="button" class="btn btn-info">分类</button>
                      <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="caret"></span>
                        <span class="sr-only">切换下拉列表</span>
                      </button>
                      <ul class="dropdown-menu">
                        <li><a href="#">分类</a></li>
                        <li><a href="#">分类</a></li>
                        <li><a href="#">分类</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">分类2</a></li>
                      </ul>
                    </div>
                    <div class="btn-group dropup">
                      <button type="button" class="btn btn-secondary">分类</button>
                      <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="caret"></span>
                        <span class="sr-only">切换下拉列表</span>
                      </button>
                      <ul class="dropdown-menu">
                        <li><a href="#">分类</a></li>
                        <li><a href="#">分类</a></li>
                        <li><a href="#">分类</a></li>
						<li><a href="#">分类</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">分类2</a></li>
                      </ul>
                    </div>
                  </div>
                  
                  <!--大小尺寸-->
                  <div class="col-lg-6">
                    <hr>
                    <h5>大小尺寸</h5>
                    <div class="btn-group dropup">
                      <button type="button" class="btn btn-primary btn-lg dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        分类 <span class="caret"></span>
                      </button>
                      <ul class="dropdown-menu">
                        <li><a href="#">分类</a></li>
                        <li><a href="#">分类</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">分类2</a></li>
                      </ul>
                    </div>
                    <div class="btn-group dropup">
                      <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        分类 <span class="caret"></span>
                      </button>
                      <ul class="dropdown-menu">
                        <li><a href="#">分类</a></li>
                        <li><a href="#">分类</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">分类2</a></li>
                      </ul>
                    </div>
                    <div class="btn-group dropup">
                      <button type="button" class="btn btn-info btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        分类 <span class="caret"></span>
                      </button>
                      <ul class="dropdown-menu">
                        <li><a href="#">分类</a></li>
                        <li><a href="#">分类</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">分类2</a></li>
                      </ul>
                    </div>
                    <div class="btn-group dropup">
                      <button type="button" class="btn btn-secondary btn-xs dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        分类 <span class="caret"></span>
                      </button>
                      <ul class="dropdown-menu">
                        <li><a href="#">分类</a></li>
                        <li><a href="#">分类</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">分类2</a></li>
                      </ul>
                    </div>
                  </div>
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