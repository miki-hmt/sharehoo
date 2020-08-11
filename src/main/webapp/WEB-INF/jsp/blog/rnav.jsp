<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <div class="rnav">
      <li class="rnav1 "><a href="http://sharehoo.cn">sharehoo社区</a></li>
      <li class="rnav2 "><a href="#">QQ空间</a></li>
      <li class="rnav3 "><a href="#">程序</a></li>
      <li class="rnav4 "><a href="#">个人作品</a></li>
      <c:forEach items="${tags }" var="tag">
      	<li class="rnav4 "><a href="#">${tag }</a></li>
      </c:forEach>
      <li class="rnav1 "><a href="#" onClick="openWin('${host}/tag/add/${user.id}','tag','550','600')">添加+</a></li>
 </div>
 <script type="text/javascript">
 	function openWin(url,name,iWidth,iHeight) { 
            //获得窗口的垂直位置 
            var iTop = (window.screen.availHeight - 30 - iHeight) / 2; 
            //获得窗口的水平位置 
            var iLeft = (window.screen.availWidth - 10 - iWidth) / 2; 
            window.open(url, name, 'height=' + iHeight + ',innerHeight=' + iHeight + ',width=' + iWidth + ',innerWidth=' + iWidth + ',top=' + iTop + ',left=' + iLeft + ',status=no,toolbar=no,menubar=no,location=no,resizable=no,scrollbars=0,titlebar=no'); 
        }
 </script>