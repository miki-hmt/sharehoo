﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/download_new.css">
 <!-- ask 全局悬浮按钮  -->
 <link href="${pageContext.request.contextPath }/shop/css/ask_float_block.css" rel="stylesheet" type="text/css" />
<!-- 尾部分页 css页码 	2017.08.03 miki-->
<link href="${pageContext.request.contextPath }/blog/include/css/page.css" rel="stylesheet"/>

<!-- 页面使用font-awesome矢量字体图标方法引入	2017.08.04	miki -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/font-awesome-4.4.0/css/font-awesome.min.css">

<script src="${pageContext.request.contextPath}/js/jquery-1.11.1.js" type="text/javascript"></script>
<script type="text/javascript"  src="${host}/shop/js/libs/jquery-version.js" type="text/javascript"></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/shop/js/jquery.form.js'></script>
<script src="${pageContext.request.contextPath}/shop/js/html5shiv.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/shop/js/sharehoo_download_comment.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/shop/js/placeholder.js"></script>

<script type="text/javascript">
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
			swal("您还未登陆！");
		} 
		else{
			window.location.href="${host}/shop/upload.htm";
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
	</c:choose>    <script type="text/javascript">
 		 //var protocol = window.location.protocol;
		 // document.write('<script type="text/javascript" src="' +protocol+ '//c.csdnimg.cn/pubfooter/js/repoAddr2.js?v=' + Math.random() + '"></'+'script>');
	</script>
<div class="news-nav">
	<div class="container clearfix">
		<div class="nav-bar">
			<a href="${host}/shop/index.htm">首页</a>
			<a href="${pageContext.request.contextPath}/shop/source/categories" target="_blank">资源分类</a>
			<a class=" " href="${host}/shop/rank" target="_blank">精品铺子</a>
			<a class=" " href="http://sharehoo.cn/topic/section/4" target="_blank">赏金平台</a>
			<a href="${host}/shop/download/rank" target="_blank">下载排行</a>			
			<a class=" " href="${pageContext.request.contextPath}/" target="_blank">论坛</a>			
			<a href="javascript:void(0)" onclick="javascript:validateBuy()" target="_blank">虎豆充值</a>
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
                
              <c:choose>
			              	<c:when test="${shop.douNum<50 }">
			              		<p class="right clearfix">等级：青铜小菜鸡<img alt="等级：1" src="${pageContext.request.contextPath}/shop/images/level/down1.png" width="48px" height="16px">
					              <span> 
					                  <label>上传权限：</label>
					                  	20MB                  									 
					                   <i title="VIP专享超大附件上传特权" class="fa fa-question-circle">
					                  </i>
								</span>
								</p>
			              	</c:when>
			              	<c:when test="${shop.douNum>49 && shop.douNum<100 }">
			              		<p class="right clearfix">等级：白银小胸弟<img alt="等级：2" src="${pageContext.request.contextPath}/shop/images/level/down2.png" width="48px" height="16px">
					              <span> 
					                  <label>上传权限：</label>
					                  	20MB                  									 
					                   <i title="VIP专享超大附件上传特权" class="fa fa-question-circle">
					                  </i>
								</span>
								</p>		              		
			              	</c:when>
			              	
			              	<c:when test="${shop.douNum>99 && shop.douNum<150 }">
			              		<p class="right clearfix">等级：黄金小搭档<img alt="等级：3" src="${pageContext.request.contextPath}/shop/images/level/down3.png" width="48px" height="16px">
					              <span> 
					                  <label>上传权限：</label>
					                  	20MB                  									 
					                   <i title="VIP专享超大附件上传特权" class="fa fa-question-circle">
					                  </i>
								</span>
								</p>
			              	</c:when>
			              	<c:when test="${shop.douNum>149 && shop.douNum<200 }">
			              		<p class="right clearfix">等级：白金大胸弟<img alt="等级：4" src="${pageContext.request.contextPath}/shop/images/level/down4.png" width="48px" height="16px">
					              <span> 
					                  <label>上传权限：</label>
					                  	20MB                  									 
					                   <i title="VIP专享超大附件上传特权" class="fa fa-question-circle">
					                  </i>
								</span>
								</p>
			              	</c:when>
			              	<c:when test="${shop.douNum>199 && shop.douNum<300 }">
			              		<p class="right clearfix">等级：钻石当家<img alt="等级：5" src="${pageContext.request.contextPath}/shop/images/level/down5.png" width="48px" height="16px">
					              <span> 
					                  <label>上传权限：</label>
					                  	20MB                  									 
					                   <i title="VIP专享超大附件上传特权" class="fa fa-question-circle">
					                  </i>
								</span>
								</p>
			              	</c:when>
			              	<c:when test="${shop.douNum>299 && shop.douNum<400}">
			              		<p class="right clearfix">等级：超凡大师<img alt="等级：6" src="${pageContext.request.contextPath}/shop/images/level/down6.png" width="48px" height="16px">
					              <span> 
					                  <label>上传权限：</label>
					                  	20MB                  									 
					                   <i title="VIP专享超大附件上传特权" class="fa fa-question-circle">
					                  </i>
								</span>
								</p>
			              	</c:when>
			              	<c:when test="${shop.douNum>399 }">
			              		<p class="right clearfix">等级：最强王者<img alt="等级：7" src="${pageContext.request.contextPath}/shop/images/level/down7.png" width="48px" height="16px">
					              <span> 
					                  <label>上传权限：</label>
					                  	20MB                  									 
					                   <i title="VIP专享超大附件上传特权" class="fa fa-question-circle">
					                  </i>
								</span>
								</p>
			              	</c:when>
			              	<c:otherwise>
			              		<p class="right clearfix">等级：辣鸡塑料<img alt="等级：7" src="${pageContext.request.contextPath}/shop/images/level/down7.png" width="48px" height="16px">
					              <span> 
					                  <label>上传权限：</label>
					                  	20MB                  									 
					                   <i title="VIP专享超大附件上传特权" class="fa fa-question-circle">
					                  </i>
								</span>
								</p>		              	
			              	</c:otherwise>
		                 </c:choose>
				                
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
              <li>
              	<a href="javascript:void(0)" onclick="javascript:upload()" target="_blank" class="btn_vipsign">
              		<i class="fa fa-upload"></i><em>.</em>上传店铺资源
              	</a>
              </li>
            </ul>
           </div>
        </div>        
        
        <div class="main">
          <div class="datas_detail pull-left">
            <ul class="tabs clearfix">
              <li class="cur"><a href="${host}/shop/center">店内商品</a></li> 
               <li><a href="${pageContext.request.contextPath}/shop/admin/log">虎豆明细</a></li>     
              <li><a href="${pageContext.request.contextPath}/shop/admin/comment">店铺评价</a></li>
              <li ><a href="${pageContext.request.contextPath}/shop/admin/collect">我的收藏</a></li>
              <li ><a href="${pageContext.request.contextPath}/shop/admin/focus">我的关注</a></li>     
              <li><a href="${pageContext.request.contextPath}/shop/admin/update/go">店铺设置</a></li>
              <li><a href="${pageContext.request.contextPath}/shop/admin/money/go">虎豆提现</a></li>
            </ul>
            <div class="items">
            
                         <!--上传资源页面  -->                                                     
              <div class="item uresource">
              <ul>
              <c:forEach  items="${sourceList }" var="source">
				<li>
				<div class="card clearfix">
					<div class="img rar1">
					<a href="/detail/iammiky/9879250" target="_blank">
					<img src="../shop/images/logo/zip.svg"></a>
					</div>			 
										  
						<div class="content">
							<h3>
								<a target="_blank" href="${host}/shop/source/${source.id }">${source.name }</a>
							</h3>
							<p class="brief" style="display:inline-block;">${source.description }</p>
							<p class="tags clearfix">
																					<a target="_blank" href="/tag/bootstrap">${source.tag }</a>
																				</p>
							<div class="times">
								<label>下载次数：</label>${source.downNum }						</div>
							<div class="date">
								<label>上传时间：</label><fmt:formatDate value="${source.upload_time}" pattern="yyyy-MM-dd HH:mm "/>						</div>
							<div class="score">
								<label>所需积分：</label>${source.douNum }					</div>
															 
						</div>
					
					</div>
				</li>
			</c:forEach>
		 </ul>
            <div class="pagination alternate">
			<ul class="clearfix">
				${pageCode }
			</ul>
		</div> 
             </div>
                         
            </div>
          </div>
          
          <div id="dlMask"></div>
          <div id="delete_reason" class="dl_popup"><i class="fa fa-close pop_close"></i>
          <h3 class="dl_popup_title">删除资源</h3>
          <form id="del_reason_form" name="del_reason_form" action="/index.php/user_console/del_my_source" enctype="multipart/form-data" method="post" >
            <ul class="del_reason_list">
              <li class="del_reason_item">
                <input id="del_reason1" type="radio" name="del_reason" value="资源违规" class="inpt">
                <label>资源违规</label>
                <input id="del_reason2" type="radio" name="del_reason" value="有病毒" class="inpt">
                <label>有病毒</label>
                <input id="del_reason3" type="radio" name="del_reason" value="无法下载" class="inpt">
                <label>无法下载</label>
                <input id="del_reason5" type="radio" name="del_reason" value="资源过时" class="inpt">
                <label>资源过时</label>
                <input id="del_reason4" type="radio" name="del_reason" value="资源更新" class="inpt">
                <label>资源更新</label>
                <input type="hidden" name="id" id="resource_id" value="" />
              </li>
              <li class="del_reason_other">
                <label>其他</label>
                <input type="text" name="delreason" id="delreason">
                <span class="other_tips">注意：删除资源将扣除资源所得相应积分！</span>
              </li>
              
            </ul>
            <div class="del_reason_btn">
              <input type="button" name="submit" value="确定" class="vip_submit" onclick="submit_del_reason();">
              <input type="button" name="cancel" value="取消" class="vip_cancel" onclick="close_delete_reason()">
            </div>
          </form>
          <iframe id="del_reason_form_iframe" name="del_reason_form_iframe" style="display:none;"></iframe>
        </div>
        
         <!--更新资源提示-->
        <div id="update_tips" class="dl_popup"><i class="fa fa-close pop_close"></i>
          <h3 class="dl_popup_title">提示</h3><span class="tips_detail">每个资源最多可更新2次</span><span class="tips_detail">该资源剩余更新次数：<em id="can_upload_count">0</em></span>
          <div class="update_tips_btn">
          	<input type="hidden" name="id" id="source_id" value="" />
            <input type="button" name="button" value="知道了" class="up_ok">
            <input type="button" name="button" value="返回" class="up_back" onclick="close_update()">
          </div>
        </div>
        
        
          <div class="aside pull-right">
            
            
          <div class="btns clearfix">
	            <a href="javascript:void(0)" onclick="javascript:upload()" target="_blank" class="upload"> 
	            	<i class="fa fa-upload">
	            	</i>上传资源
	           </a>
	            <a href="/addalbum/rule" class="create">
	             <i class="fa fa-plus"></i>创建标签</a>
          </div>
            <div class="tags">
              <h3>店铺tag</h3>
              <div class="content clearfix">
                 <a target="_blank" href="/tag/bootstrap">${shop.tag }</a>
                                                        
              </div>
              
            </div>
            
            <div class="btns clearfix" style="margin-top:10px;">
            <a><i class="fa fa-commenting-o"></i>站长私信</a>
             <a href="javascript:void(0)" onclick="javascript:upload()" target="_blank" class="upload">        
	            	<i class="fa fa-commenting-o"></i>警告申诉</a>                     	         
           	</div>
            <div class="tags">
              <h3>最近私信</h3>
              <c:forEach items="${messageList}" var="message">
              <div class="content clearfix">
                 	<font style="font-size:9pt;color:gray;">${message.content }<br><fmt:formatDate value="${message.time }" pattern="yyyy-MM-dd hh:mm:ss"/></font><br>
			<a href="javascript:void(0);" onclick="javascript:reply(1)">申诉</a><a href="javascript:void(0);" onclick="javascript:reply(1)">标为已读</a> 
                                                       
              </div>
              <h3></h3>
              </c:forEach>   
            </div>                 
            <div class="tags">           
              <h3>举报申诉</h3>
               <div class="content clearfix">
                 <form method="post" >
		      		<table>
		      			<tr>
		      				<td><input type="text" name="critique.name" placeholder="店铺名称"/></td>
		      			</tr>
		      			<tr>
			    			<td><textarea name="critique.content" style ="height:200px; width:268px;bg-color:gray;" placeholder="陈述原因"></textarea></td>
		    			</tr>
		    			<tr>
			    			<td><button type="submit" style="width: 60px;height: 30px;font-size: larger;">提交</button></td>
		    			</tr>
		    			
		    			<input type="hidden" name="message.shop.id" value="${message.shop.id }"/>
		    			<input type="hidden" name="critique.article.id" value="${article.id }"/>
		      		</table>
     		 </form>
                                                        
              </div>
            </div>
                   
	</div>      
 	</div>
   </div>
  </div>
    
    <%@ include file="./common/footer.jsp" %> 

    
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
// 	if(confirm("一旦删除将不可恢复，您确定要删除吗？"))
// 	{
// 		$.get("/index.php/user_console/del_my_source/"+ id ,function(ret){
// 			ret = eval('('+ret+')');
// 			if(ret.succ == 0){
// 				alert(ret.msg);
// 			}else{
// 				alert('删除成功');
// 				window.location.reload();
// 			}
// 		});
// 	}	

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
	

/*删除资源框关闭*/
function close_delete_reason(){
		$("#delete_reason").css("display","none");
	}

//返回框关闭
function close_update(){
	$("#update_tips").css("display","none");
}

</script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/shop/js/toolbar.js"></script>
        <!--script(type="text/javascript" src="static/js/apps/fontSize.js")-->
	<script language="javascript" type="text/javascript" src="${pageContext.request.contextPath }/shop/js/async_new.js"></script>
	<!-- <script data-main="${host}/shop/js/apps/download.config.js" src="${host}/shop/js/libs/require.js"></script> -->
 
  </body>
</html>