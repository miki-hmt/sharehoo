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
		<link href="../blog/include/css/base.css" rel="stylesheet"/>
		<link href="../blog/include/css/style.css" rel="stylesheet"/>
		<link href="../blog/include/css/media.css" rel="stylesheet"/>
		<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0"/>
		<!--2018.07.18  miki  ckeditor代码高亮	开头这里的样式为默认的风格，可以根据自己的喜好更换风格-->
		<!--我的高亮效果是zenburn-->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/highlight/styles/gruvbox-dark.css">
		<script src="${pageContext.request.contextPath}/highlight/highlight.pack.js"></script>
		<script>hljs.initHighlightingOnLoad();</script>

		<link href="${pageContext.request.contextPath}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.1.js" type="text/javascript"></script>
		<script type="text/javascript">
			function check(){
				var name=$("#name").val();
				var content=$("#criContent").val();
				if(name==""){
					alert("亲亲，昵称不能为空哦");
					return false;
				}
				if(content=""){
					alert("亲亲，评论内容不能为空哦");
					return false;
				}
			}
		</script>
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
    <h2 class="about_h">您现在的位置是：<a href="${pageContext.request.contextPath }/blog/Blog_show.action?userId=${user.id}">首页</a>><a href="${pageContext.request.contextPath }/blog/Blog_article.action?userId=${user.id}">漫生活</a>><a href="#">详细内容</a></h2>
    <div class="index_about">
      <h2 class="c_titile">${article.title }</h2>
      <p class="box_c"><span class="d_time">发布时间：<fmt:formatDate value="${article.time }" pattern="yyyy-MM-dd HH:mm:ss "/></span><span>编辑：${article.editer }</span><span>浏览（${article.count }）</span><span>评论（${article.count1 }）</span></p>
      <ul class="infos">
        ${article.content }
      </ul>
      <div class="keybq">
        <p><span>关键字词</span>：${article.keywords }</p>
      </div>
      <div class="nextinfo">
      <s:if test="before!=null">
        <p>上一篇：<a href="${pageContext.request.contextPath }/blog/Blog_detail.action?id=${before.id }">${before.title }</a></p>
      </s:if>
      <s:if test="next!=null">
        <p>下一篇：<a href="${pageContext.request.contextPath }/blog/Blog_detail.action?id=${next.id }">${next.title }</a></p>
      </s:if>
      </div>
    </div>
  </article>
  <aside>
    <div class="rnav">
      <li class="rnav1 "><a href="#">日记</a></li>
      <li class="rnav2 "><a href="#">欣赏</a></li>
      <li class="rnav3 "><a href="#">编程</a></li>
      <li class="rnav4 "><a href="#">经典语录</a></li>
    </div>
    <div class="ph_news">
      <h2>
        <p>点击排行</p>
      </h2>
		     <ul class="ph_n">
		      <c:forEach items="${countList }" var="article" varStatus="state">
		      <c:choose>
		      	<c:when test="${ state.index<3}">
		      		<li><span class="num1">${ state.index+1 }</span><a href="${pageContext.request.contextPath}/blog/Blog_detail.action?id=${article.id}">${article.title }</a></li>       	
		      	</c:when>
		      	<c:otherwise>
		      		<li><span>${state.index+1 }</span><a href="${pageContext.request.contextPath}/blog/Blog_detail.action?id=${article.id}">${article.title }</a></li>
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
		      		<li><span class="num1">${ state.index+1 }</span><a href="${pageContext.request.contextPath}/blog/Blog_detail.action?id=${article.id}">${article.title }</a></li>       	
		      	</c:when>
		      	<c:otherwise>
		      		<li><span>${state.index+1 }</span><a href="${pageContext.request.contextPath}/blog/Blog_detail.action?id=${article.id}">${article.title }</a></li>
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
          <dt><img src="${pageContext.request.contextPath }/blog/include/images/s8.jpg"> </dt>
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
          <dt><img src="${pageContext.request.contextPath }/blog/include/images/s8.jpg"> </dt>
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
       <form action="${pageContext.request.contextPath}/blog/Critique_saveAr.action?id=${article.id}" method="post" onsubmit="return check()">
      		<table>
      			<tr>
      				<td><input type="text" id="name" name="critique.name" placeholder="您的昵称"/></td>
      			</tr>
      			<tr>
	    			<td><textarea id="criContent" name="critique.content" style ="height:200px; width:268px;bg-color:gray;" placeholder="您的内容"></textarea></td>
    			</tr>
    			<tr>
	    			<td><button type="submit" style="width: 60px;height: 30px;font-size: larger;">提交</button></td>
    			</tr>
    			
    			<input type="hidden" name="critique.user.id" value="${user.id }"/>
    			<input type="hidden" name="critique.article.id" value="${article.id }"/>
      		</table>
      </form>
      
      
    </div>
   <%@ include file="./copyright.jsp" %> 
  </aside>
  <script src="../blog/include/js/silder.js"></script>
  <div class="clear"></div>
  <!-- 清除浮动 --> 
</div>
</body>
</html>
