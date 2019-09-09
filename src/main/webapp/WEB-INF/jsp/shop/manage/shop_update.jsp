<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人店铺--中心</title>

<title>上传资源-我的资源-下载频道-SHAREHOO.CN</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="description" content="上传资源-我的资源-下载频道-sharehoo.cn" />
<meta name="keywords" content="" />
<meta name="author" content="miki" />
<meta name="Copyright" content="miki" />
<meta name="baidu-site-verification" content="5qKL5WPafahaSFtZ" />
<meta http-equiv="X-UA-Compatible" content="IE=8,9" />
<meta name="renderer" content="webkit|ie-stand" />
<link href="${pageContext.request.contextPath}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/index.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/download_new.css">

<!-- 尾部分页 css页码 	2017.08.03 miki-->
<link href="${pageContext.request.contextPath }/blog/include/css/page.css" rel="stylesheet"/>

<!-- 页面使用font-awesome矢量字体图标方法引入	2017.08.04	miki -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/font-awesome-4.4.0/css/font-awesome.min.css">

<script src="${pageContext.request.contextPath}/js/jquery-1.11.1.js" type="text/javascript"></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/shop/js/jquery.form.js'></script>
<script src="${pageContext.request.contextPath}/shop/js/html5shiv.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/shop/js/sharehoo_download_comment.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/shop/js/placeholder.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploadPreview.min.js"></script>
<script type="text/javascript">
	$(function () {
		$("#image").uploadPreview({ Img: "ImgPr", Width: 220, Height: 220 });
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
	function upload(){
		if ('${currentUser.nickName}'==null||'${currentUser.nickName}'=="") {
			alert("您还未登陆！");
		} 
		else{
			window.location.href="${pageContext.request.contextPath}/shop/Shop_upload.action";
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
	
</script>

</head>
<body>
	<c:choose>
		 <c:when test="${currentUser==null }">
		 	<script id="toolbar-tpl-scriptId" prod="download" skin="black" src="${pageContext.request.contextPath}/shop/js/html.js" type="text/javascript" domain="http://sharehoo.cn"></script>	
		 </c:when>
		 <c:otherwise>
		 	 <%@ include file="../common/login.jsp" %> 
		 </c:otherwise>
	</c:choose>    <script type="text/javascript">
 		 //var protocol = window.location.protocol;
		 // document.write('<script type="text/javascript" src="' +protocol+ '//c.csdnimg.cn/pubfooter/js/repoAddr2.js?v=' + Math.random() + '"></'+'script>');
	</script>
<div class="news-nav">
	<div class="container clearfix">
		<div class="nav-bar">
			<a href="${host}/shop/index.html">首页</a>
			<a href="${pageContext.request.contextPath}/shop/Source_search.action" target="_blank">资源分类</a>
			<a class=" " href="${host}/shop/rank" target="_blank">精品铺子</a>
			<a class=" " href="#" target="_blank">赏金平台</a>
			<a href="${host}/shop/download/rank" target="_blank">下载排行</a>			
			<a class=" " href="${pageContext.request.contextPath}/Notice_listpr.action" target="_blank">论坛</a>			
			<a href="${host}/shop/cdk/buy" target="_blank">虎豆充值</a>
			<a href="javascript:void(0)" onclick="javascript:validateLogin()" target="_blank" class="current">我的店铺</a>
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


	
<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/download_profile.css">


 <div class="meeting_main">
      <div class="download_profile clearfix">
      <!-- 公共部分，放入  area_my_info.php   <div class="profile_card">  -->
        <div class="profile_card clearfix">
       <div class="cardl">
       <div class="user_img">
       		<img src="${pageContext.request.contextPath}/shop/${shop.face}" alt="${shop.shop_name }" title="${shop.shop_name }" class="avatar">
       		                                   </div>  
         
           <div class="brief">
              <div class="name"><span>${shop.shop_name }</span></div>    
              <p class="right clearfix">等级：${shop.level.name }<img alt="等级：1" src="${pageContext.request.contextPath}/shop/images/level/down1.png" width="48px" height="16px">
              <span> 
                  <label>上传权限：</label>
                  60MB                  									  <i title="VIP专享超大附件上传特权" class="fa fa-question-circle">
                  </i>
				                </span></p>
            </div>
            <ul class="datas clearfix">
              <li>
                <label>虎豆</label><span>${shop.douNum }</span>
              </li>
              <li>
                <label>积分</label><span>${shop.user.score }</span>
              </li>
                             <li>
                <label>总排名</label><span>第1名</span>
              </li>
              <li>
                <label>资源数</label><span>${shop.sourceNum }</span>
              </li>
              <li>
                <label>下载数</label><span>${shop.downNum }</span>
              </li>  
              <li>
                <label>今日访问量</label>
                <span>
                	${DV }     
                </span>
              </li>
              <li>
                <label>总访问量</label><span>${AV }</span>
              </li>           
            </ul>
          </div>
          
          
          <div class="cardr">
                        <ul class="pull-right non-members">
              <li><a href="/vip_code" class="btn_vipsign">开通vip会员 免积分下载</a></li>
            </ul>
                        </div>
        </div>        
        
        <div class="main">
          <div class="datas_detail pull-left">
            <ul class="tabs clearfix">
              <li><a href="${host}/shop/center">店内商品</a></li> 
              
              <!-- class="cur" 鼠标点击，游标当前所处位置  2017.08.11 miki-->         
              <li><a href="${pageContext.request.contextPath}/shop/admin/log">虎豆明细</a></li>     
              <li><a href="${pageContext.request.contextPath}/shop/manage/ShopManage_comments.action">店铺评价</a></li>
              <li ><a href="${pageContext.request.contextPath}/shop/manage/ShopManage_collects.action">我的收藏</a></li>
              <li ><a href="${pageContext.request.contextPath}/shop/admin/focus">我的关注</a></li>     
              <li class="cur"><a href="${pageContext.request.contextPath}/shop/admin/update/go">店铺设置</a></li>
              <li><a href="${pageContext.request.contextPath}/shop/admin/money/go">虎豆提现</a></li>
            </ul>
            <div class="items">
            
                         <!--上传资源页面  -->                                                     
         <div class="item uresource">
          <form id="regForm" style="width: 500px;border:0px solid red;margin-left:300px;" enctype="multipart/form-data" class="form-horizontal form-inline" method="post" action="ShopManage_save.action?shopId=${shop.id }">
			<div class="control-group" style="margin-top:10px;">
				<label class="control-label" for="nickName">店铺名称(*)：</label>
				<div class="controls">
					<input class="input-block-level" type="text" id="name" name="shop.shop_name" value="${shop.shop_name }"/><span class="pull-left"></span>
					<font id="userErrorInfo" class="pull-right" color="red"></font>
				</div>
			</div>
			
			<div class="control-group" style="margin-top:10px;">
				<label class="control-label" for="tag">店铺标签(*)：</label>
				<div class="controls">
					<input class="text input-block-level" type="text" id="tag"
						name="shop.tag" value="${shop.tag }"/><span class="pull-left"></span>
				</div>
			</div>
			
			<div class="control-group" id="preDiv" style="width: 700px; height: 120px;margin-top:10px;">				
				<img id="ImgPr" class="pull-left" style="width: 120px; height: 120px;" src="${pageContext.request.contextPath}/shop/${shop.face }" />			
			</div>
			<div class="control-group" style="margin-top:10px;">
				<label class="control-label" for="face">更换头像(*)：</label>
				<div class="controls">				
					<input type="file" id="image" name="image">
				</div>
			</div>
			
			<div class="control-group" style="margin-top:10px;">
				<div >
					<button type="submit" tabindex="5" style="background:#E33F3F;color:white;">保存修改</button> &nbsp;&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			<font id="error" color="red"></font>
		</form>
           
             </div>
                         
            </div>
          </div>
                    
          <div class="aside pull-right">
            <div class="btns clearfix"><a href="javascript:void(0)" onclick="javascript:upload()" target="_blank" class="upload"> <i class="fa fa-upload"></i>上传资源</a><a href="/addalbum/rule" class="create"> <i class="fa fa-plus"></i>创建标签</a></div>
            <div class="tags">
              <h3>店铺tag</h3>
              <div class="content clearfix">
                 <a target="_blank" href="/tag/bootstrap">${shop.tag }</a>
                                                        
              </div>
              
            </div>
</div>        </div>
      </div>
    </div>
    
    
<script type="text/javascript">

function cancel_fav(sourcename,id)
{
	if(confirm("您确定要取消对"+sourcename+"的收藏吗？"))
	{
		$.get("/index.php/favorite/cancel_fav/" + id,function(data){
			data = eval('('+data+')');
			alert(data.msg);
			window.location.href = '/my/favs';
		}); 
	}
}

function del_my_src(id)
{
	$("#resource_id").val(id);
	$("#delete_reason").css("display","block");
	/*资源删除原因*/
	$("#del_reason_form input").first().attr("checked","checked");
	$("#delreason").attr("value","");

	$("#delreason").focus(function(){
		$(':input:radio:checked').attr("checked",false);					
		})
	$("#delreason").blur(function(){
			if($("#delreason").val() == ''){
				$("#del_reason_form input").first().attr("checked",true);
			}
	})
}


function edit_my_src(id){
	$.getJSON("/index.php/upload/get_can_update_count?source_id=" + id + "&random="+Math.random(), function(res){
		if (res.status){
			$('#can_upload_count').html(res.count);
			
		}
	});
	//var a = $("#source_id").val(id);
	$('.update_tips_btn .up_ok').attr('data-id', id);
	$("#update_tips").css("display","block");
}

//我知道了
$('.update_tips_btn .up_ok').click(function(){
	var count = $("#can_upload_count").text();
	if(count == 0){
		alert('修改次数超限制！');
		window.location.reload();
	}
	else{
		window.location.href = "/upload/" + $(this).attr('data-id');
	}
	
	
});


//真正点击确认删除
/*删除资源*/
function submit_del_reason(){
	if(confirm("一旦删除将不可恢复，您确定要删除吗？")){
		$('#del_reason_form').ajaxSubmit({
			dataType: 'json',
			success: function(data) {	
				if(data.succ == 0)
					{
					alert(ret.msg);					
					//remove_row(id);
					//window.location.reload();
					}
				else{
					alert('删除成功');
					window.location.reload();
					}
			}
		});
	}
	return false;
}
	
</script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/shop/js/toolbar.js"></script>
      <!-- ask 全局悬浮按钮  -->
   <link href="${pageContext.request.contextPath }/shop/css/ask_float_block.css" rel="stylesheet" type="text/css" />
	<script language="javascript" type="text/javascript" src="${pageContext.request.contextPath }/shop/js/async_new.js"></script>
  </body>
</html>