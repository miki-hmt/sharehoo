<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>资源分类 - sharehoo.cn -IT帮-资讯传播社区</title>
<meta name="description" content="下载频道 - sharehoo.cn" />
<meta name="keywords" content="" />
<meta name="author" content="sharehoo" />
<meta name="Copyright" content="sharehoo" />
<meta name="baidu-site-verification" content="5qKL5WPafahaSFtZ" />
<meta http-equiv="X-UA-Compatible" content="IE=8,9" />

<meta name="renderer" content="webkit|ie-stand" />
<link href="${pageContext.request.contextPath}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />
<meta name="apple-mobile-web-app-status-bar-style" content="yes">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/index.css">

<!-- 尾部分页 css页码 	2017.08.03 miki-->
<link href="${pageContext.request.contextPath }/blog/include/css/page.css" rel="stylesheet"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/common.css">
<link href="${pageContext.request.contextPath}/shop/css/quake.slider.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/font-awesome-4.4.0/css/font-awesome.min.css">
<script src="${pageContext.request.contextPath}/shop/js/jquery.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/shop/js/quake.slider-min.js" type="text/javascript"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/download_index.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/download_new.css">
<script src="${pageContext.request.contextPath}/shop/js/animateBackground-plugin.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/shop/js/tabSwitch.js" defer></script>
<script src="${pageContext.request.contextPath}/shop/js/html5shiv.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/shop/js/placeholder.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/shop/js/notify.js"></script>
<script language="javascript" type="text/javascript" src="${pageContext.request.contextPath}/shop/js/async_new.js"></script>

<script type="text/javascript">
	
function searchType(typeid){     	     			
	//var categoryId = $("#categoryid1").attr("bate-id");
	var cate= $("#miki");
	var menuId= cate.attr("bate-id");
	var typeId=typeid;
	var cateCur = $(".cate_list .cate_cur");
	var cateId = cateCur.attr("bate-id");
	//alert(menuId);
	if(menuId==undefined){
		window.location.href="${pageContext.request.contextPath}/shop/source/categories?categoryId="+cateId+"&typeId="+typeId;
	}else{
		window.location.href="${pageContext.request.contextPath}/shop/source/categories?categoryId="+cateId+"&menuId="+menuId+"&typeId="+typeId;
	}
}

	
	//页面加载时自动执行，获取类选择器为cate_cur的class，将三角图标移动过去		2017.08.15 miki
		
	$(document).ready(function() {
		var cateCur = $(".cate_list .cate_cur");
		var cateId = cateCur.attr("bate-id");
		if(cateId != 'categoryall'){
			var offsetLeft = parseInt(cateCur.position().left + 30);
				$(".sub_img").css("left",offsetLeft);
			}
	});
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

function validateBuy(){
		if ('${currentUser.nickName}'==null||'${currentUser.nickName}'=="") {
			alert("您还未登陆！");
		} else {
			window.location.href="${host}/shop/cdk/buy";
		}	
}
</script>
</head>
<body>
	<c:choose>
		 <c:when test="${currentUser==null }">
		 	<script id="toolbar-tpl-scriptId" prod="download" skin="black" src="${pageContext.request.contextPath}/shop/js/html.js" type="text/javascript" domain="http://sharehoo.cn"></script>	
		 </c:when>
		 <c:otherwise>
		 	 <%@ include file="./common/login.jsp" %> 
		 </c:otherwise>
	</c:choose>
<div class="news-nav">
	<div class="container clearfix">
		<div class="nav-bar">
			<a href="${host}/shop/index.htm">首页</a>
			<a href="${pageContext.request.contextPath}/shop/Source_search.action" target="_blank" class="current">资源分类</a>
			<a class=" " href="${host}/shop/rank" target="_blank">精品铺子</a>
			<a class=" " href="http://sharehoo.cn/topic/section/4" target="_blank">赏金平台</a>
			<a href="${host}/shop/download/rank" target="_blank">下载排行</a>			
			<a class=" " href="${pageContext.request.contextPath}/" target="_blank">论坛</a>			
			<a href="javascript:void(0)" onclick="javascript:validateBuy()" target="_blank">虎豆充值</a>
			<a href="javascript:void(0)" onclick="javascript:validateLogin()" target="_blank">我的店铺</a>
		</div>
		<div class="search-download">
			<form action="Shop_search.action" method="post" onsubmit="return check_up(this);" name="download_search">
				<input type="text" placeholder="搜索资源" value="" id="tagff" name="keywords"/>
				<a href="javascript:check_up(download_search);void(0);" class="download-search-bth"></a>
			</form>
			<a href="help.html" class="help"><i class="fa fa-question-circle"></i>帮助</a>
		</div>
	</div>
</div>
<!-- //顶部登录部分js选择器	引入login文件的js，	2017.09.09 miki -->
	
	<script type="text/javascript" src="/js/search-service/main.js" charset="utf-8"></script>
<script type="text/javascript">
	
$(document).ready(function() {
	document.getElementById("keywords").value="${search}";		//2017.08.16 将查询关键字显示到搜索框中
	//处理特殊字符 start
	var keywords = $(".keywords").val().trim();
	keywords = keywords.replace(/C/i, "c");
	keywords = encodeURIComponent(keywords);
	// %23表示 #
	if(keywords.indexOf('c%23') >= 0){
		keywords = keywords.replace("c%23",'c井');
	}
    if(keywords != ''){
    	var gItem = $(".pageliststy");
        gItem.each(function(){
        	var _this = $(this);
        	var gUrl = _this.attr('href') || false;
        	if(!gUrl) return false; 
        	else{
        		gUrl = gUrl.replace("c#",'c井');
        		_this.attr("href",gUrl);
            }
        });

        var aItem = $(".cate_search_t_l a");
        aItem.each(function(){
        	var _this = $(this);
        	var sUrl = _this.attr('href') || false;
        	if(!sUrl) return false; 
        	else{
        		sUrl = sUrl.replace("c#",'c井');
        		_this.attr("href",sUrl);
            }
        });
        $("#keywords").attr("href",'${host}/shop/source/search?keyword='+encodeURIComponent(keywords));
    }
	//处理特殊字符 end	
})

function KeyP(event){
	var code = (navigator.appname=="Netscape")?event.which:event.keyCode;
	var keywords = $(".keywords").val().trim();
	keywords = keywords.replace(/C/i, "c");
	keywords = encodeURIComponent(keywords);
	// %2F表示 /  %2C为 ,   %5C为 \
	if(keywords.indexOf("%2F") >= 0 ){
		keywords = keywords.replace('%2F', '%2C');
	}
	if(keywords.indexOf('%5C') >= 0 ){
		keywords = keywords.replace('%5C', '%2C');
	}
	if(keywords.indexOf('c%23') >= 0 ){
		keywords = keywords.replace("c%23",'c井');
	}
    if(code == 13 && keywords != ''){
    	keywords = encodeURIComponent(keywords)
		window.location.href = "${host}/shop/source/search?categoryId="+categoryid +"&typeId="+sourcetype+"&keyword="+keywords ;
    }
    $("#keywords").attr("href",'${host}/shop/source/search?categoryId='+categoryid +'&typeId='+sourcetype+'&keyword='+keywords);
	if(keywords == ''){
        $("#keywords").attr("href",'#');
	}
}

</script>
	
   <script type="text/javascript" src="${pageContext.request.contextPath}/shop/js/toolbar.js" defer></script>
    
    <div class="meeting_main">
    	<div class="ad_wrap clearfix">
		      <div class="top_ad_box clearfix">
				<div class="top_ad_t">
		        	<!-- 广告位开始 -->					
					<!-- 广告位结束 -->
				</div>
				<div class="top_ad_b">
			      	<!-- 广告位开始 -->				
					<!-- 广告位结束 -->
			      	</div>
		      	</div>
		      	<div class="top_ad_r_box">
		        	<!-- 广告位开始 -->					
					<!-- 广告位结束 -->
	        	</div>
	  </div>
    
      <div style="height:20px;"></div>
      <div class="download_new clearfix">
        <div class="download_l fl">
          <div class="dl_wrap">
            <dl class="cate_sea_list clearfix">
              <dt>技术领域：</dt>
              <dd>
                <ul class="cate_list" id="categoryid1">
                  <li bate-id="categoryall">
                  	<a href="${pageContext.request.contextPath}/shop/${host}/shop/source/serach">
                  		全部
                  	</a>
                  </li>
                  
                  <c:forEach items="${categories}" var="category">
                  		<c:choose>
						<c:when test="${category.id==curCategory.id }">
							<li bate-id="${category.id }" class="cate_cur" style="line-height:25px;"><a href="javascript:void(0);" onclick="javascript:show()">${category.name}</a></li>
						</c:when>
                  		<c:otherwise>
                  		<li bate-id="${category.id }" class="" style="line-height:25px;"><a href="javascript:void(0);" onclick="javascript:show()">${category.name}</a></li>
                  		</c:otherwise>
                  		</c:choose>
                  </c:forEach>
                  
                </ul>
                <div class="subSearch" id="sonSearch" style="display:block;">
                  	<img class="sub_img" src="${pageContext.request.contextPath}/shop/images/logo/san.jpg" alt="img">
                  		
                  	<c:forEach items="${menus}" var="menu">
                  		<c:choose>
							<c:when test="${menu.id==curMenu.id }">
								<a href="javascript:void(0);" bate-id="${menu.id }" onclick="javascript:show2('${menu.id }')" id="miki" class="sub_a" style="color:#CC0000;">${menu.name}</a>
							</c:when>
	                  		<c:otherwise>
	                  			<a href="javascript:void(0);" onclick="javascript:show2('${menu.id }')" class=" sub_a">${menu.name}</a>
	                  		</c:otherwise>
                  		</c:choose>                		
                 	 </c:forEach>	
                                                                           
                 </div>
                             
              </dd>
            </dl>
            
             <dl class="cate_sea_list clearfix">
              <dt>资源类型：</dt>
              <dd id="sourcetype">
              <label bata-id="10" class="source_item js_source"><a href="${pageContext.request.contextPath}/shop/Source_search.action">全部</a></label>
              <c:forEach items="${types}" var="type" >
              	<c:choose>
							<c:when test="${curType.id==type.id }">
								<label bata-id="${type.id }" class="source_item js_source"><a href="javascript:void(0);" onclick="javascript:searchType(${type.id})" style="color:#CC0000;">${type.name }</a></label>
							</c:when>
	                  		<c:otherwise>
	                  			<label bata-id="${type.id }" class="source_item js_source"><a href="javascript:void(0);" onclick="javascript:searchType(${type.id})">${type.name }</a></label>
	                  		</c:otherwise>
                  		</c:choose>                       	
              </c:forEach>                 
              </dd>
            </dl>
                               
            
            <dl class="cate_sea_list clearfix">
              <dt class="keyword_dt">关键词：</dt>
              <dd>
                <input type="text" class="keywords" id="keywords" value="" name="keywords" onkeyup="KeyP(event);"><a href="javascript:void(0);" id="keywords" class="cate_search"  onclick="search_submit()">搜索</a>           
              </dd>
            </dl>
          </div>
          
          <div class="condition clearfix"><span>已选条件 ： &nbsp;</span>
            <div class="condition_wrap">
            				<label id="source_type" class="condition_item"><em>${curCategory.name }</em>
            				<a class="cate_close" id="tech_close" href="#"><img src="${pageContext.request.contextPath}/shop/images/logo/close.jpg" alt="img" style="margin-top:5px;"></a></label>                        
                             <c:if test="${curMenu!=null }">
                             	<label id="source_type" class="condition_item"><em>${curMenu.name }</em>
            				<a class="cate_close" id="tech_close" href="#"><img src="${pageContext.request.contextPath}/shop/images/logo/close.jpg" alt="img" style="margin-top:5px;"></a></label>
                             </c:if>
                             <c:if test="${curType!=null }">
                             	<label id="source_type" class="condition_item"><em>${curType.name }</em>
            				<a class="cate_close" id="tech_close" href="#"><img src="${pageContext.request.contextPath}/shop/images/logo/close.jpg" alt="img" style="margin-top:5px;"></a></label>
                             </c:if>  
                             <label id="source_type" class="condition_item"><em>清空全部</em>
	            				<a class="cate_close" id="tech_close" href="${pageContext.request.contextPath}/shop/Source_search.action"><img src="${pageContext.request.contextPath}/shop/images/logo/close.jpg" alt="img" style="margin-top:5px;">
	            				</a>
            				</label>                                                                   
          				           
            </div>
          </div>
          
          <!--搜索列表-->
          <div class="dl_wrap">
            <div class="cate_search_top clearfix">
               <div class="cate_search_t_l fl">
                				<span class="csdn-tracking-statistics" data-mod="popu_284">
                <a target="_self" href="/search/0/10/0/0/1" id="0" class="search_cur">最新上传</a>
                </span>
                <span class="csdn-tracking-statistics" data-mod="popu_283">
                <a target="_self" href="/search/0/10/0/1/1" id="1">最多下载</a>
                </span>
               </div>
             
              <div data-num="30" class="cate_total fr"><!-- 共<em>298</em>个资源 --></div>
            </div>
            <!--列表内容-->
            <div class="album_detail_wrap">
            <c:forEach items="${sourceList }" var="source">
            	<dl class="album_detail_list clearfix">
                <dt><a href="${pageContext.request.contextPath }/shop/Source_detail.action?source_id=${source.id}" target="_blank"><img src="${pageContext.request.contextPath }/shop/images/logo/zip.svg" alt="img"></a></dt>
                <dd><a href="${pageContext.request.contextPath }/shop/Source_detail.action?source_id=${source.id}" class="album_detail_title" target="_blank">${source.name }</a>
                  <p class="cate_search_p"><font style="font-size:9pt;color:gray;">${source.description} </font></p><br>
                  <div class="album_detail_bot clearfix">
                    <label><span>下载次数：</span><em>${source.downNum }</em></label>
                    <label><span>资源大小：</span><em>${source.size }</em></label>
                    <label><span>上传时间：</span><em><fmt:formatDate value="${source.upload_time}" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;I Love You</em></label>
                    <label><span>店铺：</span><em class="upload_name">${source.shop.shop_name }</em></label>
                    <strong>
                    	<span>所需虎豆：</span>
                    	<em>
                        	${source.douNum }                                        
                     	</em>
                    </strong>
                  </div>
                </dd>
              </dl>
              </c:forEach>

           </div>
          </div>
          
          <!--分页-->
          <!-- page 开始-->
             <div class="pagination alternate">
				<ul class="clearfix">
					${pageCode }
				</ul>
			</div>
            
        </div>
        
        <div class="download_r fr">
          <!--热点资源-->
          <div class="dl_wrap dl_mar_b">
            <h4 class="dl_common_t"><span style="font-size:14px">
            资源排行</span>
              <!--搜索页面热点资源-->
              <label class="contri"><span class="source_btn hotSource_cur">本周</span><span class="source_btn">本月</span><span class="source_btn">本年</span>
              </label>
            </h4>
            
            <div class="dl_notice">
              <div class="search_wrap">
              	<!-- 本周 -->
                <ul class="resource_c_list search_list searchHot_show">
                					<li><i class="fa fa-caret-right"></i><a target="_blank" title="git for windows==Git-2.14.0-64-bit" href="/download/u013904227/9923305">git for windows==Git-2.14.0-64-bit</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" title="gradle-4.1-all.zip 下载" href="/download/yyh352091626/9924256">gradle-4.1-all.zip 下载</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" title="beyondcompare 破解版" href="/download/huaxin3475/9926369">beyondcompare 破解版</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" title="C# 餐饮管理系统 详细源代码" href="/download/qq_2723812263/9923392">C# 餐饮管理系统 详细源代码</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" title="ADF4351 stm32f10x 控制代码" href="/download/qq_39704163/9923958">ADF4351 stm32f10x 控制代码</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" title="基于 spring+ spring mvc+ mybatis 权限管理系统" href="/download/ls249438054/9923613">基于 spring+ spring mvc+ mybatis 权限管理系统</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" title="spring mvc+ easyui+ mybatis 开发网站后台管理系统源代码下载" href="/download/ls249438054/9923407">spring mvc+ easyui+ mybatis 开发网站后台管理系统源代码下载</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" title="2017年阿里Java基础面试题文档" href="/download/u011958281/9929577">2017年阿里Java基础面试题文档</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" title="WEB性能实践日志" href="/download/zhangy110615/9926701">WEB性能实践日志</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" title="java数据结构和算法.（第二版）(带书签)" href="/download/my_love_java_xu/9929903">java数据结构和算法.（第二版）(带书签)</a>
                  </li>
				                </ul>
                <!-- 本月 -->
                <ul class="resource_c_list search_list">
                					<li><i class="fa fa-caret-right"></i><a target="_blank" href="/download/qw599186875/9917057">java JDK1.9  179 API 中文 谷歌翻译 java帮助文档9 Google翻译 java9 中文文档 帮助文档</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" href="/download/caozhy/9918664">Visual C++编程例子源代码</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" href="/download/zanfeng/9918581">系统架构设计师教程（第三版）.pdf</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" href="/download/caozhy/9919479">asp.net实例源代码合集</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" href="/download/caozhy/9919273">C语言源代码大全</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" href="/download/linge1995/9920604">架构解密从分布式到微服务（Leaderus著）</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" href="/download/ls249438054/9917971">基于 spring、 spring mvc、 mybatis 权限管理系统</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" href="/download/caozhy/9919476">java实例视频讲解+源代码 1 of 2</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" href="/download/u013904227/9923305">git for windows==Git-2.14.0-64-bit</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" href="/download/caozhy/9919162">Android开发源代码合集</a>
                  </li>
				                </ul>
                <!-- 本年 -->
                <ul class="resource_c_list search_list">
                					<li><i class="fa fa-caret-right"></i><a target="_blank" href="/download/t6546545/9732412">gradle-3.3-all.zip</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" href="/download/qw599186875/9802192">JDK1.8 API 中文 谷歌翻译 java帮助文档1.8 google翻译</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" href="/download/l1505624/9789078">深入浅出MyBatis技术原理与实战.pdf</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" href="/download/xiaoyu5256/9858024">精通Spring+4.x++企业应用开发实战.pdf</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" href="/download/id_rin/9815280">intellij idea 2017版本中文汉化包</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" href="/download/wyx100/9734370">微信小程序全套源代码（后台、小程序php）</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" href="/download/l1505624/9783279">深入理解计算机系统（原书第三版）中文高清.pdf</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" href="/download/kinglear/9735569">终极算法：机器学习和人工智能如何重塑世界</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" href="/download/u010693765/9774693">人脸识别代码</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" href="/download/u013003382/9872692">Tensorflow 实战Google深度学习框架 [完整PDF]</a>
                  </li>
				                </ul>
              </div>
            </div>
          </div>
          <!--广告-->
          <div class="dl_mar dl_mar_b">

          </div>
          
        </div>
      </div>
    </div>
    
    <%@ include file="./common/footer.jsp" %> 
 
    <script type="text/javascript">
      	
    	//2017.08.14 miki 点击二级分类的时候，显示三级分类
	    function show(){     	
	    	document.getElementById('sonSearch').style.display = 'block';
	    	//var categoryId = $("#categoryid1").attr("bate-id");
	    	$('.cate_list li').click(function(){//点击的时候给当前这个加上红色下划线，其他的移除
				$(this).addClass("cate_cur").siblings("li").removeClass("cate_cur");
				var cateCur = $(".cate_list .cate_cur");
				var cateId = cateCur.attr("bate-id");							
					window.location.href="${pageContext.request.contextPath}/shop/source/categories?categoryId="+cateId;																
				});
	    }
    	
    		    	  	
    	
    	//点击全部关闭子元素，并查询结果
    	function close(){
    		window.location.href="${pageContext.request.contextPath}/shop/Source_search.action";
    	}
    		
    	//二级菜单 类型查询   2017.08.15 miki
    	
    	 function show2(menuid){     	
 	    	document.getElementById('sonSearch').style.display = 'block';
 	    	$('.subSearch').click(function(){//点击的时候给当前这个加上红色下划线，其他的移除
				$(this).addClass("cate_cur").siblings("a").removeClass("cate_cur");			
 	    	//var categoryId = $("#categoryid1").attr("bate-id");	
				var cateId = ${curCategory.id};
 				var menuId=menuid;
 				window.location.href="${pageContext.request.contextPath}/shop/source/categories?categoryId="+cateId+"&menuId="+menuId;
 	    	});
 	    }
    	
    	
    

    	 function search_submit(){
       	  var categoryid = $(".category").attr("bate-id");
       	  var sourcetype = $(".sourcetype").attr("bate-id");
       	  var keywords = $("#keywords").val().trim();  
       	  if(keywords != ''){
       		  keywords=  encodeURIComponent(keywords)
           	  var url="${host}/shop/source/search";
           	  window.location.href=url;
          	}
       	if(keywords == ''){
           //有可能是大类，有可能是小类，有可能有大类和小类
           alert("关键字不能为空！");
       	}
       	if(keywords != ''){
       		 keywords=  encodeURIComponent(keywords)
       		window.location.href = "${host}/shop/source/search?keyword="+keywords+"&categoryId="+'${curCategory.id}'+"&typeId="+'${curType.id}' ;
           }
     	}

    	
    
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
				var url="${host}/shop/source/search?keyword="+encodeURIComponent(key);
				window.location.href=url;
			}
			return false;
		}
	       
	
	       
	

    </script>