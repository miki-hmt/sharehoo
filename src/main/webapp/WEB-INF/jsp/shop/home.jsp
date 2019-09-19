<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>下载频道--IT帮-资讯传播社区 - sharehoo.cn</title>
<meta name="description" content="下载频道 - sharehoo社区" />

<meta name="baidu-site-verification" content="qGEMPsi9L8" />

  <meta name="Keywords" content="下载频道，课设,下载,毕设,博客,开发心得,干货分享,代码,源码">
  <meta name="Description" content="sharehoo.cn资讯交流平台--专注于程序员开发道路的技术分享，问题解决。
	会员可以发帖交流与讨论，每个人都有一个个人博客，可以在上面写下自己的心得与感悟。同时提供资源下载，开源源码下载，课程设计，专注于服务大学生。">

<meta name="Copyright" content="sharehoo" />
<meta http-equiv="X-UA-Compatible" content="IE=8,9" />
<meta name="renderer" content="webkit|ie-stand" />
<link href="${pageContext.request.contextPath}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />
<meta name="apple-mobile-web-app-status-bar-style" content="yes">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/index.css">

<script>
	// 网站链接自动推送js代码      2017.09.07
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

<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?a17e70ae662c5f982f285d3f3d93f0ca";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/footer.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/bootstrap1.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/common.css">
<link href="${pageContext.request.contextPath}/shop/css/quake.slider.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/font-awesome-4.4.0/css/font-awesome.min.css">

<script src="${pageContext.request.contextPath}/shop/js/jquery.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/shop/js/quake.slider-min.js" type="text/javascript"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/download_index.css">
<script src="${pageContext.request.contextPath}/shop/js/animateBackground-plugin.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/shop/js/tabSwitch.js" defer></script>
<script src="${pageContext.request.contextPath}/shop/js/html5shiv.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/shop/js/placeholder.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/shop/js/notify.js"></script>
<script language="javascript" type="text/javascript" src="${pageContext.request.contextPath}/shop/js/async_new.js"></script>


<script type="text/javascript">
	function validateBuy(){
		if ('${currentUser.nickName}'==null||'${currentUser.nickName}'=="") {
			alert("您还未登陆！");
		} else {
			window.location.href="${host}/shop/cdk/buy";
		}	
	}
	
	function validateLogin(){
			if ('${currentUser.nickName}'==null||'${currentUser.nickName}'=="") {
				alert("您还未登陆！");
			} else {
				window.location.href="${host}/shop/center";
			}	
		}
</script>

<script type="text/javascript">
	function Login(){	
		 if ('${currentUser.nickName}'==null||'${currentUser.nickName}'=="") {
		var curPage=window.location.href;
		window.location.href="${pageContext.request.contextPath}/login?prePage="+curPage;
		 }else{
			 alert("上了还想上嘛？");
		  }
}
	
	//2017.08.16 miki 顶部搜索框搜索功能实现
	
	  function htmlencode(s){  
		    var div = document.createElement('div');  
		    div.appendChild(document.createTextNode(s));  
		    return div.innerHTML;  
		}  
		function htmldecode(s){  
		    var div = document.createElement('div');  
		    div.innerHTML = s;  
		    return div.innerText || div.textContent;  
		}  
		
		function setTab(m,n){
			var tli=document.getElementById("menu"+m).getElementsByTagName("a");
			var mli=document.getElementById("main"+m).getElementsByTagName("ul");
			for(i=0;i<tli.length;i++){
				tli[i].className=i==n?"current1 current2":"";
				mli[i].style.display=i==n?"block":"none";
			}
		}
	
		function check_up(thisform){
			var key=$.trim(htmlencode(thisform.keywords.value));
			if(key==""){
				alert("关键字不能为空！");
			}
			else{
				//key=key.replace(/\+/g,"%2B").replace(/\//g,"%2F");
				key =  encodeURIComponent(key)
				var url="${host}/shop/source/serach?keyword="+encodeURIComponent(key);
				window.location.href=url;
			}
			return false;
		}
		
		
	//底部热门标签关键字搜索  2017.08.26 miki
	
		function find(keyword){			
			if(keyword==""){
				alert("关键字不能为空！");
			}
			else{
				//key=key.replace(/\+/g,"%2B").replace(/\//g,"%2F");
				key =  encodeURIComponent(keyword)
				var url="${host}/shop/source/serach?keyword="+encodeURIComponent(key);
				window.location.href=url;
			}
			return false;
		}
      
</script>
</head>
<body>
	<c:choose>
		 <c:when test="${currentUser==null }">
		 	<script id="toolbar-tpl-scriptId" prod="download" skin="black" src="${pageContext.request.contextPath}/shop/js/html.js" type="text/javascript" domain="http://sharehoo.cn/shop/Shop_home.action"></script>	
		 </c:when>
		 <c:otherwise>
		 	 <%@ include file="./common/login.jsp" %> 
		 </c:otherwise>
	</c:choose>
<div class="news-nav">
	<div class="container clearfix">
		<div class="nav-bar">
			<a href="${host}/shop/index.htm" class="current">首页</a>
			<a href="${pageContext.request.contextPath}/shop/${host}/shop/source/serach" target="_blank">资源分类</a>
			<a class=" " href="${host}/shop/rank" target="_blank">精品铺子</a>
			<a class=" " href="http://sharehoo.cn/topic/section/4" target="_blank">赏金平台</a>
			<a href="${host}/shop/download/rank" target="_blank">下载排行</a>			
			<a class=" " href="${pageContext.request.contextPath}/" target="_blank">论坛</a>			
			<a href="javascript:void(0)" onclick="javascript:validateBuy()" target="_blank">虎豆充值</a>
			<a href="javascript:void(0)" onclick="javascript:validateLogin()" target="_blank">我的店铺</a>
		</div>
		<div class="search-download">
			<form action="" method="post" onsubmit="return check_up(this);" name="download_search">
				<input type="text" placeholder="搜索资源" value="" id="tagff" name="keywords"/>
				<a href="javascript:check_up(download_search);void(0);" class="download-search-bth"></a>
			</form>
			<a href="help.html" class="help"><i class="fa fa-question-circle"></i>帮助</a>
		</div>
	</div>
</div>
<!-- //顶部登录部分js选择器	引入login文件的js，	2017.09.09 miki -->

   <script type="text/javascript" src="${pageContext.request.contextPath}/shop/js/toolbar.js" defer></script>
    <div class="home_page_wrap">
      <div class="home_banner">
        <div class="container ban_content">
        <span class="conclusion_shows">累计发布<span class="download_number"><h1><font style="font-weight:bold;font-size:18pt;">52000</font></h1></span>条资源
        <input id="cur_num" type="hidden" value=""></span>
        
        <form method="post">
	     	<div class="advanced_search">
	            <div class="dropdownContainer">
	              <div isDrop="true" bate-id="0" class="dropdownDefault category">技术领域</div><i class="fa fa-angle-down sel_icon"></i>
	              <!-- 大类开始 -->
	              <div class="dropdrown_menu category-1">
	              <span bate-id="0"><a href="javascript:;">全部</a></span>
	                <div class="dropdrown_menu_con clearfix">
	                  <ul class="dropdrown_menu_list">
	                  					<c:forEach items="${categories}" var="category" begin="0" end="4">
	                  						<li bate-id="${category.name }"><a href="javascript:;">${category.name}</a></li>
	                  					</c:forEach>
	                                                                          
	                                    </ul>
	                  <ul class="dropdrown_menu_list">
	                  					<c:forEach items="${categories}" var="category" begin="5" end="9">
	                  						<li bate-id="${category.name }"><a href="javascript:;">${category.name}</a></li>
	                  					</c:forEach>
	                                    </ul>
	                  <ul class="dropdrown_menu_list">
	                                     <c:forEach items="${categories}" var="category" begin="10" end="14">
	                  						<li bate-id="${category.name }"><a href="javascript:;">${category.name}</a></li>
	                  					</c:forEach>
	                                    </ul>
	                  <ul class="dropdrown_menu_list">
	                                     <c:forEach items="${categories}" var="category" begin="15" >
	                  						<li bate-id="${category.name }"><a href="javascript:;">${category.name}</a></li>
	                  					</c:forEach>
	                                    </ul>
	                </div>
	              </div>
	              <!-- 结束 -->
	              
	            </div>
	            <div class="dropdownContainer">
	              <div isdrop="true" bate-id="0" class="dropdownDefault sourcetype">资源类型
	              </div>
	              <i class="fa fa-angle-down sel_icon"></i>
	              
	              <!-- 小类开始 -->
	              <!-- 全部 10   文档类：1 工具类：3  代码类：2  其他：4 -->
	              <div class="dropdrown_menu category-2">
	              <span bate-id="10" class="all"><a href="javascript:;">全部</a></span>
	                <div class="dropdrown_menu_con clearfix">
	                  <ul class="dropdrown_menu_list">
	                  	<c:forEach  items="${types }" var="type">
						 	 <li bate-id="${type.name }"><a href="javascript:;">${type.name}</a></li>
						 </c:forEach>                                    
	                  </ul>
	                </div>
	              </div>
	              <!-- 小类结束 -->
	              
	            </div>
	            
	            <input type="text" max="50" id="keywords" value=""  name="keywords" onkeyup="KeyP(event);" placeholder="Javaweb毕业设计" class="search_input">
	            <a href="javascript:;" class="search_btn" onclick="search_submit()" >搜索</a>
	            
	          </div>
          </form>
          
          <div class="recommended_keywords"><span class="keywords_items">推荐关键字:
          <!-- 推荐关键词开始 -->
                    <a href="javascript:void(0);" onclick="javascript:find('php')"
          target="_blank">
          PHP</a>
          <!-- <em>PHP</em><em>JavaScript</em><em>PPT</em>-->
                    <a href="javascript:void(0);" onclick="javascript:find('Android')"
          target="_blank">
          Android</a>
          <!-- <em>PHP</em><em>JavaScript</em><em>PPT</em>-->
                    <a href="javascript:void(0);" onclick="javascript:find('Python')"
          target="_blank">
          Python</a>
          <!-- <em>PHP</em><em>JavaScript</em><em>PPT</em>-->
                    <a href="javascript:void(0);" onclick="javascript:find('java')"
          target="_blank">
          java</a>
          <!-- <em>PHP</em><em>JavaScript</em><em>PPT</em>-->
                    <!-- 推荐关键词结束 -->
          </span>
          
          </div>
          <!-- 公告开始 -->
          
          <ul class="announcement_list clearfix">
                      <li class="announcement_item">
            <a target="_blank" href="http://sharehoo.cn/shop/${host}/shop/source/serach?categoryId=1&typeId=0">
            <i class="fa fa-chevron-circle-right"></i>
            2017毕业设计板块            </a>
            </li>
                      <li class="announcement_item">
            <a target="_blank" href="javascript:void(0);" onclick="javascript:find('简历')">
            <i class="fa fa-chevron-circle-right"></i>
            2017最新简历模板免费下载            </a>
            </li>
                      <li class="announcement_item">
            <a target="_blank" href="http://sharehoo.cn/shop/Shop_view.action?shopId=1">
            <i class="fa fa-chevron-circle-right"></i>
            网站网页静态化测试            </a>
            </li>
                    </ul>
          <!-- 公告结束 -->
        </div>
      </div>
      <div class="container main">
        <div class="main_l pull-left">
        	<!-- 广告位开始 -->
        	<div>
				
          	</div>
          	<!-- 广告位结束 -->
          <div class="carousel_box wrapper">
            <div class="quake-slider">
              <div class="quake-slider-images">
             <c:forEach  items="${bannerList }" var="banner"> 
	              <a target="_blank" href="${banner.url }">
	              <img src="${pageContext.request.contextPath}/${banner.news_img}" alt="Clean Business Free">
	              </a>
              </c:forEach>                         
              </div>
            </div>
          </div>
          
          <!-- 广告位开始 -->
          <div>
			
          </div>
          <!-- 广告位结束 -->
          
          <div class="resouces_tab_shows tab_nav J_tabSwitch">
            <div class="tab_bar">
              <ul class="tab_list clearfix">
                <li class="tab_item cur">精品资源推荐</li>
                <li class="tab_item">最新上传资源</li>
              </ul>
              <div class="more_info"><a href="Source_search.action" target="_blank">更多》》</a></div>
            </div>
            <!-- 选项卡 内容-->
            <div class="tab_con_box">
              <!-- 精品资源推荐-->
              <div class="tab_page tab1_con">
                <!--album_detail列表-->
                <div class="album_detail_wrap">
                <!-- 循环开始 -->
                	<c:forEach items="${goodList }" var="source">
                    <dl class="album_detail_list clearfix">
                    <dt><a target="_blank" href="${host}/shop/source/${source.id }"><img src="${pageContext.request.contextPath}/shop/images/logo/zip.svg" alt="img"></a></dt>
                    <dd><a target="_blank" href="${host}/shop/source/${source.id }" class="album_detail_title">${source.name }</a>
                      <div class="album_detail_bot clearfix">
                        <label><span>上传者：</span><em class="upl_name">${source.user.nickName }</em></label>
                        <label><span>上传时间：</span><em class="upl_time"><fmt:formatDate value="${source.upload_time}" pattern="yyyy-MM-dd"/></em></label>
                        <strong><span class="jifen">下载豆：</span><em>${source.douNum }</em></strong>
                      </div>
                    </dd>
                  </dl>  
                  </c:forEach>                      
                <!-- 循环结束 --> 
                
                </div>
              </div>
              <!-- 最新上传资源-->
              <div class="tab_page tab2_con">
                <!--album_detail列表-->
                <div class="album_detail_wrap">
                <!-- 循环开始 -->
                   <c:forEach items="${newSources}" var="source">
                    <dl class="album_detail_list clearfix">
                    <dt><a target="_blank" href="${host}/shop/source/${source.id }"><img src="${pageContext.request.contextPath}/shop/images/logo/zip.svg" alt="img"></a></dt>
                    <dd><a target="_blank" href="${host}/shop/source/${source.id }" class="album_detail_title">${source.name }</a>
                      <div class="album_detail_bot clearfix">
                        <label><span>上传者：</span><em class="upl_name">${source.user.nickName }</em></label>
                        <label><span>上传时间：</span><em class="upl_time"><fmt:formatDate value="${source.upload_time}" pattern="yyyy-MM-dd"/></em></label>
                        <strong><span class="jifen">下载豆：</span><em>${source.douNum }</em></strong>
                      </div>
                    </dd>
                  </dl>  
                  </c:forEach>               
                 <!-- 循环结束 --> 
                </div>
              </div>
            </div>
          </div>
          
          <!-- 广告位开始 -->
          <div>
				  
          </div>
          <!-- 广告位结束 -->
          
          <div class="resources_recommeded">
            <div class="com_plate_tit"><span class="plate_title">热门店铺</span><a href="Shop_rank.action" target="_blank" class="more_link">更多》》</a>
            </div>
            <div class="rr_list">
              <!--店铺贡献榜-->
              <div class="album_cate_wrap clearfix">
                <!-- 循环开始 -->
                <c:forEach items="${richList}" var="shop">
                 <dl class="album_list_b">
                  <dt><a href="Shop_view.action?shopId=${shop.id }" target="_blank" class="album_cate_img"><img src="${pageContext.request.contextPath}/shop/${shop.face}" alt="img"></a>
                  <a href="Shop_view.action?shopId=${shop.id }" target="_blank" class="album_num">${shop.douNum }</a></dt>
                  <dd><a href="Shop_view.action?shopId=${shop.id }" target="_blank" class="album_cate_t">介绍：${shop.tag }</a>
                    <div class="album_cate_b"><a href="Shop_view.action?shopId=${shop.id }" class="album_per_img"><img src="${pageContext.request.contextPath}/${shop.user.face}" alt="img"></a><a href="Shop_view.action?shopId=${shop.id }" target="_blank" class="album_per_name">店名：${shop.shop_name }</a></div>
                  </dd>
                </dl>
                </c:forEach>             
                                <!-- 循环结束 -->
              </div>
            </div>
          </div>
        </div>
        <div class="main_r pull-right">
          <!--用户登录信息-->
         <!-- 用户未登录开始 -->
                  <div class="user_login_info">
          <c:choose>
			<c:when test="${not empty currentUser }">
            <div class="user_login_img">
              <div class="login_img"><a target="_blank" href="javascript:void(0)" onclick="javascript:Login()" class="login_link"><img src="${pageContext.request.contextPath}/${currentUser.face }"></a></div>
              <h4>Hi，欢迎来到SHAREHOO下载频道！</h4>
            </div>
            </c:when>
            <c:otherwise>
            <div class="user_login_img">
              	<div class="login_img"><a target="_blank" href="javascript:void(0)" onclick="javascript:Login()" class="login_link">点击登录</a></div>
              	<h4>Hi，欢迎来到SHAREHOO下载频道！</h4>
            </div>
            </c:otherwise>
          </c:choose>
            <div class="user_sign_tips">
              <div class="btn_group" style="text-align: center;"><a target="_blank" href="#" class="ul_btn">上传资源</a><a href="javascript:;" class="sign_in_btn ul_btn">每日签到</a>
              </div>
              <ul class="sign_instructions">
                <li><span>1.每次签到用户可获得1虎豆</span></li>
                <li><span>2.连续签到7天可获得更多奖励，<a target="_blank" href="help.html">点击查看更多</a>关于店铺规则的介绍</span></li>
              </ul>
            </div>
		</div> 
		 
          
          <!-- 广告位开始 -->
          <div>
			
          </div>
          <!-- 广告位结束 -->
          
          <!--博客-->
          <div class="meeting_ppt right_plate_con">
            <div class="com_plate_tit"><span class="plate_title">IT博文</span><a href="meeting.html" class="more_link">更多</a>
            </div>
            <!--会议开始  -->
                        <div class="con_detail">
            <a target="_blank" href="meeting/meeting_detail/30.html" 
            class="ppt_img"><img src="${pageContext.request.contextPath}/shop/images/user/1df5b5b9c2c40818ac294aede716d2d9.jpg" 
            alt=""><span class="ppt_num">14</span></a>
            
              <ul class="cd_list">
                <li class="cd_item"><a target="_blank" href="meeting/meeting_detail/30.html" class="item_tit">soa面向服务框架搭建</a><span class="item_time"><i class="fa fa-clock-o"></i>2017-06-10 - 2017-06-11</span></li>
                                <li class="cd_item"><a href="javascript:;" class="item_tit">linux+dubbo+zookeeper服务管理配置</a>
                <span class="item_time"><i class="fa fa-clock-o"></i>2017-05-18 - 2017-05-19</span></li> 
                              </ul>
            </div>
                        
            
          </div>
          
            												          	          <div class="recommed_knlge right_plate_con">
            <div class="com_plate_tit"><span class="plate_title">热搜模块</span><a href="http://sharehoo.cn/" target="_blank" class="more_link">更多》》</a>
            </div>
            <div class="con_detail">
              <ul class="cd_list">
                <!-- 循环开始 -->
                                <li class="cd_item"><a target="_blank" href="#" class="clearfix"><span class="kn_logo"><img src="${pageContext.request.contextPath}/shop/images/upload/base/1455589744328_328.jpg_%3b%20filename_%3dutf-8%27%20%271455589744328_328.jpg" alt=""></span>
                    <div class="kn_tips"><span class="item_tit">Android</span><span class="item_tips">收录数：<em>3137</em></span><span class="item_tips">关注数：<em>35361</em></span></div></a>
                </li>
                                <li class="cd_item"><a target="_blank" href="#" class="clearfix"><span class="kn_logo"><img src="${pageContext.request.contextPath}/shop/images/upload/base/1465887837340_340.jpg_%3b%20filename_%3dutf-8%27%20%271465887837340_340.jpg" alt=""></span>
                    <div class="kn_tips"><span class="item_tit">React</span><span class="item_tips">收录数：<em>393</em></span><span class="item_tips">关注数：<em>2830</em></span></div></a>
                </li>
                                <li class="cd_item"><a target="_blank" href="#" class="clearfix"><span class="kn_logo"><img src="${pageContext.request.contextPath}/shop/images/upload/base/1479972981201_201.jpg_%3b%20filename_%3dutf-8%27%20%271479972981201_201.jpg" alt=""></span>
                    <div class="kn_tips"><span class="item_tit">人工智能基础</span><span class="item_tips">收录数：<em>206</em></span><span class="item_tips">关注数：<em>14195</em></span></div></a>
                </li>
                                <li class="cd_item"><a target="_blank" href="#" class="clearfix"><span class="kn_logo"><img src="${pageContext.request.contextPath}/shop/images/upload/base/1453701371636_636.jpg_%3b%20filename_%3dutf-8%27%20%271453701371636_636.jpg" alt=""></span>
                    <div class="kn_tips"><span class="item_tit">Java </span><span class="item_tips">收录数：<em>3746</em></span><span class="item_tips">关注数：<em>29098</em></span></div></a>
                </li>
                                <!-- 循环结束 -->
              </ul>
            </div>
          </div>
                    <!--我的tag-->
          <div class="tags right_plate_con">
            <div class="com_plate_tit"><span class="plate_title">热门资源标签</span>
            </div>
            <div class="con_detail content clearfix">
            <!-- 循环tag开始 -->
                                      	<a href="javascript:void(0);" onclick="javascript:find('资源')" target="_blank">资源</a>
              		              		<a href="javascript:void(0);" onclick="javascript:find('apk')" target="_blank">apk</a>
              		              		<a href="javascript:void(0);" onclick="javascript:find('jd-gui')" target="_blank">反编译</a>
              		              		<a href="javascript:void(0);" onclick="javascript:find('管理')" target="_blank">web管理系统</a>
              		              		<a href="javascript:void(0);" onclick="javascript:find('电子商城')" target="_blank">电子商城</a>
              		              		<a href="javascript:void(0);" onclick="javascript:find('源码')" target="_blank">大话设计模式,设计模式,源代码</a>
              		              		<a href="javascript:void(0);" onclick="javascript:find('破解')" target="_blank">破解</a>
              		              		<a href="javascript:void(0);" onclick="javascript:find('浏览器')" target="_blank">浏览器</a>
              		              		<a href="javascript:void(0);" onclick="javascript:find('chrome')" target="_blank">chrome</a>
              		              		<a href="javascript:void(0);" onclick="javascript:find('api文档')" target="_blank">api文档</a>
              		              		<a href="javascript:void(0);" onclick="javascript:find('myeclipse10')" target="_blank">myeclipse10</a>
              		              		<a href="javascript:void(0);" onclick="javascript:find('mysql')" target="_blank">mysql</a>
              		              		<a href="javascript:void(0);" onclick="javascript:find('navicate11')" target="_blank">navicate11</a>
              		              		<a href="javascript:void(0);" onclick="javascript:find('jdk1.7')" target="_blank">jdk1.7</a>
              		              		<a href="javascript:void(0);" onclick="javascript:find('java')" target="_blank">java</a>
              		              		<a href="javascript:void(0);" onclick="javascript:find('64位')" target="_blank">64位</a>
              		              		<a href="javascript:void(0);" onclick="javascript:find('中文版')" target="_blank">中文版</a>
              		              		<a href="javascript:void(0);" onclick="javascript:find('bootstrap')" target="_blank">bootstrap</a>
              		              		<a href="javascript:void(0);" onclick="javascript:find('chm')" target="_blank">chm</a>
              		              		<a href="javascript:void(0);" onclick="javascript:find('oracle')" target="_blank">plsql</a>
              		                          <!-- 循环tag结束-->
            </div>
          </div>
        </div>
      </div>
      <div style="position: fixed;">
          
      </div>
    </div>
 
    <%@ include file="./common/footer.jsp" %> 

    <script type="text/javascript">
      $(function () {
    	//下载总量实时滚动显示
          getdata();
          //setInterval('getdata()', 5000);
          getSignInNum();
          
          TabSwitch.init($(".J_tabSwitch"));
      
          // quake slider
          $('.quake-slider').quake({
                frameWidth: 850,
                frameHeight: 240,
                thumbnails: false,
                effects: ['randomFade', 'swirlFadeIn', 'swirlFadeOut'],
                nextText: '',
                prevText: '',
                hasNextPrev: false,
                captionOpacity: '0.3'
           });
      
          //高级搜索：自定义select	2017.08.14 miki
          $(document).click(function () {
                $(".dropdrown_menu").hide();
                $(".dropdrown_menu").siblings(".dropdownDefault").attr("isDrop", true);
        
            });

          
          $(".dropdownDefault").click(function (even) {
              var siblingsIsShow = $(this).parent(".dropdownContainer").siblings(".dropdownContainer").find(".dropdrown_menu").is(":hidden")
              if (!siblingsIsShow) {
                  $(this).parent(".dropdownContainer").siblings(".dropdownContainer").find(".dropdrown_menu").hide();
                  $(this).attr("isDrop", true);
              }
              if ($(this).attr("isDrop") === "true") {
                  $(this).siblings(".dropdrown_menu").show();
                  $(this).attr("isDrop", false);
      
              } else {
                  $(this).siblings(".dropdrown_menu").hide();
                  $(this).attr("isDrop", true);
              }
              even.stopPropagation();
      
          });
      
          $(".dropdrown_menu li a,.dropdrown_menu span a").click(function () {
              $(this).closest(".dropdrown_menu").siblings(".dropdownDefault").html($(this).html());
              $(this).closest(".dropdrown_menu").siblings(".dropdownDefault").attr("bate-id",$(this).parent().attr("bate-id"));
              $(this).closest(".dropdrown_menu").siblings(".dropdownDefault").attr("isDrop", true);
              $(this).closest(".dropdrown_menu").hide();
          });

          //资源推荐TAB页显示
          TabSwitch.init($(".J_tabSwitch"));

      })
      
    //搜索提交方法 2017.08.14 miki  只输入关键字查询的时候，执行此js函数
    
    function search_submit(){
    	  var categoryid = $(".category").attr("bate-id");
    	  var sourcetype = $(".sourcetype").attr("bate-id");
    	  var keywords = $("#keywords").val().trim();  
    	  
    	if(keywords == ''){
        //有可能是大类，有可能是小类，有可能有大类和小类
        	window.location.href = "${host}/shop/source/serach?category_name="+categoryid+"&type="+sourcetype;
    	}
    	if(keywords != ''){
    		 keywords=  encodeURIComponent(keywords)
    		window.location.href = "${host}/shop/source/serach?category_name="+categoryid+"&type="+sourcetype+"&keyword="+keywords;
        }
  	}

      // 2017.08.16 miki 当输入两个或三个查询条件时，执行该js函数进行查询
    function KeyP(event){
	    var categoryid = $(".category").attr("bate-id");
	  	var sourcetype = $(".sourcetype").attr("bate-id");
		var code = (navigator.appname=="Netscape")?event.which:event.keyCode;
		var keywords = $("#keywords").val().trim();
		keywords = keywords.replace(/C/i, "c");
		keywords = encodeURIComponent(keywords);
		// %23表示 #
		if(keywords.indexOf('c%23') >= 0 ){
			keywords = keywords.replace("c%23",'c井');
		}
		// %2F表示 /  %2C为 ,   %5C为 \
		if(keywords.indexOf("%2F") >= 0 ){
			keywords = keywords.replace('%2F', '%2C');
		}
		if(keywords.indexOf('%5C') >= 0 ){
			keywords = keywords.replace('%5C', '%2C');
		}
		if(code == 13 && keywords != ''){
			keywords = encodeURIComponent(keywords)
			window.location.href = "${host}/shop/source/serach?category_name="+categoryid+"&type="+sourcetype+"&keyword="+keywords;
			//window.location.href="/search/" + categoryid +'/'+ sourcetype + '/'+ '0' + '/'+ '2'+ '/' + '1'+ '/'+keywords;
		}
    }

         
    //下载总量实时显示相关方法
//     /***** 1、 获取后台下载总量 *****/
   	 function getdata(){
	     var num = $("#cur_num").val();
	     $.ajax({	 
	     url: '#' + new Date().getTime(),
	     dataType: "json",
	     error: function(){},
	     success: function(data){
	     	show_num(data);
    	 	}
     	});
     } 
  
    function show_num(n) {
        $(".download_number").html("");
        var it = $(".download_number i");
        var len = String(n).length;
        for (var i = 0; i < len; i++) {
            if (it.length <= i) {
                $(".download_number").append("<i></i>");
            }
            var num = String(n).charAt(i);
            var y = -parseInt(num) * 40;
            var obj = $(".download_number i").eq(i);
            obj.animate({
                    backgroundPosition: '(0 ' + String(y) + 'px)'
                }, 'slow', 'swing', function () {
                }
            );
    
        }
        var m = len % 3 == 0 ? len / 3 - 1 : len / 3;
        for (var j = 1; j <= m; j++) {
            $(".download_number i").eq(len - 3 * j).before("<em>,</em>");
        }
        $("#cur_num").val(n);
    }
    

    $('.sign_in_btn').click(function(){
    		if ('${currentUser.nickName}'==null||'${currentUser.nickName}'=="") {
    			alert("您还未登陆！");
    		} else {
    			window.open("Sign_go.action");
    		}	
    });

    function getSignInNum(){
        var _this = $(".sign_instructions");
    	$.ajax({
   	     url: '#' + new Date().getTime(),
   	     //url: '/index.php/main/get_user_sign',
   	     dataType: "json",
   	     error: function(){
			console.log("get error!");
   	   	     },
   	     success: function(data){
   	   	     $(".dl_integral").find("strong").html(data.user_score);
   	    	if(data.sum_total>1){
   	    		_this.find(".cumulative_sign_in").show();
	    		_this.find(".cumulative_sign_in em").text(data.sum_total + "天");
	    	}else{
	    		_this.find(".cumulative_sign_in").hide();
	    	}
	    	if(data.continue_total>1){
	    		_this.find(".continuous_sign_in").show();
	    		_this.find(".continuous_sign_in em").text(data.continue_total + "天");
	    	}else{
	    		_this.find(".continuous_sign_in").hide();
	    	}  
    	}
      });
    }
      
    </script>