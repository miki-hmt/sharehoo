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
<link rel="stylesheet" href="highlight/styles/gruvbox-dark.css">
<script src="highlight/highlight.pack.js"></script>
<script>hljs.initHighlightingOnLoad();</script>


<link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
<link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />

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

<style type="text/css">
.yin{
	display:none;
}
</style>



<link href="css/style.css" rel="stylesheet" />
<script type="text/javascript">

function reP(){
    document.getElementById('oImg').style.display = "block";
}

function logout() {
	if (confirm("您确定要退出系统吗？")) {
		window.location.href="http://sharehoo.cn/User_logout.action";
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
		window.location.href="http://sharehoo.cn/User_userCenter.action";
	}
}
</script>


<link href="css/csshake.min.css" rel="stylesheet" type="text/css" />
<style type="text/css">
	.weixin{
		width:200px;
		height:150px;
		position:absolute;
	}
	.weixin img{
	    position:relative;
	    float:left;
		width:150px;
		height:150px;
		display:none;
		border-radius:50%;
		
	}
.QQ{
		width:120px;
		height:85px;
		position:absolute;
	}	
	
	
	
.lx{
	margin-top:6px;
	font-weight:bold;
	align:left;
	font-size:10pt;
	position:absolute;
}
.lx img{
	width:21px;
	height:21px;
	margin-bottom:3px;
}


a:hover{
  color:red;
}

</style>


</head>
<body>

<div id="header" class="wrap" style="width: 1200px; margin: 0 auto;">
	<div  class="container">
	<div class="weixin">
		<img src='images/miki.png' id="oImg">
		</div>		
	<div id="header-wrapper">
		
					           
			<div id="logo">	 		
				<h1><a href="#"><font size=5px>IT帮-资讯传播社区</font></a></h1>
				<p> <a href="http://www.limi.store/" rel="nofollow">sharehoo.cn</a></p>
			</div>
		
	</div>
	<div>
	
		<div id="menu" class="container">
			<ul  class="navUI">				
				<li class="current_page_item"><a href="http://sharehoo.cn/home.jsp">首　页</a></li>
				<li><a href="http://sharehoo.cn/blog/Blog_show.action?userId=21" target="_blank">博客社区<img src="./images/icon/hot.gif"></a></li>
				<li><a href="http://sharehoo.cn/shop/Shop_home.action" target="blank">下载社区<img src="./images/icon/hot.gif"></a></li>
								
				<li><a href="http://sharehoo.cn/source/W3CSchool/www.w3school.com.cn/index.html" title="w3cschool最新版" target="blank">
						w3c文档</a>																															
				</li>				
				
				<li><a href="http://sharehoo.cn/Topic_list.action?sectionId=3" target="blank">社友圈<img src="./images/icon/hot.gif"></a></li>
				<li><a href="http://sharehoo.cn/game2.jsp" target="blank">h5小游戏</a></li>
				<li><a href="http://sharehoo.cn/Topic_leaveList.action" target="_blank">秘密墙<img src="./images/icon/hot.gif"></a></li>
				
				<li><a href="http://sharehoo.cn/SoftSection_listpr.action" title="可以上传下载有用的资源" target="_blank">软件下载</a></li>
				<li><a href="http://sharehoo.cn/Topic_details.action?topicId=218" target="blank" title="站长邮箱：1329289117@qq.com"><font >社区规则</font></a></li>	
			</ul>
		</div>
		
	</div>
<div class="lx"><div class="shake-little shake-constant shake-constant--hover"><img src="images/hk.jpg"/></div><a href="javascript:void();" onclick="reP()" style="color:red;">微信公众号</a>|<div class="shake-little shake-constant shake-constant--hover"><img src="images/kla.jpg" style="border-radius:50%;"/>
</div><a href="#" style="color:red;" title="群号：191710765">官方群</a>
</div>
<div style="margin: 0 auto; font-size:10pt;font-weight:bold;height:31px;" align="right">
		
				<!-- <a href="login.jsp">登录</a>| -->
				<a href="javascript:login()" style="color:#FFEC24;margin-left:0px;"><font color="white">登录</font></a>
				<a href="http://sharehoo.cn/register.jsp" style="color:#FFEC24;margin-left:0px;"><font color="white">|注册|</font></a>
				<a href="http://sharehoo.cn/userCenter/forget.jsp" style="color:#FFEC24;margin-left:0px;"><font color="white">忘记密码</font></a>
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
							&nbsp;<a href="http://sharehoo.cn/Topic_details.action?topicId=${id}" style="font-size: 9pt;margin-right:;color:gray;">发表评论</a>
							&nbsp;&nbsp;&nbsp;<a style="text-align: right;color:gray;font-size:9pt;"> 发表时间:『${topic.publishTime?string("yyyy-MM-dd HH:mm:ss") }』</a>
						</td>
					</tr>
					
				</table>
			</div>
		</div>
				
		  <!-- 回复列表2016.08.24 -->	
	</div>
	
	<div class="pagination alternate" align="center">
		<div  class="more">										
			<a href="http://sharehoo.cn/Topic_details.action?topicId=${id}">↓↓↓点击加载更多回复↓↓↓</a>
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
		<a class="arrow" href="#"><span>顶部</span></a>
		
		<a class="contact" href="http://www.baidu.com/" target="_blank"><span></span></a>
		<a class="qrcode" href="#"><span>微信二维码</span></a>
		<a class="arrow" href="#"><span>底部</span></a></div>

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
            	  $("#maincontentWrap").height($("#maincontentPanel").height()+100);
             });
 
</script>
</body>
</html>