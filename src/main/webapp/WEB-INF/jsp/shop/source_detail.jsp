<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>${source.name }-sharehoo下载频道-IT帮-资讯传播社区</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="description" content="${source.name }" />
<meta name="keywords" content="${source.name }" />
<meta name="is_vip" content= />
<meta name="author" content="sharehoo" />
<meta name="Copyright" content="sharehoo" />
<meta http-equiv="X-UA-Compatible" content="IE=8,9" />
<meta name="renderer" content="webkit|ie-stand" />
<link href="${pageContext.request.contextPath}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />

<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/index.css">

<!-- 页面使用font-awesome矢量字体图标方法引入	2017.08.04	miki

2018.07.05 miki 优化js加载速度，减少网页加载时间 
优化<script type='text/javascript' src='${pageContext.request.contextPath}/shop/js/jquery.form.js'></script>
-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/font-awesome-4.4.0/css/font-awesome.min.css">

<!-- 尾部分页 css页码 	2017.08.03 miki-->
<link href="${pageContext.request.contextPath }/blog/include/css/page.css" rel="stylesheet"/> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/footer.css"> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/download_new.css">

<!--  2017.08.05	防止不法分子利用js源码，得到文件路径下载url，我个人思路是给文件属性里增加一个二次别名，
	且名字要采用md5方式命名，让别人猜不到命名规律，即使知道下载链接也得不到正确的路径  -->
	
<script src="${pageContext.request.contextPath}/js/jquery-1.11.1.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/shop/js/html5shiv.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/shop/js/placeholder.js"></script>
<script type="text/javascript">
	function validateLogin(){
		if ('${currentUser.nickName}'==null||'${currentUser.nickName}'=="") {
			alert("您还未登陆！");
		} else {
			window.location.href="${host}/shop/center";
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

</head>
<body>

<ins data-revive-zoneid="149" data-revive-id="8c38e720de1c90a6f6ff52f3f89c4d57"></ins>

	<c:choose>
		 <c:when test="${currentUser==null }">
		 	<script id="toolbar-tpl-scriptId" prod="download" skin="black" src="${pageContext.request.contextPath}/shop/js/html.js" type="text/javascript" domain="http://sharehoo.cn"></script>	
		 </c:when>
		 <c:otherwise>
		 	 <%@ include file="./common/login.jsp" %> 
		 </c:otherwise>
	</c:choose>    <script type="text/javascript">
 		 //var protocol = window.location.protocol;
		 // document.write('<script type="text/javascript" src="' +protocol+ '//c.csdnimg.cn/pubfooter/js/repoAddr2.js?v=' + Math.random() + '"></'+'script>');
	</script>
<div class="news-nav">
	<div class="container clearfix">
		<div class="nav-bar">
			<a href="${host}/shop/index.htm">首页</a>
			<a href="${pageContext.request.contextPath}/shop/${host}/shop/source/serach" target="_blank" class="current">资源分类</a>
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
			<a href="/help" class="help"><i class="fa fa-question-circle"></i>帮助</a>
		</div>
	</div>
</div>
<!-- //toolbar nav -->


	 

 
<!--登录弹窗 -->

<script defer type='text/javascript'>
$(function(){
	$(".dredge_vip").click(function(event){
		event.preventDefault();
		var username = csdn.getCookie('UserName');

		var username_status = $("#user_vip_status").val();
		if(username_status != 1){
			if(username == "" || username == null){
				username = csdn.getCookie('UserNick');
				csdn.showLogin(function(){
					window.location.href = "/vip_code";
				});
			}else{
				window.open("/vip_code");
			}
		    return false;
		}		        
	});
});


function openAddDlg(){
	$("#myModalLabel").html("添加大模块");
	$('#dlg').modal('show');
}


function Login(){	
	 if ('${currentUser.nickName}'==null||'${currentUser.nickName}'=="") {
	var curPage=window.location.href;
	window.location.href="${pageContext.request.contextPath}/login?prePage="+curPage;
	 }else{
		  alert("上了还想上嘛？");
	  }
}


</script>

    <div class="meeting_main">
    <input id="user_vip_status" type="hidden" value="0"></input>
    
		<div class="ad_wrap clearfix">
	      <div class="top_ad_box clearfix">
			<div class="top_ad_t">
	        	<!-- 广告位开始 -->
				
				<!-- 广告位结束 -->
			</div>
			<div class="top_ad_b">
		      
				
		      	</div>
	      	</div>
	      	<div class="top_ad_r_box">
	        	<!-- 广告位开始 -->
				
				<!-- 广告位结束 -->
        	</div>
        </div>
		<div class="container clearfix csdn_dl_bread">
			<div class="row">
            	<div class="col-md-12"><a href="/">下载</a>&nbsp;>&nbsp;<a href="/search">店铺检索</a>&nbsp;>&nbsp;<a href="/search/16">${source.shop.shop_name }的小铺子</a>&nbsp;>&nbsp;<a href="/search/16010">${source.tag }</a>&nbsp;>&nbsp;${source.name }</div>
			</div>
		</div>
      <div class="download_new clearfix">
        
        <div class="download_l fl">
          <div class="download_top" id="download_top" data-id="9896715">
            <div class="download_top_wrap clearfix">
              <div class="download_top_t">
                <dl class="download_dl">
                  <dt><img src="${pageContext.request.contextPath}/shop/images/logo/zip.svg" title="pdf文件"></dt>
                  <dd>
                    <h3 title='${source.name }'><span>${source.name }</span>
                                        </h3>
                    <div class="dl_b"><span><fmt:formatDate value="${source.upload_time}" pattern="yyyy-MM-dd"/>上传</span><span>大小：<em>${source.size }</em></span>
                      <label><a href="/tag/Python_3.4.1" class="tag"  target="_blank">${source.tag }</a></label>
                    </div>
                  </dd>
                </dl>
              </div>
              <div class="down_share"><a href="#" class="jiathis_button_tsina"><i class="fa fa-weibo"></i></a><a href="#" class="jiathis_button_weixin"><i class="fa fa-weixin"></i></a>           
              </div>
            </div>
            <div class="download_b"><span>${source.description }</span></div>
            <!--pdf-->
                        <div class="dl_operate clearfix">
              <div class="dl_operate_l fl">
                               <label>
                                <i class="fa fa-star yellow"></i>
                                <i class="fa fa-star yellow"></i>
                                <i class="fa fa-star yellow"></i>
                                <i class="fa fa-star yellow"></i>
                                <i class="fa fa-star yellow"></i>
                                </label><span>综合评分：<em>4.6</em></span><i class="user_grade">（${commentTotal}位用户评分）</i>
              </div>
             <div class="dl_operate_r fr">
               <c:choose>
                  	<c:when test="${collect!=null }">
                  		<a href="javascript:void(0);" id="favorite" class="dl_func favoRed"><i class="fa fa-star" ></i>><span>我已收藏</span></a>
                  		<a href="javascript:void(0);" id="favorite" class="dl_func"><i class="fa fa-star-o"></i><span style="color:silver;">收藏</span><em style="color:silver;">(${collectTotal })</em></a>
                  	</c:when>
                  	<c:otherwise>
                  		<a href="javascript:void(0);" onclick="javascript:collectSource(${source.id})" id="favorite" class="dl_func"><i class="fa fa-star-o"></i><span>收藏</span><em>(${collectTotal })</em></a>
                  	</c:otherwise>
                  		
                  </c:choose>
              <a href="#comment" class="dl_func"><i class="fa fa-commenting-o"></i><span>评论</span><em><i>(${commentTotal})</i></em></a><a href="javascript:;" onclick="jb()" id="download_report" class="dl_func"><i class="fa fa-exclamation-triangle"></i><span>举报</span></a>
             </div>
            </div>
            <div class="dl_download" data-id="9896715">
              <label>所需下载豆：<em>${source.douNum }</em></label>
              <label>下载次数：<em>${source.downNum }</em></label>
              
               <!-- 2017.08.05	当前用户与店铺店主同一人时，免费下载 -->
               
              <c:choose>
             
             <c:when test="${currentUser==null }">
	              <span class="csdn-tracking-statistics o_vip_btn" data-mod="popu_20" >
	              		<a target="_blank" href="javascript:Login()">尚未登录，无法下载</a>
	              </span>
	              <span class="csdn-tracking-statistics o_vip_btn" data-mod="popu_336" >              
	              		<a href="javascript:;" class="dredge_vip" target="_blank">开通vip会员 免积分下载</a>
	              </span>
	              
	               <!-- 2017.08.05	当前用户与店铺店主不同一人，积分足够，扣除积分下载 -->
              </c:when>
             
				
		<c:when test="${currentShop==null }">
              	<span class="csdn-tracking-statistics o_vip_btn" data-mod="popu_20" >
              		<a href="javascript:void(0)">未激活店铺，无法下载</a>            
	              </span>
	              <span class="csdn-tracking-statistics o_vip_btn" data-mod="popu_336" >
	              	<!-- <a href="/vip_code" class="dredge_vip" target="_blank">开通vip会员 免积分下载</a> -->
	              	<a href="${host}/shop/center" target="_blank">激活店铺</a>
	              </span>
              	</c:when>
				
              	<c:when test="${currentShop.id==shop.id }">
              		<span class="csdn-tracking-statistics o_vip_btn" data-mod="popu_20" >
              		<a target="_blank" href="javascript:void(0)" onclick="javascript:check(${source.id})">进入下载页</a>             	
              </span>
              <span class="csdn-tracking-statistics o_vip_btn" data-mod="popu_336" >            	
              		<a href="javascript:;" class="dredge_vip" target="_blank">开通vip会员 免积分下载</a>
              </span>
               <!-- 2017.08.05	当前用户与店铺店主不同一人，积分足够，扣除积分下载 -->
              	</c:when>		
				
              	<c:when test="${currentShop.douNum>=source.douNum }">
              	<span class="csdn-tracking-statistics o_vip_btn" data-mod="popu_20" >
              		<a href="javascript:void(0)" onclick="javascript:check(${source.id})">进入下载</a>            
	              </span>
	              <span class="csdn-tracking-statistics o_vip_btn" data-mod="popu_336" >
	              	<!-- <a href="/vip_code" class="dredge_vip" target="_blank">开通vip会员 免积分下载</a> -->
	              	<a href="javascript:;" class="dredge_vip" target="_blank">开通vip会员 免积分下载</a>
	              </span>
              	</c:when>
              	<c:otherwise>
              		<span class="csdn-tracking-statistics o_vip_btn" data-mod="popu_20" >
              			<a target="_blank" href="javascript:void(0)">下载豆不足</a>
	              </span>
              		
              		<span class="csdn-tracking-statistics o_vip_btn" data-mod="popu_336" >
              			<!-- <a href="/vip_code" class="dredge_vip" target="_blank">开通vip会员 免积分下载</a> -->
              			<a href="javascript:;" class="dredge_vip" target="_blank">充值虎豆</a>
              	</span>
              	</c:otherwise>
              </c:choose>
               <span class="csdn-tracking-statistics o_vip_btn" data-mod="popu_336" >
              			<!-- <a href="/vip_code" class="dredge_vip" target="_blank">开通vip会员 免积分下载</a> -->
              			<a href="javascript:;" class="dredge_vip" target="_blank">关于虎豆</a>
              	</span>                
      
             </div>
          </div>
          
          <!--广告位		图片栏-->
          <div class="mod_similar clearfix">
            <div class="mod_similar_l fl">
            	
				<img src="${pageContext.request.contextPath}/shop/images/homebanner/sourcebanner/wx1.jpg" style="width:315px;">
		
				<!-- 大家在收藏，根据会员收藏资源数进行排序显示 2017.08.10 miki -->
            </div>
            
            <div class="mod_similar_r fr">
              <h4 class="dl_common_t"><span>大家在收藏</span>
                <label class="sim_t_r"></label>
              </h4>
              <ul class="csdn-tracking-statistics similar_list" id="over_download" data-mod="popu_19">
              	<c:forEach items="${collectSources}" var="collect">
                    <li>                          
                     <i class="fa fa-caret-right"></i>
                        <a strategy="SearchAlgorithm" title="Python_Machine_Learning_By_Example" href="${host}/shop/source/${collect.source.id}" target="_blank">${collect.source.name }</a><span>下载数：<em>${collect.source.downNum }</em></span>
                    </li>
               </c:forEach>
                                               
              </ul>
            </div>
          </div>
          <!--新店入驻-->
          <div class="dl_wrap">
            <h4 class="dl_common_t"><span>新店入驻</span>
              <label><a href="#" target="_blank" class="create_album">我要开店</a><em class="giveC">审核通过送虎豆</em></label>
            </h4>
            <ul class="hot_album clearfix" data-mod="popu_52">
            <c:forEach items="${newShopList}" var="shop">
               <li><a href="Shop_view.action?shopId=${shop.id }" target="_blank"><img src="${pageContext.request.contextPath}/shop/${shop.face}"></a><a href="/album/detail/3872" class="hot_album_t">${shop.tag }</a>
                <p class="hot_album_p">创建者：<em>${shop.user.nickName }</em></p>      
              </li>
              </c:forEach>
            </ul>
          </div>
          <!--广告-->
          <div class="ad">
          	<!-- 广告位开始 -->
			

			<!-- 广告位结束 -->
          </div>
          
          
          <!--	2017.08.26	newsBanner数据表推荐	-->
          <div class="dl_wrap">
            <h4 class="dl_common_t"><span class="relate_btn relate_cur">大神推荐</span>
            </h4>

            <ul class="mod_dl_show mod_dl_relate" id="edu_down_reco" data-mod="popu_56" >
            		<c:forEach items="${bannerList }" var="banner">
            			 <li>
                            <a href="${banner.url }" target="_blank" strategy="">
                                <img src="${pageContext.request.contextPath}/${banner.news_img}" title="${banner.news_name }">
                            </a>
                            <a href="${banner.url }" target="_blank" strategy="" class="mod_dl_relate_a">
                                ${banner.news_name }                          
                             </a>
                        </li>
            		</c:forEach>
                       
                        
            </ul>

            <ul class="blog_download mod_dl_relate">
            </ul>

          </div>
          <!--评论-->
        <div id="comment" class="csdn_dl_comment">

	<div class="recommand download_comment" sourceid="9896715">
<script type="text/javascript">

	function check(sourceId){
		swal({
			title: "${source.name}", 
			text: '<table align=center width=100%><tr><td>资源所需虎豆</td><td>当前拥有虎豆</td><td>当前拥有积分</td></tr><tr style="color:red"><td>${source.douNum}</td><td>${currentShop.douNum}</td><td>${currentUser.score}</td></tr></table><br>来自<span style="color:red;">sharehoo社区</span>、<a href="#">温馨提示</a>：<br/><span style="font-size:9pt">资源一经售出，概不退货哦..</span>',   
			imageUrl: "${pageContext.request.contextPath}/shop/images/logo/zip.svg",
			html: true,
			showCancelButton: true,
			closeOnConfirm: false,
			confirmButtonText: "是，割肉也下载",
			confirmButtonColor: "#ec6c62"
			}, function() {
				$.ajax({
					url: "${host}/shop/score/change",
					data: {sourceId:sourceId},
					type: "POST",
				}).done(function(data) {
					if(data.status==200){
						tipOk("虎豆已成功扣除，资源打包中...", function() {
							window.location.href="${host}/shop/source/${source.id}/download?signal=${signal}";
						});
						//swal("操作成功!", "已成功删除数据！", "success");
					}else{
						swal("OMG", data.msg, "error");
					}					
				}).error(function(data) {
					swal("OMG", "下载失败了!", "error");
				});
			});
	}


//关注功能实现，miki 2017.08.10

function focusShop(shopId){
	if ('${currentUser.nickName}'==null||'${currentUser.nickName}'=="") {
		alert("您还未登陆！");
	} else {
		if (confirm("您确定要关注该店铺吗？")) {
			$.post("Operate_focus.action",{shopId:shopId},
			function(result){
    			if(result.success){
    				alert("关注成功，请到店铺收藏中心查看！");
    				location.reload(true);
    			}else{	    				
    				alert("您已经关注过了！");    			            				
    			}
    		},"json");
		}else{
			return;
		}
	}	
}

//收藏功能实现，miki 2017.08.10

function collectSource(sourceId){
	if ('${currentUser.nickName}'==null||'${currentUser.nickName}'=="") {
		alert("您还未登陆！");
	} else {
		if (confirm("您正在收藏该资源，请确认")) {
			$.post("Operate_collect.action",{sourceId:sourceId},
			function(result){
    			if(result.success){
    				alert("收藏成功，请到店铺收藏中心查看！");
    				location.reload(true);
    			}else{	    				
    				alert("您已经收藏过了！");    			            				
    			}
    		},"json");
		}else{
			return;
		}
	}	
}


//底部热门标签关键字搜索  2017.08.26 miki
	
		function find(keyword){			
			if(keyword==""){
				alert("关键字不能为空！");
			}
			else{
				//key=key.replace(/\+/g,"%2B").replace(/\//g,"%2F");
				key =  encodeURIComponent(keyword)
				var url="${host}/shop/source/search?keyword="+encodeURIComponent(key);
				window.location.href=url;
			}
			return false;
		}


function uuid() {  
    var s = [];  
    var hexDigits = "0123456789abcdef";  
    for (var i = 0; i < 36; i++) {  
        s[i] = hexDigits.substr(Math.floor(Math.random() * 0x10), 1);  
    }  
    s[14] = "4";  // bits 12-15 of the time_hi_and_version field to 0010  
    s[19] = hexDigits.substr((s[19] & 0x3) | 0x8, 1);  // bits 6-7 of the clock_seq_hi_and_reserved to 01  
    s[8] = s[13] = s[18] = s[23] = "-";  
   
    var uuid = s.join("");  
    return uuid;  
} 


//2017.08.29 miki 举报功能实现

function jb(){
	if ('${currentUser.nickName}'==null||'${currentUser.nickName}'=="") {
		alert("您还未登陆！");
	} else {
		document.getElementById('rep').style.display = 'block';		//将隐藏的举报框显示出来  2017.08.29 miki
		$("#jb").focus();
	}
}


function checkSource(sourceId){
	if ('${currentUser.nickName}'==null||'${currentUser.nickName}'=="") {
		alert("您还未登陆！");
	} else {
		var reason=$("#rname").val();
		if (confirm("您正在提交举报材料，请确认")) {
			if (reason==1) {
				alert("类型不能为空！");
				return false;
			}
			$.post("Operate_report.action?sourceId="+sourceId, $("#form").serialize(),
			function(result){
    			if(result.success){
    				alert("举报成功，请静候结果！");
    				location.reload(true);
    			}else{	    				
    				alert("举报失败！");    			            				
    			}
    		},"json");
		}else{
			return;
		}
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
		<div class="common_li clearfix">
			<h3 class="tit">评论<span>共有${commentTotal}条</span></h3>
			<c:forEach items="${commentList }" var="comment">
				<div class="conLi clearfix" id="p_">
			    	<div class="left_img"><a href="#" target="_blank"><img src="${pageContext.request.contextPath}/${comment.user.face}" title="${comment.user.nickName }" alt="${comment.user.nickName }"></a></div>
			        <dl class="rightLi">
			        	<dt class="top"><a href="/user/jarojar" target="_blank" class="name">${comment.user.nickName }</a><span class="time"><fmt:formatDate value="${comment.publishTime}" pattern="yyyy-MM-dd HH:mm:ss "/></span>
			            	<ul class="comment_stars">
			                	
			                	<c:choose>
				                	<c:when test="${comment.sacrify_score<2 }">
				                		<li>
				                		<i class="fa fa-star yellow"></i>
					                	 <i class="fa fa-star"></i>
					                	 <i class="fa fa-star "></i>
					                	  <i class="fa fa-star "></i>
					                	  <i class="fa fa-star "></i>
					                	  </li>
				                	</c:when>
				                	
				                	<c:when test="${comment.sacrify_score<3 && comment.sacrify_score>1 }">
				                	<li>
				                		<i class="fa fa-star yellow"></i>
					                	 <i class="fa fa-star yellow"></i>
					                	 <i class="fa fa-star "></i>
					                	  <i class="fa fa-star "></i>
					                	  <i class="fa fa-star "></i>
					                	  </li>
				                	</c:when>
				                	
				                	<c:when test="${comment.sacrify_score<4 && comment.sacrify_score>2 }">
				                	<li>
				                		<i class="fa fa-star yellow"></i>
					                	 <i class="fa fa-star yellow"></i>
					                	 <i class="fa fa-star yellow"></i>
					                	  <i class="fa fa-star "></i>
					                	  <i class="fa fa-star "></i>
					                	  </li>
				                	</c:when>
				                	<c:when test="${comment.sacrify_score>3 && comment.sacrify_score<5 }">
				                	<li>
				                		<i class="fa fa-star yellow"></i>
					                	 <i class="fa fa-star yellow"></i>
					                	 <i class="fa fa-star yellow"></i>
					                	  <i class="fa fa-star yellow"></i>
					                	  <i class="fa fa-star "></i>
					                	  </li>
				                	</c:when>
				                	<c:otherwise>
				                	<li>
				                		<i class="fa fa-star yellow"></i>
					                	 <i class="fa fa-star yellow"></i>
					                	 <i class="fa fa-star yellow"></i>
					                	  <i class="fa fa-star yellow"></i>
					                	  <i class="fa fa-star yellow"></i>
					                	  </li>
				                	</c:otherwise>
				                </c:choose> 	 
			                 </ul>
			                 <!--2017.3.3 modified-->
			            <div class="respond"></div>
						</dt>
						<dd class="detal">${comment.content }</dd>
							<!--2017.3.3 modified 这里是回复框-->
			            <dd class="respond_box">
			                
			            </dd>
							<!--2017.3.3 modified 这里是回复列表-->
						</dl>
				</div>
			</c:forEach>	
			
		<!-- 分页 nav -->
	<div class="pagination alternate">
					<ul class="clearfix">
						${pageCode }
					</ul>
				</div> 
		</div>
				
            		</div>

            <!-- recommand submit -->
<div class="cannot_comment">
	<h4 class="com_t">评论资源</h4>
	<div class="cannot_com_c">
		<p class="cannot_com_t"><i class="fa fa-exclamation-circle"></i><span>您不能发表评论，可能是以下原因：</span></p>
		<p class="cannot_com_b"><em><a href="http://sharehoo.cn/login">登录</a>后才能评论</em></p>
		<a href="javascript:void(0)" onclick="javascript:validateLogin()" target="_blank">待评论资源</a>
	</div>
</div>
	
<div style="    padding: 20px;">
	<div class="cannot_com_c">	
		 <dl class="cant cc_comment_msg" style="display: none;">
			<dt>&nbsp;</dt>
			<dd></dd>
		</dl>
	</div> 
</div>
          </div>

        </div>
        <div class="download_r fr">
          <div class="mod_personal">
            <dl class="personal_wrap" id="personal_wrap">
              <dt><a href="/user/szstudy"><img src="${pageContext.request.contextPath}/shop/${shop.face}" alt="img" class="head"></a></dt>
              <dd><a href="/user/szstudy" target="_blank" class="name">${shop.shop_name }</a>
                <p>                
                <c:choose>
                  	<c:when test="${focus!=null }">
                  		<span class="attention_btn al_attention" style="background:#EEF1F3;color:red;">已关注</span>
                  	</c:when>
                  	<c:otherwise>
                  		<span class="attention_btn attention" style="background:#AC3839;color:white;"><a href="javascript:void(0)" onclick="javascript:focusShop(${shop.id})" style="color:white;">关注</a></span>
                  	</c:otherwise>
                  		
                  </c:choose>
               </p>
                <p class="personal_b"><img alt="等级：3" src="${pageContext.request.contextPath}/shop/images/level/down3.png"><span>财富值&nbsp;<em>${shop.douNum }</em></span></p>
              </dd>
            </dl>
            <div class="resource">
              <div class="resource_t"><span class="resource_btn resource_cur">店铺其他资源</span><span class="resource_btn">店铺专辑</span></div>
              <div class="resource_c_wrap">
                <div class="resource_c resource_c_show">
                  <ul class="resource_c_list">
                  						<c:forEach items="${ohterSources }" var="source">
                  							<li><i class="fa fa-caret-right"></i><a href="${host}/shop/source/${source.id }" target="_blank">${source.name }</a></li>
                  						</c:forEach>
										
					                  </ul>
                  <div class="check_all"><a href="Shop_view.action?shopId=${source.shop.id }" target="_blank" class="check_all_btn">查看店铺更多资源</a>
                  </div>
                </div>
                <div class="resource_c">
                  <ul class="resource_c_list">
                                    </ul>
                  <div class="check_all"><a href="/user/szstudy/album" class="check_all_btn" target="_blank">查看全部0个资源</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="dl_mar"><a href="/upload" class="upload_res"><i class="fa fa-upload"></i><span>上传资源</span></a>
          </div>
          <!--广告-->
          <div class="dl_mar dl_mar_b">
          	<!-- 广告位开始 -->
			<!-- 广告位结束 -->
          </div>
          <!--开发技术热门标签-->
          <div class="dl_wrap">
            <h4 class="dl_common_t"><span>开发技术热门标签</span>
            </h4>
            <div class="develop_c">
            		<a href="javascript:void(0);" onclick="javascript:find('python')" title="python" class="tag">python</a>
			<a href="javascript:void(0);" onclick="javascript:find('django')" title="django" class="tag">django</a>
			<a href="javascript:void(0);" onclick="javascript:find('pdf')" title="pdf" class="tag">pdf</a>
			<a href="javascript:void(0);" onclick="javascript:find('tensorflow')" title="tensorflow" class="tag">tensorflow</a>
			<a href="javascript:void(0);" onclick="javascript:find('机器学习')" title="机器学习" class="tag">机器学习</a>
			<a href="javascript:void(0);" onclick="javascript:find('爬虫')" title="爬虫" class="tag">爬虫</a>
			<a href="javascript:void(0);" onclick="javascript:find('python3')" title="python3" class="tag">python3</a>
			<a href="javascript:void(0);" onclick="javascript:find('编程')" title="编程" class="tag">编程</a>
			<a href="javascript:void(0);" onclick="javascript:find('numpy')" title="numpy" class="tag">numpy</a>
			<a href="javascript:void(0);" onclick="javascript:find('opencv')" title="opencv" class="tag">opencv</a>
		</div>
          </div>
          <!--VIP会员动态-->
          <div class="dl_wrap">
            <h4 class="dl_common_t"><span>VIP会员动态</span>
            </h4>
            <div id="vip_dynamic">
			功能暂未开放
	            <ul class="vip_dynamic">
	            </ul>
            </div>
          </div>
          <!--广告-->
          <div class="dl_mar dl_mar_b">
          	

			<!-- 广告位结束 -->
          </div>
          <!--下载排行榜-->
          <div class="dl_mar"><a href="/rankings" class="upload_res"><span>下载排行榜</span></a>
		<div class="dl_wrap">
            <h4 class="dl_common_t"><span>下载热度排行</span>
            </h4>
            <div id="vip_dynamic">
		因数据量较少，暂无排名
	            <ul class="vip_dynamic">
			 <li><i class="fa fa-caret-right"></i>因数据量较少，暂无排名</li>
	            </ul>
            </div>
          </div>
          </div>


	<div class="tags" style="display:none;" id="rep">           
             <div class="dl_mar"><a href="/rankings" class="upload_res"><span>举报</span></a>
         	 </div>
               <div class="content clearfix">
                 <form method="post" id="form">
		      		<table>
		      			<tr>
		      				<td>
					      <select id="rname" name="message.name" class="form-control">
			                <option style="font-size:12px" value="1">请选择类型</option>
			                <option style="font-size:12px" value="资源无法下载">资源无法下载</option>
			                <option style="font-size:12px" value="资源无法使用">资源无法使用</option>
			                <option style="font-size:12px" value="标题与实际内容不符">标题与实际内容不符</option>
			                <option style="font-size:12px" value="含有危害国家安全内容">含有危害国家安全内容</option>
			                <option style="font-size:12px" value="含有反动色情等内容">含有反动色情等内容</option>
			                <option style="font-size:12px" value="含广告内容">含广告内容</option>
			                <option style="font-size:12px" value="版权问题，盗用别人店铺的资源">版权问题，盗用别人店铺的资源</option>
			                <option style="font-size:12px" value="其他">其他</option>
			              </select>
              </td>
		      			</tr>
		      			<tr>
			    			<td><textarea id="jb" name="message.content" style ="height:200px; width:268px;bg-color:gray;" placeholder="详细说明"></textarea></td>
		    			</tr>
		    			
		    			
		    			<input type="hidden" name="message.source.id" value="${source.id }"/>
		    			<input type="hidden" name="message.user.id" value="${currentUser.id }"/>
		    			<input type="hidden" name="message.shop.id" value="${shop.id }"/>
		      		</table>
     		 </form>
               <button  style="width: 60px;height: 30px;font-size: larger;background:#C52727;color:white;" onclick="checkSource(${source.id})">提交</button>                                         
              </div>
            </div>

          <!--公告-->
          
          <!--广告-->
          <div class="dl_mar dl_mar_b">
          	<!-- 广告位开始 -->
			
		<!-- 广告位结束 -->
          </div>
        </div>
      </div>
    </div>
   
   
        <!-- 猜你在找 -->
    <%@ include file="./common/footer.jsp" %>  
	<script type="text/javascript" src="${pageContext.request.contextPath}/shop/js/toolbar.js"></script>
    <!--script(type="text/javascript" src="static/js/apps/fontSize.js")-->
	<script language="javascript" type="text/javascript" src="${pageContext.request.contextPath}/shop/js/async_new.js"></script>
	
</body>
</html>