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
				<form class="form-horizontal" id="secret_form" style="margin-top: 10px;" action="" method="post">

					<input type="hidden" id="title" name="title" value="1" style="width: 800px;">

					<div class="control-group">
						<label class="control-label" for="Content">【吐槽心事】</label>
						<div class="controls">
							<textarea name="content" id="Content" cols="50" style="height:200px;width: 800px;" ></textarea>
						</div>
					</div>
					<input id="user" name="user.id" value="${currentUser.id }" type="hidden"/>	
					<input id="section" name="section.id" value="17" type="hidden"/>				
					<div class="control-group">
						<div class="controls">
							<Button class="btn btn-primary " id="okBtn" data-dismiss="modal"
									aria-hidden="true">提交</Button>
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
	//springboot框架提交表单实体对象到后台尽量使用ajax提交，将表单序列化提交	2019.08.31 miki
	$("#okBtn").on("click", function() {

		//ckeditor4.12新特性，提交表单前需要更新textAera字段内容	2019.09.02
		for (instance in CKEDITOR.instances) {
			CKEDITOR.instances[instance].updateElement();
		}
		
		if (!checkForm()) {
			var formData = new FormData($("#secret_form")[0]);
			$.ajax({
				type : "POST",
				url : "${host}/secret/publish",
				data : formData,
				cache : false,
				async : false,
				processData : false, //必须false才会避开jQuery对 formdata 的默认处理
				contentType : false, //必须false才会自动加上正确的Content-Type
				success : function(data) {
					if (data.status == 200) {
						tipOk("发表成功!!",function(){
							location.reload();
						});
					} else {
						tipError("发表失败!!" + data.msg);
					}
				}
			});		
		}
		return false;	//阻止ajax结束自动刷新页面
	});
	
	
	//游客进入帖子页面，只能浏览不能评论，若是强行评论，会跳出提示2016.09.24
	function checkForm(){
		var result = false;
		var title = $("#title").val();
		//敏感词汇判断   2016.12.13@miki 
		if(forbiddenStr(CKEDITOR.instances.Content.getData())==false){
			tipError("内容含敏感词汇！请修改后发表 ");
	        result = true;			
		}
		if('${currentUser.nickName}'==''){
			tipError("请先登陆，再发布！");
			result = true;
		}else if (title==""||title==null) {
			tipError("请填写主题！");
			result = true;
		}
		else if (CKEDITOR.instances.Content.getData().length<10) {
			tipError("秘密内容最少10个字符！");
			result = true;
		}
		else if (CKEDITOR.instances.Content.getData().length>50) {
		tipError("内容最多120个字符！");
		result = true;
		}
			
		return result;					
	}
		
	function tipOk(content,callback){
		swal({   
			title: content,   
			text: '来自<span style="color:red">sharehoo社区</span>、<a href="#">温馨提示</a>。<br/>2秒后自动关闭..',   
			imageUrl: "${host}/sweetalert/images/thumbs-up.jpg",
			html: true,
			timer: 2000,   
			showConfirmButton: false
		},function(){
				if (callback) {
					callback();
				}
			});
	};
	function tipError(content){
		swal("发表失败", content, "error");
	};
	
	//简单的 敏感词汇验证  2016.12.13 ....时间允许，可以建一个数据库表，存储相关词汇 
	//定义敏感字符     
	var forbiddenArray =['吃屎','骚逼','妈逼','麻痹','狗娘养的','傻逼','畜生','尼玛','妈的','反共','草泥马'];
	//定义函数
	function forbiddenStr(str){
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
	</script>
</body>
</html>