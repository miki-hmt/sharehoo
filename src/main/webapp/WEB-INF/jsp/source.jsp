<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>资源下载区-IT帮-资讯传播社区</title>

<link rel="stylesheet" type="text/css" href="./soft/sectionDetail_files/list.css">
<link rel="stylesheet" type="text/css" href="./soft/sectionDetail_files/base.css">
<link rel="stylesheet" type="text/css" href="./soft/sectionDetail_files/keyfile.css">

<link href="${pageContext.request.contextPath}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />
<link rel="stylesheet" type="text/css" href="css/source.css"/>
<link href="css/csshake.min.css" rel="stylesheet" type="text/css" />

<style type="text/css" >

.miki{
	font-size:8pt;
	overflow:auto;
	padding:0px;  /* 2017.04.09   去除左边的空隙  */
}

.miki li{
	float:left;       
	margin-right:4px;    /*先让元素全部向左浮动，然后向右移动，拉开间距*/
	list-style:none;
	text-decoration:none;
	 display:inline;
}



</style>



</head>
<body class="bb">
<div class="lm">

<div class="banner">
<div class="ban"></div>
<div class="search">
<br>
<input name="content" type="text" class="input-medium search-query" placeholder="请输入搜索内容..." style="width: 500px;height:35px;"/>
<button type="submit" class="btn btn-primary" title="Search" style="height:35px;width:60px;background-color:#FF9D01;">查询&nbsp;</button><br>
<font style="font-size:10pt;color:gray;">热门搜索：</font><font style="font-size:10pt;font-color:red;"><a href="#">种子神器&nbsp;</a><a href="#">淘宝购物券&nbsp;</a><a href="#">破解版百度云&nbsp;</a><a href="#">pptv&nbsp;</a><a href="#">暴风影音&nbsp;</a><a href="#">英雄联盟&nbsp;</a><a href="#">酷我音乐&nbsp;</a><a href="#">网站扒取工具</a></font>
</div>
</div>
<div class="kk">
<div class="k1">
<ul class="nav">
<li><a href="SoftSection_listpr.action">首页</a></li>
<li><a href="Soft_listpr.action?softSectionId=1" target="_blank">系统工具</a></li>
<li><a href="Soft_listpr.action?softSectionId=2" target="_blank">编程软件</a></li>
<li><a href="Soft_listpr.action?softSectionId=3" target="_blank">网络工具</a></li>
<li><a href="Soft_listpr.action?softSectionId=4" target="_blank">多媒体工具</a></li>
<li><a href="Soft_listpr.action?softSectionId=5" target="_blank">图像图形</a></li>
<li><a href="Soft_listpr.action?softSectionId=6" target="_blank">文档下载</a></li>
<li><a href="Soft_listpr.action?softSectionId=7" target="_blank">手机软件</a></li>
<li><a href="Soft_listpr.action?softSectionId=9" target="_blank">破解软件</a></li>
<li><a href="source/txt.jsp" target="_blank">web文档</a></li>

</ul>
</div>
</div>


<div class="ll">

<!-- 网页左端部分   2016.12.13 -->
<div class="b0">
<div class="a0">
电脑下载总排行
</div>
<div class="bd">

01.<a href="#" style="font-size:9pt;"><img src="images/dn.png"/>电脑管家<img src="images/icon/hot.png" style="width:11px;height:12px;"></a><br>
02.<a href="#" style="font-size:9pt;"><img src="images/kla.jpg"/>腾讯扣扣<img src="images/icon/hot.png" style="width:11px;height:12px;"></a><br>
03.<a href="#" style="font-size:9pt;"><img src="images/hk.jpg"/>微信<img src="images/icon/hot.png" style="width:11px;height:12px;"></a><br>
04.<a href="#" style="font-size:9pt;"><img src="images/source/pp.png"/>pptv影音播放</a><img src="images/icon/ding.gif" style="width:13px;height:12px;"><br>
05.<a href="#" style="font-size:9pt;"><img src="images/source/kw.png"/>酷我音乐盒子</a><br>
06.<a href="#" style="font-size:9pt;"><img src="images/source/bf.png"/>暴风阴影<img src="images/icon/ding.gif" style="width:11px;height:12px;"></a><br>
07.<a href="#" style="font-size:9pt;"><img src="images/source/aqy.png"/>爱奇艺<img src="images/icon/hot.png" style="width:11px;height:12px;"></a><br>
08.<a href="#" style="font-size:9pt;"><img src="images/source/uc.png"/>uc浏览器</a><br>
09.<a href="#" style="font-size:9pt;"><img src="images/source/gg.png"/>谷歌浏览器<img src="images/icon/ding.gif" style="width:11px;height:12px;"></a><br>
10.<a href="#" style="font-size:9pt;"><img src="images/source/sg.png"/>搜狗输入法</a><br>
11.<a href="#" style="font-size:9pt;"><img src="images/source/hh.png"/>火狐浏览器<img src="images/icon/ding.gif" style="width:11px;height:12px;"></a><br>
12.<a href="#" style="font-size:9pt;"><img src="images/source/lol.png"/>英雄联盟<img src="images/icon/hot.png" style="width:11px;height:12px;"></a><br>
13.<a href="#" style="font-size:9pt;"><img src="images/source/wyy.png"/>网易云</a><br>
14.<a href="#" style="font-size:9pt;"><img src="images/source/tgp.png"/>tgp游戏平台</a><br>
</div>
</div>



<!-- 网页右端部分   2016.12.13 -->
	
		<c:forEach items="${softSectionList }" var="softSection">
		
			<div id="frame">
				<div id="b2">
					<a href="#"></a>		
				</div>
		
				
		<div class="app-box">
            <div class="app-box-head clearfix">
            <a href="Soft_listpr.action?softSectionId=${softSection.id }" target="_blank">
            <h1 class="app-title">
            ${softSection.areaName }           
            </h1>
            </a>
            <h2 class="app-desc">${softSection.areaName }简介</h2>
            <div class="bdsharebuttonbox bdshare-button-style0-16" data-bd-bind="1491735705397">
            <a href="http://www.xiazaiba.com/downlist/2.html#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a><a href="http://www.xiazaiba.com/downlist/2.html#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a><a href="http://www.xiazaiba.com/downlist/2.html#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="http://www.xiazaiba.com/downlist/2.html#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a><a href="http://www.xiazaiba.com/downlist/2.html#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a><a href="http://www.xiazaiba.com/downlist/2.html#" class="bds_bdhome" data-cmd="bdhome" title="分享到百度新首页"></a><a href="http://www.xiazaiba.com/downlist/2.html#" class="bds_more" data-cmd="more"></a>
            </div>
            </div>
            <div class="app-text">介绍：${softSection.descript }           		
           </div>
        </div>
        <div class="app-hot">
            <h2>${softSection.areaName }推荐</h2>
              <ul class="app-list clearfix">
                   <c:forEach items="${good.get(softSection) }" var="soft">
              		<li><a href="Soft_softDetail.action?softId=${soft.id }" title="${soft.soname }" target="_blank"><img src="${pageContext.request.contextPath}/${soft.logo }" alt="${soft.soname }"><span>${soft.soname }</span></a></li>
                 
              	</c:forEach>             	            
              </ul>
        </div>																			
	</div>
</c:forEach>
	
</div>

</div>

</body>
</html>