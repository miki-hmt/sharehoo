<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<!-- 				2018.08.20	author:miki
						project:后台索引页面的增删改查
 -->
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
 <link rel="stylesheet" type="text/css" href="${host}/sweetalert/sweetalert.css"/>
<script src="${host}/sweetalert/sweetalert.min.js"></script>	
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript">
 
 /*softSectionId对应SoftSection_delete.action里的变量，zoneId表示此处传 的值，softSectionId:zoneId表示将zoneId的值赋给softSectionId */	
function updateSolr(){
	swal({
		title: "确定要更新资源的全部索引吗?", 
		text: "更新完之后，才能搜索到新的？", 
		type: "warning",
		showCancelButton: true,
		closeOnConfirm: false,
		confirmButtonText: "是的，强行更新",
		confirmButtonColor: "#ec6c62"
		}, function() {
			$.ajax({
				url: "${pageContext.request.contextPath}/admin/shop/solr/import",
				data: {},
				type: "POST",
			}).done(function(data) {
				if(data.status==200){
					tipOk("更新成功!",function(){
							swal.close();
						});
					//swal("操作成功!", "已成功删除数据！", "success");
				}else{
					tipError("更新失败！",data.msg);
				}					
			}).error(function(data) {
				tipError("更新失败！",data.msg);
			});
		});
}

function updateTopicSolr(){	
	swal({
		title: "确定要更新全部帖子的索引吗?", 
		text: "更新完之后，才能搜索到新的？", 
		type: "warning",
		showCancelButton: true,
		closeOnConfirm: false,
		confirmButtonText: "是的，强行更新",
		confirmButtonColor: "#ec6c62"
		}, function() {
			$.ajax({
				url: "${pageContext.request.contextPath}/admin/topic/solr/import",
				data: {},
				type: "POST",
			}).done(function(data) {
				if(data.status==200){
					tipOk("更新成功!",function(){
							swal.close();
						});
					//swal("操作成功!", "已成功删除数据！", "success");
				}else{
					tipError("更新失败！",data.msg);
				}					
			}).error(function(data) {
				tipError("更新失败！",data.msg);
			});
		});
}

function tipOk(content,callback){
		swal({   
			title: content,   
			text: '来自<span style="color:red">sharehoo社区</span>、<a href="#">温馨提示</a>。<br/>2秒后自动关闭..',   
			html: true,
			type: "success",
			timer: 3000  
		},function(){
				if (callback) {
					callback();
				}
			});
	};
	function tipError(content){
		swal("发表失败", content, "error");
	};

 function resetValue(){
	 $("#id").val("");
	 $("#zoneName").val("");
}

</script>

<style type="text/css">
	body{font-weight:bold;}
	.main{width:98%;height:768px;position:relative;margin:auto;background-image: url(images/nybj.png);background-size:100% 100%;font-family:苹方;}
	div{border:0px solid white;margin:1px;}
	.layer{position:relative;width:100%;}
	#layer01{}
	#layer01 img{text-align: center;display: block;height: 35px;padding-top: 35px;margin: auto;}
	#layer02 > div{height:100%;float:left;position:relative;}
	.layer02-data{position: absolute;width: auto;height: 100px;color: white;top: 45px;left: 65px;}
	.layer03-panel{height:100%;position:relative;float:left;}
	.layer03-left-label{position:absolute;}
	#layer03_left_label01{top:10px;left:10px;color:white;height:20px;width:200px;font-weight: bold;}
	#layer03_left_label02{right:10px;top:10px;color:#036769;height:20px;width:200px;}
	.layer03-left-chart{position:relative;float:left;height:100%;}
	#layer03_right_label{position:absolute;top:10px;left:10px;color:white;height:20px;width:100px;}
	.layer03-right-chart{position:relative;float:left;height:100%;width:32%;}
	.layer03-right-chart-label{color: white;text-align: center;position: absolute;bottom: 60px;width: 100%;}
	.layer04-panel{position:relative;float:left;height:100%;width:48%;}
	.layer04-panel-label{width:100%;height:15%;color:white;padding-top:5px;}
	.layer04-panel-chart{width:100%;height:85%;}
  </style>
  
  <script src="${pageContext.request.contextPath}/admin/js/echarts.min.js"></script>
  <script src="${pageContext.request.contextPath}/admin/js/monitor.js"></script>
  <script type="text/javascript">
	$(function(){
		drawLayer02Label($("#layer02_01 canvas").get(0),"接入终端数量",80,200);
		drawLayer02Label($("#layer02_02 canvas").get(0),"今日接入数据数量",80,300);
		drawLayer02Label($("#layer02_03 canvas").get(0),"今日新增存储数据",80,400);
		drawLayer02Label($("#layer02_04 canvas").get(0),"总存储数据",50,200);
		drawLayer02Label($("#layer02_05 canvas").get(0),"当前任务个数",40,200);
		drawLayer02Label($("#layer02_06 canvas").get(0),"当前集群数",50,200);
		
		renderLegend();

		//饼状图
		renderChartBar01();
		//renderChartBar02();

		//存储
		renderLayer03Right();

		//30天日均线流量趋势
		renderLayer04Left();

		//集群性能
		renderLayer04Right();
	});
  </script>

</head>
<body style="background-color: #f5f6fa">
	<!--保持新版本上风格的统一 上面间距15px	，左右间距15px，背景色 #f5f6fa		旧版代码都要加上这样的样式		2020.08.14 miki  -->
	<div class="row" style="height:20px;width:100%;background-color: #f5f6fa"></div>
	
	<div class="main">
	
		<div id="layer02" class="layer" style="height:15%;">
			<div id="layer02_01" style="width:20%;">
				<div class="layer02-data">
					<span style="font-size:26px;">400000</span>
					<span style="font-size:16px;">台</span>
				</div>
				<canvas width="200" height="100"></canvas>
			</div>
			<div id="layer02_02" style="width:20%;">
				<div class="layer02-data">
					<span style="font-size:26px;">400000</span>
					<span style="font-size:16px;">KB</span>
				</div>
				<canvas width="200" height="100"></canvas>
			</div>
			<div id="layer02_03" style="width:21%;">
				<div class="layer02-data">
					<span style="font-size:26px;">31457280</span>
					<span style="font-size:16px;">MB</span>
				</div>
				<canvas width="200" height="100"></canvas>
			</div>
			<div id="layer02_04" style="width:12%;">
				<div class="layer02-data">
					<span style="font-size:26px;">50</span>
					<span style="font-size:16px;">PB</span>
				</div>
				<canvas width="120" height="100"></canvas>
			</div>
			<div id="layer02_05" style="width:12%;">
				<div class="layer02-data">
					<span style="font-size:26px;">25</span>
					<span style="font-size:16px;">个</span>
				</div>
				<canvas width="120" height="100"></canvas>
			</div>
			<div id="layer02_06" style="width:12%;">
				<div class="layer02-data">
					<span style="font-size:26px;">5</span>
					<span style="font-size:16px;">个</span>
				</div>
				<canvas width="120" height="100"></canvas>
			</div>
		</div>
		<div id="layer03" class="layer" style="height:40%;">
			<div id="layer03_left" style="width:48%;" class="layer03-panel">
				<div id="layer03_left_label01" class="layer03-left-label">接入机型占比</div>
				<!--
				<div id="layer03_left_label02" class="layer03-left-label">(左)在线数量 (右)上线率</div>
				-->
				<div id="layer03_left_01" class="layer03-left-chart" style="width:16%;">
					<canvas width="100" height="200" style="margin:30px 0 0 20px;"></canvas>
				</div>
				
				<div id="layer03_left_02" class="layer03-left-chart" style="width:80%;"></div>
				<!--
				<div id="layer03_left_03" class="layer03-left-chart" style="width:80%;"></div>
				-->
			</div>
			<div id="layer03_right" style="width:50%;" class="layer03-panel">
				<div id="layer03_right_label">存储</div>
				<div id="layer03_right_chart01" class="layer03-right-chart">
					<canvas width="130" height="150" style="margin:40px 0 0 20px;"></canvas>
					<div class="layer03-right-chart-label">Hdfs</div>
				</div>
				<div id="layer03_right_chart02" class="layer03-right-chart">
					<canvas width="130" height="150" style="margin:40px 0 0 20px;"></canvas>
					<div class="layer03-right-chart-label">Rdbms</div>
				</div>
				<div id="layer03_right_chart03" class="layer03-right-chart">
					<canvas width="130" height="150" style="margin:40px 0 0 20px;"></canvas>
					<div class="layer03-right-chart-label">Rdies</div>
				</div>
			</div>
		</div>
		<div id="layer04" class="layer" style="height:30%;">
			<div id="layer04_left" class="layer04-panel">
				<div id="layer04_left_label" class="layer04-panel-label">30天日均线流量趋势</div>
				<div id="layer04_left_chart" class="layer04-panel-chart"></div>
			</div>
			<div id="layer04_right" class="layer04-panel">
				<div id="layer04_right_label" class="layer04-panel-label">
					<span>集群性能/</span><span style="color:#00A09A;">近一个小时</span>
				</div>
				<div id="layer04_right_chart" class="layer04-panel-chart"></div>
			</div>
		</div>
		
		<div id="tooBar" style="padding: 10px 0px 0px 10px;">
			<button class="btn btn-primary" type="button" data-backdrop="static" data-toggle="modal" data-target="#dlg" onclick="updateSolr()">更新索引</button>
			<button class="btn btn-primary" type="button" data-backdrop="static" data-toggle="modal" data-target="#dlg" onclick="updateTopicSolr()">更新topic索引</button>
		</div>
	</div>
	
	
	
	
</body>
</html>