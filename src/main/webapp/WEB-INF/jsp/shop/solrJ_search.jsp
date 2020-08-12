<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
     <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>下载频道 - sharehoo.cn - IT帮-资讯传播社区</title>
<meta name="description" content="下载频道 - sharehoo.cn" />
<meta name="keywords" content="" />
<meta name="author" content="sharehoo" />
<meta name="Copyright" content="sharehoo" />
<meta name="baidu-site-verification" content="5qKL5WPafahaSFtZ" />
<meta http-equiv="X-UA-Compatible" content="IE=8,9" />
<script type="text/javascript">(window.NREUM||(NREUM={})).loader_config={xpid:"VQQBVVNXChABXFhbDgEFVA=="};window.NREUM||(NREUM={}),__nr_require=function(t,n,e){function r(e){if(!n[e]){var o=n[e]={exports:{}};t[e][0].call(o.exports,function(n){var o=t[e][1][n];return r(o||n)},o,o.exports)}return n[e].exports}if("function"==typeof __nr_require)return __nr_require;for(var o=0;o<e.length;o++)r(e[o]);return r}({1:[function(t,n,e){function r(t){try{s.console&&console.log(t)}catch(n){}}var o,i=t("ee"),a=t(15),s={};try{o=localStorage.getItem("__nr_flags").split(","),console&&"function"==typeof console.log&&(s.console=!0,o.indexOf("dev")!==-1&&(s.dev=!0),o.indexOf("nr_dev")!==-1&&(s.nrDev=!0))}catch(c){}s.nrDev&&i.on("internal-error",function(t){r(t.stack)}),s.dev&&i.on("fn-err",function(t,n,e){r(e.stack)}),s.dev&&(r("NR AGENT IN DEVELOPMENT MODE"),r("flags: "+a(s,function(t,n){return t}).join(", ")))},{}],2:[function(t,n,e){function r(t,n,e,r,o){try{d?d-=1:i("err",[o||new UncaughtException(t,n,e)])}catch(s){try{i("ierr",[s,c.now(),!0])}catch(u){}}return"function"==typeof f&&f.apply(this,a(arguments))}function UncaughtException(t,n,e){this.message=t||"Uncaught error with no additional information",this.sourceURL=n,this.line=e}function o(t){i("err",[t,c.now()])}var i=t("handle"),a=t(16),s=t("ee"),c=t("loader"),f=window.onerror,u=!1,d=0;c.features.err=!0,t(1),window.onerror=r;try{throw new Error}catch(l){"stack"in l&&(t(8),t(7),"addEventListener"in window&&t(5),c.xhrWrappable&&t(9),u=!0)}s.on("fn-start",function(t,n,e){u&&(d+=1)}),s.on("fn-err",function(t,n,e){u&&(this.thrown=!0,o(e))}),s.on("fn-end",function(){u&&!this.thrown&&d>0&&(d-=1)}),s.on("internal-error",function(t){i("ierr",[t,c.now(),!0])})},{}],3:[function(t,n,e){t("loader").features.ins=!0},{}],4:[function(t,n,e){function r(t){}if(window.performance&&window.performance.timing&&window.performance.getEntriesByType){var o=t("ee"),i=t("handle"),a=t(8),s=t(7),c="learResourceTimings",f="addEventListener",u="resourcetimingbufferfull",d="bstResource",l="resource",p="-start",h="-end",m="fn"+p,w="fn"+h,v="bstTimer",y="pushState",g=t("loader");g.features.stn=!0,t(6);var b=NREUM.o.EV;o.on(m,function(t,n){var e=t[0];e instanceof b&&(this.bstStart=g.now())}),o.on(w,function(t,n){var e=t[0];e instanceof b&&i("bst",[e,n,this.bstStart,g.now()])}),a.on(m,function(t,n,e){this.bstStart=g.now(),this.bstType=e}),a.on(w,function(t,n){i(v,[n,this.bstStart,g.now(),this.bstType])}),s.on(m,function(){this.bstStart=g.now()}),s.on(w,function(t,n){i(v,[n,this.bstStart,g.now(),"requestAnimationFrame"])}),o.on(y+p,function(t){this.time=g.now(),this.startPath=location.pathname+location.hash}),o.on(y+h,function(t){i("bstHist",[location.pathname+location.hash,this.startPath,this.time])}),f in window.performance&&(window.performance["c"+c]?window.performance[f](u,function(t){i(d,[window.performance.getEntriesByType(l)]),window.performance["c"+c]()},!1):window.performance[f]("webkit"+u,function(t){i(d,[window.performance.getEntriesByType(l)]),window.performance["webkitC"+c]()},!1)),document[f]("scroll",r,{passive:!0}),document[f]("keypress",r,!1),document[f]("click",r,!1)}},{}],5:[function(t,n,e){function r(t){for(var n=t;n&&!n.hasOwnProperty(u);)n=Object.getPrototypeOf(n);n&&o(n)}function o(t){s.inPlace(t,[u,d],"-",i)}function i(t,n){return t[1]}var a=t("ee").get("events"),s=t(18)(a,!0),c=t("gos"),f=XMLHttpRequest,u="addEventListener",d="removeEventListener";n.exports=a,"getPrototypeOf"in Object?(r(document),r(window),r(f.prototype)):f.prototype.hasOwnProperty(u)&&(o(window),o(f.prototype)),a.on(u+"-start",function(t,n){var e=t[1],r=c(e,"nr@wrapped",function(){function t(){if("function"==typeof e.handleEvent)return e.handleEvent.apply(e,arguments)}var n={object:t,"function":e}[typeof e];return n?s(n,"fn-",null,n.name||"anonymous"):e});this.wrapped=t[1]=r}),a.on(d+"-start",function(t){t[1]=this.wrapped||t[1]})},{}],6:[function(t,n,e){var r=t("ee").get("history"),o=t(18)(r);n.exports=r,o.inPlace(window.history,["pushState","replaceState"],"-")},{}],7:[function(t,n,e){var r=t("ee").get("raf"),o=t(18)(r),i="equestAnimationFrame";n.exports=r,o.inPlace(window,["r"+i,"mozR"+i,"webkitR"+i,"msR"+i],"raf-"),r.on("raf-start",function(t){t[0]=o(t[0],"fn-")})},{}],8:[function(t,n,e){function r(t,n,e){t[0]=a(t[0],"fn-",null,e)}function o(t,n,e){this.method=e,this.timerDuration=isNaN(t[1])?0:+t[1],t[0]=a(t[0],"fn-",this,e)}var i=t("ee").get("timer"),a=t(18)(i),s="setTimeout",c="setInterval",f="clearTimeout",u="-start",d="-";n.exports=i,a.inPlace(window,[s,"setImmediate"],s+d),a.inPlace(window,[c],c+d),a.inPlace(window,[f,"clearImmediate"],f+d),i.on(c+u,r),i.on(s+u,o)},{}],9:[function(t,n,e){function r(t,n){d.inPlace(n,["onreadystatechange"],"fn-",s)}function o(){var t=this,n=u.context(t);t.readyState>3&&!n.resolved&&(n.resolved=!0,u.emit("xhr-resolved",[],t)),d.inPlace(t,y,"fn-",s)}function i(t){g.push(t),h&&(x?x.then(a):w?w(a):(E=-E,O.data=E))}function a(){for(var t=0;t<g.length;t++)r([],g[t]);g.length&&(g=[])}function s(t,n){return n}function c(t,n){for(var e in t)n[e]=t[e];return n}t(5);var f=t("ee"),u=f.get("xhr"),d=t(18)(u),l=NREUM.o,p=l.XHR,h=l.MO,m=l.PR,w=l.SI,v="readystatechange",y=["onload","onerror","onabort","onloadstart","onloadend","onprogress","ontimeout"],g=[];n.exports=u;var b=window.XMLHttpRequest=function(t){var n=new p(t);try{u.emit("new-xhr",[n],n),n.addEventListener(v,o,!1)}catch(e){try{u.emit("internal-error",[e])}catch(r){}}return n};if(c(p,b),b.prototype=p.prototype,d.inPlace(b.prototype,["open","send"],"-xhr-",s),u.on("send-xhr-start",function(t,n){r(t,n),i(n)}),u.on("open-xhr-start",r),h){var x=m&&m.resolve();if(!w&&!m){var E=1,O=document.createTextNode(E);new h(a).observe(O,{characterData:!0})}}else f.on("fn-end",function(t){t[0]&&t[0].type===v||a()})},{}],10:[function(t,n,e){function r(t){var n=this.params,e=this.metrics;if(!this.ended){this.ended=!0;for(var r=0;r<d;r++)t.removeEventListener(u[r],this.listener,!1);if(!n.aborted){if(e.duration=a.now()-this.startTime,4===t.readyState){n.status=t.status;var i=o(t,this.lastSize);if(i&&(e.rxSize=i),this.sameOrigin){var c=t.getResponseHeader("X-NewRelic-App-Data");c&&(n.cat=c.split(", ").pop())}}else n.status=0;e.cbTime=this.cbTime,f.emit("xhr-done",[t],t),s("xhr",[n,e,this.startTime])}}}function o(t,n){var e=t.responseType;if("json"===e&&null!==n)return n;var r="arraybuffer"===e||"blob"===e||"json"===e?t.response:t.responseText;return h(r)}function i(t,n){var e=c(n),r=t.params;r.host=e.hostname+":"+e.port,r.pathname=e.pathname,t.sameOrigin=e.sameOrigin}var a=t("loader");if(a.xhrWrappable){var s=t("handle"),c=t(11),f=t("ee"),u=["load","error","abort","timeout"],d=u.length,l=t("id"),p=t(14),h=t(13),m=window.XMLHttpRequest;a.features.xhr=!0,t(9),f.on("new-xhr",function(t){var n=this;n.totalCbs=0,n.called=0,n.cbTime=0,n.end=r,n.ended=!1,n.xhrGuids={},n.lastSize=null,p&&(p>34||p<10)||window.opera||t.addEventListener("progress",function(t){n.lastSize=t.loaded},!1)}),f.on("open-xhr-start",function(t){this.params={method:t[0]},i(this,t[1]),this.metrics={}}),f.on("open-xhr-end",function(t,n){"loader_config"in NREUM&&"xpid"in NREUM.loader_config&&this.sameOrigin&&n.setRequestHeader("X-NewRelic-ID",NREUM.loader_config.xpid)}),f.on("send-xhr-start",function(t,n){var e=this.metrics,r=t[0],o=this;if(e&&r){var i=h(r);i&&(e.txSize=i)}this.startTime=a.now(),this.listener=function(t){try{"abort"===t.type&&(o.params.aborted=!0),("load"!==t.type||o.called===o.totalCbs&&(o.onloadCalled||"function"!=typeof n.onload))&&o.end(n)}catch(e){try{f.emit("internal-error",[e])}catch(r){}}};for(var s=0;s<d;s++)n.addEventListener(u[s],this.listener,!1)}),f.on("xhr-cb-time",function(t,n,e){this.cbTime+=t,n?this.onloadCalled=!0:this.called+=1,this.called!==this.totalCbs||!this.onloadCalled&&"function"==typeof e.onload||this.end(e)}),f.on("xhr-load-added",function(t,n){var e=""+l(t)+!!n;this.xhrGuids&&!this.xhrGuids[e]&&(this.xhrGuids[e]=!0,this.totalCbs+=1)}),f.on("xhr-load-removed",function(t,n){var e=""+l(t)+!!n;this.xhrGuids&&this.xhrGuids[e]&&(delete this.xhrGuids[e],this.totalCbs-=1)}),f.on("addEventListener-end",function(t,n){n instanceof m&&"load"===t[0]&&f.emit("xhr-load-added",[t[1],t[2]],n)}),f.on("removeEventListener-end",function(t,n){n instanceof m&&"load"===t[0]&&f.emit("xhr-load-removed",[t[1],t[2]],n)}),f.on("fn-start",function(t,n,e){n instanceof m&&("onload"===e&&(this.onload=!0),("load"===(t[0]&&t[0].type)||this.onload)&&(this.xhrCbStart=a.now()))}),f.on("fn-end",function(t,n){this.xhrCbStart&&f.emit("xhr-cb-time",[a.now()-this.xhrCbStart,this.onload,n],n)})}},{}],11:[function(t,n,e){n.exports=function(t){var n=document.createElement("a"),e=window.location,r={};n.href=t,r.port=n.port;var o=n.href.split("://");!r.port&&o[1]&&(r.port=o[1].split("index.html")[0].split("@").pop().split(":")[1]),r.port&&"0"!==r.port||(r.port="https"===o[0]?"443":"80"),r.hostname=n.hostname||e.hostname,r.pathname=n.pathname,r.protocol=o[0],"/"!==r.pathname.charAt(0)&&(r.pathname="/"+r.pathname);var i=!n.protocol||":"===n.protocol||n.protocol===e.protocol,a=n.hostname===document.domain&&n.port===e.port;return r.sameOrigin=i&&(!n.hostname||a),r}},{}],12:[function(t,n,e){function r(){}function o(t,n,e){return function(){return i(t,[f.now()].concat(s(arguments)),n?null:this,e),n?void 0:this}}var i=t("handle"),a=t(15),s=t(16),c=t("ee").get("tracer"),f=t("loader"),u=NREUM;"undefined"==typeof window.newrelic&&(newrelic=u);var d=["setPageViewName","setCustomAttribute","setErrorHandler","finished","addToTrace","inlineHit","addRelease"],l="api-",p=l+"ixn-";a(d,function(t,n){u[n]=o(l+n,!0,"api")}),u.addPageAction=o(l+"addPageAction",!0),u.setCurrentRouteName=o(l+"routeName",!0),n.exports=newrelic,u.interaction=function(){return(new r).get()};var h=r.prototype={createTracer:function(t,n){var e={},r=this,o="function"==typeof n;return i(p+"tracer",[f.now(),t,e],r),function(){if(c.emit((o?"":"no-")+"fn-start",[f.now(),r,o],e),o)try{return n.apply(this,arguments)}finally{c.emit("fn-end",[f.now()],e)}}}};a("setName,setAttribute,save,ignore,onEnd,getContext,end,get".split(","),function(t,n){h[n]=o(p+n)}),newrelic.noticeError=function(t){"string"==typeof t&&(t=new Error(t)),i("err",[t,f.now()])}},{}],13:[function(t,n,e){n.exports=function(t){if("string"==typeof t&&t.length)return t.length;if("object"==typeof t){if("undefined"!=typeof ArrayBuffer&&t instanceof ArrayBuffer&&t.byteLength)return t.byteLength;if("undefined"!=typeof Blob&&t instanceof Blob&&t.size)return t.size;if(!("undefined"!=typeof FormData&&t instanceof FormData))try{return JSON.stringify(t).length}catch(n){return}}}},{}],14:[function(t,n,e){var r=0,o=navigator.userAgent.match(/Firefox[\/\s](\d+\.\d+)/);o&&(r=+o[1]),n.exports=r},{}],15:[function(t,n,e){function r(t,n){var e=[],r="",i=0;for(r in t)o.call(t,r)&&(e[i]=n(r,t[r]),i+=1);return e}var o=Object.prototype.hasOwnProperty;n.exports=r},{}],16:[function(t,n,e){function r(t,n,e){n||(n=0),"undefined"==typeof e&&(e=t?t.length:0);for(var r=-1,o=e-n||0,i=Array(o<0?0:o);++r<o;)i[r]=t[n+r];return i}n.exports=r},{}],17:[function(t,n,e){n.exports={exists:"undefined"!=typeof window.performance&&window.performance.timing&&"undefined"!=typeof window.performance.timing.navigationStart}},{}],18:[function(t,n,e){function r(t){return!(t&&t instanceof Function&&t.apply&&!t[a])}var o=t("ee"),i=t(16),a="nr@original",s=Object.prototype.hasOwnProperty,c=!1;n.exports=function(t,n){function e(t,n,e,o){function nrWrapper(){var r,a,s,c;try{a=this,r=i(arguments),s="function"==typeof e?e(r,a):e||{}}catch(f){l([f,"",[r,a,o],s])}u(n+"start",[r,a,o],s);try{return c=t.apply(a,r)}catch(d){throw u(n+"err",[r,a,d],s),d}finally{u(n+"end",[r,a,c],s)}}return r(t)?t:(n||(n=""),nrWrapper[a]=t,d(t,nrWrapper),nrWrapper)}function f(t,n,o,i){o||(o="");var a,s,c,f="-"===o.charAt(0);for(c=0;c<n.length;c++)s=n[c],a=t[s],r(a)||(t[s]=e(a,f?s+o:o,i,s))}function u(e,r,o){if(!c||n){var i=c;c=!0;try{t.emit(e,r,o,n)}catch(a){l([a,e,r,o])}c=i}}function d(t,n){if(Object.defineProperty&&Object.keys)try{var e=Object.keys(t);return e.forEach(function(e){Object.defineProperty(n,e,{get:function(){return t[e]},set:function(n){return t[e]=n,n}})}),n}catch(r){l([r])}for(var o in t)s.call(t,o)&&(n[o]=t[o]);return n}function l(n){try{t.emit("internal-error",n)}catch(e){}}return t||(t=o),e.inPlace=f,e.flag=a,e}},{}],ee:[function(t,n,e){function r(){}function o(t){function n(t){return t&&t instanceof r?t:t?c(t,s,i):i()}function e(e,r,o,i){if(!l.aborted||i){t&&t(e,r,o);for(var a=n(o),s=h(e),c=s.length,f=0;f<c;f++)s[f].apply(a,r);var d=u[y[e]];return d&&d.push([g,e,r,a]),a}}function p(t,n){v[t]=h(t).concat(n)}function h(t){return v[t]||[]}function m(t){return d[t]=d[t]||o(e)}function w(t,n){f(t,function(t,e){n=n||"feature",y[e]=n,n in u||(u[n]=[])})}var v={},y={},g={on:p,emit:e,get:m,listeners:h,context:n,buffer:w,abort:a,aborted:!1};return g}function i(){return new r}function a(){(u.api||u.feature)&&(l.aborted=!0,u=l.backlog={})}var s="nr@context",c=t("gos"),f=t(15),u={},d={},l=n.exports=o();l.backlog=u},{}],gos:[function(t,n,e){function r(t,n,e){if(o.call(t,n))return t[n];var r=e();if(Object.defineProperty&&Object.keys)try{return Object.defineProperty(t,n,{value:r,writable:!0,enumerable:!1}),r}catch(i){}return t[n]=r,r}var o=Object.prototype.hasOwnProperty;n.exports=r},{}],handle:[function(t,n,e){function r(t,n,e,r){o.buffer([t],r),o.emit(t,n,e)}var o=t("ee").get("handle");n.exports=r,r.ee=o},{}],id:[function(t,n,e){function r(t){var n=typeof t;return!t||"object"!==n&&"function"!==n?-1:t===window?0:a(t,i,function(){return o++})}var o=1,i="nr@id",a=t("gos");n.exports=r},{}],loader:[function(t,n,e){function r(){if(!x++){var t=b.info=NREUM.info,n=l.getElementsByTagName("script")[0];if(setTimeout(u.abort,3e4),!(t&&t.licenseKey&&t.applicationID&&n))return u.abort();f(y,function(n,e){t[n]||(t[n]=e)}),c("mark",["onload",a()+b.offset],null,"api");var e=l.createElement("script");e.src="https://"+t.agent,n.parentNode.insertBefore(e,n)}}function o(){"complete"===l.readyState&&i()}function i(){c("mark",["domContent",a()+b.offset],null,"api")}function a(){return E.exists&&performance.now?Math.round(performance.now()):(s=Math.max((new Date).getTime(),s))-b.offset}var s=(new Date).getTime(),c=t("handle"),f=t(15),u=t("ee"),d=window,l=d.document,p="addEventListener",h="attachEvent",m=d.XMLHttpRequest,w=m&&m.prototype;NREUM.o={ST:setTimeout,SI:d.setImmediate,CT:clearTimeout,XHR:m,REQ:d.Request,EV:d.Event,PR:d.Promise,MO:d.MutationObserver};var v=""+location,y={beacon:"bam.nr-data.net",errorBeacon:"bam.nr-data.net",agent:"js-agent.newrelic.com/nr-1039.min.js"},g=m&&w&&w[p]&&!/CriOS/.test(navigator.userAgent),b=n.exports={offset:s,now:a,origin:v,features:{},xhrWrappable:g};t(12),l[p]?(l[p]("DOMContentLoaded",i,!1),d[p]("load",r,!1)):(l[h]("onreadystatechange",o),d[h]("onload",r)),c("mark",["firstbyte",s],null,"api");var x=0,E=t(17)},{}]},{},["loader",2,10,4,3]);</script>
<meta name="renderer" content="webkit|ie-stand" />
<link href="${pageContext.request.contextPath}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />
<meta name="apple-mobile-web-app-status-bar-style" content="yes">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/index.css">

<!-- 尾部分页 css页码 	2017.08.03 miki-->
<link href="${pageContext.request.contextPath }/blog/include/css/page.css" rel="stylesheet"/>

<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/common.css">
<link href="${pageContext.request.contextPath}/shop/css/quake.slider.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/font-awesome-4.4.0/css/font-awesome.min.css">
<script src="${pageContext.request.contextPath}/shop/js/jquery.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/shop/js/quake.slider-min.js" type="text/javascript"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/download_index.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/download_new.css">
<script src="${pageContext.request.contextPath}/shop/js/animateBackground-plugin.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/shop/js/tabSwitch.js" defer></script>
<script src="${pageContext.request.contextPath}/shop/js/html5shiv.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/shop/js/placeholder.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/shop/js/notify.js"></script>
<script language="javascript" type="text/javascript" src="${pageContext.request.contextPath}/shop/js/async_new.js"></script>

<script type="text/javascript">
	function validateLogin(){
		if ('${currentUser.nickName}'==null||'${currentUser.nickName}'=="") {
			alert("您还未登陆！");
		} else {
			window.location.href="${host}/shop/center";
		}	
}
</script>

<script type="text/javascript">
	function Login(){	
		 if ('${currentUser.nickName}'==null||'${currentUser.nickName}'=="") {
		var curPage=window.location.href;
		window.location.href="${pageContext.request.contextPath}/login?prePage="+curPage;
		 }else{
			  alert("上了还想上嘛？");
		  }
}
</script>
</head>
<body>
	<c:choose>
		 <c:when test="${currentUser==null }">
		 	<script id="toolbar-tpl-scriptId" prod="download" skin="black" src="${pageContext.request.contextPath}/shop/js/html.js" type="text/javascript"></script>	
		 </c:when>
		 <c:otherwise>
		 	 <%@ include file="./common/login.jsp" %> 
		 </c:otherwise>
	</c:choose>
<div class="news-nav">
	<div class="container clearfix">
		<div class="nav-bar">
			<a href="${host}/shop/index.htm">首页</a>
			<a href="${pageContext.request.contextPath}/shop/${host}/shop/source/serach" target="_blank" class="current">资源分类</a>
			<a class=" " href="${host}/shop/rank" target="_blank">精品铺子</a>
			<a class=" " href="#" target="_blank">热搜模块</a>
			<a href="#" target="_blank">下载排行</a>			
			<a class=" " href="${pageContext.request.contextPath}/" target="_blank">论坛</a>			
			<a href="${pageContext.request.contextPath}/shop/cdk/buy" target="_blank">虎豆充值</a>
			<a href="javascript:void(0)" onclick="javascript:validateLogin()" target="_blank">我的店铺</a>
		</div>
		<div class="search-download">
			<form action="Shop_search.action" method="post" onsubmit="return check_up(this);" name="download_search">
				<input type="text" placeholder="搜索资源" value="" id="tagff" name="keywords"/>
				<a href="javascript:check_up(download_search);void(0);" class="download-search-bth"></a>
			</form>
			<a href="help.html" class="help"><i class="fa fa-question-circle"></i>帮助</a>
		</div>
	</div>
</div>
<!-- //顶部登录部分js选择器	引入login文件的js，	2017.09.09 miki -->
	
<!-- <script type="text/javascript" src="/js/search-service/main.js" charset="utf-8"></script> -->
<script type="text/javascript">
	
$(document).ready(function() {
	document.getElementById("keywords").value="${search}";
	//处理特殊字符 start
	var keywords = $(".keywords").val().trim();
	keywords = keywords.replace(/C/i, "c");
	keywords = encodeURIComponent(keywords);
	// %23表示 #
	if(keywords.indexOf('c%23') >= 0){
		keywords = keywords.replace("c%23",'c井');
	}
    if(keywords != ''){
    	var gItem = $(".pageliststy");
        gItem.each(function(){
        	var _this = $(this);
        	var gUrl = _this.attr('href') || false;
        	if(!gUrl) return false; 
        	else{
        		gUrl = gUrl.replace("c#",'c井');
        		_this.attr("href",gUrl);
            }
        });

        var aItem = $(".cate_search_t_l a");
        aItem.each(function(){
        	var _this = $(this);
        	var sUrl = _this.attr('href') || false;
        	if(!sUrl) return false; 
        	else{
        		sUrl = sUrl.replace("c#",'c井');
        		_this.attr("href",sUrl);
            }
        });
        $("#keywords").attr("href",'${host}/shop/source/search?keyword='+encodeURIComponent(keywords));
    }
	//处理特殊字符 end	
})

function KeyP(event){
	var code = (navigator.appname=="Netscape")?event.which:event.keyCode;
	var keywords = $(".keywords").val().trim();
	keywords = keywords.replace(/C/i, "c");
	keywords = encodeURIComponent(keywords);
	// %2F表示 /  %2C为 ,   %5C为 \
	if(keywords.indexOf("%2F") >= 0 ){
		keywords = keywords.replace('%2F', '%2C');
	}
	if(keywords.indexOf('%5C') >= 0 ){
		keywords = keywords.replace('%5C', '%2C');
	}
	if(keywords.indexOf('c%23') >= 0 ){
		keywords = keywords.replace("c%23",'c井');
	}
    if(code == 13 && keywords != ''){
    	keywords = encodeURIComponent(keywords)
		window.location.href = "${host}/shop/source/search?categoryId="+categoryid +"&typeId="+sourcetype+"&keyword="+keywords ;
    }
    $("#keywords").attr("href",'${host}/shop/source/search?categoryId='+categoryid +'&typeId='+sourcetype+'&keyword='+keywords);
	if(keywords == ''){
        $("#keywords").attr("href",'');
	}
}

</script>
	
   <script type="text/javascript" src="${pageContext.request.contextPath}/shop/js/toolbar.js" defer></script>
    
    <div class="meeting_main">
    	<div class="ad_wrap clearfix">
		      <div class="top_ad_box clearfix">
				<div class="top_ad_t">
		        	<!-- 广告位开始 -->					
					<!-- 广告位结束 -->
				</div>
				<div class="top_ad_b">
			      	<!-- 广告位开始 -->				
					<!-- 广告位结束 -->
			      	</div>
		      	</div>
		      	<div class="top_ad_r_box">
		        	<!-- 广告位开始 -->					
					<!-- 广告位结束 -->
	        	</div>
	  </div>
    
      <div style="height:20px;"></div>
      <div class="download_new clearfix">
        <div class="download_l fl">
          <div class="dl_wrap">
            <dl class="cate_sea_list clearfix">
              <dt>技术领域：</dt>
              <dd>
                <ul class="cate_list" id="categoryid1">
                	<li bate-id="0" class="">
	                  	<a href="javascript:void(0);" onclick="javascript:close();">
	                  		全部
	                  	</a>
	                  </li>              
                  <c:forEach items="${categories}" var="category">            
                  	<c:choose>
                  		<c:when test="${category.name eq curCategory.name}">              			
                  			<li bate-id="${category.id }" class="cate_cur" style="line-height:25px;"><a href="javascript:void(0);" 
                  				onclick="javascript:show()">${category.name}</a></li>
                  		</c:when>
                  		<c:otherwise>            	
                         	<li bate-id="${category.id }" class="" style="line-height:25px;"><a href="javascript:void(0);" 
                         		onclick="javascript:show()">${category.name}</a></li>
                     	</c:otherwise>
                  	</c:choose>
                  </c:forEach>
                  
                </ul>
                
                <!-- *******************显示目录下的菜单列表	2019.09.17	miki
                ************************************************************************** -->
                <c:choose>
	                <c:when test="${fn:length(menus)==0}">
	                	<div class="subSearch" id="sonSearch" style="display:none;">
	                  		<img class="sub_img" src="${pageContext.request.contextPath}/shop/images/logo/san.jpg" alt="img">
	                         <a href="/search/12001/10/0/1/1" id="12001" class=" sub_a">DOS</a>
	                         <a href="/search/12002/10/0/1/1" id="12002" class=" sub_a">Linux</a>                                                      
	                 	</div>
	                </c:when>
	                <c:otherwise>
	                	<div class="subSearch" id="sonSearch" style="display:block;">
	                  		<img class="sub_img" src="${pageContext.request.contextPath}/shop/images/logo/san.jpg" alt="img">
	                  		<c:forEach items="${menus}" var="menu">
	                  			<a href="javascript:void(0);" onclick="javascript:show2('${menu.id }')" id="miki" class=" sub_a">${menu.name }</a>
	                  		</c:forEach>	                                                         
	                 	</div>
	                </c:otherwise>
                 </c:choose>            
              </dd>
            </dl>
            
             <dl class="cate_sea_list clearfix">
              <dt>资源类型：</dt>
              <dd id="sourcetype">
              <label bata-id="10" class="source_item js_source"><a href="#">全部</a></label>      
              <c:forEach items="${types}" var="type" >
              	<c:choose>
	              	<c:when test="${type.name eq curType.name}">
	           			<label bata-id="${type.id }" class="source_item js_source cate_cur"><a href="javascript:void(0);" 
	           				onclick="javascript:searchType('${type.id }')">${type.name }</a></label>
	                 </c:when>
	                 <c:otherwise>        
	                   	<label bata-id="${type.id }" class="source_item js_source"><a href="javascript:void(0);" 
	           				onclick="javascript:searchType('${type.id }')">${type.name }</a></label>
	               	</c:otherwise>
              	</c:choose>
              </c:forEach>                 
              </dd>
            </dl>
                               
            
            <dl class="cate_sea_list clearfix">
              <dt class="keyword_dt">关键词：</dt>
              <dd>
              	
              <input type="text" class="keywords" id="keywords" value="" name="keywords" onkeyup="KeyP(event);"><a href="javascript:void(0);" id="keywords" class="cate_search"  onclick="search_submit()">搜索</a>            		 			         
              </dd>
            </dl>
          </div>
          
          <div class="condition clearfix"><span>已选条件 ： &nbsp;</span>        	
                	        
             <c:if test="${curCategory!=null }">
                             	<label id="source_type" class="condition_item"><em>${curCategory.name }</em>
            				<a class="cate_close" id="tech_close" href="#"><img src="${pageContext.request.contextPath}/shop/images/logo/close.jpg" alt="img" style="margin-top:5px;"></a></label>
                             </c:if>
            <c:if test="${curMenu!=null }">
                  <label id="source_type" class="condition_item"><em>${curMenu.name}</em>
            		<a class="cate_close" id="tech_close" href="#"><img src="${pageContext.request.contextPath}/shop/images/logo/close.jpg" alt="img" style="margin-top:5px;"></a></label>
             </c:if>
            <c:if test="${curType!=null && curType!='' }">
                  <label id="source_type" class="condition_item"><em>${curType.name}</em>
            		<a class="cate_close" id="tech_close" href="#"><img src="${pageContext.request.contextPath}/shop/images/logo/close.jpg" alt="img" style="margin-top:5px;"></a></label>
             </c:if>
              <c:if test="${search!=null }">
                  <label id="source_type" class="condition_item"><em>${search }</em>
            		<a class="cate_close" id="tech_close" href="#"><img src="${pageContext.request.contextPath}/shop/images/logo/close.jpg" alt="img" style="margin-top:5px;"></a></label>
             </c:if>
             
          </div>
          
          <!--搜索列表-->
          <div class="dl_wrap">
            <div class="cate_search_top clearfix">
               <div class="cate_search_t_l fl">
                
                <c:choose>				
                <c:when test="${downNum!=null}">	
                	
                	 <span class="csdn-tracking-statistics" data-mod="popu_283">
                		<a target="_self" href="${pageContext.request.contextPath }/shop/shop/source/categories" id="1">最新上传</a>
                	</span>
                	<span class="csdn-tracking-statistics" data-mod="popu_284">
                		<a target="_self" href="${pageContext.request.contextPath }/shop/shop/source/categories?type=downNum" id="0" class="search_cur">最多下载</a>
                	</span>
                </c:when>
                <c:otherwise>
                	<span class="csdn-tracking-statistics" data-mod="popu_284">
                		<a target="_self" href="${pageContext.request.contextPath }/shop/shop/source/categories" id="0" class="search_cur">最新上传</a>
                	</span>
                	 <span class="csdn-tracking-statistics" data-mod="popu_283">
                		<a target="_self" href="${pageContext.request.contextPath }/shop/shop/source/categories?type=downNum" id="1">最多下载</a>
                	</span>
                </c:otherwise>
                </c:choose>
                
               
               </div>
             
              <div data-num="30" class="cate_total fr"><!-- 共<em>298</em>个资源 --></div>
            </div>
            <!--列表内容-->
            <div class="album_detail_wrap">
            <c:forEach items="${itemList }" var="source">
            	<dl class="album_detail_list clearfix">
                <dt><a href="${pageContext.request.contextPath }/shop/source/${source.id}" target="_blank"><img src="${pageContext.request.contextPath }/shop/images/logo/zip.svg" alt="img"></a></dt>
                <dd><a href="${pageContext.request.contextPath }/shop/source/${source.id}" class="album_detail_title" target="_blank">${source.title }</a>
                  <p class="cate_search_p"><font style="font-size:9pt;color:gray;">${source.description} </font></p><br>
                  <div class="album_detail_bot clearfix">
                    <label><span>下载次数：</span><em>${source.downNum }</em></label>
                    <label><span>资源大小：</span><em>${source.size }</em></label>
                    <label><span>上传时间：</span><em>${source.uploadDate }&nbsp;I Love You</em></label>
                    <label><span>店铺：</span><em class="upload_name">${source.shopName }</em></label>
                    <strong>
                    	<span>所需虎豆：</span>
                    	<em>
                        	${source.douNum }                                        
                     	</em>
                    </strong>
                  </div>
                </dd>
              </dl>
              </c:forEach>

          </div>
          </div>
          
          <!--分页-->
          <!-- page 开始-->
             <div class="pagination alternate">
				<ul class="clearfix">
					${pageCode }
				</ul>
			</div> 
        </div>
        
        <div class="download_r fr">
          <!--热点资源-->
          <div class="dl_wrap dl_mar_b">
            <h4 class="dl_common_t"><span style="font-size:14px">
            资源排行</span>
              <!--搜索页面热点资源-->
              <label class="contri"><span class="source_btn hotSource_cur">本周</span><span class="source_btn">本月</span><span class="source_btn">本年</span>
              </label>
            </h4>
            
             <div class="dl_notice">
              <div class="search_wrap">
              	<!-- 本周 -->
                <ul class="resource_c_list search_list searchHot_show">
                					<li><i class="fa fa-caret-right"></i><a target="_blank" title="git for windows==Git-2.14.0-64-bit" href="/download/u013904227/9923305">git for windows==Git-2.14.0-64-bit</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" title="gradle-4.1-all.zip 下载" href="/download/yyh352091626/9924256">gradle-4.1-all.zip 下载</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" title="beyondcompare 破解版" href="/download/huaxin3475/9926369">beyondcompare 破解版</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" title="C# 餐饮管理系统 详细源代码" href="/download/qq_2723812263/9923392">C# 餐饮管理系统 详细源代码</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" title="ADF4351 stm32f10x 控制代码" href="/download/qq_39704163/9923958">ADF4351 stm32f10x 控制代码</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" title="基于 spring+ spring mvc+ mybatis 权限管理系统" href="/download/ls249438054/9923613">基于 spring+ spring mvc+ mybatis 权限管理系统</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" title="spring mvc+ easyui+ mybatis 开发网站后台管理系统源代码下载" href="/download/ls249438054/9923407">spring mvc+ easyui+ mybatis 开发网站后台管理系统源代码下载</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" title="2017年阿里Java基础面试题文档" href="/download/u011958281/9929577">2017年阿里Java基础面试题文档</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" title="WEB性能实践日志" href="/download/zhangy110615/9926701">WEB性能实践日志</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" title="java数据结构和算法.（第二版）(带书签)" href="/download/my_love_java_xu/9929903">java数据结构和算法.（第二版）(带书签)</a>
                  </li>
				                </ul>
                <!-- 本月 -->
                <ul class="resource_c_list search_list">
                					<li><i class="fa fa-caret-right"></i><a target="_blank" href="/download/qw599186875/9917057">java JDK1.9  179 API 中文 谷歌翻译 java帮助文档9 Google翻译 java9 中文文档 帮助文档</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" href="/download/caozhy/9918664">Visual C++编程例子源代码</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" href="/download/zanfeng/9918581">系统架构设计师教程（第三版）.pdf</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" href="/download/caozhy/9919479">asp.net实例源代码合集</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" href="/download/caozhy/9919273">C语言源代码大全</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" href="/download/linge1995/9920604">架构解密从分布式到微服务（Leaderus著）</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" href="/download/ls249438054/9917971">基于 spring、 spring mvc、 mybatis 权限管理系统</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" href="/download/caozhy/9919476">java实例视频讲解+源代码 1 of 2</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" href="/download/u013904227/9923305">git for windows==Git-2.14.0-64-bit</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" href="/download/caozhy/9919162">Android开发源代码合集</a>
                  </li>
				                </ul>
                <!-- 本年 -->
                <ul class="resource_c_list search_list">
                					<li><i class="fa fa-caret-right"></i><a target="_blank" href="/download/t6546545/9732412">gradle-3.3-all.zip</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" href="/download/qw599186875/9802192">JDK1.8 API 中文 谷歌翻译 java帮助文档1.8 google翻译</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" href="/download/l1505624/9789078">深入浅出MyBatis技术原理与实战.pdf</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" href="/download/xiaoyu5256/9858024">精通Spring+4.x++企业应用开发实战.pdf</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" href="/download/id_rin/9815280">intellij idea 2017版本中文汉化包</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" href="/download/wyx100/9734370">微信小程序全套源代码（后台、小程序php）</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" href="/download/l1505624/9783279">深入理解计算机系统（原书第三版）中文高清.pdf</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" href="/download/kinglear/9735569">终极算法：机器学习和人工智能如何重塑世界</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" href="/download/u010693765/9774693">人脸识别代码</a>
                  </li>
									<li><i class="fa fa-caret-right"></i><a target="_blank" href="/download/u013003382/9872692">Tensorflow 实战Google深度学习框架 [完整PDF]</a>
                  </li>
				                </ul>
              </div>
            </div>
          </div>
          <!--广告-->
          <div class="dl_mar dl_mar_b">

          </div>
          
        </div>
      </div>
    </div>
    
    
 
    <script type="text/javascript">
      	
    	//2017.08.14 miki 点击二级分类的时候，显示三级分类
	    function show(){     	
	    	$('.cate_list li').click(function(){//点击的时候给当前这个加上红色下划线，其他的移除
				$(this).addClass("cate_cur").siblings("li").removeClass("cate_cur");
				var cateCur = $(".cate_list .cate_cur");
				var cateId = cateCur.attr("bate-id");
				var typeId = '${curType.id}';
				var url = "${pageContext.request.contextPath}/shop/source/categories?categoryId="+cateId+"&typeId=0";
				if(typeId.length>0){
					url = "${pageContext.request.contextPath}/shop/source/categories?categoryId="+cateId+"&typeId="+'${curType.id}' ;
				}
						
				window.location.href=url;											
			});
	    }
    	
    	//二级菜单 类型查询   2017.08.15 miki
    	
    	 function show2(menuid){     	
 	    	document.getElementById('sonSearch').style.display = 'block';
 	    	$('.subSearch').click(function(){//点击的时候给当前这个加上红色下划线，其他的移除
				$(this).addClass("cate_cur").siblings("a").removeClass("cate_cur");			
 	    	//var categoryId = $("#categoryid1").attr("bate-id");	
				var cateId = '${curCategory.id}';
 				var menuId=menuid;
 				window.location.href="${pageContext.request.contextPath}/shop/source/categories?categoryId="+cateId+"&menuId="+menuId;
 				return false;
 	    	});
 	    	return false;
 	    }	    	  	
    	
    	function searchType(typeid){     	     			
			//var categoryId = $("#categoryid1").attr("bate-id");
			var cate= $("#miki");
			var menuId= cate.attr("bate-id");
			var typeId=typeid;
			var cateCur = $(".cate_list .cate_cur");
			var cateId = cateCur.attr("bate-id");
			//alert(menuId);
			if(''==menuId || menuId==undefined){
				window.location.href="${pageContext.request.contextPath}/shop/source/categories?categoryId="+cateId+"&typeId="+typeId;
			}else{
				window.location.href="${pageContext.request.contextPath}/shop/source/categories?categoryId="+cateId+"&menuId="+menuId+"&typeId="+typeId;
			}
		}
    	
    	//点击全部关闭子元素，并查询结果
    	function close(){
    		document.getElementById('sonSearch').style.display = 'none';
    	}
    	
    	 function search_submit(){
       	  var categoryid = $(".category").attr("bate-id");
       	  var sourcetype = $(".sourcetype").attr("bate-id");
       	  var keywords = $("#keywords").val().trim();
       	  var url= "${host}/shop/source/search";
       	  if(keywords == ''){
           	//有可能是大类，有可能是小类，有可能有大类和小类
           		alert("关键字不能为空！");
           		return false;
       		}
       		if(''!= keywords){
       		  keywords=  encodeURIComponent(keywords)
           	  url="${host}/shop/source/search?keywords="+keywords;
          	}
       		if(''!=categoryid || null!=categoryid || categoryid!=undefined){
       		 url = "${host}/shop/source/serach?keyword="+keywords+"&category_name="+'${curCategory.name}' ;
           	}
       		if(''!= sourcetype || null!=sourcetype || sourcetype!=undefined){
       		 url = "${host}/shop/source/serach?keyword="+keywords+"&category_name="+'${curCategory.name}'+"&type="+'${curType.name}' ;
           	}
           
           window.location.href = url ;
     	}

    	
    
	    function htmlencode(s){  
		    var div = document.createElement('div');  
		    div.appendChild(document.createTextNode(s));  
		    return div.innerHTML;  
		}  
		function htmldecode(s){  
		    var div = document.createElement('div');  
		    div.innerHTML = s;  
		    return div.innerText || div.textContent;  
		}  
		
		function setTab(m,n){
			var tli=document.getElementById("menu"+m).getElementsByTagName("a");
			var mli=document.getElementById("main"+m).getElementsByTagName("ul");
			for(i=0;i<tli.length;i++){
				tli[i].className=i==n?"current1 current2":"";
				mli[i].style.display=i==n?"block":"none";
			}
		}
	
		function check_up(thisform){
			var key=$.trim(htmlencode(thisform.keywords.value));
			if(key==""){
				alert("关键字不能为空！");
			}
			else{
				//key=key.replace(/\+/g,"%2B").replace(/\//g,"%2F");
				key =  encodeURIComponent(key)
				var url="${host}/shop/source/serach?keyword="+encodeURIComponent(key);
				window.location.href=url;
			}
			return false;
		}
	       
	

    </script>