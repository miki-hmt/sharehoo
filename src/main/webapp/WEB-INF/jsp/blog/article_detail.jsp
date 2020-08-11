<%@page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--修改日期格式只显示年月日  -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>${article.title}——${article.user.nickName}博客</title>
		<meta name="keywords" content="${article.keywords}" />
		<meta name="description" content="${article.title}" />
		<link href="${host}/blog/include/css/base.css" rel="stylesheet"/>
		<link href="${host}/blog/include/css/style.css" rel="stylesheet"/>
		<link href="${host}/blog/include/css/media.css" rel="stylesheet"/>
		<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0"/>
		
		<!-- 2019.09.03 自定义弹窗所需插件 -->
		<link rel="stylesheet" type="text/css" href="${host}/sweetalert/sweetalert.css"/>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
		<script src="${host}/sweetalert/sweetalert.min.js"></script>
		
		<!--2018.07.18  miki  ckeditor代码高亮	开头这里的样式为默认的风格，可以根据自己的喜好更换风格-->
		<!--我的高亮效果是zenburn-->
		<link rel="stylesheet" href="${host}/highlight/styles/zenburn.css"/>
		<script src="${host}/highlight/highlight.pack.js"></script>
		<script>hljs.initHighlightingOnLoad();</script>

		<link href="${host}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />
		<!--[if lt IE 9]>
		<script src="../include/js/modernizr.js"></script>
		<![endif]-->

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
<div class="ibody">
  <header>
    <h1>${user.nickName }的博客</h1>
    <h2>愿居于一城，与卿所见美好......</h2>
    <div class="logo"><a href="../index/index"></a></div>
	 <%@ include file="./nav.jsp" %> 
   </header>
  <article>
    <h2 class="about_h">您现在的位置是：<a href="${host}/blog/${user.nickNameId}">首页</a>><a href="${host}/blog/${user.nickNameId}/article">漫生活</a>><a href="#">详细内容</a></h2>
    <div class="index_about">
      <h2 class="c_titile">${article.title }</h2>
      <p class="box_c"><span class="d_time">发布时间：<fmt:formatDate value="${article.time }" pattern="yyyy-MM-dd HH:mm:ss "/></span><span>编辑：${article.editer }</span><span>浏览（${article.count }）</span><span>评论（${article.count1 }）</span></p>
      <ul class="infos">
        ${article.content }
      </ul>
      <div class="keybq">
        <p><span>关键字词</span>：${article.keywords }</p>
      </div>
	<div class="bdsharebuttonbox">
      	<a href="#" class="bds_more" data-cmd="more"></a>
      	<a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
      	<a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
      	<a href="#" class="bds_sqq" data-cmd="sqq" title="分享到QQ"></a>
      	<a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a>
      	<a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
      	</div>
      <div class="nextinfo">
      <s:if test="before!=null">
        <p>上一篇：<a href="${host}/blog/${user.nickNameId}/article/${before.id }${host}">${before.title }</a></p>
      </s:if>
      <s:if test="next!=null">
        <p>下一篇：<a href="${host}/blog/${user.nickNameId}/article/${next.id }${host}">${next.title }</a></p>
      </s:if>
      </div>
    </div>
  </article>
  <aside>
    <div class="rnav">
      <li class="rnav1 "><a href="#">日记</a></li>
      <li class="rnav2 "><a href="#">编程</a></li>
      <li class="rnav3 "><a href="#">经典语录</a></li>
      <c:forEach items="${tags }" var="tag">
      	<li class="rnav4 "><a href="${host}/blog/${user.nickNameId}/article/category/${tag }">${tag }</a></li>
      </c:forEach>
      <li class="rnav1 "><a href="#" onClick="openWin('${host}/tag/add/${user.id}','tag','550','600')">添加+</a></li>
    </div>
    <div class="ph_news">
      <h2>
        <p>点击排行</p>
      </h2>
		     <ul class="ph_n">
		      <c:forEach items="${countList }" var="article" varStatus="state">
		      <c:choose>
		      	<c:when test="${ state.index<3}">
		      		<li><span class="num1">${ state.index+1 }</span><a href="${host}/blog/${user.nickNameId}/article/${article.id}">${article.title }</a></li>       	
		      	</c:when>
		      	<c:otherwise>
		      		<li><span>${state.index+1 }</span><a href="${host}/blog/${user.nickNameId}/article/${article.id}">${article.title }</a></li>
		      	</c:otherwise>
		      	</c:choose>
		      </c:forEach>
     		</ul>
      <h2>
        <p>栏目推荐</p>
      </h2>
       <ul class="ph_n">
		      <c:forEach items="${recommendList }" var="article" varStatus="state">
		      <c:choose>
		      	<c:when test="${ state.index<3}">
		      		<li><span class="num1">${ state.index+1 }</span><a href="${host}/blog/${user.nickNameId}/article/${article.id}">${article.title }</a></li>       	
		      	</c:when>
		      	<c:otherwise>
		      		<li><span>${state.index+1 }</span><a href="${host}/blog/${user.nickNameId}/article/${article.id}">${article.title }</a></li>
		      	</c:otherwise>
		      	</c:choose>
		      </c:forEach>
     		</ul>
      <h2>
        <p>文章评论</p>
      </h2>
      <ul class="pl_n">
        <c:forEach items="${ critiques}" var="critiques">
        <dl>
          <dt><img src="${host}/blog/include/images/s8.jpg"> </dt>
          <dt> </dt>
          <dd>${critiques.name }
            <fmt:formatDate value="${critiques.time }" pattern="yyyy-MM-dd HH:mm:ss "/>
          </dd>
          <a href="#"><font style="color:gray;">${critiques.content }</font></a>
        </dl>
        </c:forEach>
      </ul>
      <h2>
        <p>作者回复</p>
      </h2>
      <ul class="pl_n">
        <c:forEach items="${ replyList}" var="reply">
        <dl>
          <dt><img src="${host}${host}/blog/include/images/s8.jpg"> </dt>
          <dt> </dt>
          <dd>我&nbsp;回复：${reply.type }
            <fmt:formatDate value="${reply.time }" pattern="yyyy-MM-dd HH:mm:ss "/>           
          </dd>
          <a href="#"><font style="color:gray;">${reply.content }</font></a>
        </dl>
        </c:forEach>
      </ul>
      
      <h2>
        <p><span style="color:white;">发表看法</span></p>
      </h2>
      <br></br>
       <form action="" method="post" id="critique_form">
      		<table>
      			<tr>
      				<td><input type="text" id="name" name="name" placeholder="您的昵称"/></td>
      			</tr>
      			<tr>
	    			<td><textarea id="criContent" name="content" style ="height:200px; width:268px;bg-color:gray;" placeholder="您的内容"></textarea></td>
    			</tr>
			<tr>
	      				<td>
	      					<input id="txtCode" name="imageCode" style="width: 133px;height:30px" placeholder="验证码"/>
	      					<img id="randImage" src="${host}/imageCode" width="90" height="34" name="randImage" title="点击换一个" 
									style="vertical-align: middle; margin-top: -35px;margin-left:145px;" onclick="javascript:loadimage();" />
	      				</td>
					</tr>
    			<tr>
	    			<td><button id="submitAdd" style="width: 60px;height: 30px;font-size: larger;margin-top:5px">提交</button></td>
    			</tr>
    			
    			<input type="hidden" name="user.id" value="${user.id }"/>
    			<input type="hidden" name="article.id" value="${article.id }"/>
      		</table>
      </form>
      
      
    </div>
   <%@ include file="./copyright.jsp" %> 
  </aside>
  <script src="${host}/blog/include/js/silder.js"></script>
  <div class="clear"></div>
  <!-- 清除浮动 --> 
</div>

<script type="text/javascript">
	function openWin(url,name,iWidth,iHeight) { 
            //获得窗口的垂直位置 
            var iTop = (window.screen.availHeight - 30 - iHeight) / 2; 
            //获得窗口的水平位置 
            var iLeft = (window.screen.availWidth - 10 - iWidth) / 2; 
            window.open(url, name, 'height=' + iHeight + ',innerHeight=' + iHeight + ',width=' + iWidth + ',innerWidth=' + iWidth + ',top=' + iTop + ',left=' + iLeft + ',status=no,toolbar=no,menubar=no,location=no,resizable=no,scrollbars=0,titlebar=no'); 
        }
	function loadimage(){
		document.getElementById("randImage").src = "${host}/imageCode?"+Math.random();
	}
	$(document).ready(function() {	
	$("#submitAdd").on("click",function(){
		var name=$("#name").val();
		var criContent=$("#criContent").val();
		if(name==""){
			tipError("亲亲，昵称不能为空哦");
			return false;
		}
		if(criContent=""){
			tipError("亲亲，评论内容不能为空哦");
			return false;
		}
		$.ajax({
	       type: "POST",
	       url: "${host}/blog/article/${article.id}/critiqueAdd",
	       data: $("#critique_form").serialize(),
	       success: function (data) {
	       		if(data.status==200){
	       			tipOk("回复成功",function(){
		       			 	window.location.reload();       			
		       			});
	       		}else{
	       			tipError(data.msg);
	       		}
	       }
		   	});
   		return false;	//!!一定要return false, 否則會自動刷新頁面,導致ajax彈窗提醒失效。防止刷新頁面
})
});

function deleteCritique(id) {
			swal({
				title : "",
				text : "您确定要删除这个评论吗？",
				type : "warning",
				showCancelButton : true,
				closeOnConfirm : false,
				confirmButtonText : "是的，我要删除",
				confirmButtonColor : "#ec6c62"
			}, function() {
				$.post("${host}/blog/manage/critique/delete", {
					id : id
				}, function(result) {
					if (result.status == 200) {
						tipOk("评论已成功删除！", function() {
							console.log(".......");
							location.reload(true);
						});
	
					} else {
						tipError("删除失败！！");
					}
				}, "json");
			});
		}

function tipOk(content,callback){
		swal({   
			title: content,   
			text: '来自<span style="color:red">sharehoo社区</span>、<a href="#">温馨提示</a>。<br/>2秒后自动关闭..',   
			imageUrl: "${host}/sweetalert/images/thumbs-up.jpg",
			html: true,
			timer: 2000,   
			showConfirmButton: false
		},function(){
				if (callback) {
					callback();
				}
			});
	};
	function tipError(content){
		swal("操作失败", content, "error");
	};
</script>

</body>
</html>
