<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
if(null!=session.getAttribute("progress")){

	out.print(session.getAttribute("progress").toString());
	}
%>