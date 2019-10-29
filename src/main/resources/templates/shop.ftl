
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>${shop.shop_name }店铺-主页</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="description" content="${shop.shop_name}" />
<meta name="keywords" content="${shop.shop_name}" />
<meta name="is_vip" content= />
<meta name="author" content="sharehoo" />
<meta name="Copyright" content="sharehoo" />
<meta http-equiv="X-UA-Compatible" content="IE=8,9" />
<meta name="renderer" content="webkit|ie-stand" />
<link href="shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />

<link rel="stylesheet" href="shop/css/index.css">

<!-- 页面使用font-awesome矢量字体图标方法引入	2017.08.04	miki -->
<link rel="stylesheet" href="font-awesome-4.4.0/css/font-awesome.min.css">

<!-- 尾部分页 css页码 	2017.08.03 miki-->
<link href="blog/include/css/page.css" rel="stylesheet"/>

<link rel="stylesheet" href="shop/css/bootstrap.css">
<link rel="stylesheet" href="shop/css/common.css">
<link rel="stylesheet" href="shop/css/download_profile.css">
<link rel="stylesheet" href="shop/css/download_new.css">

<script type='text/javascript' src='shop/js/jquery.form.js'></script>
<script src="shop/js/html5shiv.min.js"></script>
<script type="text/javascript" src="shop/js/sharehoo_download_comment.js"></script>
<script type="text/javascript" src="shop/js/placeholder.js"></script>

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


<!--  2017.08.05	防止不法分子利用js源码，得到文件路径下载url，我个人思路是给文件属性里增加一个二次别名，
	且名字要采用md5方式命名，让别人猜不到命名规律，即使知道下载链接也得不到正确的路径  -->
	
<script src="js/jquery-1.11.1.js" type="text/javascript"></script>
<script type="text/javascript">

	function validateLogin(){
		if ('${vistor.nickName}'==null||'${vistor.nickName}'=="") {
			alert("您还未登陆！");
		} else {
			window.location.href="Shop_userCenter.action";
		}	
	}

</script>



</head>
<body>

<ins data-revive-zoneid="149" data-revive-id="8c38e720de1c90a6f6ff52f3f89c4d57"></ins>

	
		 <#if user??>
		 	<script id="toolbar-tpl-scriptId" prod="download" skin="black" src="shop/js/html.js" type="text/javascript" domain="http://sharehoo.cn"></script>	
		 <#else>

		 	 <# include "common/login.ftl" /> 
		 </#if>
 
<div class="news-nav">
	<div class="container clearfix">
		<div class="nav-bar">
			<a href="shop/Shop_home.action">首页</a>
			<a href="shop/Source_search.action" target="_blank">资源分类</a>
			<a class=" " href="shop/Shop_rank.action" target="_blank" class="current">精品铺子</a>
			<a class=" " href="#" target="_blank">热搜模块</a>
			<a href="#" target="_blank">下载排行</a>			
			<a class=" " href="Notice_listpr.action" target="_blank">论坛</a>			
			<a href="SoftSection_listpr.action" target="_blank">虎豆充值</a>
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


	

    <div class="meeting_main">
	  <div class="download_profile clearfix">
        <div class="container clearfix csdn_dl_bread">
          <div class="row">
            <div class="col-md-12"><a href="javascript:void(0);">下载频道</a>&nbsp;&gt;&nbsp;${shop.shop_name }的店铺</div>
          </div>
        </div>
        <div class="main">
          <div class="datas_detail pull-left">
            <ul class="tabs clearfix">
              <li class="cur"><a href="Shop_view.action?shopId=${shop.id }">店内资源</a></li>
              <li ><a href="/user/delphiboy2003/downloads">店铺新品</a></li>
              <li ><a href="/user/delphiboy2003/album">店铺活动</a></li>
            </ul>
            
            
		  <div class="items"> 
		  		   <div class="item uresource">
		    <ul>
			    <#list  sourceList as source>
					<li>
					<div class="card clearfix">
						<div class="img rar1">
						<a href="/detail/iammiky/9879250" target="_blank">
						<img src="shop/images/logo/zip.svg"></a>
						</div>			 
											  
							<div class="content">
								<h3>
									<a target="_blank" href="Source_detail.action?source_id=${source.id }">${source.name }</a>
								</h3>
								<p class="brief" style="display:inline-block;">${source.description }</p>
								<p class="tags clearfix">
									<a target="_blank" href="/tag/bootstrap">${source.tag }</a>
								</p>
								<div class="times">
									<label>下载次数：</label>${source.downNum }						
								</div>
								<div class="date">
									<label>上传时间：</label><fmt:formatDate value="${source.upload_time}" pattern="yyyy-MM-dd HH:mm "/>						</div>
								<div class="score">
									<label>所需积分：</label>${source.douNum }					
								</div>
																 
							</div>
						
						</div>
					</li>
				</#list>
		    	
		   </ul>
		    
		    <div class="pagination alternate">
				<ul class="clearfix">
					${pageCode }
				</ul>
			</div> 
		 <!-- 分页结束 -->
            </div>
          </div>
       </div>
          
          
          
          <div class="aside pull-right">
            <div class="mod_personal">
              <dl id="personal_wrap" class="personal_wrap">
                <dt><a href="#" target="_blank"><img src="shop/${shop.face}" alt="img" class="head"></a>
                  <!--.vip类是只有一个标签时用-->
                  <!--span.vip VIP-->
                  <!--注：vip_grey 是vip过期时的样式-->
                  <!--span.vip.vip_l.vip_grey VIP-->
                                                                      </dt>
                <dd><a href="#" target="_blank" class="name">${shop.shop_name }</a>
                  <p>
                  <!--span.attention_btn.al_attention 已关注-->
                  
                  	<#if focus??>
                  		<span class="attention_btn al_attention" style="background:#EEF1F3;color:red;">已关注</span>
                  	<#else>
                  		<span class="attention_btn attention" style="background:#AC3839;color:white;"><a href="javascript:void(0)" onclick="javascript:focusShop(${shop.id})" style="color:white;">关注</a></span>
                  	</#if>
                  		                                
                  </p>
                  <p class="personal_b">店铺等级：<img src="shop/images/level/down4.png" alt="等级：4"><span>财富值:&nbsp;<em>${shop.douNum }</em></span></p>
                </dd>
              </dl>
              
            </div>
            
            
            <div class="tags">
              <h3>${shop.shop_name }的tag</h3>          
              <div class="content clearfix">
              	<#list sourceList as source>
                	<a target="_blank" href="/tag/wpf">${source.tag }</a>
              	</#list>	              	
             </div>
            </div>
            
          </div>
        </div>
      </div>
    </div>
    
  <script type="text/javascript">
    

	function focusShop(shopId){
		if ('${vistor.nickName}'==null||'${vistor.nickName}'=="") {
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
 
    </script>
    
    
  
   <div class="album_wrap">
    </div>
    <!--script(type="text/javascript" src="static/js/apps/fontSize.js")-->

</body>
</html>