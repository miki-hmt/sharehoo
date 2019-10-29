<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
   <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>资源下载排行--下载社区-IT帮-资讯传播社区</title>

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
<link href="${pageContext.request.contextPath}/she_files/style2016.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/download_new.css">

	<!--2017.10.15 miki body样式css文件 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/pay-css/style.css">

<!-- 尾部分页 css页码 	2017.08.03 miki-->
<link href="${pageContext.request.contextPath }/blog/include/css/page.css" rel="stylesheet"/>

<!-- 页面使用font-awesome矢量字体图标方法引入	2017.08.04	miki -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/font-awesome-4.4.0/css/font-awesome.min.css">

<!-- 资源排行页面css	2017.12.27	miki -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/source-rank/common_sourceRank.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/source-rank/download.css?/v=201712251730">

<script src="${pageContext.request.contextPath}/js/jquery-1.11.1.js" type="text/javascript"></script>
<script type="text/javascript"  src="${host}/shop/js/libs/jquery-version.js" type="text/javascript"></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/shop/js/jquery.form.js'></script>
<script src="${pageContext.request.contextPath}/shop/js/html5shiv.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/shop/js/sharehoo_download_comment.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/shop/js/placeholder.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/shop/js/pay-js/jquery.select.js"></script>

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
			alert("您还未登陆！");
		} 
		else{
			window.location.href="${host}/shop/upload.htm";
		}
}
	
		
	//2017.08.16 miki 顶部搜索框搜索功能实现
	
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
			//var key=$.trim(htmlencode(thisform.keywords.value));
			var key=document.getElementById("tagff").value;
			if(key=="" || key==null){
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
	
	function exchange(){
		if ('${currentUser.nickName}'==null||'${currentUser.nickName}'=="") {
			alert("您还未登陆！");
		} else {
		 var code= $("#content").val();
		 
		 if(code==""){
			 $("#error2").html("*兑换码不能为空！");
			 $("#content").focus();
		 }else{
			 $("#error2").html("");
		 }
			 $.post("${pageContext.request.contextPath}/shop/cdk/exchange?code="+code,
				 function(result){
				if(result.data==200){
					alert("兑换成功！");
					location.reload(true);
				}else{		
					alert(data.msg);
				}
			},"json");
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
		 	 <%@ include file="./common/login2.jsp" %> 
		 </c:otherwise>
	</c:choose>    
	<script type="text/javascript">
 
	</script>
<div class="news-nav">
	<div class="container clearfix">
		<div class="nav-bar">
			<a href="${host}/shop/index.htm">首页</a>
			<a href="${pageContext.request.contextPath}/shop/${host}/shop/source/serach" target="_blank">资源分类</a>
			<a class=" " href="${host}/shop/rank" target="_blank">精品铺子</a>
			<a class=" " href="http://sharehoo.cn/topic/section/4" target="_blank">赏金平台</a>
			<a href="${host}/shop/download/rank" target="_blank" class="current">下载排行</a>			
			<a class=" " href="${pageContext.request.contextPath}/" target="_blank">论坛</a>			
			<a href="${pageContext.request.contextPath}/shop/cdk/buy" target="_blank">虎豆充值</a>
			<a href="javascript:void(0)" onclick="javascript:validateLogin()" target="_blank">我的店铺</a>
		</div>
		<div class="search-download">
			<form action="http://sharehoo.cn" method="post" onsubmit="return check_up(this);" name="download_search" style="height:26px;;">
				<input type="text" placeholder="搜索资源" value="" id="tagff" name="keywords"/>
				<a href="javascript:check_up(download_search);void(0);" class="download-search-bth"></a>
			</form>
			<a href="/help" class="help"><i class="fa fa-question-circle"></i>帮助</a>
		</div>
	</div>
</div>
<!-- //toolbar nav -->


	
<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/download_profile.css">


 
 <div id="wrap">
			<!-- ranking -->
<div class="ranking_down">
	<div class="ranking">
		<h1>下载资源周排行</h1>
		<dl>
			<dt><span class="top">排名</span><span class="title">资源名称</span><span class="num1">下载次数</span></dt>
			<dd>
				<ul>
					<c:forEach items="${userweeklist }" var="source">
						<li><span class="title"><a title="${source.name }" href="${pageContext.request.contextPath }/shop/source/${source.id}">${source.name }</a></span><span class="num">${source.downNum }</span></li>
					</c:forEach>		
					
				</ul>
			</dd>
		</dl>
	</div>
	<div class="ranking">
		<h1>店铺虎豆周排行</h1>
		<dl>
			<dt><span class="top">排名</span><span class="title">店铺</span><span class="num1">虎豆总数</span></dt>
			<dd>
				<ul>
					<c:forEach items="${shopweekList }" var="shop">
						<li><span class="name"><a title="${shop.shop_name }" href="${host}/shop/${shop.id }" class="user_name">${shop.shop_name }</a></span><span class="num">${shop.douNum }</span></li>
					</c:forEach>
					
			</ul>
			</dd>
		</dl>
	</div>

	<div class="ranking ranking_download">
		<h1><span class="fr"></span>上传资源周排行</h1>
		<dl>
			<dt><span class="top">排名</span><span class="title">店铺</span><span class="num1">上传个数</span></dt>
			<dd>
				<ul>
					<c:forEach items="${uploadrankweekList }" var="source">
						<li><span class="name"><a title="${source.shop.shop_name }" href="${host}/shop/${source.shop.id }" class="user_name">${source.shop.shop_name }</a></span><span class="num">${uploadCount.get(source) }</span></li>
					</c:forEach>
					<li><span class="name"><a title="zzjlhlcd" class="user_name">zzjlhlcd</a></span><span class="num">75</span></li>
					<li><span class="name"><a title="u012590555" class="user_name">泡泡泡你</a></span><span class="num">57</span></li>			
					<li><span class="name"><a title="fhyfhy17" class="user_name">大_冯</a></span><span class="num">36</span></li>
					<li><span class="name"><a title="ylg5132976" class="user_name">叶师傅在线</a></span><span class="num">35</span></li>
			</ul>
			</dd>
		</dl>
	</div>

	<div class="ranking">
		<h1>下载资源月排行</h1>
		<dl>
			<dt><span class="top">排名</span><span class="title">资源名称</span><span class="num1">下载次数</span></dt>
			<dd>
				<ul>
					<c:forEach items="${userMonthList }" var="source">
						<li><span class="title"><a title="${source.name },${source.tag}" href="${pageContext.request.contextPath }/shop/source/${source.id}">${source.name }--${source.tag} </a></span><span class="num">${source.downNum }</span></li>
					</c:forEach>
					
			</ul>
			</dd>
		</dl>
	</div>
	<div class="ranking">
		<h1>店铺虎豆月排行</h1>
		<dl>
			<dt><span class="top">排名</span><span class="title">店铺</span><span class="num1">虎豆总数</span></dt>
			<dd>
				<ul>
					<c:forEach items="${shopmonthList }" var="shop">
						<li><span class="name"><a title="${shop.shop_name }" href="${host}/shop/${shop.id }" class="user_name">${shop.shop_name }</a></span><span class="num">${shop.douNum }</span></li>
					</c:forEach>
					<li title="l1505624"><span class="name"><a href="/user/l1505624" class="user_name">浮舟</a></span><span class="num">3761</span></li>
					<li title="ramissue"><span class="name"><a href="/user/ramissue" class="user_name">ramissue</a></span><span class="num">3102</span></li>
					<li title="u013273643"><span class="name"><a href="/user/u013273643" class="user_name">轩小亮</a></span><span class="num">2816</span></li>
			</ul>
			</dd>
		</dl>
	</div>

	<div class="ranking ranking_download">
		<h1><span class="fr"></span>上传资源月排行</h1>
		<dl>
			<dt><span class="top">排名</span><span class="title">店铺</span><span class="num1">上传个数</span></dt>
			<dd>
				<ul>
					<c:forEach items="${uploadrankweekList }" var="source">
						<li><span class="name"><a title="${source.shop.shop_name }" href="${host}/shop/${source.shop.id }" class="user_name">${source.shop.shop_name }</a></span><span class="num">${uploadCount.get(source) }</span></li>
					</c:forEach>
					<li><span class="name"><a title="towangjindian" class="user_name">王金典</a></span><span class="num">233</span></li>											
					<li><span class="name"><a title="cz_00001" class="user_name">传智播客教育集团</a></span><span class="num">136</span></li>
					<li><span class="name"><a title="qq_25337221" class="user_name">_雨季_</a></span><span class="num">117</span></li>									
					<li><span class="name"><a title="sinat_21729671" class="user_name">三达不遛点看</a></span><span class="num">67</span></li>
			</ul>
			</dd>
		</dl>
	</div>

	<div class="ranking">
		<h1>下载资源年排行</h1>
		<dl>
			<dt><span class="top">排名</span><span class="title">资源名称</span><span class="num1">下载次数</span></dt>
			<dd>
				<ul>
											<li><span class="title"><a title="gradle-3.3-all.zip  绿色版" href="/download/t6546545/9732412">gradle-3.3-all.zip  绿色版</a></span><span class="num">21502</span></li>
											<li><span class="title"><a title="JDK1.8 API 中文 高清完整CHM版" href="/download/qw599186875/9802192">JDK1.8 API 中文 高清完整CHM版</a></span><span class="num">14479</span></li>
											<li><span class="title"><a title="《Tensorflow：实战Google深度学习框架》高清完整PDF版" href="/download/u013003382/9872692">《Tensorflow：实战Google深度学习框架》高清完整PDF版</a></span><span class="num">7963</span></li>
											<li><span class="title"><a title="《精通Spring  4.x 企业应用开发实战》高清完整PDF版 下载" href="/download/xiaoyu5256/9858024">《精通Spring  4.x 企业应用开发实战》高清完整PDF版 下载</a></span><span class="num">6947</span></li>
											<li><span class="title"><a title="《深入浅出MyBatis技术原理与实战》高清完整PDF下载" href="/download/l1505624/9789078">《深入浅出MyBatis技术原理与实战》高清完整PDF下载</a></span><span class="num">6565</span></li>
											<li><span class="title"><a title="《深入理解计算机系统(原书第三版)》高清完整PDF下载" href="/download/l1505624/9783279">《深入理解计算机系统(原书第三版)》高清完整PDF下载</a></span><span class="num">6245</span></li>
											<li><span class="title"><a title="intellij idea 2017版本中文汉化包 绿色版" href="/download/id_rin/9815280">intellij idea 2017版本中文汉化包 绿色版</a></span><span class="num">5673</span></li>
											<li><span class="title"><a title="微信小程序全套源代码（后台、小程序php）" href="/download/wyx100/9734370">微信小程序全套源代码（后台、小程序php）</a></span><span class="num">5413</span></li>
											<li><span class="title"><a title="《终极算法：机器学习和人工智能如何重塑世界》高清完整PDF版" href="/download/kinglear/9735569">《终极算法：机器学习和人工智能如何重塑世界》高清完整PDF版</a></span><span class="num">4968</span></li>
											<li><span class="title"><a title="SecureCRT8.1 keygen 绿色版" href="/download/lsacnvkjahsdgnla/9794035">SecureCRT8.1 keygen 绿色版</a></span><span class="num">4357</span></li>
									</ul>
			</dd>
		</dl>
	</div>
	<div class="ranking">
		<h1>店铺积分年排行</h1>
		<dl>
			<dt><span class="top">排名</span><span class="title">店铺</span><span class="num1">增长积分</span></dt>
			<dd>
				<ul>
											<li title="xiaoyu5256"><span class="name"><a href="/user/xiaoyu5256" class="user_name">我怀念De</a></span><span class="num">180639</span></li>
											<li title=""><span class="name"><a href="/user/" class="user_name"></a></span><span class="num">132624</span></li>
											<li title="u013003382"><span class="name"><a href="/user/u013003382" class="user_name">DWCSDNNET</a></span><span class="num">85157</span></li>
											<li title="niehanmin"><span class="name"><a href="/user/niehanmin" class="user_name">niehanmin</a></span><span class="num">83884</span></li>
											<li title="u011433684"><span class="name"><a href="/user/u011433684" class="user_name">yinkaisheng-nj</a></span><span class="num">80012</span></li>
											<li title="laoge"><span class="name"><a href="/user/laoge" class="user_name">laoge</a></span><span class="num">67718</span></li>
											<li title="l1505624"><span class="name"><a href="/user/l1505624" class="user_name">浮舟</a></span><span class="num">66571</span></li>
											<li title="ramissue"><span class="name"><a href="/user/ramissue" class="user_name">ramissue</a></span><span class="num">65554</span></li>
											<li title="qq_30096641"><span class="name"><a href="/user/qq_30096641" class="user_name">爱琴忆海</a></span><span class="num">59463</span></li>
											<li title="machen_smiling"><span class="name"><a href="/user/machen_smiling" class="user_name">machen_smiling</a></span><span class="num">47756</span></li>
									</ul>
			</dd>
		</dl>
	</div>


	<div class="ranking ranking_download">
		<h1><span class="fr"></span>上传资源年排行</h1>
		<dl>
			<dt><span class="top">排名</span><span class="title">店铺</span><span class="num1">上传个数</span></dt>
			<dd>
				<ul>
											<li><span class="name"><a title="u011433684" class="user_name">yinkaisheng-nj</a></span><span class="num">4331</span></li>
											<li><span class="name"><a title="xiaoyu5256" class="user_name">我怀念De</a></span><span class="num">773</span></li>
											<li><span class="name"><a title="ls249438054" class="user_name">樱花满天</a></span><span class="num">549</span></li>
											<li><span class="name"><a title="u013003382" class="user_name">DWCSDNNET</a></span><span class="num">428</span></li>
											<li><span class="name"><a title="jiangsucsdn002" class="user_name">jiangsucsdn002</a></span><span class="num">378</span></li>
											<li><span class="name"><a title="gouyue" class="user_name">勾月QQ223857666</a></span><span class="num">365</span></li>
											<li><span class="name"><a title="wizardforcel" class="user_name">龙哥盟飞龙</a></span><span class="num">345</span></li>
											<li><span class="name"><a title="qq_2723812263" class="user_name">qq_is_2723812263</a></span><span class="num">304</span></li>
											<li><span class="name"><a title="niehanmin" class="user_name">niehanmin</a></span><span class="num">300</span></li>
											<li><span class="name"><a title="machen_smiling" class="user_name">machen_smiling</a></span><span class="num">289</span></li>
									</ul>
			</dd>
		</dl>
	</div>

</div>

</div>
 
<%@ include file="./common/footer.jsp" %>     
 <link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/footer.css">   

    
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
      <!-- ask 全局悬浮按钮  -->
   			<link href="${pageContext.request.contextPath }/shop/css/ask_float_block.css" rel="stylesheet" type="text/css" />
        <!--script(type="text/javascript" src="static/js/apps/fontSize.js")-->
	<script language="javascript" type="text/javascript" src="${pageContext.request.contextPath }/shop/js/async_new.js"></script>
	<!-- <script data-main="${host}/shop/js/apps/download.config.js" src="${host}/shop/js/libs/require.js"></script> -->
 
  </body>
</html>