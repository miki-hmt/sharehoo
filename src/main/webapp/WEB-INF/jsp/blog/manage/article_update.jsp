﻿<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
    <head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>${user.nickName }的个人博客——更新博客</title>
		<meta name="keywords" content="${user.nickName }的个人博客" />
		<meta name="description" content="${user.nickName }的个人博客。" />
		<link href="${host}/blog/include/css/base.css" rel="stylesheet"/>
		<link href="${host}/blog/include/css/style.css" rel="stylesheet"/>
		<link href="${host}/blog/include/css/media.css" rel="stylesheet"/>
		<link href="${host}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />
		
		<!-- 2019.09.03 自定义弹窗所需插件 -->
		<link rel="stylesheet" type="text/css" href="${host}/sweetalert/sweetalert.css"/>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
		<script src="${host}/sweetalert/sweetalert.min.js"></script>
		
		<script type="text/javascript" src="${host}/ckeditor4.12/ckeditor/ckeditor.js"></script>
		<script type="text/javascript" src="${host}/js/uploadPreview.min.js"></script>
		
		<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0"/>
		
		<script type="text/javascript">
		$(function () {
			$("#articleImage").uploadPreview({ Img: "ImgPr", Width: 220, Height: 220 });
			//2019.09.04 miki 初始化ckeditor编辑器，修改上传文件地址，记得去掉class="ckeditor"
			CKEDITOR.replace('content', { 
				filebrowserImageUploadUrl :"${host}/topic/ckupload?",
				codeSnippet_theme: 'zenburn',
				height:'500'
			});
		});
		</script>
		<style type="text/css">
			/*为段落定义样式*/
			input {border:0;background-color:#DADADA;height:28px}
			span {color:#099;}
		</style>
		<!--[if lt IE 9]>
		<script src="../include/js/modernizr.js"></script>
		<![endif]-->
	</head>
<body>
<div class="ibody">
  <header>
    <h1>${user.nickName }的个人博客</h1>
    <h2>愿居于一城，与卿所见美好......</h2>
    <div class="logo"><a href="../manage/article"></a></div>
   <%@ include file="../manage_nav.jsp" %>
    </header>
  <article>
    <h2 class="about_h">您现在的位置是：<a href="../manage/article">首页</a>><a href="#">博客更新</a></h2>
    <div class="index_about">
    <form action="" method="post" id="article_form" enctype="multipart/form-data">
    	<table>
    		<tr>
	    		<td><input id="title" name="title" value="${article.title }" style="width:96%;font-size:12pt;text-align:center;"/></td>
    		</tr>
    		<tr>
	    		<td>
	    		<div class="control-group" id="preDiv" style="width: 700px; height: 80px;margin-left: 70px;">
				<img id="ImgPr" class="pull-left" style="width: 170px; height: 90px;" src="${host}/${article.image }" />
			</div>
			<div class="control-group">
				<label class="control-label" for="image">文章配图(*)</label>
				<div class="controls">
					<input type="file" id="articleImage" name="articleImage"/>
				</div>
			</div></td>
    		</tr>
    		<tr>
    			<table>
      			<tr>
	    			<td><textarea id="content" name="content" style ="height:150px; width:700px;bg-color:gray;" placeholder="您的内容">${article.content }</textarea>	    				
	    			</td>
    			</tr>   			
    			</table>
   			
   	    	</tr>
   	    	
    		<tr>
    			<td>
    				<!-- 2019.09.02 时间格式前台不处理，因为前台传到后台为string，转Date会报错 -->
    				<span>发表时间:</span><input id="time" name="showtime" value="${article.time }" readonly="readonly" style="width:90px"/>
    				<span>作者:</span><input id="editer" name="editer" value="${article.editer }" style="width:90px"/>
    				<span>浏览:</span><input id="count" name="count" value="${article.count }" readonly="readonly"/>
    				<span>评论:</span><input id="count1" name="count1" value="${article.count1 }" readonly="readonly"/>
    			</td>
    		</tr>
    		<tr>
	    		<td>
	    			<span>关键词:</span><input id="keywords" name="keywords" value="${article.keywords }"style="width:90px"/>
	    			<span>分类:</span>
	    			<select def="0" style="border:solid 1px green;margin-top:11px;font-size:11px;height:24px;width:130px;" id="type" name="type">
						<option value="${article.type }" >${article.type }</option>
						<option value="日记" >日记</option>
						<option value="编程" >编程</option>
						<option value="经典语录" >经典语录</option>
						 <c:forEach  items="${tags }" var="tag">
						 	<option value="${tag }" >${tag}</option>
						 </c:forEach>									
					 </select>
	    			<%-- <input id="type" name="type" value="${article.type }"style="width:90px"/> --%>
	    			<span>设为推荐:</span>
	    			<c:if test="${article.notice=='recommendArticles'}">
		    			<input name="notice" type="radio" value="1" checked/>是
		 				<input name="notice" type="radio" value="2" />否
	    			</c:if>
	    			<c:if test="${article.notice==''}">
	    				<input name="notice" type="radio" value="1" />是
		 				<input name="notice" type="radio" value="2" checked/>否
	    			</c:if>
	    			<input name="id" value="${article.id }" style="display:none;"/>
	    			<input id="user" name="user.id" value="${user.id}" type="hidden"/>
	    		</td>
    		</tr>
    		<tr>
	    			<td><input id="okBtn" type="button" style="width: 60px;height: 30px;font-size: larger;" value="修改"/></td>
    			</tr>
    	</table>
    </form>
      <div class="nextinfo">
         <s:if test="articleBefore!=null">
        <p>上一篇：<a href="../article/article_detail?id="><s:property value="articleBefore.title"/></a></p>
      </s:if>
      <s:if test="articleAfter!=null">
        <p>下一篇：<a href="../article/article_detail?id="><s:property value="articleAfter.title"/></a></p>
      </s:if>
      </div>
    </div>
  </article>
  <aside>
  <%@ include file="../rnav.jsp" %> 
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
        <li><a href="../article/article_detail?id=">推荐1</a></li>
      </s:iterator>
      </ul>
      <h2>
        <p>最新评论</p>
      </h2>
      <ul class="pl_n">
        <s:iterator value="critiques" >
        <dl>
          <dt><img src="${host}/blog/include/images/s8.jpg"/> </dt>
          <dt> </dt>
          <dd>名字
            <time>时间</time>
          </dd>
          <dd><a href="#">内容</a></dd>
        </dl>
        </s:iterator>
      </ul>
      
    </div>
    <%@ include file="../copyright.jsp" %> 
  </aside>
  <script src="${host}/blog/include/js/silder.js"></script>
  <div class="clear"></div>
  <!-- 清除浮动 --> 
  
<script type="text/javascript">
$(function(){
	
	function addFileName() {
		var uploadfile = $("#articleImage").val();
		var fileName = getFileName(uploadfile);
		$("#faceFileName").val(fileName);
	}
	//获取文件名方式一
	function getFileName(file) { //通过第一种方式获取文件名
		var pos = file.lastIndexOf("\\"); //查找最后一个\的位置
		return file.substring(pos + 1); //截取最后一个\位置到字符长度，也就是截取文件名 
	}
	
	
	//springboot框架提交表单实体对象到后台尽量使用ajax提交，将表单序列化提交	2019.08.31 miki
	$("#okBtn").on("click", function() {

		//ckeditor4.12新特性，提交表单前需要更新textAera字段内容	2019.09.02
		for (instance in CKEDITOR.instances) {
			CKEDITOR.instances[instance].updateElement();
		}
		if (checkForm()) {
			addFileName();
			var faceFileName = $('#ImgPr')[0].src;
			var formData = new FormData($("#article_form")[0]);
			$.ajax({
				type : "POST",
				url : "${host}/blog/manage/article/update?faceFileName=" + faceFileName,
				data : formData,
				cache : false,
				async : false,
				processData : false, //必须false才会避开jQuery对 formdata 的默认处理
				contentType : false, //必须false才会自动加上正确的Content-Type
				success : function(data) {
					if (data.status == 200) {
						tipOk("修改成功!!");
					} else {
						tipError("修改失败!!" + data.msg);
					}
				}
			});
			return false;
		}
	});
	function checkForm() {
		var editer = $("#editer").val();
		var keywords = $("#keywords").val();
		var type = $("#type").val();
		var image = $("#image").val();
		var title = $("#title").val();
		var result = true;
		if (title == "") {
			result = false;
		}
		if (editer == "") {
			$("#editer").html("作者不能为空！");
			result = false;
		}
		if (keywords == "") {
			$("#keywords").html("关键字不能为空！");
			result = false;
		}
		if (type == "") {
			$("#type").html("类型不能为空！");
			result = false;
		}

		if ($("#content").val().length < 10) {
			tipError("文章内容最少20个字符！");
			result = false;
		}
		return result;
		
	}
	
	function tipOk(content){
		swal({   
			title: content,   
			text: '来自<span style="color:red">sharehoo社区</span>、<a href="#">温馨提示</a>。<br/>2秒后自动关闭..',   
			imageUrl: "${host}/sweetalert/images/thumbs-up.jpg",
			html: true,
			timer: 2000,   
			showConfirmButton: false
		});
	};
	function tipError(content){
		swal("操作失败", content, "error");
	};
});
</script>
  
  
</div>
</body>
</html>
