<%@page pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--修改日期格式只显示年月日  -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>${user.nickName}的个人博客-IT帮-资讯传播社区-技术交流_干货分享_课设下载_源码下载</title>
		<meta name="baidu-site-verification" content="qGEMPsi9L8" />
 		<meta name="Author" content="miki">
  		<meta name="Keywords" content="${user.nickName},课设,下载,博客,论坛,IT资讯,开发心得,干货分享,代码,源码">
  		<meta name="Description" content="${user.nickName}的个人博客--sharehoo.cn资讯交流平台--专注于程序员开发道路的技术分享，问题解决。
	会员可以发帖交流与讨论，每个人都有一个个人博客，可以在上面写下自己的心得与感悟。同时提供资源下载，开源源码下载，课程设计，专注于服务大学生。">		
		<link href="${host }/blog/include/css/base.css" rel="stylesheet"/>
		<link href="${host }/blog/include/css/index.css" rel="stylesheet"/>
		<link href="${host }/blog/include/css/style.css" rel="stylesheet"/>
		<link href="${host }/blog/include/css/media.css" rel="stylesheet"/>
		<link href="${host }/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />
		<!--2018.07.18  miki  ckeditor代码高亮	开头这里的样式为默认的风格，可以根据自己的喜好更换风格-->
		<!--我的高亮效果是zenburn-->
		<link rel="stylesheet" href="${host }/highlight/styles/gruvbox-dark.css">
		<script src="${host }/highlight/highlight.pack.js"></script>
		<script>hljs.initHighlightingOnLoad();</script>
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

		<meta name="baidu-site-verification" content="qGEMPsi9L8" />
		<script>
		var _hmt = _hmt || [];
		(function() {
  			var hm = document.createElement("script");
  			hm.src = "https://hm.baidu.com/hm.js?a17e70ae662c5f982f285d3f3d93f0ca";
  			var s = document.getElementsByTagName("script")[0]; 
  			s.parentNode.insertBefore(hm, s);
			})();
		</script>

		<!-- 尾部分页 css页码 	2017.05.24 -->
		<link href="${host }/blog/include/css/page.css" rel="stylesheet"/>
		
		<style type="text/css">
			/*为段落定义样式*/
			.avatar { margin: 10px auto; width: 160px; height: 160px; border-radius: 100%; overflow: hidden; }
			.avatar a { display: block; padding-top: 100px; width: 160px; background: url(${host }/${user.face}) no-repeat; background-size: 160px 160px; }
			.avatar a span { display: block; margin-top: 63px; padding-top: 8px; width: 160px; height: 55px; text-align: center; line-height: 20px; color: #fff; background: rgba(0, 0, 0, .5); -webkit-transition: margin-top .2s ease-in-out; -moz-transition: margin-top .2s ease-in-out; -o-transition: margin-top .2s ease-in-out; transition: margin-top .2s ease-in-out; }
			.avatar a:hover span { display: block; margin-top: 0; }
		</style>
		<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0"/>
		<!--[if lt IE 9]>
		<script src="../include/js/modernizr.js"></script>
		<![endif]-->
	</head>
<body>

<div class="ibody">
  <header>
    <h1>${user.nickName }个人博客</h1>    
    <h2>愿居于一城，与卿所见美好......</h2>
    <div class="logo"><a href="#"></a></div>
    <%@ include file="./nav.jsp" %>
    </header>
  <article>
    <div class="banner">
      <ul class="texts">
        <p>The best life is use of willing attitude, a happy-go-lucky life. </p>
        <p>最好的生活是用心甘情愿的态度，过随遇而安的生活。</p>
      </ul>
    </div>
    <div class="bloglist">
      <h2>
        <p><span>推荐</span>文章</p>
      </h2>
      <c:forEach items="${articleList }" var="article">
	      <div class="blogs">
	        <h3><a href="${host}/blog/${user.nickNameId}/article/${article.id}" target="_blank">${article.title }</a></h3>
	        <figure><img src="${host }/${article.image}" ></figure>
	        <ul>
	        <div class="content" style="height:12em;clear:both;" >${article.content }</div>
	          <a href="${host}/blog/${user.nickNameId}/article/${article.id}" target="_blank" class="readmore" style="color:white;">阅读全文&gt;&gt;</a>
	        </ul>
	        <p class="autor"><span>作者：${article.editer }</span><span>分类：【<a href="/">${article.type }</a>】</span><span>浏览（<a href="/">${article.count }</a>）</span><span>评论（<a href="/">${article.count1 }</a>）</span></p>
	        <div class="dateview"><fmt:formatDate value="${article.time }" pattern="yyyy-MM-dd HH:mm:ss "/></div>
	      </div>
      </c:forEach>
    </div>
    
    <div class="pagination alternate">
		<ul class="clearfix">
		${pageCode }
		</ul>
	</div> 
	           
  </article>
  <aside>
    <%@ include file="./info.jsp" %>
    <div class="tj_news">
      <h2>
        <p class="tj_t1">热点文章</p>
      </h2>
      <ul>
      <c:forEach items="${countList }" var="article">
        <li><a href="${host}/blog/${user.nickNameId}/article/${article.id}"  target="_blank">${article.title }</a></li>
      </c:forEach>
      </ul>
      <h2>
        <p class="tj_t2">推荐文章</p>
      </h2>
      <ul>
        <c:forEach items="${recommendList }" var="article">
        	<li><a href="${host}/blog/${user.nickNameId}/article/${article.id}"  target="_blank">${article.title }</a></li>
      	</c:forEach>
      </ul>
      
      <h2>
        <p class="tj_t1">博友互动</p>
      </h2>
      <ul class="pl_n">
        <c:forEach items="${ critiques}" var="critiques">
        <dl>
          <dt><img src="${host}/blog/include/images/s8.jpg" style="width:47px;height:47px;"> </dt>
          <dt> </dt>
          <dd>${critiques.name }
            <fmt:formatDate value="${critiques.time }" pattern="yyyy-MM-dd HH:mm:ss "/>
          </dd>
          <a href="#"><font style="color:gray;">${critiques.content }</font></a>
        </dl>
        </c:forEach>
      </ul>
      
    </div>
    <div class="links">
      <h2>
        <p>友情链接</p>
      </h2>
      <ul>
        <li><a href="http://sharehoo.cn/">个人博客</a></li>
        <li><a href="http://user.qzone.qq.com/#">QQ空间</a></li>
      </ul>
    </div>
    <%@ include file="./copyright.jsp" %> 
  </aside>
  <script src="${host }/blog/include/js/silder.js"></script>
  <div class="clear"></div>
  <!-- 清除浮动 --> 
</div>
</body>
</html>
