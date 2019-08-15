<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${softSection.areaName }下载区-IT帮-资讯传播社区</title>

			<!--	2017.04.13			引入底部页码css格式 		 -->
<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />


<link rel="stylesheet" type="text/css" href="soft/sectionDetail_files/list.css">
<link rel="stylesheet" type="text/css" href="soft/sectionDetail_files/base.css">
<script type="text/javascript" src="soft/sectionDetail_files/js"></script>
<script type="text/javascript" src="soft/sectionDetail_files/jst.js"></script>
<script type="text/javascript" src="soft/sectionDetail_files/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="soft/sectionDetail_files/browser.js"></script>
<link rel="stylesheet" type="text/css" href="soft/sectionDetail_files/keyfile.css">
<script type="text/javascript">
	function baidu_search(){
		var baidu = $('#bdcs-search-form-input');
		var search_key = $('#search_key').val();
		baidu.val(search_key);
		$("#bdcs-search-form").submit();  
	}

	$(document).ready(function(){
	    $("input[type='text']").each(function(){
	            $(this).keypress( function(e) {
	          	    var baidu = $('#bdcs-search-form-input');
	         			var search_key = $('#search_key').val();
	         			baidu.val(search_key);	           		   
	                     var key = window.event ? e.keyCode : e.which;
	                    if(key.toString() == "13"){
	                 	   	$("#bdcs-search-form").submit();
	                         return false;
	                    }
	            });
	     });
	}) 
</script>
<script src="soft/sectionDetail_files/share.js"></script>
<link rel="stylesheet" href="soft/sectionDetail_files/share_style0_16.css">
<jsp:include page="../common/top1.jsp"/>
</head>
<style type="text/css" id="27337073000"></style>
<body>
<div class="container">
   
<div class="row mt10">
    <div class="page-position">
        <p>您所在的位置：<a href="http://www.limi.store/" class="imp">IT帮-资讯传播社区</a> <span class="ext">&#187;</span>  <a href="SoftSection_list1.action" class="imp">软件下载</a> <span class="ext">&#187;</span> <strong class="c666">${softSection.areaName }</strong></p>
    </div>
</div>
<div class="row mt10">
    <div class="lay-740 fl">
    
    
    	<div class="app-box">
            <div class="app-box-head clearfix">
            <a href="Soft_listpr.action?softSectionId=${softSection.id }">
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
              	<c:forEach items="${goodSoftList }" var="soft">
              		<li><a href="Soft_softDetail.action?softId=${soft.id }" title="${soft.soname }" target="_blank"><img src="${pageContext.request.contextPath}/${soft.logo }" alt="${soft.soname }"><span>${soft.soname }</span></a></li>                
              	</c:forEach>
             </ul>
        </div>
                <div class="mark-bh mt10">
                        <h2 class="mark">${softSection.areaName }软件大全</h2>
                        <ul class="list-ord">
                <li><a href="">最新<i class="up"></i></a></li>
                <li><a href="">好评<i class="down"></i></a></li>
                <li><a href="">排行<i class="down"></i></a></li>
            </ul>
        </div>
        
        
        
        <ul class="cur-cat-list">
               
        	<c:forEach items="${softList }" var="soft">
             <li>
                <a href="" class="ico" target="_blank"><img src="${pageContext.request.contextPath}/${soft.logo}" width="48" alt="GeekBench(多平台综合性测试工具)V4.1.0免费版"></a>
                <dl class="soft-con">
                    <dt class="clearfix">
                        <a href="Soft_softDetail.action?softId=${soft.id }" class="name" title="GeekBench(多平台综合性测试工具)V4.1.0免费版" target="_blank">${soft.soname }</a><span class="star-bar"><span class="in" style="width:40%;"></span></span>
                      
                    </dt>
                    <dd class="desc" style="height:5em;width:43em; text-overflow:ellipsis; overflow:hidden;">${soft.description }.${soft.soname }是一个兼容多平台的综合性测试工具，可以支持苹果、视窗、Solaris和Linux等系统，是苹果平台上最常用的测试程序，主要可以考察CPU和内存系统的运算能力.....</dd>
                    <dd class="soft-ext">
                        <span class="size">大小：${soft.size }</span>
                        <span class="date">更新：<fmt:formatDate value="${soft.publishDate }" pattern="yyyy-MM-dd "/> </span>
                        <span class="num">支持语言：${soft.language }</span>
                        <span class="num">
                        		支持系统：${soft.forSystem }
                         </span>
                         
                    </dd>
                </dl>
                <a href="Soft_softDetail.action?softId=${soft.id }" class="btn-dl" target="_blank">下载</a>
            </li>
            </c:forEach>
                        
         </ul>
        
 				<!--底部页码设计     2017.04.13  --> 
 				      
       <div class="pagination alternate">
					<ul class="clearfix">${pageCode }
					</ul>
				</div> 
        



       
                
    </div><!-- /.lay-740 -->
    
    
    
    <div class="lay-240 fr">
        <div class="cats-list-box">
            <ul class="cats-list clearfix">
                                <li><a href="">系统维护</a></li>
                                <li><a href="">硬件测试</a></li>
                                <li><a href="">驱动工具</a></li>
                                <li><a href="">CPU软件</a></li>
                                <li><a href="">键盘鼠标</a></li>
                                <li><a href="">磁盘工具</a></li>
                                <li><a href="">光驱工具</a></li>
                                <li><a href="">桌面主题</a></li>
                                <li><a href="">数据恢复</a></li>
                                <li><a href="">系统评测</a></li>
                                <li><a href="">升级补丁</a></li>
                                <li><a href="">桌面工具</a></li>
                                <li><a href="">卸载清理</a></li>
                                <li><a href="">系统备份</a></li>
                                <li><a href="">系统优化</a></li>
                                <li><a href="">系统增强</a></li>
                                <li><a href="">windows7</a></li>
                                <li><a href="">windows8</a></li>
                                <li><a href="">开关定时</a></li>
                                <li><a href="">U盘工具</a></li>
                                <li><a href="">屏幕保护</a></li>
                            </ul>
        </div>
        <div class="onlytab">
            <div class="sub-title mt10">
                <span class="title h3">下载排行</span>
                <ul class="mod-tab" rel="xtaberTabs">
                    <li rel="xtaberTabItem" class="current">一周最热</li>
                    <li rel="xtaberTabItem">总排行榜</li>
                </ul>
            </div>
            <div class="sub-tab-wrap" rel="xtaberItems">
                <ul class="soft-top-list xtaber-item onlyhover" style="display: block;">
                                     <li class="hover">
    <div class="single">
        <span class="num num1">1</span>
        <a href="" target="_blank">DirectX修复工具3.5(dx修复工具DirectX Repair下载)增强版</a>
        <span class="star-bar"><span class="in" style="width:80%;"></span></span>
    </div>
    <div class="app-img">
        <a href="" class="pic" target="_blank"><img src="soft/sectionDetail_files/thumb_48_48_2014040209154541680.png" width="48" alt="DirectX修复工具3.5(dx修复工具DirectX Repair下载)增强版"></a>
        <a href="" title="DirectX修复工具3.5(dx修复工具DirectX Repair下载)增强版" class="name" target="_blank">DirectX修复工具3.5(dx修复工具DirectX Repair下载)增强版</a>
        <span class="ext">1243148次下载</span>
        <a href="" class="btn" target="_blank">立即下载</a>
    </div>
</li>                                    <li>
    <div class="single">
        <span class="num num2">2</span>
        <a href="" target="_blank">Microsoft Visual C++ 2005 SP1运行库(VC2005运行库下载)官方版</a>
        <span class="star-bar"><span class="in" style="width:60%;"></span></span>
    </div>
    <div class="app-img">
        <a href="" class="pic" target="_blank"><img src="soft/sectionDetail_files/thumb_48_48_352.png" width="48" alt="Microsoft Visual C++ 2005 SP1运行库(VC2005运行库下载)官方版"></a>
        <a href="" title="Microsoft Visual C++ 2005 SP1运行库(VC2005运行库下载)官方版" class="name" target="_blank">Microsoft Visual C++ 2005 SP1运行库(VC2005运行库下载)官方版</a>
        <span class="ext">397269次下载</span>
        <a href="" class="btn" target="_blank">立即下载</a>
    </div>
</li>                                   
 <li>
    <div class="single">
        <span class="num num3">3</span>
        <a href="" target="_blank">CPU-Z 1.78.1(CPU检测软件cpuz中文版下载) 官方中文绿色版</a>
        <span class="star-bar"><span class="in" style="width:80%;"></span></span>
    </div>
    <div class="app-img">
        <a href="" class="pic" target="_blank"><img src="soft/sectionDetail_files/thumb_48_48_2015060108312985976.png" width="48" alt="CPU-Z 1.78.1(CPU检测软件cpuz中文版下载) 官方中文绿色版"></a>
        <a href="" title="CPU-Z 1.78.1(CPU检测软件cpuz中文版下载) 官方中文绿色版" class="name" target="_blank">CPU-Z 1.78.1(CPU检测软件cpuz中文版下载) 官方中文绿色版</a>
        <span class="ext">1566014次下载</span>
        <a href="" class="btn" target="_blank">立即下载</a>
    </div>
</li>                                    <li>
    <div class="single">
        <span class="num num4">4</span>
        <a href="" target="_blank">Ghost(Ghost备份还原工具)12.0.0.8006官方版下载</a>
        <span class="star-bar"><span class="in" style="width:60%;"></span></span>
    </div>
    <div class="app-img">
        <a href="" class="pic" target="_blank"><img src="soft/sectionDetail_files/thumb_48_48_2013031208561653579.png" width="48" alt="Ghost(Ghost备份还原工具)12.0.0.8006官方版下载"></a>
        <a href="" title="Ghost(Ghost备份还原工具)12.0.0.8006官方版下载" class="name" target="_blank">Ghost(Ghost备份还原工具)12.0.0.8006官方版下载</a>
        <span class="ext">78378次下载</span>
        <a href="" class="btn" target="_blank">立即下载</a>
    </div>
</li>                                    <li>
    <div class="single">
        <span class="num num5">5</span>
        <a href="http://www.xiazaiba.com/html/516.html" target="_blank">VMware Workstation(vmware虚拟机下载)9.0.4.1945795官方下载</a>
        <span class="star-bar"><span class="in" style="width:100%;"></span></span>
    </div>
    <div class="app-img">
        <a href="http://www.xiazaiba.com/html/516.html" class="pic" target="_blank"><img src="soft/sectionDetail_files/thumb_48_48_2015052608571168780.png" width="48" alt="VMware Workstation(vmware虚拟机下载)9.0.4.1945795官方下载"></a>
        <a href="http://www.xiazaiba.com/html/516.html" title="VMware Workstation(vmware虚拟机下载)9.0.4.1945795官方下载" class="name" target="_blank">VMware Workstation(vmware虚拟机下载)9.0.4.1945795官方下载</a>
        <span class="ext">455510次下载</span>
        <a href="http://www.xiazaiba.com/html/516.html" class="btn" target="_blank">立即下载</a>
    </div>
</li>                                    <li>
    <div class="single">
        <span class="num num6">6</span>
        <a href="http://www.xiazaiba.com/html/24738.html" target="_blank">万能驱动助理 6.0.2013.1209_WinXP官网版(XP 32位专版)</a>
        <span class="star-bar"><span class="in" style="width:80%;"></span></span>
    </div>
    <div class="app-img">
        <a href="http://www.xiazaiba.com/html/24738.html" class="pic" target="_blank"><img src="soft/sectionDetail_files/thumb_48_48_2013121115312650366.png" width="48" alt="万能驱动助理 6.0.2013.1209_WinXP官网版(XP 32位专版)"></a>
        <a href="http://www.xiazaiba.com/html/24738.html" title="万能驱动助理 6.0.2013.1209_WinXP官网版(XP 32位专版)" class="name" target="_blank">万能驱动助理 6.0.2013.1209_WinXP官网版(XP 32位专版)</a>
        <span class="ext">75018次下载</span>
        <a href="http://www.xiazaiba.com/html/24738.html" class="btn" target="_blank">立即下载</a>
    </div>
</li>                                    <li>
    <div class="single">
        <span class="num num7">7</span>
        <a href="http://www.xiazaiba.com/html/6015.html" target="_blank">硬盘序列号读取器 V1.0绿色版</a>
        <span class="star-bar"><span class="in" style="width:60%;"></span></span>
    </div>
    <div class="app-img">
        <a href="http://www.xiazaiba.com/html/6015.html" class="pic" target="_blank"><img src="soft/sectionDetail_files/thumb_48_48_6015.png" width="48" alt="硬盘序列号读取器 V1.0绿色版"></a>
        <a href="http://www.xiazaiba.com/html/6015.html" title="硬盘序列号读取器 V1.0绿色版" class="name" target="_blank">硬盘序列号读取器 V1.0绿色版</a>
        <span class="ext">55926次下载</span>
        <a href="http://www.xiazaiba.com/html/6015.html" class="btn" target="_blank">立即下载</a>
    </div>
</li>                                   
 <li>
    <div class="single">
        <span class="num num8">8</span>
        <a href="http://www.xiazaiba.com/html/5537.html" target="_blank">Office卸载工具(解决office卸载不了)微软官方版</a>
        <span class="star-bar"><span class="in" style="width:60%;"></span></span>
    </div>
    <div class="app-img">
        <a href="http://www.xiazaiba.com/html/5537.html" class="pic" target="_blank"><img src="soft/sectionDetail_files/thumb_48_48_b72c29649009dac743770805a087b198.gif" width="48" alt="Office卸载工具(解决office卸载不了)微软官方版"></a>
        <a href="http://www.xiazaiba.com/html/5537.html" title="Office卸载工具(解决office卸载不了)微软官方版" class="name" target="_blank">Office卸载工具(解决office卸载不了)微软官方版</a>
        <span class="ext">1265490次下载</span>
        <a href="http://www.xiazaiba.com/html/5537.html" class="btn" target="_blank">立即下载</a>
    </div>
</li>                                     
</ul>



  <ul class="soft-top-list xtaber-item onlyhover" style="display: none;">
                                     <li class="hover">
    <div class="single">
        <span class="num num1">1</span>
        <a href="http://www.xiazaiba.com/html/158.html" target="_blank">HD Tune Pro(硬盘检测工具下载)V5.60官方正式版</a>
        <span class="star-bar"><span class="in" style="width:80%;"></span></span>
    </div>
    <div class="app-img">
        <a href="http://www.xiazaiba.com/html/158.html" class="pic" target="_blank"><img src="soft/sectionDetail_files/thumb_48_48_2015052108450921814.png" width="48" alt="HD Tune Pro(硬盘检测工具下载)V5.60官方正式版"></a>
        <a href="http://www.xiazaiba.com/html/158.html" title="HD Tune Pro(硬盘检测工具下载)V5.60官方正式版" class="name" target="_blank">HD Tune Pro(硬盘检测工具下载)V5.60官方正式版</a>
        <span class="ext">3613521次下载</span>
        <a href="http://www.xiazaiba.com/html/158.html" class="btn" target="_blank">立即下载</a>
    </div>
</li>                                    <li>
    <div class="single">
        <span class="num num2">2</span>
        <a href="http://www.xiazaiba.com/html/120.html" target="_blank">Windows XP SP3截至2014年5月更新补丁汇总(WinXP补丁包)</a>
        <span class="star-bar"><span class="in" style="width:100%;"></span></span>
    </div>
    <div class="app-img">
        <a href="http://www.xiazaiba.com/html/120.html" class="pic" target="_blank"><img src="soft/sectionDetail_files/thumb_48_48_120.png" width="48" alt="Windows XP SP3截至2014年5月更新补丁汇总(WinXP补丁包)"></a>
        <a href="http://www.xiazaiba.com/html/120.html" title="Windows XP SP3截至2014年5月更新补丁汇总(WinXP补丁包)" class="name" target="_blank">Windows XP SP3截至2014年5月更新补丁汇总(WinXP补丁包)</a>
        <span class="ext">2238824次下载</span>
        <a href="http://www.xiazaiba.com/html/120.html" class="btn" target="_blank">立即下载</a>
    </div>
</li>

 <li>
    <div class="single">
        <span class="num num3">3</span>
        <a href="http://www.xiazaiba.com/html/1305.html" target="_blank">DiskGenius(硬盘分区软件下载) V4.9.2.371简体中文免费版</a>
        <span class="star-bar"><span class="in" style="width:60%;"></span></span>
    </div>
    <div class="app-img">
        <a href="http://www.xiazaiba.com/html/1305.html" class="pic" target="_blank"><img src="soft/sectionDetail_files/thumb_48_48_2015050510075132209.png" width="48" alt="DiskGenius(硬盘分区软件下载) V4.9.2.371简体中文免费版"></a>
        <a href="http://www.xiazaiba.com/html/1305.html" title="DiskGenius(硬盘分区软件下载) V4.9.2.371简体中文免费版" class="name" target="_blank">DiskGenius(硬盘分区软件下载) V4.9.2.371简体中文免费版</a>
        <span class="ext">2051554次下载</span>
        <a href="http://www.xiazaiba.com/html/1305.html" class="btn" target="_blank">立即下载</a>
    </div>
</li>




 <li>
    <div class="single">
        <span class="num num4">4</span>
        <a href="" target="_blank">CCleaner中文版(系统垃圾清理工具)V5.22.5724绿色中文版</a>
        <span class="star-bar"><span class="in" style="width:80%;"></span></span>
    </div>
    <div class="app-img">
        <a href="" class="pic" target="_blank"><img src="soft/sectionDetail_files/thumb_48_48_2015052708381564145.png" width="48" alt="CCleaner中文版(系统垃圾清理工具)V5.22.5724绿色中文版"></a>
        <a href="" title="CCleaner中文版(系统垃圾清理工具)V5.22.5724绿色中文版" class="name" target="_blank">CCleaner中文版(系统垃圾清理工具)V5.22.5724绿色中文版</a>
        <span class="ext">1769693次下载</span>
        <a href="" class="btn" target="_blank">立即下载</a>
    </div>
</li>                                    <li>
    <div class="single">
        <span class="num num5">5</span>
        <a href="" target="_blank">CPU-Z 1.78.1(CPU检测软件cpuz中文版下载) 官方中文绿色版</a>
        <span class="star-bar"><span class="in" style="width:80%;"></span></span>
    </div>
    <div class="app-img">
        <a href="" class="pic" target="_blank"><img src="soft/sectionDetail_files/thumb_48_48_2015060108312985976.png" width="48" alt="CPU-Z 1.78.1(CPU检测软件cpuz中文版下载) 官方中文绿色版"></a>
        <a href="" title="CPU-Z 1.78.1(CPU检测软件cpuz中文版下载) 官方中文绿色版" class="name" target="_blank">CPU-Z 1.78.1(CPU检测软件cpuz中文版下载) 官方中文绿色版</a>
        <span class="ext">1566014次下载</span>
        <a href="" class="btn" target="_blank">立即下载</a>
    </div>
</li>                                    <li>
    <div class="single">
        <span class="num num6">6</span>
        <a href="" target="_blank">驱动人生Win8预览版(驱动人生2013官网下载) V1.0.0.2官方版</a>
        <span class="star-bar"><span class="in" style="width:60%;"></span></span>
    </div>
    <div class="app-img">
        <a href="" class="pic" target="_blank"><img src="soft/sectionDetail_files/thumb_48_48_2013032113352664275.png" width="48" alt="驱动人生Win8预览版(驱动人生2013官网下载) V1.0.0.2官方版"></a>
        <a href="" title="驱动人生Win8预览版(驱动人生2013官网下载) V1.0.0.2官方版" class="name" target="_blank">驱动人生Win8预览版(驱动人生2013官网下载) V1.0.0.2官方版</a>
        <span class="ext">1468131次下载</span>
        <a href="" class="btn" target="_blank">立即下载</a>
    </div>
</li>                                    <li>
    <div class="single">
        <span class="num num7">7</span>
        <a href="" target="_blank">Windows一键还原2012(一键ghost)2.0.1.23正式版</a>
        <span class="star-bar"><span class="in" style="width:100%;"></span></span>
    </div>
    <div class="app-img">
        <a href="" class="pic" target="_blank"><img src="soft/sectionDetail_files/thumb_48_48_2014060609155065913.png" width="48" alt="Windows一键还原2012(一键ghost)2.0.1.23正式版"></a>
        <a href="" title="Windows一键还原2012(一键ghost)2.0.1.23正式版" class="name" target="_blank">Windows一键还原2012(一键ghost)2.0.1.23正式版</a>
        <span class="ext">1371758次下载</span>
        <a href="" class="btn" target="_blank">立即下载</a>
    </div>
</li>                                   
 <li>
    <div class="single">
        <span class="num num8">8</span>
        <a href="" target="_blank">Office卸载工具(解决office卸载不了)微软官方版</a>
        <span class="star-bar"><span class="in" style="width:60%;"></span></span>
    </div>
    <div class="app-img">
        <a href="" class="pic" target="_blank"><img src="soft/sectionDetail_files/thumb_48_48_b72c29649009dac743770805a087b198.gif" width="48" alt="Office卸载工具(解决office卸载不了)微软官方版"></a>
        <a href="" title="Office卸载工具(解决office卸载不了)微软官方版" class="name" target="_blank">Office卸载工具(解决office卸载不了)微软官方版</a>
        <span class="ext">1265490次下载</span>
        <a href="" class="btn" target="_blank">立即下载</a>
    </div>
</li>                                   

                                 
</ul>
            </div>
        </div>
        <div class="onlytab site-keys mt10">
    <ul class="mod-tab" rel="xtaberTabs">
        <li rel="xtaberTabItem" class="current">热门软件</li>
        <li rel="xtaberTabItem">热门关键字</li>
    </ul>
<div class="sub-tab-wrap" rel="xtaberItems">
	<ul class="softs-list xtaber-item clearfix" style="display: block;">
 		<c:forEach items="${hotSoftList }" var="soft">
			<li><img src="${pageContext.request.contextPath}/${soft.logo }" alt="${soft.soname }"><a href="Soft_softDetail.action?softId=${soft.id}" target="_blank">${soft.soname }</a></li>
	
 		</c:forEach>
 
  </ul>
        <div class="xtaber-item" style="display: none;">
            <div class="hot-tags-list clearfix">
           		 未加载
            </div>
        </div>
    </div>
</div>       
    </div><!-- /.lay-240 -->
</div>
                     
<script type="text/javascript" src="soft/sectionDetail_files/xzb_haha.js"></script>  
</div>

<script type="text/javascript" src="soft/sectionDetail_files/common.js"></script>
<div style="display:none">
<script type="text/javascript" src="soft/sectionDetail_files/stat.js"></script>

</div>


</body>
</html>