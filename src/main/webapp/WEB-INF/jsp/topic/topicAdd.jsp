<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>IT帮-资讯传播社区--芝兰之室</title>
<link href="${host}/bootstrap/css/bootstrap.css" rel="stylesheet" />
<link href="${host}/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" />
<link href="${host}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />
<link rel="stylesheet" type="text/css" href="${host}/css/emoticon.css" />
<script src="${host}/js/jquery-1.11.1.js" type="text/javascript"></script>
<script src="${host}/ckeditor4.12/ckeditor/ckeditor.js"></script>
<script type="text/javascript">

//简单的 敏感词汇验证  2016.12.13 ....时间允许，可以建一个数据库表，存储相关词汇 
//定义敏感字符     
var forbiddenArray =['吃屎','骚逼','妈逼','麻痹','狗娘养的','傻逼','畜生','尼玛','妈的','反共','草泥马'];
//定义函数
function forbiddenStr(str){
//var destString = trim(str);
var re = '';

for(var i=0;i<forbiddenArray.length;i++){
    if(i==forbiddenArray.length-1)
        re+=forbiddenArray[i];
    else
        re+=forbiddenArray[i]+"|";
}
//定义正则表示式对象
//利用RegExp可以动态生成正则表示式
var pattern = new RegExp(re,"g");
if(pattern.test(str)){
    return false;
}else{
    return true;
}
}


             //游客进入帖子页面，只能浏览不能评论，若是强行评论，会跳出提示2016.09.24
function checkForm(){
	if('${currentUser.nickName}'==''){
		alert("请先登陆，再发布！");
		/* var url="Report_preSave.action?role=0&reportType=1";
		window.open("login?url="+url); */
		return false;
	}
	if ($("#title").val()==""||$("#title").val()==null) {
		alert("请填写主题！");
		return false;
	}
	if ($("#section").val()==0||$("#section").val()==null) {
		alert("请选择板块！");
		return false;
	}
	if (CKEDITOR.instances.Content.getData().length<10) {
		alert("帖子内容最少10个字符！");
		return false;
	}
	
//敏感词汇判断   2016.12.13@miki 
	if(forbiddenStr(CKEDITOR.instances.Content.getData())==false){
		alert("内容含敏感词汇！请修改后发表 ");
        return false;
		
	}	
	
	
}
</script>
</head>
<body>
<div class="wrap" style="margin: 0 auto;">
	<jsp:include page="../common/top4.jsp"/>
</div>	
<div style="width: 1200px; margin: 0 auto;">
	<table border="0" width="100%" cellspacing="0" cellpadding="0" style="margin-top: 8;" align="center">
		<tr height="25" style="background-color:#9E2A2B;">
			<td style="text-indent:5;">
			
			</td>
			<td></td>
		</tr>
		<tr>
			<td style="width: 220px;" valign="top">
				<table style="margin-top: 10;margin-left: 20px;" class="">
					<tr>
						<td valign="top" width="99%">
						
					</tr>
					<tr height="40">
						
					</tr>
				</table>
			</td>
			<td>
				<form class="form-horizontal" style="margin-top: 10px;" action="Topic_save.action" method="post" onsubmit="return checkForm()">
					<div class="control-group">
						<label class="control-label" for="title">【主题】</label>
						<div class="controls">
							<input type="text" id="title" name="topic.title" value="${topic.title }" style="width: 800px;">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="section">【板块】</label>
						<div class="controls">
							<select id="section" name="topic.section.id" style="width: 400px;"><option value="0">请选择板块...</option>
								<c:forEach var="section" items="${sectionList }">
									<option value="${section.id }" ${curSection.id==section.id?'selected':'' }>${section.name }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label" for="Content">【内容】</label>
						<div class="controls">
							<textarea name="topic.content" id="Content" class="ckeditor" cols="50" style="height:200px;width: 800px;" ></textarea>
						</div>
					</div>
					<input id="user" name="topic.user.id" value="${currentUser.id }" type="hidden"/>
					<%-- <input id="section" type="hidden" name="topic.section.id" value="${curSection.id }"/> --%>
					<div class="control-group">
						<div class="controls">
							<Button class="btn btn-primary " data-dismiss="modal" aria-hidden="true" type="submit">提交</Button>
							<font id="error"></font>
						</div>
					</div>
				</form>
			</td>
		</tr>
	</table>
</div>
<div id="footer" style="width: 1200px; margin: 0 auto;">
	<jsp:include page="../common/footer.jsp"/>
</div>
<script src="${host}/shop/alert/jquery-1.2.6.js" type="text/javascript"></script>
<script type="text/javascript" src="${host}/js/jquery.funkyUI.js"></script>
	<script type="text/javascript">
		/* //放新浪微博表情
		$("#message_face").jqfaceedit({
			txtAreaObj : $('#Content'),
			containerObj : $('#container'),
			top : 25,
			left : -27
		});

		//显示表情
		$("#show_face").click(function() {
			$('.show_e').html($('#Content').val());
			$('.show_e').emotionsToHtml();
		}); */
	</script>
</body>
</html>