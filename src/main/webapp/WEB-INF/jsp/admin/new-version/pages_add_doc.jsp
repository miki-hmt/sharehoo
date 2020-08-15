<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>新增文档 - bootstrap中文后台管理系统模板</title>
<link rel="icon" href="favicon.ico" type="image/ico">
<meta name="keywords" content="后台模板,后台管理系统,HTML模板">
<meta name="description" content="基于Bootstrap的后台管理系统模板">
<meta name="author" content="www.bootstrapmb.com">
<link href="${host }/admin/new-version/css/bootstrap.min.css" rel="stylesheet">
<link href="${host }/admin/new-version/css/fonts.css" rel="stylesheet">
<!--标签插件-->
<link rel="stylesheet" href="${host }/admin/new-version/js/jquery-tags-input/jquery.tagsinput.min.css">
<link href="${host }/admin/new-version/css/style.css" rel="stylesheet">
</head>
  
<body>
    <!--页面主要内容-->
    <main class="ftdms-layout-content">
      
      <div class="container-fluid" style="margin-bottom:90px;">
        
        <div class="row" style="margin-top:15px;">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-body">
                
                <form action="#!" method="post" class="row">
                  <div class="form-group col-md-12">
                    <label for="type">栏目</label>
                    <div class="form-controls">
                      <select name="type" class="form-control" id="type">
                        <option value="1">小说</option>
                        <option value="2">古籍</option>
                        <option value="3">专辑</option>
                        <option value="4">自传</option>
                      </select>
                    </div>
                  </div>
                  <div class="form-group col-md-12">
                    <label for="title">标题</label>
                    <input type="text" class="form-control" id="title" name="title" value="" placeholder="请输入标题" />
                  </div>
                  <div class="form-group col-md-12">
                    <label for="seo_keywords">关键词</label>
                    <input type="text" class="form-control" id="seo_keywords" name="seo_keywords" value="" placeholder="关键词" />
                  </div>
                  <div class="form-group col-md-12">
                    <label for="seo_description">描述</label>
                    <textarea class="form-control" id="seo_description" name="seo_description" rows="5" value="" placeholder="描述"></textarea>
                  </div>
                  <div class="form-group col-md-12">
                    <label>多图上传</label>
                    <div class="form-controls">
                      
                      <ul class="list-inline clearfix ftdms-uploads-pic">
                        <li class="col-xs-4 col-sm-3 col-md-2">
                          <figure>
                            <img src="${host }/admin/new-version/images/img-1.jpg" alt="图片一">
                            <figcaption>
                              <a class="btn btn-round btn-square btn-primary" href="#"><i class="ftsucai-eye-7"></i></a>
                              <a class="btn btn-round btn-square btn-danger" href="#"><i class="ftsucai-del"></i></a>
                            </figcaption>
                          </figure>
                        </li>
                        <li class="col-xs-4 col-sm-3 col-md-2">
                          <figure>
                            <img src="${host }/admin/new-version/images/img-2.jpg" alt="图片二">
                            <figcaption>
                              <a class="btn btn-round btn-square btn-primary" href="#"><i class="ftsucai-eye-7"></i></a>
                              <a class="btn btn-round btn-square btn-danger" href="#"><i class="ftsucai-del"></i></a>
                            </figcaption>
                          </figure>
                        </li>
                        <li class="col-xs-4 col-sm-3 col-md-2">
                          <figure>
                            <img src="${host }/admin/new-version/images/img-3.jpg" alt="图片三">
                            <figcaption>
                              <a class="btn btn-round btn-square btn-primary" href="#"><i class="ftsucai-eye-7"></i></a>
                              <a class="btn btn-round btn-square btn-danger" href="#"><i class="ftsucai-del"></i></a>
                            </figcaption>
                          </figure>
                        </li>
                        <li class="col-xs-4 col-sm-3 col-md-2">
                          <a class="pic-add" id="add-pic-btn" href="#" title="点击上传"></a>
                        </li>
                      </ul>
                    </div>
                  </div>
                  <div class="form-group col-md-12">
                    <label for="content">内容</label>
                    <p>HTML编辑器这里就不做演示了</p>
                  </div>
                  <div class="form-group col-md-12">
                    <label for="tags">标签</label>
                    <input class="js-tags-input form-control" type="text" id="tags" name="tags" value="" />
                  </div>
                  <div class="form-group col-md-12">
                    <label for="sort">排序</label>
                    <input type="text" class="form-control" id="sort" name="sort" value="0" />
                  </div>
                  <div class="form-group col-md-12">
                    <label for="status">状态</label>
                    <div class="clearfix">
                      <label class="ftdms-radio radio-inline radio-primary">
                        <input type="radio" name="status" value="0"><span>禁用</span>
                      </label>
                      <label class="ftdms-radio radio-inline radio-primary">
                        <input type="radio" name="status" value="1" checked><span>启用</span>
                      </label>
                    </div>
                  </div>
                  <div class="form-group col-md-12">
                    <button type="submit" class="btn btn-primary ajax-post" target-form="add-form">确 定</button>
                    <button type="button" class="btn btn-default" onclick="javascript:history.back(-1);return false;">返 回</button>
                  </div>
                </form>
       
              </div>
            </div>
          </div>
          
        </div>
        
      </div>
      
    </main>
    <!--End 页面主要内容-->
  </div>
</div>

<script type="text/javascript" src="${host }/admin/new-version/js/jquery.min.js"></script>
<script type="text/javascript" src="${host }/admin/new-version/js/bootstrap.js"></script>
<script type="text/javascript" src="${host }/admin/new-version/js/perfect-scrollbar.min.js"></script>
<!--标签插件-->
<script src="${host }/admin/new-version/js/jquery-tags-input/jquery.tagsinput.min.js"></script>
<script type="text/javascript" src="${host }/admin/new-version/js/main.min.js"></script>
</body>
</html>
