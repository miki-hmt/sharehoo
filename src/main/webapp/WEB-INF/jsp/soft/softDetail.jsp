<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${soft.soname }下载-IT帮-资讯传播社区</title>
<link rel="stylesheet" href="${host}/bootstrap/css/bootstrap.min.css" />
<link href="${host}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />
<link rel="stylesheet" href="${host}/bootstrap/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="${host}/admin/css/uniform.css" />
<link rel="stylesheet" href="${host}/admin/css/unicorn.main.css" />
<link rel="stylesheet" href="${host}/admin/css/unicorn.grey.css" class="skin-color" />
<link rel="stylesheet" type="text/css" href="${host}/soft/sectionDetail_files/list.css">
<link rel="stylesheet" type="text/css" href="${host}/soft/sectionDetail_files/base.css">
<script type="text/javascript" src="${host}/soft/sectionDetail_files/js"></script>
<script type="text/javascript" src="${host}/soft/sectionDetail_files/jst.js"></script>
<script type="text/javascript" src="${host}/soft/sectionDetail_files/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${host}/soft/sectionDetail_files/browser.js"></script>
<link rel="stylesheet" type="text/css" href="${host}/soft/sectionDetail_files/keyfile.css">
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
<script src="${host}/soft/sectionDetail_files/share.js"></script>
<link rel="stylesheet" href="${host}/soft/sectionDetail_files/share_style0_16.css">
<jsp:include page="../common/top1.jsp"/>
</head>
<style type="text/css" id="27337073000"></style>
<body>
<div class="container">
   
<div class="row mt10">
    <div class="page-position">
        <p>您所在的位置：<a href="http://sharehoo.cn/" class="imp">IT帮-资讯传播社区</a><span class="ext">&#187;</span><a href="SoftSection_list1.action" class="imp">软件下载</a> <span class="ext">&#187;</span><a href="Soft_listpr.action?softSectionId=${softSection.id}" class="imp">${softSection.areaName }</a><span class="ext">&#187;</span> <strong class="c666">${soft.soname }下载</strong></p>
    </div>
</div>
<div class="row mt10">
    <div class="lay-740 fl" style="border:0px solid red;">
     <div class="xz-info fl">
                    <div class="soft-title">
                                        <h1>${soft.soname }</h1>
                   </div>
                    <div class="soft-cnt mt5 clearfix">
                        <div class="soft-pic mt5 fl">
                            <div class="previewimg" rel="http://sharehoo.cn/uploadfiles/preview_img/2014/0822/water_2014082213450664116.jpg"style="width:200px;height:200px;">
                                <img src="${host}/${soft.logo }" style="margin:0px auto;width:200px;height:200px;">                               
                            </div>
                        </div>
                        <div class="soft-txt fr" style="margin-left:10px;">
                            <ul class="clearfix">
                                <li class="item">大小：<span class="imp">${soft.size }</span></li>
                                <li class="item">语言：<span class="imp">${soft.language }</span></li>
                                <li class="item">更新：<span class="imp">${soft.publishDate }</span></li>
                                <li class="item">授权：<span class="imp">免费软件</span></li>
                                <li class="item">支持系统：<span class="imp">${soft.forSystem }</span></li>
                                <li class="item">下载次数：<span class="imp">${soft.count }</span></li>
                                <li class="item star-box">
                                    <span>评分：</span>
                                    <span class="star" rel="3113" id="j_star_bar"><i style="width:100%;"></i></span>
                           		    <span class="orange h3"><i class="h1" id="j_star_score">10</i>分</span>
                                </li>
                                <li class="item">开发商：<a href="http://dl.xunlei.com/" rel="nofollow" target="_blank"><span class="imp">${soft.maker }</span></a></li>                              
                            </ul>
                            <div class="soft-tags clearfix"> 
                                <span class="green">版本：</span><span class="blue">无病毒,官方版</span>
                            </div>
                            <div class="soft-rela mt10 clearfix"> 
                                <div class="rela-item has-list">    		                   
			                             <button style="width:210px;height:70px;background-color:#55C618;position:absolute;">
			                             <a href="${soft.downAdress }" title="下载软件" target="_blank" class="imp">
			                             <span><font style="font-size:16px;color:white;">下载软件</font></span>
			                             </a>
			                             </button>
			                               <div class="rela-sub-list">
			                     				<a href="http://sharehoo.cn/hotsoft/xunlei/" title="迅雷软件大全" target="_blank">迅雷软件大全</a>
			                               	</div>
		        					</div>
                				 </div>
                        	</div>
                        <div class="soft-down-area" style="position:absolute;margin-top:210px;">                         
                            <div class="bdsharebuttonbox bdshare-button-style0-16" data-bd-bind="1491829666907"><a href="http://sharehoo.cn/html/3113.html#" class="bds_more" data-cmd="more"></a><a href="http://sharehoo.cn/html/3113.html#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a><a href="http://sharehoo.cn/html/3113.html#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="http://sharehoo.cn/html/3113.html#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a><a href="http://sharehoo.cn/html/3113.html#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a><a href="http://sharehoo.cn/html/3113.html#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a></div>
                        </div>
                     </div>
                </div>                     
    </div>
    <!-- /.lay-740 -->
  	<div style="margin-top:340px;border:0px solid red;width:740px;height:auto;position:absolute;">
  	软件描述：${soft.description }
  	</div>
   
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
        <a href="" class="pic" target="_blank"><img src="${host}/soft/sectionDetail_files/thumb_48_48_2014040209154541680.png" width="48" alt="DirectX修复工具3.5(dx修复工具DirectX Repair下载)增强版"></a>
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
        <a href="" class="pic" target="_blank"><img src="${host}/soft/sectionDetail_files/thumb_48_48_352.png" width="48" alt="Microsoft Visual C++ 2005 SP1运行库(VC2005运行库下载)官方版"></a>
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
        <a href="" class="pic" target="_blank"><img src="${host}/soft/sectionDetail_files/thumb_48_48_2015060108312985976.png" width="48" alt="CPU-Z 1.78.1(CPU检测软件cpuz中文版下载) 官方中文绿色版"></a>
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
        <a href="" class="pic" target="_blank"><img src="${host}/soft/sectionDetail_files/thumb_48_48_2013031208561653579.png" width="48" alt="Ghost(Ghost备份还原工具)12.0.0.8006官方版下载"></a>
        <a href="" title="Ghost(Ghost备份还原工具)12.0.0.8006官方版下载" class="name" target="_blank">Ghost(Ghost备份还原工具)12.0.0.8006官方版下载</a>
        <span class="ext">78378次下载</span>
        <a href="" class="btn" target="_blank">立即下载</a>
    </div>
</li>                                    <li>
    <div class="single">
        <span class="num num5">5</span>
        <a href="http://sharehoo.cn/html/516.html" target="_blank">VMware Workstation(vmware虚拟机下载)9.0.4.1945795官方下载</a>
        <span class="star-bar"><span class="in" style="width:100%;"></span></span>
    </div>
    <div class="app-img">
        <a href="http://sharehoo.cn/html/516.html" class="pic" target="_blank"><img src="${host}/soft/sectionDetail_files/thumb_48_48_2015052608571168780.png" width="48" alt="VMware Workstation(vmware虚拟机下载)9.0.4.1945795官方下载"></a>
        <a href="http://sharehoo.cn/html/516.html" title="VMware Workstation(vmware虚拟机下载)9.0.4.1945795官方下载" class="name" target="_blank">VMware Workstation(vmware虚拟机下载)9.0.4.1945795官方下载</a>
        <span class="ext">455510次下载</span>
        <a href="http://sharehoo.cn/html/516.html" class="btn" target="_blank">立即下载</a>
    </div>
</li>                                    <li>
    <div class="single">
        <span class="num num6">6</span>
        <a href="http://sharehoo.cn/html/24738.html" target="_blank">万能驱动助理 6.0.2013.1209_WinXP官网版(XP 32位专版)</a>
        <span class="star-bar"><span class="in" style="width:80%;"></span></span>
    </div>
    <div class="app-img">
        <a href="http://sharehoo.cn/html/24738.html" class="pic" target="_blank"><img src="${host}/soft/sectionDetail_files/thumb_48_48_2013121115312650366.png" width="48" alt="万能驱动助理 6.0.2013.1209_WinXP官网版(XP 32位专版)"></a>
        <a href="http://sharehoo.cn/html/24738.html" title="万能驱动助理 6.0.2013.1209_WinXP官网版(XP 32位专版)" class="name" target="_blank">万能驱动助理 6.0.2013.1209_WinXP官网版(XP 32位专版)</a>
        <span class="ext">75018次下载</span>
        <a href="http://sharehoo.cn/html/24738.html" class="btn" target="_blank">立即下载</a>
    </div>
</li>                                    <li>
    <div class="single">
        <span class="num num7">7</span>
        <a href="http://sharehoo.cn/html/6015.html" target="_blank">硬盘序列号读取器 V1.0绿色版</a>
        <span class="star-bar"><span class="in" style="width:60%;"></span></span>
    </div>
    <div class="app-img">
        <a href="http://sharehoo.cn/html/6015.html" class="pic" target="_blank"><img src="${host}/soft/sectionDetail_files/thumb_48_48_6015.png" width="48" alt="硬盘序列号读取器 V1.0绿色版"></a>
        <a href="http://sharehoo.cn/html/6015.html" title="硬盘序列号读取器 V1.0绿色版" class="name" target="_blank">硬盘序列号读取器 V1.0绿色版</a>
        <span class="ext">55926次下载</span>
        <a href="http://sharehoo.cn/html/6015.html" class="btn" target="_blank">立即下载</a>
    </div>
</li>                                   
 <li>
    <div class="single">
        <span class="num num8">8</span>
        <a href="http://sharehoo.cn/html/5537.html" target="_blank">Office卸载工具(解决office卸载不了)微软官方版</a>
        <span class="star-bar"><span class="in" style="width:60%;"></span></span>
    </div>
    <div class="app-img">
        <a href="http://sharehoo.cn/html/5537.html" class="pic" target="_blank"><img src="${host}/soft/sectionDetail_files/thumb_48_48_b72c29649009dac743770805a087b198.gif" width="48" alt="Office卸载工具(解决office卸载不了)微软官方版"></a>
        <a href="http://sharehoo.cn/html/5537.html" title="Office卸载工具(解决office卸载不了)微软官方版" class="name" target="_blank">Office卸载工具(解决office卸载不了)微软官方版</a>
        <span class="ext">1265490次下载</span>
        <a href="http://sharehoo.cn/html/5537.html" class="btn" target="_blank">立即下载</a>
    </div>
</li>                                     
</ul>



  <ul class="soft-top-list xtaber-item onlyhover" style="display: none;">
                                     <li class="hover">
    <div class="single">
        <span class="num num1">1</span>
        <a href="http://sharehoo.cn/html/158.html" target="_blank">HD Tune Pro(硬盘检测工具下载)V5.60官方正式版</a>
        <span class="star-bar"><span class="in" style="width:80%;"></span></span>
    </div>
    <div class="app-img">
        <a href="http://sharehoo.cn/html/158.html" class="pic" target="_blank"><img src="${host}/soft/sectionDetail_files/thumb_48_48_2015052108450921814.png" width="48" alt="HD Tune Pro(硬盘检测工具下载)V5.60官方正式版"></a>
        <a href="http://sharehoo.cn/html/158.html" title="HD Tune Pro(硬盘检测工具下载)V5.60官方正式版" class="name" target="_blank">HD Tune Pro(硬盘检测工具下载)V5.60官方正式版</a>
        <span class="ext">3613521次下载</span>
        <a href="http://sharehoo.cn/html/158.html" class="btn" target="_blank">立即下载</a>
    </div>
</li>                                    <li>
    <div class="single">
        <span class="num num2">2</span>
        <a href="http://sharehoo.cn/html/120.html" target="_blank">Windows XP SP3截至2014年5月更新补丁汇总(WinXP补丁包)</a>
        <span class="star-bar"><span class="in" style="width:100%;"></span></span>
    </div>
    <div class="app-img">
        <a href="http://sharehoo.cn/html/120.html" class="pic" target="_blank"><img src="${host}/soft/sectionDetail_files/thumb_48_48_120.png" width="48" alt="Windows XP SP3截至2014年5月更新补丁汇总(WinXP补丁包)"></a>
        <a href="http://sharehoo.cn/html/120.html" title="Windows XP SP3截至2014年5月更新补丁汇总(WinXP补丁包)" class="name" target="_blank">Windows XP SP3截至2014年5月更新补丁汇总(WinXP补丁包)</a>
        <span class="ext">2238824次下载</span>
        <a href="http://sharehoo.cn/html/120.html" class="btn" target="_blank">立即下载</a>
    </div>
</li>

 <li>
    <div class="single">
        <span class="num num3">3</span>
        <a href="http://sharehoo.cn/html/1305.html" target="_blank">DiskGenius(硬盘分区软件下载) V4.9.2.371简体中文免费版</a>
        <span class="star-bar"><span class="in" style="width:60%;"></span></span>
    </div>
    <div class="app-img">
        <a href="http://sharehoo.cn/html/1305.html" class="pic" target="_blank"><img src="${host}/soft/sectionDetail_files/thumb_48_48_2015050510075132209.png" width="48" alt="DiskGenius(硬盘分区软件下载) V4.9.2.371简体中文免费版"></a>
        <a href="http://sharehoo.cn/html/1305.html" title="DiskGenius(硬盘分区软件下载) V4.9.2.371简体中文免费版" class="name" target="_blank">DiskGenius(硬盘分区软件下载) V4.9.2.371简体中文免费版</a>
        <span class="ext">2051554次下载</span>
        <a href="http://sharehoo.cn/html/1305.html" class="btn" target="_blank">立即下载</a>
    </div>
</li>




 <li>
    <div class="single">
        <span class="num num4">4</span>
        <a href="" target="_blank">CCleaner中文版(系统垃圾清理工具)V5.22.5724绿色中文版</a>
        <span class="star-bar"><span class="in" style="width:80%;"></span></span>
    </div>
    <div class="app-img">
        <a href="" class="pic" target="_blank"><img src="${host}/soft/sectionDetail_files/thumb_48_48_2015052708381564145.png" width="48" alt="CCleaner中文版(系统垃圾清理工具)V5.22.5724绿色中文版"></a>
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
        <a href="" class="pic" target="_blank"><img src="${host}/soft/sectionDetail_files/thumb_48_48_2015060108312985976.png" width="48" alt="CPU-Z 1.78.1(CPU检测软件cpuz中文版下载) 官方中文绿色版"></a>
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
        <a href="" class="pic" target="_blank"><img src="${host}/soft/sectionDetail_files/thumb_48_48_2013032113352664275.png" width="48" alt="驱动人生Win8预览版(驱动人生2013官网下载) V1.0.0.2官方版"></a>
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
        <a href="" class="pic" target="_blank"><img src="${host}/soft/sectionDetail_files/thumb_48_48_2014060609155065913.png" width="48" alt="Windows一键还原2012(一键ghost)2.0.1.23正式版"></a>
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
        <a href="" class="pic" target="_blank"><img src="${host}/soft/sectionDetail_files/thumb_48_48_b72c29649009dac743770805a087b198.gif" width="48" alt="Office卸载工具(解决office卸载不了)微软官方版"></a>
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
	<li><img src="${host}/${soft.logo }" alt="${soft.soname }"><a href="Soft_softDetail.action?softId=${soft.id}" target="_blank">${soft.soname }</a></li>
	
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
                     
<script type="text/javascript" src="${host}/soft/sectionDetail_files/xzb_haha.js"></script>  
</div>

<script type="text/javascript" src="${host}/soft/sectionDetail_files/common.js"></script>
<div style="display:none">
<script type="text/javascript" src="${host}/soft/sectionDetail_files/stat.js"></script>

</div>


</body>
</html>