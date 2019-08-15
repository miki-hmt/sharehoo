

                 <!-- 导入java.sql.*包 -->
<%@page import="javax.swing.text.StyleContext.SmallAttributeSet"%>
<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>首页</title>
<style type="text/css">

</style>
</head>
<body>
   
                                        <!-- 显示所有注册用户信息      2016.10.13-->
<%@ page contentType="text/html;charset=utf-8" %> 
<% java.sql.Connection sqlCon; //数据库连接对象  
java.sql.Statement sqlStmt; //SQL语句对象  
java.sql.ResultSet sqlRst; //结果集对象  
java.lang.String strCon; //数据库连接字符串  
java.lang.String strSQL; //SQL语句  



int PageSize=5; //设置一页显示的记录数  
int RowCount; //记录总数  
int PageCount; //总页数  
int Page; //默认显示页  
java.lang.String strPage;  
int i;  

                           //*************连接数据库，获取数据 2016.10.14**********************     
                                 
//第一步：加载数据库驱动 
   	Class.forName("com.mysql.jdbc.Driver");
  

//第二步：创建数据库连接 ,连接url为：jdbc：MySQL://服务器地址/数据库名，
Connection ct=DriverManager.getConnection("jdbc:mysql://localhost:3306/db_forum","root","root");
  
//第三步  创建statement语句对象 ，调用数据库 Statement sm=ct.createStatement(); 
sqlStmt = ct.createStatement(java.sql.ResultSet.TYPE_SCROLL_INSENSITIVE,java.sql.  
ResultSet.CONCUR_READ_ONLY); //执行SQL语句  
strSQL = "select * from t_topic where good=1 ";  

//取得待显示页码，默认为第一页   
strPage = request.getParameter("page");  
if(strPage==null){  
		//表明在QueryString中没有page这一个参数，此时显示第一页数据  
	Page = 1;  
	} else{  
		//将字符串转换成整型  
		Page = java.lang.Integer.parseInt(strPage);  
		if(Page< 1) Page = 1;  
	} 
	 
//执行SQL语句并获取结果集  
sqlRst = sqlStmt.executeQuery(strSQL);  
//获取记录总数  
sqlRst.last();  //光标在最后一行  
RowCount = sqlRst.getRow();  //获得当前行号 
//记算总页数  
PageCount = (RowCount+PageSize-1) / PageSize;  
//调整待显示的页码  ，超过总页数，显示最后一页 
if(Page>PageCount)
	 Page = PageCount;  
%> 

<table border="1" cellspacing="0" cellpadding="0"> 
<tr> 
<th>名称</th>
<th>id</th>
</tr> 
<% if(PageCount>0)  
{  
//将记录指针定位到待显示页的第一条记录上  
sqlRst.absolute((Page-1) * PageSize + 1);  
//显示数据  
i = 0;  
while(i<PageSize && !sqlRst.isAfterLast()){ %> 


<tr> 
<td><%=sqlRst.getString(5) %></td>
<td align="center"><%=sqlRst.getInt(1) %></td>
</tr> 

<% 
sqlRst.next();  
i++;  
}  
}  
%> 
</table> 
<form method="post" action="test.jsp">
第<%=Page%>页 共<%=PageCount%>页  
<%if(Page<PageCount)   //说明总页数大于当前页，还有下一页 
{%><a href="test.jsp?page=<%=Page+1%>">下一页</a><%}%> 
<%if(Page>1)
{%> <a href="test.jsp?page=<%=Page-1%>">上一页</a><%} %> 
跳转到第:<input type="text" name="page" size="8"/>页
<span>
<input class="buttonface" type="submit" value="GO"/>
</span>
</form>
<%  
//关闭结果集  
sqlRst.close();  
//关闭SQL语句对象  
sqlStmt.close();  
//关闭数据库  
ct.close();  
%> 
	
	
</body>
</html>