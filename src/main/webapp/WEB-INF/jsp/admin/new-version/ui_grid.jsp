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
<title>格栅 - 后台管理系统模板</title>
<link rel="icon" href="favicon.ico" type="image/ico">
<meta name="keywords" content="后台模板,后台管理系统,HTML模板">
<meta name="description" content="基于Bootstrap的后台管理系统模板">
<meta name="author" content="www.bootstrapmb.com">
<link href="${host }/admin/new-version/css/bootstrap.min.css" rel="stylesheet">
<link href="${host }/admin/new-version/css/fonts.css" rel="stylesheet">
<link href="${host }/admin/new-version/css/style.css" rel="stylesheet">
<style>
.show-grid [class^=col-] {
    padding-top: 10px;
    padding-bottom: 10px;
    background-color: #eee;
    background-color: rgba(86,61,124,.15);
    border: 1px solid #ddd;
    border: 1px solid rgba(86,61,124,.2);
}
.show-grid {
    margin-bottom: 15px;
}
</style>
</head>
  
<body>
    <!--页面主要内容-->
    <main class="ftdms-layout-content">
      
      <div class="container-fluid" style="margin-bottom:90px;">
        
        <div class="row" style="margin-top:15px;">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-header"><h4>格栅</h4></div>
              <div class="card-body">
                
                <div class="table-responsive">
                  <table class="table table-bordered table-striped">
                    <thead>
                      <tr>
                        <th></th>
                        <th>
                          超小屏幕
                          <small>手机 (&lt;768px)</small>
                        </th>
                        <th>
                          小屏幕
                          <small>平板 (≥768px)</small>
                        </th>
                        <th>
                          中等屏幕
                          <small>桌面显示器 (≥992px)</small>
                        </th>
                        <th>
                          大屏幕
                          <small>大桌面显示器 (≥1200px)</small>
                        </th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <th class="text-nowrap" scope="row">栅格系统行为</th>
                        <td>总是水平排列</td>
                        <td colspan="3">开始是堆叠在一起的，当大于这些阈值时将变为水平排列C</td>
                      </tr>
                      <tr>
                        <th class="text-nowrap" scope="row"><code>.container</code> 最大宽度</th>
                        <td>None （自动）</td>
                        <td>750px</td>
                        <td>970px</td>
                        <td>1170px</td>
                      </tr>
                      <tr>
                        <th class="text-nowrap" scope="row">类前缀</th>
                        <td><code>.col-xs-</code></td>
                        <td><code>.col-sm-</code></td>
                        <td><code>.col-md-</code></td>
                        <td><code>.col-lg-</code></td>
                      </tr>
                      <tr>
                        <th class="text-nowrap" scope="row">列（column）数</th>
                        <td colspan="4">12</td>
                      </tr>
                      <tr>
                        <th class="text-nowrap" scope="row">最大列（column）宽</th>
                        <td class="text-muted">自动</td>
                        <td>~62px</td>
                        <td>~81px</td>
                        <td>~97px</td>
                      </tr>
                      <tr>
                        <th class="text-nowrap" scope="row">槽（gutter）宽</th>
                        <td colspan="4">30px （每列左右均有 15px）</td>
                      </tr>
                      <tr>
                        <th class="text-nowrap" scope="row">可嵌套</th>
                        <td colspan="4">是</td>
                      </tr>
                      <tr>
                        <th class="text-nowrap" scope="row">偏移（Offsets）</th>
                        <td colspan="4">是</td>
                      </tr>
                      <tr>
                        <th class="text-nowrap" scope="row">列排序</th>
                        <td colspan="4">是</td>
                      </tr>
                    </tbody>
                  </table>
                </div>
                
                <h5>从堆叠到水平排列</h5>
                <p>使用单一的一组 <code>.col-md-*</code> 栅格类，就可以创建一个基本的栅格系统，在手机和平板设备上一开始是堆叠在一起的（超小屏幕到小屏幕这一范围），在桌面（中等）屏幕设备上变为水平排列。所有“列（column）必须放在 ” <code>.row</code> 内。</p>
                <div class="p-lr-15">
                  <div class="row show-grid">
                    <div class="col-md-1">.col-md-1</div>
                    <div class="col-md-1">.col-md-1</div>
                    <div class="col-md-1">.col-md-1</div>
                    <div class="col-md-1">.col-md-1</div>
                    <div class="col-md-1">.col-md-1</div>
                    <div class="col-md-1">.col-md-1</div>
                    <div class="col-md-1">.col-md-1</div>
                    <div class="col-md-1">.col-md-1</div>
                    <div class="col-md-1">.col-md-1</div>
                    <div class="col-md-1">.col-md-1</div>
                    <div class="col-md-1">.col-md-1</div>
                    <div class="col-md-1">.col-md-1</div>
                  </div>
                  <div class="row show-grid">
                    <div class="col-md-8">.col-md-8</div>
                    <div class="col-md-4">.col-md-4</div>
                  </div>
                  <div class="row show-grid">
                    <div class="col-md-4">.col-md-4</div>
                    <div class="col-md-4">.col-md-4</div>
                    <div class="col-md-4">.col-md-4</div>
                  </div>
                  <div class="row show-grid">
                    <div class="col-md-6">.col-md-6</div>
                    <div class="col-md-6">.col-md-6</div>
                  </div>
                </div>
                
                <h5>移动设备和桌面屏幕</h5>
                <p>是否不希望在小屏幕设备上所有列都堆叠在一起？那就使用针对超小屏幕和中等屏幕设备所定义的类吧，即 <code>.col-xs-*</code> 和 <code>.col-md-*</code>。请看下面的实例，研究一下这些是如何工作的。</p>
                <div class="p-lr-15">
                  <div class="row show-grid">
                    <div class="col-xs-12 col-md-8">.col-xs-12 .col-md-8</div>
                    <div class="col-xs-6 col-md-4">.col-xs-6 .col-md-4</div>
                  </div>
                  <div class="row show-grid">
                    <div class="col-xs-6 col-md-4">.col-xs-6 .col-md-4</div>
                    <div class="col-xs-6 col-md-4">.col-xs-6 .col-md-4</div>
                    <div class="col-xs-6 col-md-4">.col-xs-6 .col-md-4</div>
                  </div>
                  <div class="row show-grid">
                    <div class="col-xs-6">.col-xs-6</div>
                    <div class="col-xs-6">.col-xs-6</div>
                  </div>
                </div>
                
                <h5>手机、平板、桌面</h5>
                <p>在上面案例的基础上，通过使用针对平板设备的 <code>.col-sm-*</code> 类，我们来创建更加动态和强大的布局吧。</p>
                <div class="p-lr-15">
                  <div class="row show-grid">
                    <div class="col-xs-12 col-sm-6 col-md-8">.col-xs-12 .col-sm-6 .col-md-8</div>
                    <div class="col-xs-6 col-md-4">.col-xs-6 .col-md-4</div>
                  </div>
                  <div class="row show-grid">
                    <div class="col-xs-6 col-sm-4">.col-xs-6 .col-sm-4</div>
                    <div class="col-xs-6 col-sm-4">.col-xs-6 .col-sm-4</div>
                    <div class="clearfix visible-xs-block"></div>
                    <div class="col-xs-6 col-sm-4">.col-xs-6 .col-sm-4</div>
                  </div>
                </div>
                
                <h5>多余的列（column）将另起一行排列</h5>
                <p>如果在一个 <code>.row</code> 内包含的列（column）大于12个，包含多余列（column）的元素将作为一个整体单元被另起一行排列。</p>
                <div class="p-lr-15">
                  <div class="row show-grid">
                    <div class="col-xs-9">.col-xs-9</div>
                    <div class="col-xs-4">.col-xs-4<br>Since 9 + 4 = 13 &gt; 12, this 4-column-wide div gets wrapped onto a new line as one contiguous unit.</div>
                    <div class="col-xs-6">.col-xs-6<br>Subsequent columns continue along the new line.</div>
                  </div>
                </div>
                
                <h5>响应式列重置</h5>
                <p>即便有上面给出的四组栅格class，你也不免会碰到一些问题，例如，在某些阈值时，某些列可能会出现比别的列高的情况。为了克服这一问题，建议联合使用 <code>.clearfix</code> 和 响应式工具类。</p>
                <div class="p-lr-15">
                  <div class="row show-grid">
                    <div class="col-xs-6 col-sm-3">
                      .col-xs-6 .col-sm-3
                      <br>
                      Resize your viewport or check it out on your phone for an example.
                    </div>
                    <div class="col-xs-6 col-sm-3">.col-xs-6 .col-sm-3</div>
                    
                    <div class="clearfix visible-xs-block"></div>
                
                    <div class="col-xs-6 col-sm-3">.col-xs-6 .col-sm-3</div>
                    <div class="col-xs-6 col-sm-3">.col-xs-6 .col-sm-3</div>
                  </div>
                </div>
                
                <h5>列偏移</h5>
                <p>使用 <code>.col-md-offset-*</code> 类可以将列向右侧偏移。这些类实际是通过使用 <code>*</code> 选择器为当前元素增加了左侧的边距（margin）。例如，<code>.col-md-offset-4</code> 类将 <code>.col-md-4</code> 元素向右侧偏移了4个列（column）的宽度。</p>
                <div class="p-lr-15">
                  <div class="row show-grid">
                    <div class="col-md-4">.col-md-4</div>
                    <div class="col-md-4 col-md-offset-4">.col-md-4 .col-md-offset-4</div>
                  </div>
                  <div class="row show-grid">
                    <div class="col-md-3 col-md-offset-3">.col-md-3 .col-md-offset-3</div>
                    <div class="col-md-3 col-md-offset-3">.col-md-3 .col-md-offset-3</div>
                  </div>
                  <div class="row show-grid">
                    <div class="col-md-6 col-md-offset-3">.col-md-6 .col-md-offset-3</div>
                  </div>
                </div>
                
                <h5>嵌套列</h5>
                <p>为了使用内置的栅格系统将内容再次嵌套，可以通过添加一个新的 <code>.row</code> 元素和一系列 <code>.col-sm-*</code> 元素到已经存在的 <code>.col-sm-*</code> 元素内。被嵌套的行（row）所包含的列（column）的个数不能超过12（其实，没有要求你必须占满12列）。</p>
                <div class="p-lr-15">
                  <div class="row show-grid">
                    <div class="col-sm-9">
                      Level 1: .col-sm-9
                      <div class="row show-grid">
                        <div class="col-xs-8 col-sm-6">
                          Level 2: .col-xs-8 .col-sm-6
                        </div>
                        <div class="col-xs-4 col-sm-6">
                          Level 2: .col-xs-4 .col-sm-6
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                
                <h5>列排序</h5>
                <p>通过使用 <code>.col-md-push-*</code> 和 <code>.col-md-pull-*</code> 类就可以很容易的改变列（column）的顺序。</p>
                <div class="p-lr-15">
                  <div class="row show-grid">
                    <div class="col-md-9 col-md-push-3">.col-md-9 .col-md-push-3</div>
                    <div class="col-md-3 col-md-pull-9">.col-md-3 .col-md-pull-9</div>
                  </div>
                </div>
                
              </div>
            </div>
          </div>
          
        </div>
        
      </div>
      
    </main>
    <!--End 页面主要内容-->

</body>
</html>