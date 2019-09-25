<%@page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--修改日期格式只显示年月日  -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html>
<html>
    <head>
    	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1,text/html; charset=utf-8"/> 
        <link rel="shortcut icon" href="../favicon.ico"/> 
		<title>${user.nickName}个人博客—留言板</title>
		<meta name="keywords" content="${user.nickName},个人博客" />
		<meta name="description" content="${user.nickName}个人博客" />
		
		<link href="${host}/blog/include/css/base.css" rel="stylesheet"/>
		<link href="${host}/blog/include/css/style.css" rel="stylesheet"/>
		<link href="${host}/blog/include/css/media.css" rel="stylesheet"/>
		<link href="${host}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />
		
		<!-- 2019.09.03 自定义弹窗所需插件 -->
		<link rel="stylesheet" type="text/css" href="${host}/sweetalert/sweetalert.css"/>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
		<script src="${host}/sweetalert/sweetalert.min.js"></script>
		
		<script type="text/javascript" src="${host}/blog/include/js/jquery.gallery.js"></script>
		<script type="text/javascript" src="${host}/blog/include/js/modernizr.custom.53451.js"></script>
		<meta name="viewport" content="width=device-width, minimum-scale=1.0,initial-scale=1.0,maximum-scale=1.0"/>
		<!--[if lt IE 9]>
		<script src="../include/js/modernizr.js"></script>
		<![endif]-->

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
    <h2 class="about_h">您现在的位置是：<a href="${host}/blog/${user.nickNameId}">首页</a>><a href="${host}/blog/${user.nickNameId}/critiques">留言板</a></h2>
    <div class="template">
      
      <h3>
        <p><span>最新留言</span></p>
      </h3>
      <ul class="pl_n">
       <c:forEach items="${critiqueList }" var="critique" >
        <dl>
          <dt><img src="${host}/blog/include/images/s8.jpg"> </dt>
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
       <form method="post" id="critique_form">
      		<table>
      			<tr>
      				<td><span>您的昵称:</span></td><td><input id="name" type="text" name="name"/></td>
      			</tr>
      			<tr>
	    			<td><div style="width:70px;padding-bottom: 189px;"><span>留言内容:</span></div></td><td><textarea id="criContent" name="content" style ="height:200px; width:630px;" ></textarea></td>
    			</tr>
    			<tr>
	    			<td></td><td><button id="submitAdd" style="width: 60px;height: 30px;font-size: larger;">提交</button></td>
    			</tr>
    			<input type="hidden" name="user.id" value="${user.id }"/>
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
        	<li><a href="../article/article_detail?id="><s:property value="title"/></a></li>
      	</s:iterator>
      </ul>
    <%@ include file="./copyright.jsp" %> 
  </aside>
  <script src="${host}/blog/include/js/silder.js"></script>
  <div class="clear"></div>
  <!-- 清除浮动 --> 
</div>

<script type="text/javascript">
//springboot框架提交表单实体对象到后台尽量使用ajax提交，将表单序列化提交	2019.08.31 miki
$(document).ready(function() {	
	$("#submitAdd").on("click",function(){
		var name=$("#name").val();
		var content=$("#criContent").val();
		if(name==""){
			tipError("亲亲，昵称不能为空哦");
			return false;
		}
		if(content=""){
			tipError("亲亲，评论内容不能为空哦");
			return false;
		}
		$.ajax({
	       type: "POST",
	       url: "${host}/blog/${user.nickNameId}/critique/add",
	       data: $("#critique_form").serialize(),
	       success: function (data) {
	       		if(data.status==200){
	       			tipOk("留言成功", function() {
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
