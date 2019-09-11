<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div class="container-fluid">
		<div id="tooBar" style="padding: 10px 0px 0px 10px;">
			<button class="btn btn-primary" type="button" data-backdrop="static" data-toggle="modal" data-target="#dlg" onclick="return openAddDlg()">管理资源类型</button>&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
		<div class="row-fluid">
			<div class="span12">
				<div class="widget-box">
					<div class="widget-title">
						<!-- <span class="icon"> <input type="checkbox"
							id="title-checkbox" name="title-checkbox" />
						</span> -->
						<h5>类型列表</h5>
					</div>
					<div class="widget-content nopadding">
						<table class="table table-bordered table-striped with-check">
							<thead>
								<tr>
									<th><i class=""></i></th>
									<th>编号</th>
									<th>类型名称</th>						
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${typeList }" var="type">
									<tr>
										<td><input type="checkbox" /></td>
										<td style="text-align: center;">${type.id }</td>
										<td style="text-align: center;">${type.name }</td>									
										<td style="text-align: center;">											
											<button class="btn btn-info" type="button" data-backdrop="static" data-toggle="modal" data-target="#dlg" onclick="return modifyType(${type.id},'${type.name }')">修改
											</button>&nbsp;&nbsp;<button class="btn btn-danger" type="button" onclick="javascript:typeDelete(${type.id})">删除</button>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="pagination alternate">
					<ul class="clearfix">${pageCode }
					</ul>
				</div>


			</div>
		</div>
		<div id="dlg" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true" onclick="return resetValue()">×</button>
				<h3 id="myModalLabel">修改子模块</h3>
			</div>
			<div class="modal-body">
				<form id="fm" action="">
					<table>						
						<tr>
							<td>
								<label class="control-label" for="name">类型名称：</label>
							</td>
							<td>
								 <input id="name" type="text" name="name" placeholder="请输入…">
							</td>
						</tr>								
					</table>
					<input id="id" type="hidden" name="id" value="0">
				</form>
			</div>
			<div class="modal-footer">
				<font id="error" style="color: red;"></font>
				<button class="btn" data-dismiss="modal" aria-hidden="true"
					onclick="return resetValue()">关闭</button>
				<button class="btn btn-primary" onclick="javascript:updateType()">保存</button>
			</div>
		</div>
		
		
		<!-- 2017.11.11	miki 添加子模块div -->
		<div id="dlg2" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true" onclick="return resetValue()">×</button>
				<h3 id="myModalLabel">添加子模块</h3>
			</div>
			<div class="modal-body">
				<form id="sfm" action="">
					<table>	
						<tr>
							<td>
								<label class="control-label" for="sName">子模块名：</label>
							</td>
							<td>
								 <input id="sName" type="text" name=name" placeholder="请输入…">
							</td>
						</tr>								
					</table>
					<input id="fId" type="hidden" name="id" value="0">
				</form>
			</div>
			<div class="modal-footer">
				<font id="serror" style="color: red;"></font>
				<button class="btn" data-dismiss="modal" aria-hidden="true"
					onclick="return resetValue()">关闭</button>
				<button class="btn btn-primary" onclick="javascript:saveType()">保存</button>
			</div>
		</div>
		
		
		
	</div>
	
</body>
</html>