<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>${source.name }-sharehoo下载</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="Python_3.4.1" />
<meta name="is_vip" content= />
<meta name="author" content="sharehoo" />
<meta name="Copyright" content="sharehoo" />
<meta http-equiv="X-UA-Compatible" content="IE=8,9" />
<meta name="renderer" content="webkit|ie-stand" />
<link href="${pageContext.request.contextPath}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />

<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/index.css">

<!-- 页面使用font-awesome矢量字体图标方法引入	2017.08.04	miki -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/font-awesome-4.4.0/css/font-awesome.min.css">

<!-- 尾部分页 css页码 	2017.08.03 miki-->
<link href="${pageContext.request.contextPath }/blog/include/css/page.css" rel="stylesheet"/>

<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/download_new.css">


<script src="${pageContext.request.contextPath}/js/jquery-1.11.1.js" type="text/javascript"></script>

<script type="text/javascript"  src="${pageContext.request.contextPath}/shop/js/jquery-version.js" type="text/javascript"></script>
<script type='text/javascript' src="${pageContext.request.contextPath}/shop/js/jquery.form.js"></script>
<script src="${pageContext.request.contextPath}/shop/js/html5shiv.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/shop/js/sharehoo_download_comment.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/shop/js/placeholder.js"></script>

<!-- 2017.08.08 miki 评论的评星功能实现，好评五星 -->
<style type="text/css">
	/* star */
	#star {
		position: absolute;
		width: 600px;
		height: 24px;
	}
	
	#star ul,
	#star span {
		float: left;
		display: inline;
		height: 19px;
		line-height: 19px;
	}
	
	#star ul {
		margin: 0 10px;
	}
	
	#star li {
		float: left;
		width: 24px;
		cursor: pointer;
		text-indent: -9999px;
		background: url(${pageContext.request.contextPath}/shop/images/logo/star.png) no-repeat;
	}
	
	#star strong {
		color: #f60;
		padding-left: 10px;
	}
	#star li.on {
		background-position: 0 -28px;
	}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/shop/js/more-starts.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/footer.css"/>
	
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

	function Login() {
		if ('${currentUser.nickName}' == null || '${currentUser.nickName}' == "") {
			var curPage = window.location.href;
			window.location.href = "${pageContext.request.contextPath}/login?prePage=" + curPage;
		} else {
			alert("上了还想上嘛？");
		}
	}
	
	//**************** 页面加载完，就开始下载
	$(document).ready(function() {
		swal({   
			title: "天王盖地虎",   
			text: "输入暗号:",   
			type: "input",   
			showCancelButton: true,   
			closeOnConfirm: false,   
			animation: "slide-from-top",   
			inputPlaceholder: "填点东西到这里面吧" 
		}, function(inputValue){   
			if (inputValue === false) return false;      
			if (inputValue === "") {     
				swal.showInputError("请输入!");     
				return false
			}
			tipOk("恭喜你答对了，资源下载中...", function() {
				swal.close();
				window.location.href="${host}/shop/source/download?source_id="+${source.id};			
			});		
		});	
	});
</script>



</head>
<body>
<% String sign=(String)session.getAttribute("signal");
	if(sign==null || sign.equals("")){
		response.sendRedirect("3bug.jsp");
	}
%>

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
			<a href="${pageContext.request.contextPath}/shop/source/serach" target="_blank" class="current">资源分类</a>
			<a class=" " href="${host}/shop/rank" target="_blank">精品铺子</a>
			<a class=" " href="http://sharehoo.cn/topic/section/4" target="_blank">赏金平台</a>
			<a href="${host}/shop/download/rank" target="_blank">下载排行</a>			
			<a class=" " href="${pageContext.request.contextPath}/" target="_blank">论坛</a>			
			<a href="javascript:void(0)" onclick="javascript:validateBuy()" target="_blank">虎豆充值</a>
			<a href="javascript:void(0)" onclick="javascript:validateLogin()" target="_blank">我的店铺</a>
			                
		</div>
		<div class="search-download">
			<form action="http://download.csdn.net/search" method="get" onsubmit="return check_up(this);" name="download_search">
				<input type="text" placeholder="搜索资源" value="" id="tagff" name="keywords"/>
				<a href="javascript:check_up(download_search);void(0);" class="download-search-bth"></a>
			</form>
			<a href="/help" class="help"><i class="fa fa-question-circle"></i>帮助</a>
		</div>
	</div>
</div>
<!-- //toolbar nav -->
	
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
                <script type="text/javascript" src="http://v3.jiathis.com/code/jia.js" charset="utf-8"></script>
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
                                <i class="fa fa-star"></i>
                                </label><span>综合评分：<em>4.6</em></span><i class="user_grade">（${commentTotal}位用户评分）</i>
              </div>
              <div class="dl_operate_r fr">
	              <c:choose>
	                  	<c:when test="${collect!=null }">
	                  		<a href="javascript:void(0);" id="favorite" class="dl_func favoRed"><i class="fa fa-star" ></i><span>我已收藏</span></a>
	                  		<a href="javascript:void(0);" id="favorite" class="dl_func"><i class="fa fa-star-o"></i><span style="color:silver;">收藏</span><em style="color:silver;">(${collectTotal })</em></a>
	                  	</c:when>
	                  	<c:otherwise>
	                  		<a href="javascript:void(0);" onclick="javascript:collectSource(${source.id})" id="favorite" class="dl_func">
	                  			<i class="fa fa-star-o"></i>
	                  			<span id="dl_func_collect">收藏</span>
	                  			<em>(${collectTotal })</em>
	                  		</a>
	                  	</c:otherwise>
	                  		
	                  </c:choose>
	              <a href="#comment" class="dl_func"><i class="fa fa-commenting-o"></i><span>评论</span><em><i>(${commentTotal})</i></em></a>
	              <a href="javascript:;" id="download_report" class="dl_func"><i class="fa fa-exclamation-triangle"></i><span>举报</span></a></div>
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
             
             
              	<c:when test="${currentShop.id==shop.id }">
              		<span class="csdn-tracking-statistics o_vip_btn" data-mod="popu_20" >
              		<a target="_blank" href="${host}/shop/source/download?source_id=${source.id }">免费下载</a>
              </span>
              <span class="csdn-tracking-statistics o_vip_btn" data-mod="popu_336" >            	
              		<a href="javascript:;" class="dredge_vip" target="_blank">开通vip会员 免积分下载</a>
              </span>
               <!-- 2017.08.05	当前用户与店铺店主不同一人，积分足够，扣除积分下载 -->
              	</c:when>
              		
              	<c:otherwise>
              		<span class="csdn-tracking-statistics o_vip_btn" data-mod="popu_20" >
              		<a href="${host}/shop/source/download?source_id=${source.id }">抱走吧</a>
	              </span>
	              <span class="csdn-tracking-statistics o_vip_btn" data-mod="popu_336" >	       
	              	<a href="javascript:;" class="dredge_vip" target="_blank">开通vip会员 免积分下载</a>
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
			<!-- 广告位结束 -->
        </div>
        
        <div class="mod_similar_r fr">
          <h4 class="dl_common_t"><span>大家在收藏</span>
            <label class="sim_t_r"></label>
          </h4>
          <ul class="csdn-tracking-statistics similar_list" id="over_download" data-mod="popu_19">
          	<c:forEach items="${collectSources}" var="collect">
                <li>                          
                 <i class="fa fa-caret-right"></i>
                    <a strategy="SearchAlgorithm" title="Python_Machine_Learning_By_Example" href="${host}/shop/source/${collect.source.id}" target="_blank">${collect.source.name }</a><span>下载豆：<em>${collect.source.douNum }</em></span>
                </li>
           </c:forEach>
                                           
          </ul>
        </div>
      </div>
          
      <!--热门专辑-->
      <div class="dl_wrap">
        <h4 class="dl_common_t"><span>新店入驻</span>
          <label><a href="#" target="_blank" class="create_album">我要开店</a><em class="giveC">审核通过送虎豆</em></label>
        </h4>
        <ul class="hot_album clearfix" data-mod="popu_52">
        <c:forEach items="${newShopList}" var="shop">
           <li><a href="${host}/shop/${shop.id }" target="_blank"><img src="${pageContext.request.contextPath}/shop/${shop.face}"></a><a href="/album/detail/3872" class="hot_album_t">${shop.tag }</a>
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
    <!--课程推荐-->
    <div class="dl_wrap">
      <h4 class="dl_common_t"><span class="relate_btn relate_cur">店铺推荐</span>
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
			//收藏功能实现，miki 2017.08.10
			
				//******** 收藏功能实现，miki 2017.08.10	
				function collectSource(sourceId){
					if ('${currentUser.nickName}'==null||'${currentUser.nickName}'=="") {
						alert("您还未登陆！");
					} else {	
						swal({
							title : "您正在收藏该资源，请确认？",
							text : '<span style="color:red">好的东西用到用不到不知道，收藏起来是必须的..</span>',
							type : "warning",
							html : true,
							showCancelButton : true,
							closeOnConfirm : false,
							confirmButtonText : "是的，我要",
							confirmButtonColor : "#ec6c62"
						}, function() {
							$.post("${host}/shop/collect", {
								sourceId:sourceId
							}, function(result) {
								if (result.status == 200) {
									tipOk("收藏成功!!请到店铺收藏中心查看",function(){
											swal.close();
											$("#favorite").addClass("favoRed");
											$("#dl_func_collect").text("我已收藏");
										});				
									//********** 尽量不刷新页面，减少不必要得请求资源消耗	2019.09.20 miki
									//location.reload(true);
								} else {
									tipError("您已经收藏过了！");
								}
							}, "json");
						});
					}	
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
			</script>
		<div class="common_li clearfix">
			<h3 class="tit">评论<span>共有${commentTotal }条</span></h3>
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
	
	<!-- 发布评论页面-->
		 <div class="cc_comment_form recom_sub">
	        <form id="fm" >
	            <div class="common_form clearfix">
	                <div class="common_bar clearfix">
	                    <ul id="csdn_dl_commentbox" class="comment_stars">
	                        <li class="tit">星级评价：</li>
	                        <input class="star" id="star" name="sacrify_score" value="${comment.sacrify_score }" type="hidden"/>
	                                <li class="stats">                                
		                                <div class="BOX"> 
											<div id="star" class="">
												<ul class="star_UL" sid="0">
													<li><a href="javascript:;">1</a></li>
													<li><a href="javascript:;">2</a></li>
													<li><a href="javascript:;">3</a></li>
													<li><a href="javascript:;">4</a></li>
													<li><a href="javascript:;">5</a></li>
												</ul>
												<span  class="star_result_span">
													<strong></strong>&nbsp;&nbsp;<a></a>
												</span>
											</div>
										</div>
	
	                                </li>
	                            </ul>
	                        </div>
	                        <input id="userId" name="user.id" value="${currentUser.id}" type="hidden">
	                <input id="shopId" name="shop.id" value="${shop.id}" type="hidden">
	                <input id="sourceId" name="source.id" value="${source.id}" type="hidden">
	                <div class="common_tit">评论：<span>一个资源可评论一次</span></div>
	                <textarea class="comment_area" id="content" name="content"></textarea>
	                <div class="common_bot clearfix"><span class="tip" style="color:red;"><i class="fa fa-exclamation-triangle fa-2x" ></i><font id="error" style="color:red;"></font></span>
	                    <button type="button" class="btn btn-sm btn-red" onclick="javascript:postComment()">
	                    	发表评论
	                    </button>
	                </div>
	            </div>
	        </form>
		  </div>                         
     <!-- 2017.08.08 form表单异步提交及验证	 -->               
     <script type="text/javascript">
      
      function postComment(){
      	if ($("#star").val()==null||$("#star").val()=='') {
    		$("#error").html("星级评价不能为空！");
       		 return false;
      	}else if ($("#content").val()==null||$("#content").val()=='') {
      		$("#error").html("评论不能为空！");
      		 return false;
      	}else if ($("#content").val().length<5) {
      		$("#error").html("最少输入五个汉字！");
   			return false;
    	}else if ($("#content").val().length>160) {
    		$("#error").html("最多输入80个汉字！");
    		return false;	
    	}
   		$("#error").html("");
    		
    	var formData = new FormData($("#fm")[0]);
		$.ajax({
			type : "POST",
			url : "${host}/shop/comment/${source.id}",
			data : formData,
			cache : false,
			async : false,
			processData : false, //必须false才会避开jQuery对 formdata 的默认处理
			contentType : false, //必须false才会自动加上正确的Content-Type
			success : function(data) {
				if (data.status == 200) {
					tipOk("评论成功，谢谢参与！",function(){
						location.reload();
					});
				} else {
					tipError("您已经评论过了，不能二次评论！" + data.msg);
				}
			}
		});
       }
        
       $(function () {
           function cache_hit() {
               $("#imgValidcode").attr("src", "/index.php/rest/tools/validcode/comment_validate/1" + Math.random());
           }

           $("#imgValidcode").on("click", function () {
               cache_hit();
           });
       });
    </script>                    
		
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
                  		<span class="attention_btn attention" style="background:#AC3839;color:white;">
                  			<a href="javascript:void(0)" onclick="javascript:focusShop(${shop.id})" style="color:white;">关注</a></span>
                  	</c:otherwise>
                  		
                  </c:choose>
               </p>
                <p class="personal_b"><img alt="等级：3" src="${pageContext.request.contextPath}/shop/images/level/down3.png"><span>财富值：&nbsp;<em>${shop.douNum }</em></span></p>
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
				 
                	<div class="check_all"><a href="${host}/shop/${source.shop.id }" target="_blank" class="check_all_btn">查看全部资源</a></div>
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
          </div>
          <!--公告-->
          <div class="dl_wrap">
            <h4 class="dl_common_t"><span>公告</span></h4>
            <div class="dl_notice">
              <ul class="resource_c_list">
                <li><i class="fa fa-caret-right"></i><a href="#">前端开发重难点</a></li>
                <li><i class="fa fa-caret-right"></i><a href="#">17年软考最新真题及解析</a></li>
                <li><i class="fa fa-caret-right"></i><a href="#">物联网全栈开发专题</a></li>
                <li><i class="fa fa-caret-right"></i><a href="#">二十大技术领域优质资源</a></li>
              </ul>
            </div>
          </div>
          <!--广告-->
          <div class="dl_mar dl_mar_b">
          	<!-- 广告位开始 -->		
			<!-- 广告位结束 -->
          </div>
        </div>
      </div>
    </div>
    <!-- 广告位开始 -->
	<div class="J_adv" data-view="true" data-mod="ad_popu_22" data-mtp="62" data-order="418" data-con="ad_content_2078"></div>
	<%@ include file="./common/footer.jsp" %> 
	<!-- 广告位结束 -->
          
<!-- 猜你在找 -->
<script type="text/javascript" defer>
    
    //******** 关注功能实现，miki 2017.08.10
	function focusShop(shopId){
		if ('${currentUser.nickName}'==null||'${currentUser.nickName}'=="") {
			alert("您还未登陆！");
			} else {	
				swal({
				title : "您确定要关注该店铺吗？",
				text : '<span style="color:red">关注之后，可以实时查看最新商品..</span>',
				type : "warning",
				html : true,
				showCancelButton : true,
				closeOnConfirm : false,
				confirmButtonText : "强行关注，最为致命",
				confirmButtonColor : "#ec6c62"
			}, function() {
				$.post("${host}/shop/focus", {
					shopId:shopId
				}, function(result) {
					if (result.status == 200) {
						tipOk("关注成功!!",function(){
								swal.close();
								$(".attention_btn").removeClass("attention").addClass("al_attention").attr('style','background:#EEF1F3;color:red');
								$(".attention_btn").text("已关注");
							});				
						//********** 尽量不刷新页面，减少不必要得请求资源消耗	2019.09.20 miki
						//location.reload(true);
					} else {
						tipError("您已经关注过了！");
					}
				}, "json");
			});
		}	
	}
    
    function get_find_report(bd,pageno){
		$.get("/index.php/source/get_source_report/"+bd+"/"+pageno,
			function(data){
				if(data.succ > 0){
					var html = '';
					for (var i = 0; i < data.info.length; i++) {
						html += '		<li><i class="fa fa-caret-right"></i>';
						html += '			<a strategy="SearchAlgorithm" title="'+data.info[i].object.title+'" href="' + data.info[i].object.url + '" target="_blank">' + data.info[i].object.title + '</a><span>积分：<em>'+data.info[i].object.sourcescore+'</em></span>';
						html += '		</li>';
			        }
			        var pre = (pageno - 1) < 1 ? data.total_rows : (pageno - 1);
			        var next = (pageno + 1) > data.total_rows ? 1 : (parseInt(pageno) + 1);
					$(".fa-angle-left").attr("data-id",pre);
					$(".fa-angle-right").attr("data-id",next);
					$("#over_download").html(html);
				}							
		},'json');			
	}
    
	var title = $( '.download_dl' ).find( 'h3' ).attr( 'title' );
	var $tags = $( '.dl_b' ).find( 'a.tag' );
	var bd, tags = [];

	$tags.each( function ( i, tag ) {
		tags.push( $( tag ).html() );
	} );
	bd = title + ',' + tags.join( ',' );
	var pageno = 1;		
	$(document).ready(function() {
		
		$(".fa-angle-left").click(function(){
			pageno = $(".fa-angle-left").attr("data-id");
			get_find_report(bd,pageno);
		});
		$(".fa-angle-right").click(function(){
			pageno = $(".fa-angle-right").attr("data-id");
			get_find_report(bd,pageno);
		});
	});		
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/shop/js/toolbar.js"></script>
<script language="javascript" type="text/javascript" src="${pageContext.request.contextPath}/shop/js/async_new.js"></script>
	
</body>
</html>