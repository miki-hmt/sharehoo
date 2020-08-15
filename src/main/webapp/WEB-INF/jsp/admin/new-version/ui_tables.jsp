
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
              <div class="card-header"><h4>表格</h4></div>
              <div class="card-body">
                
                <h5>基本实例</h5>
                <table class="table">
                  <thead>
                    <tr>
                      <th>#</th>
                      <th>订单号</th>
                      <th>商品名称</th>
                      <th>数量</th>
					  <th>日期</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <th scope="row">1</th>
                      <td>2023063568</td>
                      <td><a href="http://www.ftdms.cn">飞天下载系统FTDMS X2.0版</a></td>
                      <td>1</td>
					  <td>2019-10-10</td>
                    </tr>
                    <tr>
                      <th scope="row">2</th>
                      <td>2023063568</td>
                      <td><a href="http://www.ftdms.cn">飞天下载系统FTDMS X2.0版</a></td>
                      <td>1</td>
					  <td>2019-10-10</td>
                    </tr>
                    <tr>
                      <th scope="row">3</th>
                      <td>2023063568</td>
                      <td><a href="http://www.ftdms.cn">飞天下载系统FTDMS X2.0版</a></td>
                      <td>1</td>
					  <td>2019-10-10</td>
                    </tr>
                  </tbody>
                </table>
                
                <h5>条纹状表格 <code>.table-striped</code></h5>
                <table class="table table-striped">
                  <thead>
                    <tr>
                      <th>#</th>
                      <th>订单号</th>
                      <th>商品名称</th>
                      <th>数量</th>
					  <th>日期</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <th scope="row">1</th>
                      <td>2023063568</td>
                      <td><a href="http://www.www.bootstrapmb.com">精品素材尽在bootstrap中文</a></td>
                      <td>1</td>
					  <td>2019-10-10</td>
                    </tr>
                    <tr>
                      <th scope="row">2</th>
                      <td>2023063568</td>
                      <td><a href="http://www.www.bootstrapmb.com">精品素材尽在bootstrap中文</a></td>
                      <td>1</td>
					  <td>2019-10-10</td>
                    </tr>
                    <tr>
                      <th scope="row">3</th>
                      <td>2023063568</td>
                      <td><a href="http://www.www.bootstrapmb.com">精品素材尽在bootstrap中文</a></td>
                      <td>1</td>
					  <td>2019-10-10</td>
                    </tr>
                  </tbody>
                </table>
                
                <h5>带边框的表格 <code>.table-bordered</code></h5>
                <table class="table table-bordered">
                  <thead>
                    <tr>
                      <th>#</th>
                      <th>订单号</th>
                      <th>商品名称</th>
                      <th>数量</th>
					  <th>日期</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <th scope="row">1</th>
                      <td>2023063568</td>
                      <td><a href="http://www.www.bootstrapmb.com">精品素材尽在bootstrap中文</a></td>
                      <td>1</td>
					  <td>2019-10-10</td>
                    </tr>
                    <tr>
                      <th scope="row">2</th>
                      <td>2023063568</td>
                      <td><a href="http://www.www.bootstrapmb.com">精品素材尽在bootstrap中文</a></td>
                      <td>1</td>
					  <td>2019-10-10</td>
                    </tr>
                    <tr>
                      <th scope="row">3</th>
                      <td>2023063568</td>
                      <td><a href="http://www.www.bootstrapmb.com">精品素材尽在bootstrap中文</a></td>
                      <td>1</td>
					  <td>2019-10-10</td>
                    </tr>
                  </tbody>
                </table>
                
                <h5>鼠标悬停 <code>.table-hover</code></h5>
                <table class="table table-hover">
                  <thead>
                    <tr>
                      <th>#</th>
                      <th>订单号</th>
                      <th>商品名称</th>
                      <th>数量</th>
					  <th>日期</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <th scope="row">1</th>
                      <td>2023063568</td>
                      <td><a href="http://www.www.bootstrapmb.com">精品素材尽在bootstrap中文</a></td>
                      <td>1</td>
					  <td>2019-10-10</td>
                    </tr>
                    <tr>
                      <th scope="row">2</th>
                      <td>2023063568</td>
                      <td><a href="http://www.www.bootstrapmb.com">精品素材尽在bootstrap中文</a></td>
                      <td>1</td>
					  <td>2019-10-10</td>
                    </tr>
                    <tr>
                      <th scope="row">3</th>
                      <td>2023063568</td>
                      <td><a href="http://www.www.bootstrapmb.com">精品素材尽在bootstrap中文</a></td>
                      <td>1</td>
					  <td>2019-10-10</td>
                    </tr>
                  </tbody>
                </table>
                
                <h5>紧缩表格 <code>.table-condensed</code></h5>
                <table class="table table-condensed">
                  <thead>
                    <tr>
                      <th>#</th>
                      <th>订单号</th>
                      <th>商品名称</th>
                      <th>数量</th>
					  <th>日期</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <th scope="row">1</th>
                      <td>2023063568</td>
                      <td>精品素材尽在bootstrap中文</td>
                      <td>1</td>
					  <td>2019-10-10</td>
                    </tr>
                    <tr>
                      <th scope="row">2</th>
                      <td>2023063568</td>
                      <td>精品素材尽在bootstrap中文</td>
                      <td>1</td>
					  <td>2019-10-10</td>
                    </tr>
                    <tr>
                      <th scope="row">3</th>
                      <td>2023063568</td>
                      <td>精品素材尽在bootstrap中文</td>
                      <td>1</td>
					  <td>2019-10-10</td>
                    </tr>
                  </tbody>
                </table>
                
                <h5>状态类</h5>
                <table class="table">
                  <thead>
                    <tr>
                      <th>#</th>
                      <th>订单号</th>
                      <th>商品名称</th>
                      <th>数量</th>
					  <th>日期</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr class="active">
                      <th scope="row">1</th>
                      <td>2023063568</td>
                      <td>进口正品欧莱雅秀发锁护乳</td>
                      <td>1</td>
					  <td>2019-10-10</td>
                    </tr>
                    <tr>
                      <th scope="row">2</th>
                      <td>2023063568</td>
                      <td>进口正品欧莱雅秀发锁护乳</td>
                      <td>1</td>
					  <td>2019-10-10</td>
                    </tr>
                    <tr class="success">
                      <th scope="row">3</th>
                      <td>2023063568</td>
                      <td>进口正品欧莱雅秀发锁护乳</td>
                      <td>1</td>
					  <td>2019-10-10</td>
                    </tr>
                    <tr>
                      <th scope="row">4</th>
                      <td>2023063568</td>
                      <td>进口正品欧莱雅秀发锁护乳</td>
                      <td>1</td>
					  <td>2019-10-10</td>
                    </tr>
                    <tr class="info">
                      <th scope="row">5</th>
                      <td>2023063568</td>
                      <td>进口正品欧莱雅秀发锁护乳</td>
                      <td>1</td>
					  <td>2019-10-10</td>
                    </tr>
                    <tr>
                      <th scope="row">6</th>
                      <td>2023063568</td>
                      <td>进口正品欧莱雅秀发锁护乳</td>
                      <td>1</td>
					  <td>2019-10-10</td>
                    </tr>
                    <tr class="warning">
                      <th scope="row">7</th>
                      <td>2023063568</td>
                      <td>进口正品欧莱雅秀发锁护乳</td>
                      <td>1</td>
					  <td>2019-10-10</td>
                    </tr>
                  </tbody>
                </table>
                
                <h5>响应式表格</h5>
                <div class="table-responsive">
                  <table class="table">
                    <thead>
                      <tr>
                        <th>#</th>
                        <th>订单号</th>
                        <th>商品名称</th>
                        <th>数量</th>
					    <th>日期</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <th scope="row">1</th>
                        <td>2023063568</td>
                        <td>测试测试测试测试测试</td>
                        <td>125</td>
                        <td>2019-10-10</td>
                      </tr>
                      <tr>
                        <th scope="row">2</th>
                        <td>2023063568</td>
                        <td>测试测试测试测试测试</td>
                        <td>26</td>
                        <td>2019-10-10</td>
                      </tr>
                      <tr>
                        <th scope="row">3</th>
                        <td>2023063568</td>
                        <td>测试测试测试测试测试</td>
                        <td>39</td>
                        <td>2019-10-10</td>
                      </tr>
                    </tbody>
                  </table>
                </div>
                <div class="table-responsive">
                  <table class="table table-bordered">
                    <thead>
                      <tr>
                        <th>#</th>
                        <th>订单号</th>
                        <th>商品名称</th>
                        <th>数量</th>
					    <th>日期</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <th scope="row">1</th>
                        <td>2023063568</td>
                        <td>测试测试测试测试测试</td>
                        <td>125</td>
                        <td>2019-10-10</td>
                      </tr>
                      <tr>
                        <th scope="row">2</th>
                        <td>2023063568</td>
                        <td>测试测试测试测试测试</td>
                        <td>26</td>
                        <td>2019-10-10</td>
                      </tr>
                      <tr>
                        <th scope="row">3</th>
                        <td>2023063568</td>
                        <td>测试测试测试测试测试</td>
                        <td>39</td>
                        <td>2019-10-10</td>
                      </tr>
                    </tbody>
                  </table>
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