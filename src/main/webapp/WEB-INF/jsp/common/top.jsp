<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/search_index.css">
<!-- 2019.09.03 自定义弹窗所需插件 -->
<link rel="stylesheet" type="text/css" href="${host}/sweetalert/sweetalert.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
<script src="${host}/sweetalert/sweetalert.min.js"></script>

<script type="text/javascript">

function reP(){
    document.getElementById('oImg').style.display = "block";
}

function logout() {
	//$.confirm("<p>您确定要退出sharehoo社区</p><p>一个人浪迹天涯吗？</P>");
	swal({
		title : "您确定要退出sharehoo社区",
		text : '<span style="color:red">一个人浪迹天涯吗？</span>',
		type : "warning",
		html : true,
		showCancelButton : true,
		closeOnConfirm : false,
		confirmButtonText : "是的，忍心退出",
		confirmButtonColor : "#ec6c62"
	}, function() {
		$.post("${host}/logout", {
			id : '521'
		}, function(result) {
			if (result.status == 200) {
				location.reload(true);
			} else {
				tipError("退出登录失败！！");
			}
		}, "json");
	});
}

function tipError(content) {
	swal("操作失败", content, "error");
}
function login(){
	var curPage=window.location.href;
	window.location.href="${host}/login?prePage="+curPage;
}
function checkUserLogin(){
	if ('${currentUser.nickName}'==null||'${currentUser.nickName}'=="") {
		alert("您还未登陆！");
	} else {
		window.location.href="user/center";
	}
}

//底部热门标签关键字搜索  2018.08.23 miki

function check_up(thisform){
		var key=$.trim(thisform.keywords.value);
		if(key==""){
			alert("关键字不能为空！");
		}
		else{
			//key=key.replace(/\+/g,"%2B").replace(/\//g,"%2F");
			key =  encodeURIComponent(key)
			var url="${host}/solr/search?keyword="+encodeURIComponent(key);
			window.open(url);
			//window.location.href=url;
		}
		return false;
	}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>haha</title>
		<link href="css/style.css" rel="stylesheet" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/common/css/common.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/common/css/download_index.css">
</head>
<body>

	<div class="header">
			<div class="header-con">
				<a class="header-logo" href="#"><img src="${pageContext.request.contextPath}/common/images/logo/logo1.jpg" style="width:40px;height:40px;"><font style="color:white;"></font></a>
				
				<c:choose>
					
					<c:when test="${not empty currentUser }">							
											<div class="header-user">
												
												<font style="color:white;font-size:9pt;">
											
												<c:choose>
							                  	  		<c:when test="${currentUser.sectionList.size()==0&&currentUser.type!=2 }">
							                  	  			社区会员：	
							                  	  		</c:when>
							                  	  		<c:when test="${currentUser.sectionList.size()!=0&&currentUser.type!=2 }">
							                  	  			社区版主：
							                  	  		</c:when>
							                  	  		<c:otherwise>
							                  	  			社区管理：
							                  	  		</c:otherwise>
							                  	  		</c:choose>
												
						<a href="javascript:checkUserLogin()" style="color:#FFEC24;margin-left:-4px;text-transform:uppercase;">${currentUser.nickName }</a><font style="color:white;font-size:9pt;">|</font>
						<a href="user/center" target="_blank" title="进入个人中心" style="color:#FFEC24;margin-left:-4px;"><font color="#FFEC24">个人中心</font></a><font style="color: white;font-size:9pt;">|</font>				
						<a href="user/center" target="_blank" style="color:#FFEC24;margin-left:-4px;"><font color="#FFEC24">消息</font><img id="news" src="${pageContext.request.contextPath}/common/images/logo/mess.png" style="width:6px;height:24px;display:none;"/></a><font style="color: white;font-size:9pt;">|</font>
						<a href="javascript:logout()"><font style="color:#FFEC24;margin-left:-4px;">注销</font></a>
						</font>
						<c:choose>
								<c:when test="${(currentUser.face==null||currentUser.face=='')&&currentUser.sex=='男'}">
								<a href="javascript:checkUserLogin()"style="color:#FFEC24;margin-left:0px;">
									<img alt=""
										src="${pageContext.request.contextPath}/images/user/user0.gif"
										style="width: 32px; height: 32px;"></a>
								</c:when>
								<c:when test="${(currentUser.face==null||currentUser.face=='')&&currentUser.sex=='女'}">
								<a href="javascript:checkUserLogin()" style="color:#FFEC24;margin-left:0px;">	
									<img alt=""
										src="${pageContext.request.contextPath}/images/user/female.gif"
										style="width: 32px; height: 32px;"></a>
								</c:when>
								<c:otherwise>
								<a href="javascript:checkUserLogin()" style="color:#FFEC24;margin-left:0px;">
									
									<img alt="" src="${pageContext.request.contextPath}/${currentUser.face}"
										style="width: 32px; height: 32px;margin-right:7px;border:1px solid white;"></a>			
								</c:otherwise>
							</c:choose>
																																									
						</div>
					</c:when>
				<c:otherwise>
				<!-- <a href="login">登录</a>| -->
				<div class="header-user">
					<font style="color:white;font-size:9pt;">
						<a href="javascript:login()">登录&nbsp;</a>|<a href="${host}/register">&nbsp;注册&nbsp;</a>|
						<a href="user/forget">忘记密码</a>
					</font>
				</div>
			</c:otherwise>
		</c:choose>
			</div>
		</div>
		<div class="news-nav">
			<div class="container clearfix">
				<div class="nav-bar">
					<a href="home" class="current">首页</a>
					<a href="http://sharehoo.cn/blog/hxk" target="_blank">博客社区<img src="${host}/images/icon/hot.gif"></a>
					<a class=" " href="shop/index.htm" target="_blank">下载社区<img src="${host}/images/icon/hot.gif"></a>
					<a class=" " href="source/W3CSchool/www.w3school.com.cn/index.html" target="_blank">W3C文档</a>
					<a href="topic/section/3" target="_blank">社友圈<img src="${host}/images/icon/hot.gif"></a>			
					<a class=" " href="h5" target="_blank">H5小游戏</a>			
					<a href="secret" target="_blank">秘密墙<img src="${host}/images/icon/hot.gif"></a>
					<a href="softsection/list" target="_blank">软件下载</a>
					<a class=" " href="http://sharehoo.cn/154339002942889.html" target="blank">社区规则</a>	
				</div>
				
				<div class="search-download">
					<form action="" method="post" onsubmit="return check_up(this);" name="download_search">
						<input style="font-size:9pt;" type="text" placeholder="搜索资源..." value="" id="tagff" name="keywords"/>
						<a href="javascript:check_up(download_search);void(0);" class="download-search-bth"></a>
					</form>

				</div>
			</div>
		</div>
    <div class="home_page_wrap">    	
	    	<div class="home_banner">
        		<div id="header-wrapper">
				
		            <!--黑色背景块上面加入logo块  -->
					<div id="logo">	 		
						<h1><a href="#"><font size=5px>IT帮-资讯传播社区</font></a></h1>
						<p> <a href="#" rel="nofollow"><font style="font-size:7pt;"></font></a></p>
					</div>
		
				</div>
      		</div>
	    	 
    </div>


</body>

<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		cache: false,
		type: "POST",
		dataType: "json",
		data: {},
		url: "${host}/user/news",
		success: function(result) {
			if(result.mes){
				$("#news").show();
			}else{
				$("#news").css("display","none");
			}
		}
	});
	if(${currentUser!=null}){
		setInterval(function(){
			   update();
			  }, 50000);
	}
});
function update(){
	$.ajax({
		cache: false,
		type: "POST",
		dataType: "json",
		data: {},
		url: "${host}/user/news",
		success: function(result) {
			if(result.mes){
				$("#news").show();
			}else{
				$("#news").css("display","none");
			}
		}
	});
}
</script>
</html>