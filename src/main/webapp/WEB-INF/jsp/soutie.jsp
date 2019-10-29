<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>IT帮-资讯传播社区--搜索结果</title>

<!-- 2019.09.03 自定义弹窗所需插件 -->
<link rel="stylesheet" type="text/css" href="${host}/sweetalert/sweetalert.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
<script src="${host}/sweetalert/sweetalert.min.js"></script>

<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />

<script src="${host}/bootstrap/js/bootstrap.min.js"></script>
<script src="${host}/bootstrap/js/bootstrap.js"></script>

<style type="text/css">
a:hover{
  	text-decoration:none;
}
p{
	margin:0 0 1px!important;
}
</style>

</head>
<body style="height:900px;">

        <!-- 导入页面头部 -->
<div class="wrap" style="margin: 0 auto;">
	<jsp:include page="common/top-search.jsp"/>
</div>
<div style="background:#F5F5F5;width: 1200px;margin: 0 auto;">
<div class="container-fluid">

		<div class="row-fluid">
			<div class="span12">
				<div class="widget-box">
					<div class="widget-title">

						<c:choose>
          						<c:when test="${curCategory==null }">
          							<h5>搜索结果列表:>>>&nbsp;${query }</h5>
          						</c:when>
          						<c:otherwise>
          							<h5>搜索结果列表:>>>&nbsp;${curCategory }版面>>>&nbsp;${query }</h5>
          						</c:otherwise>
          					</c:choose>
						
					</div>
					<div class="widget-content nopadding">
						<table class="table table-bordered with-check">
							<thead>
								<tr>																		
									<th style="text-align:left;font-size:10pt;">帖子标题</th>
									<!-- <th style="text-align:center;font-size:10pt;">发帖人</th>
									<th class="th"style="text-align:center;font-size:10pt;">所属板块</th>
									<th style="text-align:center;font-size:10pt;">发帖时间</th> -->																		
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${itemList }" var="topic">
									<tr>
																													
										<td style="text-align: left;vertical-align: middle;font-size:12pt;">
										<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://sharehoo.cn/${topic.code }.html" target="_blank">${topic.title }</a></p>
										<p style="font-size: 10px;margin: 5px 0 0 26px;color:gray;">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<span>${topic.user_name }</span>
										&nbsp;&nbsp;<span>${topic.section_name }</span>&nbsp;&nbsp;${topic.publishTime }</p>
										
										</td>
										<%-- <td style="text-align: left;vertical-align: middle;width: 110px;vertical-align: middle;font-size:10pt;">
											${topic.user_name }
										</td>
										<td style="text-align: center;vertical-align: middle;font-size:10pt;">${topic.section_name }</td>
										<td style="text-align: center;vertical-align: middle;font-size:10pt;">${topic.publishTime }</td> --%>																			
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="pagination alternate">
					<ul class="clearfix">${pageCode }
					</ul>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>