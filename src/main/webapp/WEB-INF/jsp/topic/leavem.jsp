<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>IT帮-资讯传播社区--秘密墙</title>
<link href="${host}/bootstrap/css/bootstrap.css" rel="stylesheet" />
<link href="${host}/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" />
<link href="${host}/css/style.css" rel="stylesheet" />
<link href="${host}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />
<script src="${host}/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${host}/css/emoticon.css" />
<script src="${host}/js/jquery-1.11.1.js" type="text/javascript"></script>
<script src="${host}/js/jquery.emoticons.js" type="text/javascript"></script>
<script src="${host}/ckeditor4.12/ckeditor/ckeditor.js"></script>

<script type="text/javascript">
	$(function () {
		//2019.09.04 miki 初始化ckeditor编辑器，修改上传文件地址，记得去掉class="ckeditor"
		CKEDITOR.replace('content', { 
			filebrowserImageUploadUrl :"${host}/topic/ckupload?",
			codeSnippet_theme: 'zenburn',
			height:'500'
		});
	});
</script>

<script type="text/javascript">

//简单的 敏感词汇验证  2016.12.13 ....时间允许，可以建一个数据库表，存储相关词汇 
//定义敏感字符     
var forbiddenArray =['吃屎','骚逼','妈逼','麻痹','mabi','狗娘养的','傻逼','草','滚','黄色','逼','日','畜生','sb','尼玛','妈的','反共','草泥马'];
//定义函数
function forbiddenStr(str){
//  var destString = trim(str);
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
	
	if (CKEDITOR.instances.Content.getData().length<10) {
		alert("留言内容最少20个字符！");
		return false;
	}
	if (CKEDITOR.instances.Content.getData().length>50) {
		alert("内容最多120个字符！");
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
	<jsp:include page="../common/top5.jsp"/>
</div>	
<div style="width: 1200px; margin: 0 auto;">
	<table border="0" width="100%" cellspacing="0" cellpadding="0" style="margin-top: 8;width: 1200px;" align="center">
		<tr height="30" style="background:#AC3839">
			<td style="text-indent:5;">
				<b><font color="white">■ 秘密墙</font></b>
			</td>
			<td></td>
		</tr>
		<tr>
			<td style="width: 213px;" valign="top">
				<table style="margin-top: 10;margin-left: 20px;" class="">
					<tr>
						<td valign="top" width="99%">
						
					</tr>
					<tr height="40">
						
					</tr>
				</table>
			</td>
			<td>
				<form class="form-horizontal" style="margin-top: 10px;" action="secret/publish?topic.section.id=17" method="post" onsubmit="return checkForm()">

					<input type="hidden" id="title" name="topic.title" value="1" style="width: 800px;">

					<div class="control-group">
						<label class="control-label" for="Content">【吐槽心事】</label>
						<div class="controls">
							<textarea name="topic.content" id="Content" cols="50" style="height:200px;width: 800px;" ></textarea>
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