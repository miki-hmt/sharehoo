﻿
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>设置权限 - bootstrap中文后台管理系统模板</title>
<link rel="icon" href="favicon.ico" type="image/ico">
<meta name="keywords" content="后台模板,后台管理系统,HTML模板">
<meta name="description" content="基于Bootstrap的后台管理系统模板">
<meta name="author" content="www.bootstrapmb.com">
<link href="${host }/admin/new-version/css/bootstrap.min.css" rel="stylesheet">
<link href="${host }/admin/new-version/css/fonts.css" rel="stylesheet">
<link href="${host }/admin/new-version/css/style.css" rel="stylesheet">
</head>
  
<body>
    <!--页面主要内容-->
    <main class="ftdms-layout-content">
      
      <div class="container-fluid" style="margin-bottom:90px;">
        
        <div class="row" style="margin-top:15px;">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-header"><h4>设置权限</h4></div>
              <div class="card-body">
                
                <form action="#!" method="post">
                  <div class="form-group">
                    <label for="example-text-input">角色名称</label>
                    <input class="form-control" type="text" name="role-input" placeholder="角色名称">
                  </div>
                  <div class="table-responsive">
                  <table class="table table-striped">
                    <thead>
                      <tr>
                        <th>
                          <label class="ftdms-checkbox checkbox-primary">
                            <input name="checkbox" type="checkbox" id="check-all">
                            <span> 全选</span>
                          </label>
                        </th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>
                          <label class="ftdms-checkbox checkbox-primary">
                            <input name="rules[]" type="checkbox" class="checkbox-parent" dataid="id-1" value="1">
                            <span> 系统管理</span>
                          </label>
                        </td>
                      </tr>
                      <tr>
                        <td class="p-l-20">
                          <label class="ftdms-checkbox checkbox-primary">
                            <input name="rules[]" type="checkbox" class="checkbox-parent checkbox-child" dataid="id-1-5" value="5">
                            <span> 网站设置</span>
                          </label>
                        </td>
                      </tr>
                      <tr>
                        <td class="p-l-20">
                          <label class="ftdms-checkbox checkbox-primary">
                            <input name="rules[]" type="checkbox" class="checkbox-parent checkbox-child" dataid="id-1-6" value="6">
                            <span> 配置管理</span>
                          </label>
                        </td>
                      </tr>
                      <tr>
                        <td class="p-l-40">
                          <label class="ftdms-checkbox checkbox-primary checkbox-inline">
                            <input name="rules[]" type="checkbox" class="checkbox-child" dataid="id-1-6-20" value="20">
                            <span> 添加配置</span>
                          </label>
                          <label class="ftdms-checkbox checkbox-primary checkbox-inline">
                            <input name="rules[]" type="checkbox" class="checkbox-child" dataid="id-1-6-21" value="21">
                            <span> 编辑配置</span>
                          </label>
                          <label class="ftdms-checkbox checkbox-primary checkbox-inline">
                            <input name="rules[]" type="checkbox" class="checkbox-child" dataid="id-1-6-44" value="44">
                            <span> 删除配置</span>
                          </label>
                          <label class="ftdms-checkbox checkbox-primary checkbox-inline">
                            <input name="rules[]" type="checkbox" class="checkbox-child" dataid="id-1-6-45" value="45">
                            <span> 禁用/启用配置</span>
                          </label>
                          <label class="ftdms-checkbox checkbox-primary checkbox-inline">
                            <input name="rules[]" type="checkbox" class="checkbox-child" dataid="id-1-6-46" value="46">
                            <span> 设置配置值</span>
                          </label>
                        </td>
                      </tr>
                      <tr>
                        <td class="p-l-20">
                          <label class="ftdms-checkbox checkbox-primary">
                            <input name="rules[]" type="checkbox" class="checkbox-parent checkbox-child" dataid="id-1-7" value="7">
                            <span> 导航管理</span>
                          </label>
                        </td>
                      </tr>
                      <tr>
                        <td class="p-l-40">
                          <label class="ftdms-checkbox checkbox-primary checkbox-inline">
                            <input name="rules[]" type="checkbox" class="checkbox-child" dataid="id-1-7-51" value="51">
                            <span> 添加导航菜单</span>
                          </label>
                          <label class="ftdms-checkbox checkbox-primary checkbox-inline">
                            <input name="rules[]" type="checkbox" class="checkbox-child" dataid="id-1-7-52" value="52">
                            <span> 编辑导航菜单</span>
                          </label>
                          <label class="ftdms-checkbox checkbox-primary checkbox-inline">
                            <input name="rules[]" type="checkbox" class="checkbox-child" dataid="id-1-7-53" value="53">
                            <span> 删除导航菜单</span>
                          </label>
                        </td>
                      </tr>
                      <tr>
                        <td class="p-l-20">
                          <label class="ftdms-checkbox checkbox-primary">
                            <input name="rules[]" type="checkbox" class="checkbox-parent checkbox-child" dataid="id-1-8" value="8">
                            <span> 栏目管理</span>
                          </label>
                        </td>
                      </tr>
                      <tr>
                        <td class="p-l-40">
                          <label class="ftdms-checkbox checkbox-primary checkbox-inline">
                            <input name="rules[]" type="checkbox" class="checkbox-child" dataid="id-1-8-40" value="40">
                            <span> 添加栏目</span>
                          </label>
                          <label class="ftdms-checkbox checkbox-primary checkbox-inline">
                            <input name="rules[]" type="checkbox" class="checkbox-child" dataid="id-1-8-41" value="41">
                            <span> 编辑栏目</span>
                          </label>
                          <label class="ftdms-checkbox checkbox-primary checkbox-inline">
                            <input name="rules[]" type="checkbox" class="checkbox-child" dataid="id-1-8-42" value="42">
                            <span> 删除栏目</span>
                          </label>
                        </td>
                      </tr>
                      <tr>
                        <td class="p-l-20">
                          <label class="ftdms-checkbox checkbox-primary">
                            <input name="rules[]" type="checkbox" class="checkbox-parent checkbox-child" dataid="id-1-9" value="9">
                            <span> 权限列表</span>
                          </label>
                        </td>
                      </tr>
                      <tr>
                        <td class="p-l-40">
                          <label class="ftdms-checkbox checkbox-primary checkbox-inline">
                            <input name="rules[]" type="checkbox" class="checkbox-child" dataid="id-1-9-36" value="36">
                            <span> 添加规则</span>
                          </label>
                          <label class="ftdms-checkbox checkbox-primary checkbox-inline">
                            <input name="rules[]" type="checkbox" class="checkbox-child" dataid="id-1-9-37" value="37">
                            <span> 编辑规则</span>
                          </label>
                          <label class="ftdms-checkbox checkbox-primary checkbox-inline">
                            <input name="rules[]" type="checkbox" class="checkbox-child" dataid="id-1-9-38" value="38">
                            <span> 删除规则</span>
                          </label>
                          <label class="ftdms-checkbox checkbox-primary checkbox-inline">
                            <input name="rules[]" type="checkbox" class="checkbox-child" dataid="id-1-9-39" value="39">
                            <span> 禁用/启用规则</span>
                          </label>
                        </td>
                      </tr>
                      <tr>
                        <td class="p-l-20">
                          <label class="ftdms-checkbox checkbox-primary">
                            <input name="rules[]" type="checkbox" class="checkbox-parent checkbox-child" dataid="id-1-73" value="73">
                            <span> 后台首页</span>
                          </label>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <label class="ftdms-checkbox checkbox-primary">
                            <input name="rules[]" type="checkbox" class="checkbox-parent" dataid="id-2" value="2">
                            <span> 用户管理</span>
                          </label>
                        </td>
                      </tr>
                      <tr>
                        <td class="p-l-20">
                          <label class="ftdms-checkbox checkbox-primary">
                            <input name="rules[]" type="checkbox" class="checkbox-parent checkbox-child" dataid="id-2-10" value="10">
                            <span> 角色管理</span>
                          </label>
                        </td>
                      </tr>
                      <tr>
                        <td class="p-l-40">
                          <label class="ftdms-checkbox checkbox-primary checkbox-inline">
                            <input name="rules[]" type="checkbox" class="checkbox-child" dataid="id-2-10-31" value="31">
                            <span> 添加角色</span>
                          </label>
                          <label class="ftdms-checkbox checkbox-primary checkbox-inline">
                            <input name="rules[]" type="checkbox" class="checkbox-child" dataid="id-2-10-33" value="33">
                            <span> 编辑角色</span>
                          </label>
                          <label class="ftdms-checkbox checkbox-primary checkbox-inline">
                            <input name="rules[]" type="checkbox" class="checkbox-child" dataid="id-2-10-34" value="34">
                            <span> 删除角色</span>
                          </label>
                          <label class="ftdms-checkbox checkbox-primary checkbox-inline">
                            <input name="rules[]" type="checkbox" class="checkbox-child" dataid="id-2-10-35" value="35">
                            <span> 禁用/启用角色</span>
                          </label>
                        </td>
                      </tr>
                      <tr>
                        <td class="p-l-20">
                          <label class="ftdms-checkbox checkbox-primary">
                            <input name="rules[]" type="checkbox" class="checkbox-parent checkbox-child" dataid="id-2-12" value="12">
                            <span> 用户管理</span>
                          </label>
                        </td>
                      </tr>
                      <tr>
                        <td class="p-l-40">
                          <label class="ftdms-checkbox checkbox-primary checkbox-inline checkbox-inline">
                            <input name="rules[]" type="checkbox" class="checkbox-child" dataid="id-2-12-62" value="62">
                            <span> 添加用户</span>
                          </label>
                          <label class="ftdms-checkbox checkbox-primary checkbox-inline checkbox-inline">
                            <input name="rules[]" type="checkbox" class="checkbox-child" dataid="id-2-12-63" value="63">
                            <span> 编辑用户</span>
                          </label>
                          <label class="ftdms-checkbox checkbox-primary checkbox-inline checkbox-inline">
                            <input name="rules[]" type="checkbox" class="checkbox-child" dataid="id-2-12-64" value="64">
                            <span> 删除用户</span>
                          </label>
                          <label class="ftdms-checkbox checkbox-primary checkbox-inline checkbox-inline">
                            <input name="rules[]" type="checkbox" class="checkbox-child" dataid="id-2-12-65" value="65">
                            <span> 启用/禁用用户</span>
                          </label>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <label class="ftdms-checkbox checkbox-primary">
                            <input name="rules[]" type="checkbox" class="checkbox-parent" dataid="id-3" value="3">
                            <span> 内容管理</span>
                          </label>
                        </td>
                      </tr>
                      <tr>
                        <td class="p-l-20">
                          <label class="ftdms-checkbox checkbox-primary">
                            <input name="rules[]" type="checkbox" class="checkbox-parent checkbox-child" dataid="id-3-13" value="13">
                            <span> 单页管理</span>
                          </label>
                        </td>
                      </tr>
                      <tr>
                        <td class="p-l-40">
                          <label class="ftdms-checkbox checkbox-primary checkbox-inline">
                            <input name="rules[]" type="checkbox" class="checkbox-child" dataid="id-3-13-58" value="58">
                            <span> 添加单页</span>
                          </label>
                          <label class="ftdms-checkbox checkbox-primary checkbox-inline">
                            <input name="rules[]" type="checkbox" class="checkbox-child" dataid="id-3-13-59" value="59">
                            <span> 编辑单页</span>
                          </label>
                          <label class="ftdms-checkbox checkbox-primary checkbox-inline">
                            <input name="rules[]" type="checkbox" class="checkbox-child" dataid="id-3-13-60" value="60">
                            <span> 删除单页</span>
                          </label>
                        </td>
                      </tr>
                      <tr>
                        <td class="p-l-20">
                          <label class="ftdms-checkbox checkbox-primary">
                            <input name="rules[]" type="checkbox" class="checkbox-parent checkbox-child" dataid="id-3-14" value="14">
                            <span> 文章管理</span>
                          </label>
                        </td>
                      </tr>
                      <tr>
                        <td class="p-l-20">
                          <label class="ftdms-checkbox checkbox-primary">
                            <input name="rules[]" type="checkbox" class="checkbox-parent checkbox-child" dataid="id-3-15" value="15">
                            <span> 文档管理</span>
                          </label>
                        </td>
                      </tr>
                      <tr>
                        <td class="p-l-40">
                          <label class="ftdms-checkbox checkbox-primary checkbox-inline checkbox-inline checkbox-inline">
                            <input name="rules[]" type="checkbox" class="checkbox-child" dataid="id-3-15-16" value="16">
                            <span> 添加文档</span>
                          </label>
                          <label class="ftdms-checkbox checkbox-primary checkbox-inline checkbox-inline checkbox-inline">
                            <input name="rules[]" type="checkbox" class="checkbox-child" dataid="id-3-15-61" value="61">
                            <span> 删除文档</span>
                          </label>
                          <label class="ftdms-checkbox checkbox-primary checkbox-inline checkbox-inline checkbox-inline">
                            <input name="rules[]" type="checkbox" class="checkbox-child" dataid="id-3-15-75" value="75">
                            <span> 编辑文档</span>
                          </label>
                          <label class="ftdms-checkbox checkbox-primary checkbox-inline checkbox-inline checkbox-inline">
                            <input name="rules[]" type="checkbox" class="checkbox-child" dataid="id-3-15-79" value="79">
                            <span> 启用/禁用文档</span>
                          </label>
                        </td>
                      </tr>
                      <tr>
                        <td class="p-l-20">
                          <label class="ftdms-checkbox checkbox-primary">
                            <input name="rules[]" type="checkbox" class="checkbox-parent checkbox-child" dataid="id-3-72" value="72">
                            <span> 下载管理</span>
                          </label>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <label class="ftdms-checkbox checkbox-primary">
                            <input name="rules[]" type="checkbox" class="checkbox-parent" dataid="id-4" value="4">
                            <span> 扩展管理</span>
                          </label>
                        </td>
                      </tr>
                      <tr>
                        <td class="p-l-20">
                          <label class="ftdms-checkbox checkbox-primary">
                            <input name="rules[]" type="checkbox" class="checkbox-parent checkbox-child" dataid="id-4-17" value="17">
                            <span> 广告管理</span>
                          </label>
                        </td>
                      </tr>
                      <tr>
                        <td class="p-l-40">
                          <label class="ftdms-checkbox checkbox-primary checkbox-inline checkbox-inline">
                            <input name="rules[]" type="checkbox" class="checkbox-child" dataid="id-4-17-27" value="27">
                            <span> 添加广告</span>
                          </label>
                          <label class="ftdms-checkbox checkbox-primary checkbox-inline checkbox-inline">
                            <input name="rules[]" type="checkbox" class="checkbox-child" dataid="id-4-17-28" value="28">
                            <span> 编辑广告</span>
                          </label>
                          <label class="ftdms-checkbox checkbox-primary checkbox-inline checkbox-inline">
                            <input name="rules[]" type="checkbox" class="checkbox-child" dataid="id-4-17-29" value="29">
                            <span> 删除广告</span>
                          </label>
                          <label class="ftdms-checkbox checkbox-primary checkbox-inline checkbox-inline">
                            <input name="rules[]" type="checkbox" class="checkbox-child" dataid="id-4-17-30" value="30">
                            <span> 禁用/启用广告</span>
                          </label>
                        </td>
                      </tr>
                      <tr>
                        <td class="p-l-20">
                          <label class="ftdms-checkbox checkbox-primary">
                            <input name="rules[]" type="checkbox" class="checkbox-parent checkbox-child" dataid="id-4-19" value="19">
                            <span> 友情链接</span>
                          </label>
                        </td>
                      </tr>
                      <tr>
                        <td class="p-l-40">
                          <label class="ftdms-checkbox checkbox-primary checkbox-inline">
                            <input name="rules[]" type="checkbox" class="checkbox-child" dataid="id-4-19-47" value="47">
                            <span> 添加友情链接</span>
                          </label>
                          <label class="ftdms-checkbox checkbox-primary checkbox-inline">
                            <input name="rules[]" type="checkbox" class="checkbox-child" dataid="id-4-19-48" value="48">
                            <span> 编辑友情链接</span>
                          </label>
                          <label class="ftdms-checkbox checkbox-primary checkbox-inline">
                            <input name="rules[]" type="checkbox" class="checkbox-child" dataid="id-4-19-49" value="49">
                            <span> 删除友情链接</span>
                          </label>
                          <label class="ftdms-checkbox checkbox-primary checkbox-inline">
                            <input name="rules[]" type="checkbox" class="checkbox-child" dataid="id-4-19-50" value="50">
                            <span> 禁用/启用友情链接</span>
                          </label>
                        </td>
                      </tr>
                      <tr>
                        <td class="p-l-20">
                          <label class="ftdms-checkbox checkbox-primary">
                            <input name="rules[]" type="checkbox" class="checkbox-parent checkbox-child" dataid="id-4-66" value="66">
                            <span> 附件管理</span>
                          </label>
                        </td>
                      </tr>
                      <tr>
                        <td class="p-l-40">
                          <label class="ftdms-checkbox checkbox-primary">
                            <input name="rules[]" type="checkbox" class="checkbox-child" dataid="id-4-66-67" value="67">
                            <span> 上传图片</span>
                          </label>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
                </form>
                
              </div>
            </div>
          </div>
          
        </div>
        
      </div>
      
    </main>
    <!--End 页面主要内容-->

<script type="text/javascript" src="${host }/admin/new-version/js/jquery.min.js"></script>
<script type="text/javascript" src="${host }/admin/new-version/js/bootstrap.js"></script>
<script type="text/javascript" src="${host }/admin/new-version/js/main.min.js"></script>

<script type="text/javascript" src="${host }/admin/new-version/js/chosen.jquery.min.js"></script>
<script type="text/javascript">
$(function(){
    //动态选择框，上下级选中状态变化
    $('input.checkbox-parent').on('change', function(){
        var dataid = $(this).attr("dataid");
        $('input[dataid^=' + dataid + '-]').prop('checked', $(this).is(':checked'));
    });
    $('input.checkbox-child').on('change', function(){
        var dataid = $(this).attr("dataid");
            dataid = dataid.substring(0, dataid.lastIndexOf("-"));
        var parent = $('input[dataid=' + dataid + ']');
        if($(this).is(':checked')){
            parent.prop('checked', true);
            //循环到顶级
            while(dataid.lastIndexOf("-") != 2){
                dataid = dataid.substring(0, dataid.lastIndexOf("-"));
                parent = $('input[dataid=' + dataid + ']');
                parent.prop('checked', true);
            }
        }else{
            //父级
            if($('input[dataid^=' + dataid + '-]:checked').length == 0){
                parent.prop('checked', false);
                //循环到顶级
                while(dataid.lastIndexOf("-") != 2){
                    dataid = dataid.substring(0, dataid.lastIndexOf("-"));
                    parent = $('input[dataid=' + dataid + ']');
                    if($('input[dataid^=' + dataid + '-]:checked').length == 0){
                        parent.prop('checked', false);
                    }
                }
            }
        }
    });
});
</script>
</body>
</html>