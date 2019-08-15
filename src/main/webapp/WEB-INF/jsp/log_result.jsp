<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<%
String going_to=(String)session.getAttribute("GOING_TO");
String prepareGoingTo=(String)session.getAttribute("prepareGoingTo");
String backGoingTo=(String)session.getAttribute("backGoingTo");

if(going_to!=null){
	response.sendRedirect(going_to);
}else if(prepareGoingTo!=null){
	if(session.getAttribute("error")!=null){
		response.sendRedirect(backGoingTo);
	}else{
		response.sendRedirect(prepareGoingTo);
	}
}
%>
<body>

</body>
</html>