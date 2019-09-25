<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${host}/shop/css/qiandao_style.css">
<title>签到-sharehoo社区</title>
</head>
<body>

	 <div class="qiandao-warp">
        <div class="qiandap-box">
            <div class="qiandao-banner">
                <img src="${host}/shop/images/qiandao_banner.jpg" height="551" width="1120" alt="">
            </div>
            <div class="qiandao-con clear">
                <div class="qiandao-left">
                    <div class="qiandao-left-top clear">
                        <div class="current-date">2018年2月1日</div>
                        <div class="qiandao-history qiandao-tran qiandao-radius" id="js-qiandao-history">我的签到</div>
                    </div>
                    <div class="qiandao-main" id="js-qiandao-main">
                        <ul class="qiandao-list" id="js-qiandao-list">
                        </ul>
                    </div>
                </div>
                <div class="qiandao-right">
                    <div class="qiandao-top">
                    	<c:choose>
                    		<c:when test="${flag==1 }">
                    			<div class="just-qiandao qiandao-sprits actived" id="js-just-qiandao">
                        		</div>
                        		<p class="qiandao-notic" id="qida">今日已领<span>1</span>虎豆，请明日继续签到</p>
                    		</c:when>
                    		<c:otherwise>
                    			<div class="just-qiandao qiandao-sprits" id="js-just-qiandao">
                        		</div>
                    		</c:otherwise>
                    	</c:choose>                   
                    </div>
                    <div class="qiandao-bottom">
                        <div class="qiandao-rule-list">
                            <h4>签到规则</h4>
                            <p>首次签到获得1虎豆奖励</p>
                            <p>连续签到7天额外获得4虎豆奖励</p>
                            <p>1虎豆等价于1元现金</p>
                        </div>
                        <div class="qiandao-rule-list">
                            <h4>其他说明</h4>
                            <p>如果中间有一天间断未签到的，重先开始计算连续签到时间。</p>
                            <p>连续签到获得奖励后分享到QQ空间、微信朋友圈后再获得一次奖励，每天只限分享一次。</p>
                            <p>获得的奖励不能直接提现，只能用于社区内资源下载。</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 我的签到 layer start -->
    <div class="qiandao-layer qiandao-history-layer">
        <div class="qiandao-layer-con qiandao-radius">
            <a href="javascript:;" class="close-qiandao-layer qiandao-sprits"></a>
            <ul class="qiandao-history-inf clear">
                <li>
                    <p>连续签到</p>
                    <h4>${nowSign.sign_continue }</h4>
                </li>
                <li>
                    <p>本月签到</p>
                    <h4>${count }</h4>
                </li>
                <li>
                    <p>总共签到数</p>
                    <h4>${nowSign.sign_total }</h4>
                </li>
                <li>
                    <p>签到累计奖励</p>
                    <h4>${nowSign.dou_total }</h4>
                </li>
            </ul>
            <div class="qiandao-history-table">
                <table>
                    <thead>
                        <tr>
                            <th>签到日期</th>
                            <th>奖励</th>
                            <th>说明</th>
                        </tr>
                    </thead>
                    <table>
                    	<c:forEach items="${signs}" var="operate">
                    		<tr>
                            <td><fmt:formatDate value="${operate.operate_time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <c:choose>
                            	<c:when test="${not empty operate.notice}">
                            		 <td>5</td>
                            		<td>连续签到七天奖励</td>
                            	</c:when>
                            	<c:otherwise>
                            		<td>1</td>
                            		<td>签到奖励</td>
                            	</c:otherwise>
                            </c:choose>
                           
                        </tr>
                    	</c:forEach>              
                    </table>
                </table>
            </div>
        </div>
        <div class="qiandao-layer-bg"></div>
    </div>
    <!-- 我的签到 layer end -->
    <!-- 签到 layer start -->
    <div class="qiandao-layer qiandao-active">
    			<div class="qiandao-layer-con qiandao-radius">
		            <a href="javascript:;" class="close-qiandao-layer qiandao-sprits"></a>
		            <div class="yiqiandao clear">
		                <div class="yiqiandao-icon qiandao-sprits"></div>您已连续签到<span id="conti">1</span>天
		            </div>
		            <div class="qiandao-jiangli qiandao-sprits">
		                <span class="qiandao-jiangli-num" id="hu">1</span>
		            </div>
		            <a href="javascript:;" class="qiandao-share qiandao-tran">关闭</a>
		        </div>   	
        
        <div class="qiandao-layer-bg"></div>
    </div>
    <!-- 签到 layer end -->
    <script src="${host}/shop/js/qiandao/jquery-1.10.2.min.js"></script>
    <script src="${host}/shop/js/qiandao/qiandao_js.js"></script>

</body>
</html>