
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
<title>选项卡 - bootstrap中文后台管理系统模板</title>
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
          <div class="col-md-6">
            <div class="card">
              <div class="card-header"><h4>基本样式选项卡</h4></div>
              <div class="card-body">
 
                <ul id="myTabs" class="nav nav-tabs" role="tablist">
                  <li class="active"><a href="#home" id="home-tab" role="tab" data-toggle="tab">FTDMS特点</a></li>
                  <li><a href="#profile" role="tab" id="profile-tab" data-toggle="tab">FTDMS架构</a></li>
                  <li class="dropdown">
                    <a href="#" id="myTabDrop1" class="dropdown-toggle" data-toggle="dropdown" aria-controls="myTabDrop1-contents" aria-expanded="false">其他 <span class="caret"></span></a>
                    <ul class="dropdown-menu" id="myTabDrop1-contents">
                      <li><a href="#dropdown1" id="dropdown1-tab" data-toggle="tab">购买</a></li>
                      <li><a href="#dropdown2" id="dropdown2-tab" data-toggle="tab">定制</a></li>
                    </ul>
                  </li>
                </ul>
                <div id="myTabContent" class="tab-content">
                  <div class="tab-pane fade active in" id="home">
                    <p>1、采用模板引擎缓存技术，实现模板与程序分离，大大提高了系统的访问速度。<br>
                       2、系统采用原生态代码架构，未引入任何框架，永远不用担心第三方版权纠纷问题。<br>
                       3、支持火狐,IE,谷歌等多种浏览器,同时还支持移动端与PC端多种版本进行访问。<br>
                       4、系统前台页面简洁大方，溶入了时下流行的一些元素。<br>
                       5、傻瓜式的内容管理模式，真正实现只要会打字就能管理好网站的内容。<br>
                       6、超强的权限管理，不仅能控制各个模块，还能控制到添、删、改、查等操作权限。<br>
					   7、集成了扫码支付功能，您只要申请个支付帐号，系统后台设置好就可以在线支付了。<br>
                       8、系统采用积分制模式，免费、收费下载都支持，也支持部分免费部分收费模式。<br>
                       9、分类支持无限级分类，帐号支持邮箱激活认证及邮箱取回密码。
                       </p>
                  </div>
                  <div class="tab-pane fade" id="profile">
                    <p>采用模板引擎缓存技术，实现模板与程序分离</p>
                  </div>
                  <div class="tab-pane fade" id="dropdown1">
                    <p>购买&授权联系QQ: 123291926</p>
                  </div>
                  <div class="tab-pane fade" id="dropdown2">
                    <p>1、定制用户必须是我们的商业版用户，拒绝为免费版用户提供定制开发服务。<br>
                       2、客户通过QQ、微信等方式提出定制开发基本需求，确定好开发的基本功能。<br>
                       3、我们根据用户所提的定制需求进行分析并给出最终收费报价（不还价）。<br>
                       4、功能报价双方确认都同意后，要用书面文档的形式把所有定制功能都详细的写入定制开发需求文档中，防止后续产生一些不必要的争议。<br>
                       5、支付定制功能所有的费用，支付方式可以在线支付也可以转帐。<br>
                       6、定制功能开发完成后，交付给用户并协同用户测试验证所有定制的功能。<br>
                       7、定制功能测试验证完成，定制开发就结束。</p>
                  </div>
                </div>
                
              </div>
            </div>
          </div>
          <div class="col-md-6">
            <div class="card">
              <div class="card-header"><h4>两端对齐的选项卡</h4></div>
              <div class="card-body">
                
                <ul class="nav nav-tabs nav-justified">
                  <li class="active">
                    <a data-toggle="tab" href="#home-basic">国际</a>
                  </li>
                  <li class="nav-item">
                    <a data-toggle="tab" href="#profile-basic">本省</a>
                  </li>
                  <li class="nav-item">
                    <a data-toggle="tab" href="#messages-basic">本地</a>
                  </li>
                  <li class="nav-item">
                    <a data-toggle="tab" href="#settings-basic">精选</a>
                  </li>
                </ul>
                <div class="tab-content">
                  <div class="tab-pane fade active in" id="home-basic">
                    <p>众所周知，我国的国企、央企在国民经济中也占有很大的比重。特别是一些银行、电信、能源、保险等国企都进入到了世界五百企业之中。但是，很多国企基层员工们却认为，他们每个月的工资也只有两三千元，只能説是混混日子。不过，令人感到奇怪的是，历年国企辞职的人并不多，一家国企一年也只有两三个人离职，退休的人却远比辞职的多。
于是，很多民众会提出质疑，既然基层国企员工月薪才两三千元，又没啥升职空间，那年轻人还待在国企里面干什么呢？对此，我们认为，在这些国企里面，一些有前途、有能力的人都陆续跳槽了，剩下的更多的人是贪图安逸生活，或者临近退休年龄的人了</p>
                  </div>
                  <div class="tab-pane fade" id="profile-basic">
                    <p>众所周知，我国的国企、央企在国民经济中也占有很大的比重。特别是一些银行、电信、能源、保险等国企都进入到了世界五百企业之中。但是，很多国企基层员工们却认为，他们每个月的工资也只有两三千元，只能説是混混日子。不过，令人感到奇怪的是，历年国企辞职的人并不多，一家国企一年也只有两三个人离职，退休的人却远比辞职的多。
</p>
                  </div>
                  <div class="tab-pane fade" id="messages-basic">
                    <p>众所周知，我国的国企、央企在国民经济中也占有很大的比重。特别是一些银行、电信、能源、保险等国企都进入到了世界五百企业之中。但是，很多国企基层员工们却认为，他们每个月的工资也只有两三千元，只能説是混混日子。不过，令人感到奇怪的是，历年国企辞职的人并不多，一家国企一年也只有两三个人离职，退休的人却远比辞职的多。</p>
                  </div>
                  <div class="tab-pane fade" id="settings-basic">
                    <p>众所周知，我国的国企、央企在国民经济中也占有很大的比重。特别是一些银行、电信、能源、保险等国企都进入到了世界五百企业之中。但是，很多国企基层员工们却认为，他们每个月的工资也只有两三千元，只能説是混混日子。不过，令人感到奇怪的是，历年国企辞职的人并不多，一家国企一年也只有两三个人离职，退休的人却远比辞职的多。</p>
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