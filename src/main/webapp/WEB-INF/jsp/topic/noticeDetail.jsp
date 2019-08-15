<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!--修改日期格式只显示年月日  -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />
<link rel="stylesheet" href="css/css1.css">
<title>IT帮-资讯传播社区--公告页面</title>
</head>
<body bgcolor="#E9E9E9">
<table width="500" height="200" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="39" colspan="2">
      <p align="center"><font size="7" face="隶书">公告信息</font></td>
  </tr>

  <tr>
    <td width="31%" height="37"><div align="center"><font size="5">标题： </font></div></td>
    <td width="69%"><font size="5">${notice.name } </font></td>
  </tr>
  <tr>
    <td width="31%" height="32"><div align="center">公告内容：</div></td>
    <td width="69%" height="32"><textarea style="width:200px;height:170px;">${notice.content }</textarea> </td>
  </tr>

<tr>
<td width="31%" height="27"><div align="center">发布时间： </div></td>
<td width="69%" height="27"><fmt:formatDate value="${notice.pubDate }" pattern="yyyy-MM-dd "/></td>
</tr>


<tr><td height="27" colspan="2" align="center">
<input type="button" name="wclose" value="关闭窗口" onClick="window.close()">
</td>
</tr>
</table>

</body>
</html>