<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>对话框 - bootstrap中文后台管理系统模板</title>
<link rel="icon" href="favicon.ico" type="image/ico">
<meta name="keywords" content="后台模板,后台管理系统,HTML模板">
<meta name="description" content="基于Bootstrap的后台管理系统模板">
<meta name="author" content="www.bootstrapmb.com">
<link href="${host }/admin/new-version/css/bootstrap.min.css" rel="stylesheet">
<link href="${host }/admin/new-version/css/fonts.css" rel="stylesheet">
<!--对话框-->
<link rel="stylesheet" href="${host }/admin/new-version/js/jconfirm/jquery-confirm.min.css">
<link href="${host }/admin/new-version/css/style.css" rel="stylesheet">
</head>
  
<body>
    <!--页面主要内容-->
    <main class="ftdms-layout-content">
      
      <div class="container-fluid" style="margin-bottom:90px;">
        
        <div class="row" style="margin-top:15px;">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-header"><h4>对话框</h4></div>
              <div class="card-body">

                <div class="row">
                  <div class="col-md-4">
                    <button class="btn btn-primary btn-block example-p-1">弹出框示例</button>
                  </div>
                  <div class="col-md-4">
                    <button class="btn btn-primary btn-block example-p-2">确认框示例</button>
                  </div>
                  <div class="col-md-4">
                    <button class="btn btn-primary btn-block example-p-3">对话框示例</button>
                  </div>
                  <br/><br/><br/>
                  <div class="col-md-4">
                    <button class="btn btn-primary btn-block example-p-4">错误/红色 对话框</button>
                  </div>
                  <div class="col-md-4">
                    <button class="btn btn-primary btn-block example-p-5">成功/绿色 对话框</button>
                  </div>
                  <div class="col-md-4">
                    <button class="btn btn-primary btn-block example-p-6">警告/黄色 对话框</button>
                  </div>
                  
                </div>
       
              </div>
            </div>
          </div>
          
          <div class="col-lg-12">
            <div class="card">
              <div class="card-header"><h4>模态框</h4></div>
              <div class="card-body">
                
                <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
                  点击启动示例
                </button>
                
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">标题</h4>
                      </div>
                      <div class="modal-body">
                        您的内容...
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary">点击保存</button>
                      </div>
                    </div>
                  </div>
                </div>
                
                <hr>
                <h5>可选尺寸</h5>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg">大模态框</button>
                
                <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
                  <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                        <h4 class="modal-title" id="myLargeModalLabel">标题（大）</h4>
                      </div>
                      <div class="modal-body">
                        您的内容...
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary">点击保存</button>
                      </div>
                    </div>
                  </div>
                </div>
                
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm">小模态框</button>
                
                <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
                  <div class="modal-dialog modal-sm" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                        <h4 class="modal-title" id="myLargeModalLabel">标题（小）</h4>
                      </div>
                      <div class="modal-body">
                        您的内容...
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary">点击保存</button>
                      </div>
                    </div>
                  </div>
                </div>
                
                <hr>
                <h5>使用格栅</h5>
                <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#gridSystemModal">
                  点击演示示例
                </button>
                <div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" id="gridSystemModal">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="gridSystemModalLabel">标题</h4>
                      </div>
                      <div class="modal-body">
                        <div class="row">
                          <div class="col-md-4">.col-md-4</div>
                          <div class="col-md-4 col-md-offset-4">.col-md-4 .col-md-offset-4</div>
                        </div>
                        <div class="row">
                          <div class="col-md-3 col-md-offset-3">.col-md-3 .col-md-offset-3</div>
                          <div class="col-md-2 col-md-offset-4">.col-md-2 .col-md-offset-4</div>
                        </div>
                        <div class="row">
                          <div class="col-md-6 col-md-offset-3">.col-md-6 .col-md-offset-3</div>
                        </div>
                        <div class="row">
                          <div class="col-sm-9">
                            Level 1: .col-sm-9
                            <div class="row">
                              <div class="col-xs-8 col-sm-6">
                                Level 2: .col-xs-8 .col-sm-6
                              </div>
                              <div class="col-xs-4 col-sm-6">
                                Level 2: .col-xs-4 .col-sm-6
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary">点击保存</button>
                      </div>
                    </div>
                  </div>
                </div>
                
                <hr>
                <h5>变更模态框内容</h5>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">打开模态框 for @mdo</button>
                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="exampleModalLabel">新消息</h4>
                      </div>
                      <div class="modal-body">
                        <form>
                          <div class="form-group">
                            <label for="recipient-name" class="control-label">收件人：</label>
                            <input type="text" class="form-control" id="recipient-name">
                          </div>
                          <div class="form-group">
                            <label for="message-text" class="control-label">消息内容：</label>
                            <textarea class="form-control" id="message-text"></textarea>
                          </div>
                        </form>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary">发送消息</button>
                      </div>
                    </div>
                  </div>
                </div>
                
              </div>
            </div>
          </div>

          <div class="col-lg-12">
            <div class="card">
              <div class="card-header"><h4>提示 / 弹出框</h4></div>
              <div class="card-body">
                
                <button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="left" title="Tooltip on left">Tooltip on 左侧</button>
                
                <button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="top" title="Tooltip on top">Tooltip on 顶部</button>
                
                <button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="Tooltip on bottom">Tooltip on 底部</button>
                
                <button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="right" title="Tooltip on right">Tooltip on 右侧</button>
                
                <button type="button" class="btn btn-default" data-toggle="tooltip" data-html="true" title="" data-original-title="<em>Tooltip</em> <u>with</u> <b>HTML</b>">Html Tooltip</button>
                
                <hr>
                
                <button type="button" class="btn btn-default" data-container="body" data-toggle="popover" data-placement="top" data-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus." title="Popover title">
                  Popover on 顶部
                </button>
                
                <button type="button" class="btn btn-default" data-container="body" data-toggle="popover" data-placement="bottom" data-content="Vivamus
                sagittis lacus vel augue laoreet rutrum faucibus.">
                  Popover on 底部
                </button>
                
                <button type="button" class="btn btn-default" data-container="body" data-toggle="popover" data-placement="right" data-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus.">
                  Popover on 右侧
                </button>
                
                <button type="button" class="btn btn-default" data-container="body" data-toggle="popover" data-placement="left" data-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus.">
                  Popover on 左侧
                </button>
                
              </div>
            </div>
          </div>
      
    </main>
    <!--End 页面主要内容-->

<script type="text/javascript" src="${host }/admin/new-version/js/jquery.min.js"></script>
<script type="text/javascript" src="${host }/admin/new-version/js/bootstrap.js"></script>
<!--对话框-->
<script src="${host }/admin/new-version/js/jconfirm/jquery-confirm.min.js"></script>
<script type="text/javascript" src="${host }/admin/new-version/js/main.min.js"></script>
<script type="text/javascript">
$('.example-p-1').on('click', function () {
    $.alert({
        title: '嗨',
        content: '这是对用户的简单提示框。 <br> 一些 <strong>HTML</strong> <em>内容</em>',
		buttons: {
			confirm: {
				text: '确认',
				btnClass: 'btn-primary',
				action: function(){
                    $.alert('你点击了确认!');
				}
			},
			cancel: {
				text: '取消',
				action: function () {
                    $.alert('你点击了取消!');
				}
			}
		}
    });
});
$('.example-p-2').on('click', function () {
    $.confirm({
        title: '对话框',
        content: '一些内容...',
        buttons: {
            confirm: {
                text: '确认',
                action: function(){
                    $.alert('确认的!');
                }
            },
            cancel: {
                text: '关闭',
                action: function(){
                    $.alert('取消的!');
                }
            },
            somethingElse: {
                text: '其他',
                btnClass: 'btn-blue',
                keys: ['enter', 'shift'],
                action: function(){
                    $.alert('其他的选择？');
                }
            }
        }
    });
});
$('.example-p-3').on('click', function () {
    $.confirm({
        title: '提示',
        content: '' +
        '<form action="" class="formName">' +
        '<div class="form-group">' +
        '<label>请输入您的姓名</label>' +
        '<input type="text" placeholder="姓名" class="name form-control" required />' +
        '</div>' +
        '</form>',
        buttons: {
            formSubmit: {
                text: '提交',
                btnClass: 'btn-blue',
                action: function () {
                    var name = this.$content.find('.name').val();
                    if(!name){
                        $.alert('请您输入您的姓名');
                        return false;
                    }
                    $.alert('您的姓名是： ' + name);
                }
            },
            cancel: {
                text: '取消'
            },
        },
        onContentReady: function () {
            var jc = this;
            this.$content.find('form').on('submit', function (e) {
                e.preventDefault();
                jc.$$formSubmit.trigger('click');
            });
        }
    });
});
$('.example-p-4').on('click', function () {
    $.confirm({
        title: '错误提示',
        content: '笑江湖浪迹十年游，空负少年头。对铜驼巷陌，吟情渺渺，心事悠悠！酒冷诗残梦断，南国正清秋。',
        type: 'red',
        typeAnimated: true,
        buttons: {
            tryAgain: {
                text: '重试',
                btnClass: 'btn-red',
                action: function(){
                }
            },
            close: {
                text: '关闭'
            }
        }
    });
});
$('.example-p-5').on('click', function () {
    $.confirm({
        title: '成功',
        content: '难消受灯昏罗帐，怅昙花一现恨难休！飘零惯，金戈铁马，拼葬荒丘！',
        type: 'green',
        buttons: {
            omg: {
                text: '谢谢',
                btnClass: 'btn-green',
            },
            close: {
                text: '关闭',
            }
        }
    });
});
$('.example-p-6').on('click', function () {
    $.confirm({
        title: '警告',
        content: '把剑凄然望，无处招归舟。明日天涯路远，问谁留楚佩，弄影中洲？数英雄儿女，俯仰古今愁。',
        type: 'orange',
        typeAnimated: false,
        buttons: {
            omg: {
                text: '重试',
                btnClass: 'btn-orange',
            },
            close: {
                text: '关闭',
            }
        }
    });
});
</script>
</body>
</html>
