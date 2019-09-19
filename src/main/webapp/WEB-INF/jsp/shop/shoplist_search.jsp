<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>资源分类 - sharehoo.cn</title>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/download_new.css">
<script src="${pageContext.request.contextPath}/shop/js/animateBackground-plugin.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/shop/js/tabSwitch.js" defer></script>
<script src="${pageContext.request.contextPath}/shop/js/html5shiv.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/shop/js/placeholder.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/shop/js/notify.js"></script>
<script language="javascript" type="text/javascript" src="${pageContext.request.contextPath}/shop/js/async_new.js"></script>

<style type="text/css">
	
</style>

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
		 	<script id="toolbar-tpl-scriptId" prod="download" skin="black" src="${pageContext.request.contextPath}/shop/js/html.js" type="text/javascript" domain="http://download.csdn.net"></script>	
		 </c:when>
		 <c:otherwise>
		 	 <%@ include file="./common/login.jsp" %> 
		 </c:otherwise>
	</c:choose>
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
			<a href="help.html" class="help"><i class="fa fa-question-circle"></i>帮助</a>
		</div>
	</div>
</div>
	
    <div class="album_top">
      <div class="album_top_box">
        <dl class="dl_album_t clearfix">
          <dt>
                      <label class="dl_album_btn dl_album_cur "><img src=""></label>
                       <label class="dl_album_btn  "><img src=""></label>
                       <label class="dl_album_btn  "><img src=""></label>
                     </dt>
          <dd>
          
            <div class="dl_album_t_c clearfix dl_album_c_show">
              <div class="dl_album_t_c_l fl"><a href="/album/detail/3843"><img src=""></a></div>
              <div class="dl_album_t_c_r"><a href="/album/detail/3843" 
              target="_blank" class="dl_album_t_title">软考各科最新历年真题详细解析合集</a>
                <p class="dl_album_p">本合集包括了软考网络工程师、网络规划设计师、系统集成项目管理工程师、信息安全工程师等软考科目上、下午最新历年真题详细解析。帮助广大学员熟...</p>
                <div class="dl_album_c_b clearfix">
                  <label><a href="/album/detail/3843" class="album_img"><img src=""></a><a href="#" class="album_name">u011110479</a></label><span class="dl_album_c_b_r"><i class="fa fa-eye"></i><em>4053</em></span>
                </div>
              </div>
            </div>
            <div class="dl_album_t_c clearfix ">
              <div class="dl_album_t_c_l fl"><a href="/album/detail/3840"><img src=""></a></div>
              <div class="dl_album_t_c_r"><a href="/album/detail/3840" 
              target="_blank" class="dl_album_t_title">[资源优选]第二十六期：十五个Docker的优质资源</a>
                <p class="dl_album_p">[资源优选]是由CSDN下载频道运营部发布的精品源码系列专辑，每周一上午11点发布。每周一个专题，收录了CSDN下载频道相关技术领域的热门优质资源。 查看...</p>
                <div class="dl_album_c_b clearfix">
                  <label><a href="/album/detail/3840" class="album_img"><img src=""></a><a href="#" class="album_name">nigelyq</a></label><span class="dl_album_c_b_r"><i class="fa fa-eye"></i><em>8912</em></span>
                </div>
              </div>
            </div>
            <div class="dl_album_t_c clearfix ">
              <div class="dl_album_t_c_l fl"><a href="/album/detail/3825"><img src=""></a></div>
              <div class="dl_album_t_c_r"><a href="/album/detail/3825" 
              target="_blank" class="dl_album_t_title">【2017软考】2017年上半年软考各科目考试真题及答案解析！</a>
                <p class="dl_album_p">2017年上半年软考 信息系统项目管理师（高项），系统集成项目管理工程师（集成），软件设计师，系统分析师，网络工程师（网工），网络规划设计师（...</p>
                <div class="dl_album_c_b clearfix">
                  <label><a href="/album/detail/3825" class="album_img"><img src="${host}/shop/images/2_xiaornshuo.jpg"></a><a href="#" class="album_name">xiaornshuo</a></label><span class="dl_album_c_b_r"><i class="fa fa-eye"></i><em>9538</em></span>
                </div>
              </div>
            </div>
        </dd>
        </dl>
      </div>
    </div>
    <div class="album_wrap">
      <div class="download_new clearfix">
        <div class="download_l fl">
          <div class="dl_wrap">
            <ul class="album_cate_list">
              <li class="clearfix"><span>技术领域：</span>
                <label>
                
                <a href="/album" >全部</a>
                <c:forEach items="${categories }" var="category">
               		<c:choose>
               			<c:when test="${curCategory.id==category.id }">
               				<a href="Shop_category.action?categoryId=${category.id }" target="_blank" class="item_cur">${category.name }</a>
               			</c:when>
               			<c:otherwise>
               				<a href="Shop_category.action?categoryId=${category.id }" target="_blank">${category.name }</a>
               			</c:otherwise>
               		</c:choose>

                </c:forEach>
		                               
               </label>
              </li>            
              <li class="clearfix"><span>排序方式：</span>
                <label>
                <a href="/album/15/1/orderbydatetime">
                                      最新
                </a>                       
                <a href="/album/15/1/orderbyclick" class="item_cur">
               	 最热
               	 </a>
               	 <a href="/album/15/1/orderbyclick">
               	 按浏览量<img src="${pageContext.request.contextPath}/shop/images/logo/arrow_down.png" alt="img">
               	 </a>
               	 <a href="/album/15/1/orderbyclick">
               	 按下载量<img src="${pageContext.request.contextPath}/shop/images/logo/arrow_down.png" alt="img">
               	 </a>
                </label>
              </li>
            </ul>
          </div>
          <!--专辑首页列表-->
          <div class="album_cate_wrap clearfix">
          
              <c:forEach items="${shopList }" var="shop">
              <dl class="album_list_b">
	              <dt>
		              <a href="Shop_view.action?shopId=${shop.id }" target="_blank" class="album_cate_img">
		              	<img src="${pageContext.request.contextPath}/shop/${shop.face}">
		              </a>
		              <span class="album_num">
		              ${shop.sourceNum}	              
		              </span>
	             </dt>
	             <dd>
	              <a href="Shop_view.action?shopId=${shop.id }" target="_blank" class="album_cate_t"><font style="font-size:9pt;">主要业务：${shop.tag }</font></a>
	              	
	              
	              <div class="album_cate_b"><a href="#" class="album_per_img">
		              <img src="${pageContext.request.contextPath}/${shop.user.face}" style="margin-left:9px;">
		              </a>
		              <a href="/user/youngalmond11/album" class="album_per_name"><font style="font-size:9pt;color:gray;">${shop.user.nickName }</font></a>
		              <font style="font-size:9pt;color:gray;">           	
	              		<c:choose>
			              	<c:when test="${shop.douNum<50 }">
			              		<p class="right clearfix"><img alt="等级：1" src="${pageContext.request.contextPath}/shop/images/level/down1.png" width="48px" height="16px">
					              	等级：青铜小菜鸡
								</p>
			              	</c:when>
			              	<c:when test="${shop.douNum>49 && shop.douNum<100 }">
			              		<p class="right clearfix"><img alt="等级：2" src="${pageContext.request.contextPath}/shop/images/level/down2.png" width="48px" height="16px">
					              	等级：白银小胸弟
								</p>		              		
			              	</c:when>
			              	
			              	<c:when test="${shop.douNum>99 && shop.douNum<150 }">
			              		<p class="right clearfix"><img alt="等级：3" src="${pageContext.request.contextPath}/shop/images/level/down3.png" width="48px" height="16px">
					              	等级：黄金小搭档
								</p>
			              	</c:when>
			              	<c:when test="${shop.douNum>149 && shop.douNum<200 }">
			              		<p class="right clearfix"><img alt="等级：4" src="${pageContext.request.contextPath}/shop/images/level/down4.png" width="48px" height="16px">
					              	等级：白金大胸弟
								</p>
			              	</c:when>
			              	<c:when test="${shop.douNum>199 && shop.douNum<300 }">
			              		<p class="right clearfix"><img alt="等级：5" src="${pageContext.request.contextPath}/shop/images/level/down5.png" width="48px" height="16px">
					              	等级：钻石当家
								</p>
			              	</c:when>
			              	<c:when test="${shop.douNum>299 && shop.douNum<400}">
			              		<p class="right clearfix"><img alt="等级：6" src="${pageContext.request.contextPath}/shop/images/level/down6.png" width="48px" height="16px">
					             	等级：超凡大师
								</p>
			              	</c:when>
			              	<c:when test="${shop.douNum>399 }">
			              		<p class="right clearfix"><img alt="等级：7" src="${pageContext.request.contextPath}/shop/images/level/down7.png" width="48px" height="16px">
					              	等级：最强王者
								</p>
			              	</c:when>
			              	<c:otherwise>
			              		<p class="right clearfix"><img alt="等级：0" src="${pageContext.request.contextPath}/shop/images/level/down7.png" width="48px" height="16px">
					             	等级：辣鸡塑料
								</p>		              	
			              	</c:otherwise>
		                 </c:choose>
	              		</font>
	              </div>
	            </dd>
            </dl>
              </c:forEach>      
                  
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
          <!--专辑贡献榜-->
          <div class="dl_wrap">
            <h4 class="dl_common_t"><span>店铺下载榜</span>
              <label class="contri">
			  <span class="contri_btn contri_cur">总榜</span>
			  <span class="contri_btn">年榜</span>
              </label>
            </h4>
            <div class="album_contri">
              <ul class="album_contri_c album_contri_c_show">
                            	<!-- total_contribution -->
                <li class="clearfix">
                  <label><a href="/user/baiyuzhong2012"><img src="http://avatar.csdn.net/C/8/4/2_baiyuzhong2012.jpg" alt="img"></a><a href="/user/baiyuzhong2012" class="contri_name">baiyuzhong2012</a>
                  </label><span><em>下载数：</em><i>45</i></span>
                </li>
                            	<!-- total_contribution -->
                <li class="clearfix">
                  <label><a href="/user/caozhy"><img src="http://avatar.csdn.net/D/C/C/2_caozhy.jpg" alt="img"></a><a href="/user/caozhy" class="contri_name">caozhy</a>
                  </label><span><em>下载数：</em><i>41</i></span>
                </li>
                            	<!-- total_contribution -->
                <li class="clearfix">
                  <label><a href="/user/nigelyq"><img src="http://avatar.csdn.net/E/6/1/2_nigelyq.jpg" alt="img"></a><a href="/user/nigelyq" class="contri_name">nigelyq</a>
                  </label><span><em>下载数：</em><i>35</i></span>
                </li>
                            	<!-- total_contribution -->
                <li class="clearfix">
                  <label><a href="/user/huan0416"><img src="http://avatar.csdn.net/E/E/4/2_huan0416.jpg" alt="img"></a><a href="/user/huan0416" class="contri_name">huan0416</a>
                  </label><span><em>下载数：</em><i>24</i></span>
                </li>
                            	<!-- total_contribution -->
                <li class="clearfix">
                  <label><a href="/user/yixiaof"><img src="http://avatar.csdn.net/4/1/7/2_yixiaof.jpg" alt="img"></a><a href="/user/yixiaof" class="contri_name">yixiaof</a>
                  </label><span><em>专辑数：</em><i>23</i></span>
                </li>
                
              </ul>
              <!-- 年榜  year_contribution-->
              <ul class="album_contri_c">
                              <li class="clearfix">
                  <label><a href="/user/nigelyq"><img src="http://avatar.csdn.net/E/6/1/2_nigelyq.jpg" alt="img"></a><a href="/user/nigelyq" class="contri_name">nigelyq</a>
                  </label><span><em>专辑数：</em><i>35</i></span>
                </li>
                              <li class="clearfix">
                  <label><a href="/user/caozhy"><img src="http://avatar.csdn.net/D/C/C/2_caozhy.jpg" alt="img"></a><a href="/user/caozhy" class="contri_name">caozhy</a>
                  </label><span><em>专辑数：</em><i>20</i></span>
                </li>
                              <li class="clearfix">
                  <label><a href="/user/zhangguo5"><img src="http://avatar.csdn.net/E/3/8/2_zhangguo5.jpg" alt="img"></a><a href="/user/zhangguo5" class="contri_name">zhangguo5</a>
                  </label><span><em>专辑数：</em><i>12</i></span>
                </li>
                              <li class="clearfix">
                  <label><a href="/user/sinat_38936641"><img src="http://avatar.csdn.net/2/6/F/2_sinat_38936641.jpg" alt="img"></a><a href="/user/sinat_38936641" class="contri_name">sinat_38936641</a>
                  </label><span><em>专辑数：</em><i>11</i></span>
                </li>
                              <li class="clearfix">
                  <label><a href="/user/yixiaof"><img src="http://avatar.csdn.net/4/1/7/2_yixiaof.jpg" alt="img"></a><a href="/user/yixiaof" class="contri_name">yixiaof</a>
                  </label><span><em>专辑数：</em><i>8</i></span>
                </li>
               
              </ul>
            </div>
          </div>
           <!--创建专辑-->
          <div class="dl_mar_b"><a href="/addalbum/rule" class="upload_res"><i class="fa fa-plus"></i><span>我要开店</span></a>
          </div>
          <!--热门专辑-->
          <div class="dl_wrap">
            <h4 class="dl_common_t"><span>社区公告</span>
            </h4>
            <div class="dl_notice">
              <ul class="resource_c_list">
                              <li><i class="fa fa-caret-right"></i><a href="/album/detail/967">13个程序员笔试面试宝典</a></li>
                              <li><i class="fa fa-caret-right"></i><a href="/album/detail/1013">阿里巴巴集团技术丛书——淘宝一线团队实践</a></li>
                              <li><i class="fa fa-caret-right"></i><a href="/album/detail/279">程序员表白系列-6套源码分享</a></li>
                              <li><i class="fa fa-caret-right"></i><a href="/album/detail/1111">Head First中文版全系列</a></li>
                              <li><i class="fa fa-caret-right"></i><a href="/album/detail/783">源码超市——带你进入另一重编程境界</a></li>
                            </ul>
            </div>
          </div>
           
          <!--广告-->
          <!-- <div class="dl_mar dl_mar_b"><a href="#"><img src="${host}/shop/images/dl_img.jpg"></a></div> -->
          
		    
        </div>
      </div>
    </div>
<script type="text/javascript" src="${pageContext.request.contextPath}/shop/js/toolbar.js" defer></script>
	<!-- <script data-main="${host}/shop/js/apps/download.config.js" src="${host}/shop/js/libs/require.js"></script> -->
 <%@ include file="./common/footer.jsp" %> 
  </body>
</html>
	


