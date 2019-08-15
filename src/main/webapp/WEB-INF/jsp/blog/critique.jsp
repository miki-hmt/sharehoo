<%@page pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--修改日期格式只显示年月日  -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1,text/html; charset=utf-8"/> 
        <link rel="shortcut icon" href="../favicon.ico"/> 
		<title>${user.nickName}个人博客—留言板</title>
		<meta name="keywords" content="${user.nickName},个人博客" />
		<meta name="description" content="${user.nickName}个人博客" />
		
		<link href="../blog/include/css/base.css" rel="stylesheet"/>
		<link href="../blog/include/css/style.css" rel="stylesheet"/>
		<link href="../blog/include/css/media.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />
		
		<script type="text/javascript" src="../blog/include/js/jquery.min.js"></script>
		<script type="text/javascript" src="../blog/include/js/jquery.gallery.js"></script>
		<script type="text/javascript" src="../blog/include/js/modernizr.custom.53451.js"></script>
		<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
		<meta name="viewport" content="width=device-width, minimum-scale=1.0,initial-scale=1.0,maximum-scale=1.0"/>
		<!--[if lt IE 9]>
		<script src="../include/js/modernizr.js"></script>
		<![endif]-->
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
				return true;
			}
		</script>

	</head>
<body>
<div class="ibody">
  <header>
    <h1>${user.nickName }的博客博客</h1>
    <h2>愿居于一城，与卿所见美好......</h2>
    <div class="logo"><a href="../index/index"></a></div>
    <%@ include file="./nav.jsp" %>
    </header>
  <article>
    <h2 class="about_h">您现在的位置是：<a href="${pageContext.request.contextPath}/blog/Blog_show.action?userId=${user.id}">首页</a>><a href="${pageContext.request.contextPath}/blog/Critique_save.action?userId=${user.id}">留言板</a></h2>
    <div class="template">
      
      <h3>
        <p><span>最新留言</span></p>
      </h3>
      <ul class="pl_n">
       <c:forEach items="${critiqueList }" var="critique" >
        <dl>
          <dt><img src="../blog/include/images/s8.jpg"> </dt>
          <dt> </dt>
          <dd>${critique.name }
            <time><fmt:formatDate value="${critique.time }" pattern="yyyy-MM-dd HH:mm:ss "/></time>
          </dd>
          <dd><a href="#">${critique.content }</a></dd>
        </dl>
        </c:forEach>
      </ul>
      
    <div class="page">
      	
      </div> 
  		<h3>
        <p><span>随便说说</span></p>
        <a href="#" target="_blank" class="more"></a>
      </h3>
       <form action="${pageContext.request.contextPath}/blog/Critique_save.action?userId=${user.id}" method="post" onsubmit="return check()">
      		<table>
      			<tr>
      				<td><span>您的昵称:</span></td><td><input id="name" type="text" name="critique.name"/></td>
      			</tr>
      			<tr>
	    			<td><div style="width:70px;padding-bottom: 189px;"><span>留言内容:</span></div></td><td><textarea id="criContent" name="critique.content" style ="height:200px; width:630px;" ></textarea></td>
    			</tr>
    			<tr>
	    			<td></td><td><button type="submit" style="width: 60px;height: 30px;font-size: larger;">提交</button></td>
    			</tr>
    			
    			<input type="hidden" name="critique.user.id" value="${user.id }"/>
      		</table>
      </form>
     </div>
  </article>
  <aside>
    <div class="rnav">
      <li class="rnav1 "><a href="http://123.206.23.11/">个人博客</a></li>
      <li class="rnav2 "><a href="http://user.qzone.qq.com/787894993">QQ空间</a></li>
      <li class="rnav3 "><a href="#">个人作品</a></li>
      <li class="rnav4 "><a href="#">随便逛逛</a></li>
    </div>
    <div class="ph_news">
      <h2>
        <p>点击排行</p>
      </h2>
      <ul class="ph_n">
        
      </ul>
      <h2>
        <p>栏目推荐</p>
      </h2>
      <ul>
        <s:iterator value="recommendArticles" >
        	<li><a href="../article/article_detail?id=<s:property value="id"/>"><s:property value="title"/></a></li>
      	</s:iterator>
      </ul>
    <%@ include file="./copyright.jsp" %> 
  </aside>
  <script src="../blog/include/js/silder.js"></script>
  <div class="clear"></div>
  <!-- 清除浮动 --> 
</div>
</body>
</html>
