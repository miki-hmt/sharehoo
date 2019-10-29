<!DOCTYPE html><head>
<meta charset="utf-8">
<meta name="renderer" content="webkit"> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>${topic.title}--IT帮-资讯传播社区</title>
<meta name="Author" content="miki">
<meta name="Keywords" content="${topic.title}，课设,下载,博客,论坛,IT资讯,开发心得,干货分享,代码,源码">
<meta name="Description" content="sharehoo.cn资讯交流平台--专注于程序员开发道路的技术分享，问题解决。
	会员可以发帖交流与讨论，每个人都有一个个人博客，可以在上面写下自己的心得与感悟。同时提供资源下载，开源源码下载，课程设计，专注于服务大学生。">
<link href="css/style3.css" rel="stylesheet" type="text/css" />
<link href="shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>

<!--2018.07.18  miki  ckeditor代码高亮	开头这里的样式为默认的风格，可以根据自己的喜好更换风格-->
		<!--我的高亮效果是zenburn-->
<link rel="stylesheet" href="highlight/styles/zenburn.css">
<script src="highlight/highlight.pack.js"></script>
<script>hljs.initHighlightingOnLoad();</script>

<link rel="stylesheet" href="shop/css/search_index.css">
<link rel="stylesheet" href="common/css/common.css">
<link rel="stylesheet" href="common/css/download_index.css">

<link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
<link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet" />

<script>
(function(){
    var bp = document.createElement('script');
    var curProtocol = window.location.protocol.split(':')[0];
    if (curProtocol === 'https') {
        bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';        
    }
    else {
        bp.src = 'http://push.zhanzhang.baidu.com/push.js';
    }
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(bp, s);
})();
</script>

<meta name="baidu-site-verification" content="qGEMPsi9L8" />
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?a17e70ae662c5f982f285d3f3d93f0ca";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>

<link href="css/style.css" rel="stylesheet" />
<script type="text/javascript">

function reP(){
    document.getElementById('oImg').style.display = "block";
}

function logout() {
	if (confirm("您确定要退出系统吗？")) {
		window.location.href="http://sharehoo.cn/user/logout";
	}
}
function login(){
	var curPage=window.location.href;
	window.location.href="login.jsp?prePage="+curPage;
}
function checkUserLogin(){
	if ('${user.nickName}'==null||'${user.nickName}'=="") {
		alert("您还未登陆！");
	} else {
		window.location.href="http://sharehoo.cn/user/center";
	}
}
</script>

</head>
<body>

<div class="wrap">

	<div class="header">
			<div class="header-con">
				<a class="header-logo" href="#"><img src="common/images/logo/logo1.jpg" style="width:40px;height:40px;"><font style="color:white;"></font></a>
				<!-- <a href="login">登录</a>| -->
				<div class="header-user">
					<font style="color:white;font-size:9pt;">
						<a href="javascript:login()">登录&nbsp;</a>|<a href="register">&nbsp;注册&nbsp;</a>|
						<a href="user/forget">忘记密码</a>
					</font>
				</div>
			</div>
		</div>
		<div class="news-nav">
			<div class="container clearfix">
				<div class="nav-bar">
					<a href="home" class="current">首页</a>
					<a href="http://sharehoo.cn/blog/miki" target="_blank">博客社区<img src="images/icon/hot.gif"></a>
					<a class=" " href="shop/index.htm" target="_blank">下载社区<img src="images/icon/hot.gif"></a>
					<a class=" " href="source/W3CSchool/www.w3school.com.cn/index.html" target="_blank">W3C文档</a>
					<a href="topic/section/3" target="_blank">社友圈<img src="images/icon/hot.gif"></a>			
					<a class=" " href="h5" target="_blank">H5小游戏</a>			
					<a href="secret" target="_blank">秘密墙<img src="images/icon/hot.gif"></a>
					<a href="softsection/list" target="_blank">软件下载</a>
					<a class=" " href="http://sharehoo.cn/154339002942889.html" target="blank">社区规则</a>		
				</div>
			<div class="search-download" style="display:none;">
					<form action="" method="post" onsubmit="return check_up(this);" name="download_search">
						<input style="font-size:9pt;" type="text" placeholder="搜索资源..." value="" id="tagff" name="keywords"/>
						<a href="javascript:check_up(download_search);void(0);" class="download-search-bth"></a>
					</form>

				</div>
			</div>
		</div>
    <div class="home_page_wrap">    	
	    	<div class="home_banner">       
				
		            <!--黑色背景块上面加入logo块  -->
					<div style="width: 1200px; margin: 0 auto;height:150px;color:white;border:1px solid white;"> 		
					<h4 align="center">欢迎讨论：${topic.title }！</h4>
					<h5>-发帖者：${topic.user.nickName }</h5>
					<h5>-<img src="common/images/write.png"><a href="#1">参与讨论....</a></h5>
					</div>
		
      		</div>
	    	 
    </div>
    
</div>


                 <!-- 设置背景图片的尺寸2016.08.25 background:url('images/123.jpg') -->
<div style=" width: 1200px;height:auto;margin: 0 auto; background-color:#FFFFFF;" id="maincontentWrap">
<div style="width: 1200px; margin: 0 auto;border:1px;">
	<div class="container-fluid" style="padding-left: 0px;padding-right: 2px;">
		<div class="row-fluid" >
			<div class="span2">
				<table style="width: 100%;border:1px solid silver; background-color:#EFF4FB;" cellpadding="5px;">
					<tr>
						<td>
							★楼主&nbsp;
						</td>
					</tr>
					<tr>
						<td>
																									
							<img alt="" src="${user.face}" style="width: 100px;height: 100px;border-radius:50%;">
						
							<a href="#" style="font-size: 8pt;color: black;">${user.nickName }</a>
						</td>
					</tr>					
					<tr>
						<td>
							<a href="#" style="font-size: 8pt;color: black;"><strong>性别：${user.sex }</strong></a><br>
							<a href="#" style="font-size: 8pt;color: black;"><strong>邮箱：${user.email }</strong></a><br>
		
							<#if size==0 && user.type!=2>					
								<font style="font-size: 8pt;color: black;">普通用户</font>
							<#elseif size!=0 && user.type!=2>
										<font style="font-size: 8pt;color: blue;">版主</font>
								【<#list sectionList as section>
					                  	  	${section.name }；
					                  	 </#list>】
					                <#else>
									
							<font style="font-size: 8pt;color: red;">管理员</font>
							</#if>
						</td>
					</tr>
				</table>
			</div>
			<div class="span10">
				<table style="width: 100%;border:1px solid #A9CBEE;" id="maincontentPanel">
					<tr style="height: 60px;">
						<a name="top"></a>
						<td style="background-color:#EFF4FB;">
							【主题】:<strong><font color="red">${topic.title }</font></strong>
						</td>
						
					</tr>
					
					<tr>
						<td>
							<div style="height:auto; width: 975px;padding:6px;font-size:9pt;" class="show_e">
								${topic.content }
							</div>
						</td>
					</tr>
					
					<tr>
						<td style="text-align: right;height: 40px;color:gray;font-size:9pt;background-color:#EFF4FB;">
							&nbsp;<a href="http://sharehoo.cn/topic/detail/${id}" style="font-size: 9pt;margin-right:;color:gray;">发表评论</a>
							&nbsp;&nbsp;&nbsp;<a style="text-align: right;color:gray;font-size:9pt;"> 发表时间:『${topic.publishTime?string("yyyy-MM-dd HH:mm:ss") }』</a>
						</td>
					</tr>
					
				</table>
			</div>
		</div>
				
		  <!-- 回复列表2016.08.24 -->	
	</div>
	
	<div class="pagination alternate" align="center">
		<a name="foot"></a>
		<div  class="more">									
			<a href="http://sharehoo.cn/topic/detail/${id}">↓↓↓点击加载更多回复↓↓↓</a>
		</div>				
	</div>
	
</div>
</div>



                      <!-- 返回顶部 代码        2017.03.02               -->


<script type="text/javascript">

	 $(function(){

        // 页面浮动面板
        $("#floatPanel > .ctrolPanel > a.arrow").eq(0).click(function(){$("html,body").animate({scrollTop :0}, 800);return false;});
        $("#floatPanel > .ctrolPanel > a.arrow").eq(1).click(function(){$("html,body").animate({scrollTop : $(document).height()}, 800);return false;});

        var objPopPanel = $("#floatPanel > .popPanel");	
        var w = objPopPanel.outerWidth();
        $("#floatPanel > .ctrolPanel > a.qrcode").bind({
            mouseover : function(){
                        objPopPanel.css("width","0px").show();
                        objPopPanel.animate({"width" : w + "px"},300);return false;
                },
                mouseout : function(){
                        objPopPanel.animate({"width" : "0px"},300);return false;
                        objPopPanel.css("width",w + "px");
            }	
        });

    });
</script>
<br><div style="text-align:center;clear:both"><br>
</div>

<div style="text-align:center;margin:0px 0">
<!--浮动面板-->
<div id="floatPanel">
	<div class="ctrolPanel">
		<a class="arrow" href="#top"><span>顶部</span></a>
		
		<a class="contact" href="http://www.baidu.com/" target="_blank"><span></span></a>
		<a class="qrcode" href="#"><span>微信二维码</span></a>
		<a class="arrow" href="#foot"><span>底部</span></a></div>

	<div class="popPanel">
		<div class="popPanel-inner">
			<div class="qrcodePanel">
				<img src="images/miki.png" /><span>扫描二维码关注网站最新动态</span></div>
			<div class="arrowPanel">
				<div class="arrow01">
				</div>
				<div class="arrow02">
				</div>
			</div>
		</div>
	</div>
</div>
</div>




        <!-- 回复界面不需要底部管理员登录选项footer.jsp       2016.09.27-->

<script type="text/javascript">
       $(document).ready(function(){
            	  // 在这里写你的代码...
            	  $("#maincontentWrap").height($("#maincontentPanel").height()+200);
             });
 
</script>
</body>
</html>