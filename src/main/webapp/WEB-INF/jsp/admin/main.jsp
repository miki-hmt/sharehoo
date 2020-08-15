<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- ############################################################################ -->

<!-- 2020.08.14 miki sharehoo管理后台新版本升级  -->

<!-- ############################################################################ -->
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>sharehoo后台管理</title>
	<link href="${host}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />
	<link href="${host}/admin/new-version/css/style.css" rel="stylesheet">
    <link href="${host}/admin/new-version/css/bootstrap.min.css" rel="stylesheet">
    <link href="${host}/admin/new-version/css/theme.css" rel="stylesheet">
    <link href="${host}/admin/new-version/css/fonts.css" rel="stylesheet">
    <script src="${host}/admin/new-version/js/jquery.min.js"></script>
    <script src="${host}/admin/new-version/js/bootstrap.js"></script>
    <script src="${host}/admin/new-version/js/jquery.cookie.js"></script>
    <script src="${host}/admin/new-version/js/framework.js"></script>
	</head>
  
  <body class="theme-blue-gradient pace-done" style="overflow: hidden; ">
    <div class="pace  pace-inactive">
      <div class="pace-progress" style="width: 100%;" data-progress-text="100%" data-progress="99">
        <div class="pace-progress-inner"></div>
      </div>
      <div class="pace-activity"></div>
    </div>

    <div id="ajax-loader" style="background: rgb(255, 255, 255); left: -50%; top: -50%; width: 200%; height: 200%; overflow: hidden; display: none; position: fixed; z-index: 10000; cursor: progress;">
    <img style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; margin: auto;" src="${host}/admin/new-version/images/loader.gif">
	</div>

    <div id="theme-wrapper">
      <header class="navbar" id="header-navbar">
        <div class="container" style="padding-right: 0px;">
          <a class="navbar-brand" id="logo" href="#">后台管理系统</a>
          <div class="clearfix">
            <div class="nav-no-collapse navbar-left pull-left hidden-sm hidden-xs">
              <ul class="nav navbar-nav pull-left">
                <li>
                  <a id="make-small-nav">
					<div class="ftdms-aside-toggler">
                      <span class="ftdms-toggler-bar"></span>
                      <span class="ftdms-toggler-bar"></span>
                      <span class="ftdms-toggler-bar"></span>
                    </div>
                  </a>
                </li>
              </ul>
            </div>
            <div class="nav-no-collapse pull-right" id="header-nav">
              <ul class="nav navbar-nav pull-right">
                <li class="dropdown profile-dropdown">
                  <a class="dropdown" href="#" data-toggle="dropdown">
				    <!-- <img class="img-qrcode img-qrcode-46" src="images/ftsucai.png" alt="用户头像" /> -->
                    <span class="hidden-xs">当前用户：${currentUser.nickName}&nbsp;&nbsp;&nbsp;&nbsp;角色：管理员</span></a>
                  <ul class="dropdown-menu pull-right">
				    <li>
					  <a class="submenuitem" href="${host}/admin/userinfo" data-id="rofile" data-index="100"><i class="ft ftsucai-58"></i>个人信息</a>
                    </li>
					<li>
					  <a class="submenuitem" href="${host }/admin/pages_edit_pwd" data-id="linkpwd" data-index="101"><i class="ft ftsucai-edit-2"></i>修改密码</a>
                    </li>
                    <li>
                      <a href="${host }/admin/logout"><i class="ft ftsucai-exit2"></i>安全退出</a>
                    </li>
                  </ul>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </header>

      <div class="container" id="page-wrapper">
        <div class="row">
          <div id="nav-col">
            <section class="col-left-nano" id="col-left">
              <div class="col-left-nano-content" id="col-left-inner">
                <div class="collapse navbar-collapse navbar-ex1-collapse" id="sidebar-nav">
                  <ul class="nav nav-pills nav-stacked">
                    <li>
                      <a class="dropdown-toggle" href="#" data-id="a1">
                        <i class="ft ftsucai-82"></i>
                        <span>后台首页</span>
                        <i class="ft ftsucai-139 drop-icon"></i>
                      </a>
                    </li>
                    <!--################################ 2020.08.13 miki 自定义数据管理 ####################################-->
                      <li>
                          <a class="submenuitem" href="${host}/admin/messages?page=1" data-id="a1" data-index="1">
                              <i class="ft ftsucai-291"></i>
                              <span>站内私信</span>
                          </a>
                      </li>
                      <li>
                          <a class="submenuitem" href="${host}/admin/notices" data-id="a2" data-index="2">
                              <i class="ft ftsucai-volume-medium"></i>
                              <span>公告管理</span>
                          </a>
                      </li>
                      <li>
                          <a class="submenuitem" href="${host}/admin/user/list?page=1" data-id="a3" data-index="3">
                              <i class="ft ftsucai-user-3"></i>
                              <span>用户管理</span>
                          </a>
                      </li>

                      <li>
                          <a class="dropdown-toggle" href="#" data-id="a4">
                              <i class="ft ftsucai-appstore"></i>
                              <span>论坛管理</span>
                              <i class="ft ftsucai-139 drop-icon"></i>
                          </a>
                          <ul class="submenu">
                              <li>
                                  <a class="submenuitem" href="${host}/admin/topics?page=1" data-id="link1" data-index="1">
                                      帖子管理
                                  </a>
                              </li>
                              <li>
                                  <a class="submenuitem" href="${host }/admin/sections?page=1" data-id="link2" data-index="2">
                                      板块管理
                                  </a>
                              </li>
                              <li>
                                  <a class="submenuitem" href="${host }/admin/zones?page=1" data-id="link3" data-index="3">
                                      空间管理
                                  </a>
                              </li>
                              <li>
                                  <a class="submenuitem" href="http://sharehoo.cn/admin/notices" data-id="link4" data-index="4">
                                      回复管理
                                  </a>
                              </li>
                          </ul>
                      </li>
                      <li>
                          <a class="dropdown-toggle" href="#" data-id="a5">
                              <i class="ft ftsucai-appstore"></i>
                              <span>下载社区管理</span>
                              <i class="ft ftsucai-139 drop-icon"></i>
                          </a>
                          <ul class="submenu">
                              <li>
                                  <a class="submenuitem" href="${host}/admin/shop?page=1" data-id="link1" data-index="1">
                                      店铺管理
                                  </a>
                              </li>
                              <li>
                                  <a class="submenuitem" href="${host}/admin/shop/source?page=1" data-id="link2" data-index="2">
                                      资源管理
                                  </a>
                              </li>
                              <li>
                                  <a class="submenuitem" href="https://www.baidu.com" data-id="link3" data-index="3">
                                      评价管理
                                  </a>
                              </li>
                              <li>
                                  <a class="submenuitem" href="${host}/admin/messages?page=1" data-id="link4" data-index="4">
                                      举报管理
                                  </a>
                              </li>
                              <li>
                                  <a class="submenuitem" href="${host }/admin/shop/cdks?page=1" data-id="link5" data-index="5">
                                      兑换券管理
                                  </a>
                              </li>
                              <li>
                                  <a class="submenuitem" href="${host}/amdin/shop/category?page=1" data-id="link6" data-index="6">
                                      分类管理
                                  </a>
                              </li>
                              <li>
                                  <a class="submenuitem" href="${host}/admin/shop/menu?page=1" data-id="link7" data-index="7">
                                      二级分类管理
                                  </a>
                              </li>
                              <li>
                                  <a class="submenuitem" href="${host}/admin/shop/types?page=1" data-id="link8" data-index="8">
                                      资源类型管理
                                  </a>
                              </li>
                              <li>
                                  <a class="submenuitem" href="https://www.baidu.com" data-id="link9" data-index="9">
                                      积分等级管理
                                  </a>
                              </li>
                          </ul>
                      </li>
                      <li>
                          <a class="dropdown-toggle" href="#" data-id="a6">
                              <i class="ft ftsucai-214"></i>
                              <span>solr索引管理</span>
                              <i class="ft ftsucai-139 drop-icon"></i>
                          </a>
                          <ul class="submenu">
                              <li>
                                  <a class="submenuitem" href="${host}/admin/solr" data-id="link1" data-index="1">
                                      更新索引
                                  </a>
                              </li>
                              <li>
                                  <a class="submenuitem" href="http://sharehoo.cn/admin/notices" data-id="link2" data-index="2">
                                      查看索引
                                  </a>
                              </li>
                              <li>
                                  <a class="submenuitem" href="http://sharehoo.cn/admin/notices" data-id="link3" data-index="3">
                                      删除索引
                                  </a>
                              </li>
                          </ul>
                      </li>
                      <li>
                          <a class="submenuitem" href="${host}/admin/newsBanner?page=1" data-id="a7" data-index="3">
                              <i class="ft ftsucai-225"></i>
                              <span>banner管理</span>
                          </a>
                      </li>
                      <li>
                          <a class="submenuitem" href="${host}/admin/logs?page=1" data-id="a8" data-index="3">
                              <i class="ft ftsucai-eye-8"></i>
                              <span>监控管理</span>
                          </a>
                      </li>

                      <li>
                          <a class="dropdown-toggle" href="#" data-id="a9">
                              <i class="ft ftsucai-jshezhi"></i>
                              <span>系统管理</span>
                              <i class="ft ftsucai-139 drop-icon"></i>
                          </a>
                          <ul class="submenu">
                              <li>
                                  <a class="submenuitem" href="http://sharehoo.cn/admin/notices" data-id="link1" data-index="1">
                                      清理缓存
                                  </a>
                              </li>
                              <li>
                                  <a class="submenuitem" href="${host }/admin/system" data-id="link2" data-index="2">
                                      系统配置
                                  </a>
                              </li>
                          </ul>
                      </li>

                      <li>
                          <a class="dropdown-toggle" href="#" data-id="a10">
                              <i class="ft ftsucai-appstore"></i>
                              <span>博客管理</span>
                              <i class="ft ftsucai-139 drop-icon"></i>
                          </a>
                          <ul class="submenu">
                              <li>
                                  <a class="submenuitem" href="http://sharehoo.cn/admin/notices" data-id="link1" data-index="1">
                                      文章管理
                                  </a>
                              </li>
                              <li>
                                  <a class="submenuitem" href="http://sharehoo.cn/admin/notices" data-id="link2" data-index="2">
                                      留言管理
                                  </a>
                              </li>
                              <li>
                                  <a class="submenuitem" href="http://sharehoo.cn/admin/notices" data-id="link3" data-index="3">
                                      标签管理
                                  </a>
                              </li>
                              <li>
                                  <a class="submenuitem" href="http://sharehoo.cn/admin/notices" data-id="link4" data-index="4">
                                      文章分类
                                  </a>
                              </li>
                              <li>
                                  <a class="submenuitem" href="http://sharehoo.cn/admin/notices" data-id="link5" data-index="5">
                                      个人介绍
                                  </a>
                              </li>
                              <li>
                                  <a class="submenuitem" href="http://sharehoo.cn/admin/notices" data-id="link6" data-index="6">
                                      相册管理
                                  </a>
                              </li>
                              <li>
                                  <a class="submenuitem" href="http://sharehoo.cn/admin/notices" data-id="link7" data-index="7">
                                      文件管理
                                  </a>
                              </li>
                          </ul>
                      </li>

                    <!--################################ 2020.08.13 miki 自定义数据管理 ####################################-->
                      <li>
                          <a class="dropdown-toggle" href="#" data-id="a11">
                            <i class="ft ftsucai-UI"></i>
                            <span>设计元素</span>
                            <i class="ft ftsucai-139 drop-icon"></i>
                          </a>
                          <ul class="submenu">
                            <li>
                              <a class="submenuitem" href="${host }/admin/ui_buttons" data-id="link1" data-index="1">按钮</a>
                            </li>
                            <li>
                              <a class="submenuitem" href="${host }/admin/ui_cards" data-id="link2" data-index="2">卡片</a>
                            </li>
                            <li>
                              <a class="submenuitem" href="${host }/admin/ui_grid" data-id="link3" data-index="3">格栅</a>
                            </li>
                            <li>
                              <a class="submenuitem" href="${host }/admin/ui_icons" data-id="link4" data-index="4">图标</a>
                            </li>
                            <li>
                              <a class="submenuitem" href="${host }/admin/ui_tables" data-id="link5" data-index="5">表格</a>
                            </li>
                            <li>
                              <a class="submenuitem" href="${host }/admin/pagination" data-id="link5" data-index="5">分页导航</a>
                            </li>
                            <li>
                              <a class="submenuitem" href="${host }/admin/ui_progress" data-id="link6" data-index="6">进度条</a>
                            </li>
                            <li>
                              <a class="submenuitem" href="${host }/admin/ui_tabs" data-id="link7" data-index="7">选项卡</a>
                            </li>
                            <li>
                              <a class="submenuitem" href="${host }/admin/ui_step" data-id="link8" data-index="8">步骤</a>
                            </li>
                            <li>
                              <a class="submenuitem" href="${host }/admin/ui_other" data-id="link9" data-index="9">其他</a>
                            </li>
                          </ul>
                    </li>
                    <li>
                      <a class="dropdown-toggle" href="#" data-id="a12">
                        <i class="ft ftsucai-edit-2"></i>
                        <span>表单元素</span>
                        <i class="ft ftsucai-139 drop-icon"></i>
                      </a>
                      <ul class="submenu">
                        <li>
                          <a class="submenuitem" href="${host }/admin/forms_elements" data-id="link21" data-index="21">基本元素</a>
						</li>
						<li>
                          <a class="submenuitem" href="${host }/admin/forms_radio" data-id="link22" data-index="22">单选框</a>
						</li>
						<li>
                          <a class="submenuitem" href="${host }/admin/forms_checkbox" data-id="link23" data-index="23">复选框</a>
						</li>
						<li>
                          <a class="submenuitem" href="${host }/admin/forms_switch" data-id="link24" data-index="24">开关</a>
						</li>
                      </ul>
                    </li>
                    <li>
                      <a class="dropdown-toggle" href="#" data-id="a13">
                        <i class="ft ftsucai-19"></i>
                        <span>示例页面</span>
                        <i class="ft ftsucai-139 drop-icon"></i>
                      </a>
                      <ul class="submenu">
                        <li>
                          <a class="submenuitem" href="${host }/admin/pages_config" data-id="link31" data-index="31">网站配置</a>
						</li>
                        <li>
                          <a class="submenuitem" href="${host }/admin/pages_permission" data-id="link32" data-index="32">权限设置</a>
						</li>
						<li>
                          <a class="submenuitem" href="${host }/admin/pages_add_doc" data-id="link33" data-index="33">新增文档</a>
						</li>
						<li>
                          <a class="submenuitem" href="${host }/admin/pages_guide" data-id="link34" data-index="34">表单向导</a>
						</li>
                      </ul>
                    </li>
                    <li>
                      <a class="dropdown-toggle" href="#" data-id="a14">
                        <i class="ft ftsucai-table"></i>
                        <span>常用列表</span>
                        <i class="ft ftsucai-139 drop-icon"></i>
                      </a>
                      <ul class="submenu">
                        <li>
                          <a class="submenuitem" href="${host }/admin/pages_data" data-id="link41" data-index="41">数据列表</a>
						</li>
                      </ul>
                    </li>
					
					<li>
                      <a class="dropdown-toggle" href="#" data-id="a15">
                        <i class="ft ftsucai-js"></i>
                        <span>脚本插件</span>
                        <i class="ft ftsucai-139 drop-icon"></i>
                      </a>
                      <ul class="submenu">
                        <li>
                          <a class="submenuitem" href="${host }/admin/js_datepicker" data-id="link51" data-index="51">日期选取</a>
						</li>
						<li>
                          <a class="submenuitem" href="${host }/admin/js_sliders" data-id="link52" data-index="52">滑块特效</a>
						</li>
						<li>
                          <a class="submenuitem" href="${host }/admin/js_colorpicker" data-id="link53" data-index="53">色码选取</a>
						</li>
						<li>
                          <a class="submenuitem" href="${host }/admin/js_msg" data-id="link54" data-index="54">对话框</a>
						</li>
						<li>
                          <a class="submenuitem" href="${host }/admin/js_tags_input" data-id="link55" data-index="55">标签插件</a>
						</li>
						<li>
                          <a class="submenuitem" href="${host }/admin/js_notify" data-id="link56" data-index="56">通知消息</a>
						</li>
                      </ul>
                    </li>
					<li>
                      <a class="dropdown-toggle" href="#" data-id="a16">
                        <i class="ft ftsucai-315"></i>
                        <span>统计图表</span>
                        <i class="ft ftsucai-139 drop-icon"></i>
                      </a>
                      <ul class="submenu">
                        <li>
                          <a class="submenuitem" href="${host }/admin/js_chartjs" data-id="link61" data-index="61">Chart图表</a>
						</li>
                      </ul>
                    </li>
                  </ul>
                </div>
              </div>
            </section>
          </div>
          <div id="content-wrapper">
            <div class="content-tabs" style="height:44px;border-bottom:2px solid #f0f0f0;">
              <button class="roll-nav roll-left tabLeft">
                <i class="ft ftsucai-backward2"></i>
              </button>
              <nav class="page-tabs menuTabs">
                <div class="page-tabs-content" style="margin-left: 0px;">
                  <a class="menuTab active" href="javascript:;" data-id="home.htm">欢迎首页</a></div>
              </nav>
              <button class="roll-nav roll-right tabRight">
                <i class="ft ftsucai-forward3"></i>
              </button>
              <div class="btn-group roll-nav roll-right">
                <button class="dropdown tabClose" data-toggle="dropdown">页签操作
                  <i class="ft caret" style="padding-top: 3px;"></i>
				</button>
                <ul class="dropdown-menu dropdown-menu-right">
                  <li>
                    <a class="tabReload" href="javascript:void(0);"><i class="ft ftsucai-spinner3"></i>刷新当前页面</a></li>
                  <li>
                    <a class="tabCloseCurrent" href="javascript:void(0);"><i class="ft ftsucai-close-3"></i>关闭当前页面</a></li>
                  <li>
                    <a class="tabCloseAll" href="javascript:void(0);"><i class="ft ftsucai-77"></i>关闭全部页面</a></li>
                  <li>
                    <a class="tabCloseOther" href="javascript:void(0);"><i class="ft ftsucai-120"></i>除此之外全关</a></li>
                </ul>
              </div>
            </div>
            <div class="content-iframe" style="background-color: #f9f9f9;">
              <div class="mainContent" id="content-main" style="margin: 0px; padding: 0px; height: 1050px;">
				<iframe name="main_iframe" width="100%" height="100%" class="main_iframe" id="default" src="${host}/admin/home.htm" frameborder="0" data-id="home.htm"></iframe>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div id="loadingPage" style="display: none;">
      <div class="loading-shade"></div>
      <div class="loading-content" onClick="$.loading(false)">数据加载中，请稍后…</div>
	</div>
    <script src="${host}/admin/new-version/js/index.js"></script>
    <script src="${host}/admin/new-version/js/indextab.js"></script>
    <script src="${host}/admin/new-version/js/pace.min.js"></script>
  </body>

</html>
