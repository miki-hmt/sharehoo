
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
<title>其他 - bootstrap中文后台管理系统模板</title>
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
          <div class="col-md-12">
            <div class="card">
              <div class="card-header"><h4>按钮效果</h4></div>
              <div class="card-body">
                
                <button type="button" id="myButton" data-loading-text="处理中..." class="btn btn-primary" autocomplete="off">
                等待状态
                </button>
                
              </div>
            </div>
          </div>
          <div class="col-md-12">
            <div class="card">
              <div class="card-header"><h4>折叠效果</h4></div>
              <div class="card-body">
                
                <h5>普通折叠效果</h5>
                <!--折叠效果-->
                <a class="btn btn-primary" role="button" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                  Link with href
                </a>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                  Button with data-target
                </button>
                <div class="collapse m-t-10" id="collapseExample">
                  <div class="well">
                    内容信息内容信息内容信息内容信息内容信息内容信息。
                  </div>
                </div>
                <!--折叠效果 End-->
                
                <hr>
                <h5>手风琴效果</h5>
                <!--手风琴效果-->
                <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                  <div class="panel panel-primary">
                    <div class="panel-heading" role="tab" id="headingOne">
                      <h4 class="panel-title">
                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                          新闻标题
                        </a>
                      </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                      <div class="panel-body">
                        新闻内容新闻内容新闻内容新闻内容新闻内容新闻内容新闻内容新闻内容新闻内容新闻内容新闻内容新闻内容。
                      </div>
                    </div>
                  </div>
                  <div class="panel panel-cyan">
                    <div class="panel-heading" role="tab" id="headingTwo">
                      <h4 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                          新闻标题
                        </a>
                      </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                      <div class="panel-body">
                        新闻内容新闻内容新闻内容新闻内容新闻内容新闻内容新闻内容新闻内容新闻内容新闻内容新闻内容新闻内容
                      </div>
                    </div>
                  </div>
                  <div class="panel panel-danger">
                    <div class="panel-heading" role="tab" id="headingThree">
                      <h4 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                          新闻标题
                        </a>
                      </h4>
                    </div>
                    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                      <div class="panel-body">
                        新闻内容新闻内容新闻内容新闻内容新闻内容新闻内容新闻内容新闻内容新闻内容新闻内容新闻内容新闻内容。
                      </div>
                    </div>
                  </div>
                </div>
                <!--手风琴效果 End-->
                
              </div>
            </div>
          </div>
          
          <div class="col-md-4">
            <div class="card">
              <div class="card-header"><h4>幻灯片一</h4></div>
              <div class="card-body">
                
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                  <div class="carousel-inner" role="listbox">
                    <div class="item active"><img src="${host }/admin/new-version/images/img-1.jpg" alt="图片一"></div>
                    <div class="item"><img src="${host }/admin/new-version/images/img-2.jpg" alt="图片二"></div>
                    <div class="item"><img src="${host }/admin/new-version/images/img-3.jpg" alt="图片三"></div>
                  </div>
                </div>
                
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card">
              <div class="card-header"><h4>幻灯片二</h4></div>
              <div class="card-body">
                
                <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                  <div class="carousel-inner">
                    <div class="item active"><img src="${host }/admin/new-version/images/img-2.jpg" alt="图片一"></div>
                    <div class="item"><img src="${host }/admin/new-version/images/img-1.jpg" alt="图片二"></div>
                    <div class="item"><img src="${host }/admin/new-version/images/img-3.jpg" alt="图片三"></div>
                  </div>
                  <a class="left carousel-control" href="#carouselExampleControls" role="button" data-slide="prev"><span class="icon-left-open-big icon-prev" aria-hidden="true"></span><span class="sr-only">Previous</span></a>
                  <a class="right carousel-control" href="#carouselExampleControls" role="button" data-slide="next"><span class="icon-right-open-big icon-next" aria-hidden="true"></span><span class="sr-only">Next</span></a>
                </div>
                
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card">
              <div class="card-header"><h4>幻灯片三</h4></div>
              <div class="card-body">
                
                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                  <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                  </ol>
                  <div class="carousel-inner">
                    <div class="item active"><img src="${host }/admin/new-version/images/img-3.jpg" alt="图片一"></div>
                    <div class="item"><img src="${host }/admin/new-version/images/img-2.jpg" alt="图片二"></div>
                    <div class="item"><img src="${host }/admin/new-version/images/img-1.jpg" alt="图片三"></div>
                  </div>
                  <a class="left carousel-control" href="#carouselExampleIndicators" role="button" data-slide="prev"><span class="icon-left-open-big icon-prev" aria-hidden="true"></span><span class="sr-only">Previous</span></a>
                  <a class="right carousel-control" href="#carouselExampleIndicators" role="button" data-slide="next"><span class="icon-right-open-big icon-next" aria-hidden="true"></span><span class="sr-only">Next</span></a>
                </div>
                
              </div>
            </div>
          </div>
          
          <div class="col-lg-12">
            <div class="card">
              <div class="card-header"><h4>列表组</h4></div>
              <div class="card-body">
                
                <ul class="list-group">
                  <li class="list-group-item">内容信息内容信息内容信息内容信息内容信息</li>
                  <li class="list-group-item">内容信息内容信息内容信息内容信息内容信息</li>
                  <li class="list-group-item">内容信息内容信息内容信息内容信息内容信息</li>
                </ul>
                <p>徽章自动被放在右边。</p>
                <ul class="list-group">
                  <li class="list-group-item">
                    <span class="badge">14</span>
                    内容信息内容信息内容信息内容信息内容信息
                  </li>
                  <li class="list-group-item">
                    <span class="badge">2</span>
                    内容信息内容信息内容信息内容信息内容信息
                  </li>
                  <li class="list-group-item">
                    <span class="badge">1</span>
                    内容信息内容信息内容信息内容信息内容信息
                  </li>
                </ul>
                
                
              </div>
            </div>
          </div>
          
          <div class="col-lg-12">
            <div class="card">
              <div class="card-header"><h4>徽章</h4></div>
              <div class="card-body">
                
                <a href="#">收件箱 <span class="badge">42</span></a>
                <br/><br/>
                <button class="btn btn-primary" type="button">
                  消息 <span class="badge">4</span>
                </button>
                
              </div>
            </div>
          </div>
          <!--end 徽章-->
          
        </div>
        
      </div>
      
    </main>
    <!--End 页面主要内容-->
  </div>
</div>

<script type="text/javascript" src="${host }/admin/new-version/js/jquery.min.js"></script>
<script type="text/javascript" src="${host }/admin/new-version/js/bootstrap.js"></script>

<script>
// 按钮示例
$('#myButton').on('click', function () {
    var $btn = $(this).button('loading');
    setTimeout(function() {
        $btn.button("reset")
    }, 3e3)
});
</script>
</body>
</html>