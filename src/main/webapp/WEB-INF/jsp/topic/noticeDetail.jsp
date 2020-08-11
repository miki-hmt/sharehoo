<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!--修改日期格式只显示年月日  -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	  <title>IT帮-资讯传播社区--公告页面</title>
	  <link href="${pageContext.request.contextPath}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />
	  <link rel="stylesheet" href="${host}/blog/tag/css/style.css"> 
	</head>
	<body>
	  	<h1><span style="font-size:9pt;">${notice.name }</span></h1>
		<textarea class="tagarea" id="content" name="content">
				<c:choose>
					<c:when test="${not empty notice}">${notice.content }</c:when>
					<c:otherwise>java 我爱你の</c:otherwise>
				</c:choose>
		  		
			</textarea>
			
		<!--User Info-->
		<table>
		  <tr>
		    <td colspan="3" align="center"><b>公告详情</b></td>
		  </tr>
		  <tr>
		    <td>时间</td>
		    <td> <fmt:formatDate value="${notice.pubDate }" pattern="yyyy-MM-dd "/> <span>Enter</span></td>
		    <td> <i class="chcek"></i> </td>
		  </tr>
		  <tr>
		    <td>内容</td>
		    <td> <c:choose>
					<c:when test="${not empty notice}">${notice.content }</c:when>
					<c:otherwise>java 我爱你の</c:otherwise>
				</c:choose> <span>Enter</span></td>
		    <td> <i class="chcek"></i> </td>
		  </tr>
		  
		</table>
		<input id="bntClose" type="button" value="关闭" onclick="window.close();"/>
	  <script type="text/javascript">
		
	  </script>
	</body>
</html>