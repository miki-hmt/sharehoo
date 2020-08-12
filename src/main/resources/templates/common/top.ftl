
<link href="topic_style/css/style.css" rel="stylesheet" />
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





<link href="topic_style/css/csshake.min.css" rel="stylesheet" type="text/css" />
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

<div>
	<div  class="container">
	<div class="weixin">
		<img src='topic_style/images/miki.png' id="oImg">
		</div>		
	<div id="header-wrapper">
		
		
		
		            <!--黑色背景块上面加入logo块  -->
			<div id="logo">	 		
				<h1><a href="#"><font size=5px>IT资讯交流社区</font></a></h1>
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
				
				<li><a href="http://sharehoo.cn/topic/section/3" target="blank">社友圈<img src="./images/icon/hot.gif"></a></li>
				<li><a href="http://sharehoo.cn/game2.jsp" target="blank">h5小游戏</a></li>
				<li><a href="http://sharehoo.cn/Topic_leaveList.action" target="_blank">秘密墙<img src="./images/icon/hot.gif"></a></li>
				
				<li><a href="http://sharehoo.cn/SoftSection_listpr.action" title="可以上传下载有用的资源" target="_blank">软件下载</a></li>
				<li><a href="http://sharehoo.cn/${host}/topic/detail/218" target="blank" title="站长邮箱：1329289117@qq.com"><font >社区规则</font></a></li>	
			</ul>
		</div>
		
	</div>
<div class="lx"><div class="shake-little shake-constant shake-constant--hover"><img src="topic_style/images/hk.jpg"/></div><a href="javascript:void();" onclick="reP()" style="color:red;">微信公众号</a>|<div class="shake-little shake-constant shake-constant--hover"><img src="topic_style/images/kla.jpg" style="border-radius:50%;"/>
</div><a href="#" style="color:red;" title="群号：191710765">官方群</a>
</div>
<div style="margin: 0 auto; font-size:10pt;font-weight:bold;height:31px;" align="right">
		<#if !user??>
										<font style="color:white;font-size:9pt;">
									
										<#if size==0 && user.type!=2>				                  	  		
					                  	  			社区会员：	
					                  	  		<#else>
					                  	  			<#if size!=0 && user.type!=2>				                  	  	
					                  	  			社区版主：
					                  	  		<#else>					                  	  		
					                  	  			社区管理：
					                  	  		</#if>					            
					                  	 </#if>
										</font>
				<a href="javascript:checkUserLogin()" style="color:#FFEC24;margin-left:-4px;text-transform:uppercase;">${user.nickName }</a><font style="color:white;font-size:9pt;">|</font>
				<a href="User_userCenter.action" target="_blank" title="进入个人中心" style="color:#FFEC24;margin-left:-4px;"><font color="#FFEC24">个人中心</font></a><font style="color: white;font-size:9pt;">|</font>				
				<a href="User_userCenter.action" target="_blank" style="color:#FFEC24;margin-left:-4px;"><font color="#FFEC24"><img src="images/mail3.jpg" style="width:25px;height:21px;border-radius:70%;"/>消息:</font><font style="color: white;">(<%=session.getAttribute("count") %>)</font></a><font style="color: white;font-size:9pt;">|</font>
				<a href="javascript:logout()"><font style="color:#FFEC24;margin-left:-4px;">注销</font></a>
				
				<#if (user.face)??>						
						<a href="javascript:checkUserLogin()"style="color:#FFEC24;margin-left:0px;">
							<img alt=""
								src="topic/images/user/user0.gif"
								style="width: 32px; height: 32px;"></a>
				<#else>
						<a href="javascript:checkUserLogin()" style="color:#FFEC24;margin-left:0px;">
							
							<img alt="" src="topic/${user.face}"
								style="width: 32px; height: 32px;margin-right:7px;border:1px solid white;"></a>			
						</#if>
			<#else>
				<!-- <a href="login.jsp">登录</a>| -->
				<a href="javascript:login()" style="color:#FFEC24;margin-left:0px;"><font color="white">登录</font></a>
				<a href="http://sharehoo.cn/register.jsp" style="color:#FFEC24;margin-left:0px;"><font color="white">|注册|</font></a>
				<a href="http://sharehoo.cn/userCenter/forget.jsp" style="color:#FFEC24;margin-left:0px;"><font color="white">忘记密码</font></a>
		</#if>
	</div>
	</div>
</div>

