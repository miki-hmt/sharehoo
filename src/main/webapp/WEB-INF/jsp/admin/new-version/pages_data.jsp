<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>数据列表 - bootstrap中文后台管理系统模板</title>
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
              <div class="card-toolbar clearfix">
                <form class="pull-right search-bar" method="get" action="#!" role="form">
                  <div class="input-group">
                    <div class="input-group-btn">
                      <input type="hidden" name="search_field" id="search-field" value="title">
                      <button class="btn btn-default dropdown-toggle" id="search-btn" data-toggle="dropdown" type="button" aria-haspopup="true" aria-expanded="false">
                      标题 <span class="caret"></span>
                      </button>
                      <ul class="dropdown-menu">
                        <li> <a tabindex="-1" href="javascript:void(0)" data-field="title">标题</a> </li>
                        <li> <a tabindex="-1" href="javascript:void(0)" data-field="cat_name">栏目</a> </li>
                      </ul>
                    </div>
                    <input type="text" class="form-control" value="" name="keyword" placeholder="请输入名称">
                  </div>
                </form>
                <div class="toolbar-btn-action">
				  <a class="btn btn-primary m-r-5 submenuitem" href="pages_data.html" data-id="link552" data-index="552"> 新增</a>
                  <a class="btn btn-success m-r-5 submenuitem" href="pages_data.html" data-id="link553" data-index="553"> 启用</a>
                  <a class="btn btn-warning m-r-5 submenuitem" href="pages_data.html" data-id="link554" data-index="554"> 禁用</a>
                  <a class="btn btn-danger submenuitem" href="pages_data.html" data-id="link555" data-index="555"> 删除</a>
                </div>
              </div>
              <div class="card-body">
                
                <div class="table-responsive">
                  <table class="table table-bordered">
                    <thead>
                      <tr>
                        <th width="5">
                          <label class="ftdms-checkbox checkbox-primary">
                            <input type="checkbox" id="check-all"><span></span>
                          </label>
                        </th>
                        <th>标题</th>
                        <th>来源</th>
                        <th>作者</th>
                        <th>阅读量</th>
                        <th>状态</th>
                        <th>操作</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>
                          <label class="ftdms-checkbox checkbox-primary">
                            <input type="checkbox" name="ids[]" value="1"><span></span>
                          </label>
                        </td>
                        <td>2019年Q4移动支付市场份额：支付宝占据半壁江山，微信支付也占很大份额。。。。。。。。。。。。。</td>
                        <td>百度</td>
                        <td>无名人</td>
                        <td>36</td>
                        <td><font class="text-success">正常</font></td>
                        <td>
                          <div class="btn-group">
                            <a class="btn btn-xs btn-default submenuitem" href="pages_data.html" target= "_self" title="编辑" data-toggle="tooltip"><i class="ftsucai-edit-2"></i></a>
                            <a class="btn btn-xs btn-default submenuitem" href="pages_data.html" target= "_self" title="删除" data-toggle="tooltip"><i class="ftsucai-del-2"></i></a>
                          </div>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <label class="ftdms-checkbox checkbox-primary">
                            <input type="checkbox" name="ids[]" value="1"><span></span>
                          </label>
                        </td>
                        <td>2019年Q4移动支付市场份额：支付宝占据半壁江山</td>
                        <td>百度</td>
                        <td>无名人</td>
                        <td>36</td>
                        <td><font class="text-success">正常</font></td>
                        <td>
                          <div class="btn-group">
                            <a class="btn btn-xs btn-default submenuitem" href="pages_data.html" target= "_self" title="编辑" data-toggle="tooltip"><i class="ftsucai-edit-2"></i></a>
                            <a class="btn btn-xs btn-default submenuitem" href="pages_data.html" target= "_self" title="删除" data-toggle="tooltip"><i class="ftsucai-del-2"></i></a>
                          </div>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <label class="ftdms-checkbox checkbox-primary">
                            <input type="checkbox" name="ids[]" value="1"><span></span>
                          </label>
                        </td>
                        <td>2019年Q4移动支付市场份额：支付宝占据半壁江山</td>
                        <td>百度</td>
                        <td>无名人</td>
                        <td>36</td>
                        <td><font class="text-success">正常</font></td>
                        <td>
                          <div class="btn-group">
                            <a class="btn btn-xs btn-default submenuitem" href="pages_data.html" target= "_self" title="编辑" data-toggle="tooltip"><i class="ftsucai-edit-2"></i></a>
                            <a class="btn btn-xs btn-default submenuitem" href="pages_data.html" target= "_self" title="删除" data-toggle="tooltip"><i class="ftsucai-del-2"></i></a>
                          </div>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <label class="ftdms-checkbox checkbox-primary">
                            <input type="checkbox" name="ids[]" value="1"><span></span>
                          </label>
                        </td>
                        <td>2019年Q4移动支付市场份额：支付宝占据半壁江山</td>
                        <td>百度</td>
                        <td>无名人</td>
                        <td>36</td>
                        <td><font class="text-success">正常</font></td>
                        <td>
                          <div class="btn-group">
                            <a class="btn btn-xs btn-default submenuitem" href="pages_data.html" target= "_self" title="编辑" data-toggle="tooltip"><i class="ftsucai-edit-2"></i></a>
                            <a class="btn btn-xs btn-default submenuitem" href="pages_data.html" target= "_self" title="删除" data-toggle="tooltip"><i class="ftsucai-del-2"></i></a>
                          </div>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <label class="ftdms-checkbox checkbox-primary">
                            <input type="checkbox" name="ids[]" value="1"><span></span>
                          </label>
                        </td>
                        <td>2019年Q4移动支付市场份额：支付宝占据半壁江山</td>
                        <td>百度</td>
                        <td>无名人</td>
                        <td>36</td>
                        <td><font class="text-success">正常</font></td>
                        <td>
                          <div class="btn-group">
                            <a class="btn btn-xs btn-default submenuitem" href="pages_data.html" target= "_self" title="编辑" data-toggle="tooltip"><i class="ftsucai-edit-2"></i></a>
                            <a class="btn btn-xs btn-default submenuitem" href="pages_data.html" target= "_self" title="删除" data-toggle="tooltip"><i class="ftsucai-del-2"></i></a>
                          </div>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <label class="ftdms-checkbox checkbox-primary">
                            <input type="checkbox" name="ids[]" value="1"><span></span>
                          </label>
                        </td>
                        <td>2019年Q4移动支付市场份额：支付宝占据半壁江山</td>
                        <td>百度</td>
                        <td>无名人</td>
                        <td>36</td>
                        <td><font class="text-success">正常</font></td>
                        <td>
                          <div class="btn-group">
                            <a class="btn btn-xs btn-default submenuitem" href="pages_data.html" target= "_self" title="编辑" data-toggle="tooltip"><i class="ftsucai-edit-2"></i></a>
                            <a class="btn btn-xs btn-default submenuitem" href="pages_data.html" target= "_self" title="删除" data-toggle="tooltip"><i class="ftsucai-del-2"></i></a>
                          </div>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <label class="ftdms-checkbox checkbox-primary">
                            <input type="checkbox" name="ids[]" value="1"><span></span>
                          </label>
                        </td>
                        <td>2019年Q4移动支付市场份额：支付宝占据半壁江山</td>
                        <td>百度</td>
                        <td>无名人</td>
                        <td>36</td>
                        <td><font class="text-success">正常</font></td>
                        <td>
                          <div class="btn-group">
                            <a class="btn btn-xs btn-default submenuitem" href="pages_data.html" target= "_self" title="编辑" data-toggle="tooltip"><i class="ftsucai-edit-2"></i></a>
                            <a class="btn btn-xs btn-default submenuitem" href="pages_data.html" target= "_self" title="删除" data-toggle="tooltip"><i class="ftsucai-del-2"></i></a>
                          </div>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <label class="ftdms-checkbox checkbox-primary">
                            <input type="checkbox" name="ids[]" value="1"><span></span>
                          </label>
                        </td>
                        <td>2019年Q4移动支付市场份额：支付宝占据半壁江山</td>
                        <td>百度</td>
                        <td>无名人</td>
                        <td>36</td>
                        <td><font class="text-success">正常</font></td>
                        <td>
                          <div class="btn-group">
                            <a class="btn btn-xs btn-default submenuitem" href="pages_data.html" target= "_self" title="编辑" data-toggle="tooltip"><i class="ftsucai-edit-2"></i></a>
                            <a class="btn btn-xs btn-default submenuitem" href="pages_data.html" target= "_self" title="删除" data-toggle="tooltip"><i class="ftsucai-del-2"></i></a>
                          </div>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <label class="ftdms-checkbox checkbox-primary">
                            <input type="checkbox" name="ids[]" value="1"><span></span>
                          </label>
                        </td>
                        <td>2019年Q4移动支付市场份额：支付宝占据半壁江山</td>
                        <td>百度</td>
                        <td>无名人</td>
                        <td>36</td>
                        <td><font class="text-success">正常</font></td>
                        <td>
                          <div class="btn-group">
                            <a class="btn btn-xs btn-default submenuitem" href="pages_data.html" target= "_self" title="编辑" data-toggle="tooltip"><i class="ftsucai-edit-2"></i></a>
                            <a class="btn btn-xs btn-default submenuitem" href="pages_data.html" target= "_self" title="删除" data-toggle="tooltip"><i class="ftsucai-del-2"></i></a>
                          </div>
                        </td>
                      </tr>
					  <tr>
                        <td>
                          <label class="ftdms-checkbox checkbox-primary">
                            <input type="checkbox" name="ids[]" value="1"><span></span>
                          </label>
                        </td>
                        <td>2019年Q4移动支付市场份额：支付宝占据半壁江山</td>
                        <td>百度</td>
                        <td>无名人</td>
                        <td>36</td>
                        <td><font class="text-success">正常</font></td>
                        <td>
                          <div class="btn-group">
                            <a class="btn btn-xs btn-default submenuitem" href="pages_data.html" target= "_self" title="编辑" data-toggle="tooltip"><i class="ftsucai-edit-2"></i></a>
                            <a class="btn btn-xs btn-default submenuitem" href="pages_data.html" target= "_self" title="删除" data-toggle="tooltip"><i class="ftsucai-del-2"></i></a>
                          </div>
                        </td>
                      </tr>
					  <tr>
                        <td>
                          <label class="ftdms-checkbox checkbox-primary">
                            <input type="checkbox" name="ids[]" value="1"><span></span>
                          </label>
                        </td>
                        <td>	飞天下载系统FTDMS X2.0版</td>
                        <td>飞天</td>
                        <td>飞天</td>
                        <td>36</td>
                        <td><font class="text-success">正常</font></td>
                        <td>
                          <div class="btn-group">
                            <a class="btn btn-xs btn-default submenuitem" href="pages_data.html" target= "_self" title="编辑" data-toggle="tooltip"><i class="ftsucai-edit-2"></i></a>
                            <a class="btn btn-xs btn-default submenuitem" href="pages_data.html" target= "_self" title="删除" data-toggle="tooltip"><i class="ftsucai-del-2"></i></a>
                          </div>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
                <ul class="pagination">
                  <li class="disabled"><span>«</span></li>
                  <li class="active"><span>1</span></li>
                  <li><a class="submenuitem" href="pages_data.html#2">2</a></li>
                  <li><a href="#3">3</a></li>
                  <li><a href="#4">4</a></li>
                  <li><a href="#5">5</a></li>
                  <li><a href="#1">6</a></li>
                  <li><a href="#1">7</a></li>
                  <li><a href="#1">8</a></li>
                  <li class="disabled"><span>...</span></li>
                  <li><a href="#">14452</a></li>
                  <li><a href="#">14453</a></li>
                  <li><a href="#">»</a></li>
                </ul>
       
              </div>
            </div>
          </div>
          
        </div>
        
      </div>
      
    </main>
    <!--End 页面主要内容-->

<script type="text/javascript" src="${host }/admin/new-version/js/jquery.min.js"></script>
<script type="text/javascript" src="${host }/admin/new-version/js/bootstrap.js"></script>
<script type="text/javascript" src="${host }/admin/new-version/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="${host }/admin/new-version/js/main.min.js"></script>
<script type="text/javascript">
$(function(){
    $('.search-bar .dropdown-menu a').click(function() {
        var field = $(this).data('field') || '';
        $('#search-field').val(field);
        $('#search-btn').html($(this).text() + ' <span class="caret"></span>');
    });
});
</script>
</body>
</html>
