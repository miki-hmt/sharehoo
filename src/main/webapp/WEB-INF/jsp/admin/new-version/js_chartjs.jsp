<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>Chart图表 - bootstrap中文后台管理系统模板</title>
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
          <div class="col-lg-6">
            <div class="card">
              <div class="card-header"><h4>线形图 - 1</h4></div>
              <div class="card-body">
                <canvas id="chart-line-1" width="400" height="250"></canvas>
              </div>
            </div>
          </div>
          <div class="col-lg-6">
            <div class="card">
              <div class="card-header"><h4>线形图 - 2</h4></div>
              <div class="card-body">
                <canvas id="chart-line-2" width="400" height="250"></canvas>
              </div>
            </div>
          </div>
          <div class="col-lg-6">
            <div class="card">
              <div class="card-header"><h4>线形图 - 3</h4></div>
              <div class="card-body">
                <canvas id="chart-line-3" width="400" height="250"></canvas>
              </div>
            </div>
          </div>
          <div class="col-lg-6">
            <div class="card">
              <div class="card-header"><h4>线形图 - 4</h4></div>
              <div class="card-body">
                <canvas id="chart-line-4" width="400" height="250"></canvas>
              </div>
            </div>
          </div>
          <div class="col-lg-6">
            <div class="card">
              <div class="card-header"><h4>面积图 - 1</h4></div>
              <div class="card-body">
                <canvas id="chart-area-1" width="400" height="250"></canvas>
              </div>
            </div>
          </div>
          <div class="col-lg-6">
            <div class="card">
              <div class="card-header"><h4>面积图 - 2</h4></div>
              <div class="card-body">
                <canvas id="chart-area-2" width="400" height="250"></canvas>
              </div>
            </div>
          </div>
          <div class="col-lg-6">
            <div class="card">
              <div class="card-header"><h4>垂直条形图 - 1</h4></div>
              <div class="card-body">
                <canvas id="chart-vbar-1" width="400" height="250"></canvas>
              </div>
            </div>
          </div>
          <div class="col-lg-6">
            <div class="card">
              <div class="card-header"><h4>垂直条形图 - 2</h4></div>
              <div class="card-body">
                <canvas id="chart-vbar-2" width="400" height="250"></canvas>
              </div>
            </div>
          </div>
          <div class="col-lg-6">
            <div class="card">
              <div class="card-header"><h4>水平条形图 - 1</h4></div>
              <div class="card-body">
                <canvas id="chart-hbar-1" width="400" height="250"></canvas>
              </div>
            </div>
          </div>
          <div class="col-lg-6">
            <div class="card">
              <div class="card-header"><h4>水平条形图 - 2</h4></div>
              <div class="card-body">
                <canvas id="chart-hbar-2" width="400" height="250"></canvas>
              </div>
            </div>
          </div>
          <div class="col-lg-6">
            <div class="card">
              <div class="card-header"><h4>饼图</h4></div>
              <div class="card-body">
                <canvas id="chart-pie" width="280" height="280"></canvas>
              </div>
            </div>
          </div>
          <div class="col-lg-6">
            <div class="card">
              <div class="card-header"><h4>环形图</h4></div>
              <div class="card-body">
                <canvas id="chart-doughnut" width="280" height="280"></canvas>
              </div>
            </div>
          </div>
          <div class="col-lg-6">
            <div class="card">
              <div class="card-header"><h4>雷达图</h4></div>
              <div class="card-body">
                <canvas id="chart-radar" width="360" height="360"></canvas>
              </div>
            </div>
          </div>
          <div class="col-lg-6">
            <div class="card">
              <div class="card-header"><h4>极区图</h4></div>
              <div class="card-body">
                <canvas id="chart-polar" width="360" height="360"></canvas>
              </div>
            </div>
          </div>
        </div>
        
      </div>
      
    </main>
    <!--End 页面主要内容-->

<script type="text/javascript" src="${host }/admin/new-version/js/jquery.min.js"></script>
<script type="text/javascript" src="${host }/admin/new-version/js/Chart.js"></script>
<script type="text/javascript">
new Chart($("#chart-line-1"), {
    type: 'line',
    data: {
        labels: ["01", "02", "03", "04","05", "06", "07", "08","09", "10", "11", "12"],
        datasets: [{
            label: "收入",
            fill: false,
            backgroundColor: "#36a2eb",
            borderColor: "#36a2eb",
            borderWidth: 3,
            pointRadius: 0,
            data: [120, 125, 105, 153,100, 90, 160, 111,133, 115, 135, 123]
        },
        {
            label: "支出",
            fill: false,
            borderColor: "#ff6384",
            backgroundColor: "#ff6384",
            borderWidth: 3,
            pointRadius: 0,
            data: [110, 115, 115, 151,110, 99, 120, 121,153, 105, 145, 103]
        }]
    },
    options: {}
});

new Chart($("#chart-line-2"), {
    type: 'line',
    data: {
        labels: ["01", "02", "03", "04","05", "06", "07", "08","09", "10", "11", "12"],
        datasets: [{
            label: "收入",
            fill: false,
            borderWidth: 3,
            pointRadius: 4,
            borderColor: "#36a2eb",
            backgroundColor: "#36a2eb",
            pointBackgroundColor: "#36a2eb",
            pointBorderColor: "#36a2eb",
            pointHoverBackgroundColor: "#fff",
            pointHoverBorderColor: "#36a2eb",
            data: [120, 125, 105, 153,100, 90, 160, 111,133, 115, 135, 123]
        },
        {
            label: "支出",
            fill: false,
            borderWidth: 3,
            pointRadius: 4,
            borderColor: "#ff6384",
            backgroundColor: "#ff6384",
            pointBackgroundColor: "#ff6384",
            pointBorderColor: "#ff6384",
            pointHoverBackgroundColor: "#fff",
            pointHoverBorderColor: "#ff6384",
            data: [118, 105, 115, 151,110, 109, 120, 111,158, 105, 155, 113]
        }]
    },
    options: {}
});

new Chart($("#chart-line-3"), {
    type: 'line',
    data: {
        labels: ["01", "02", "03", "04","05", "06", "07", "08","09", "10", "11", "12"],
        datasets: [
            {
                label: "收入",
                fill: false,
                borderWidth: 3,
                pointRadius: 0,
				borderColor: "#57C43C",
                pointBackgroundColor: "#57C43C",
                pointBorderColor: "#57C43C",
                pointHoverBackgroundColor: "#fff",
                pointHoverBorderColor: "#57C43C",
                data: [120, 125, 105, 153,100, 90, 160, 111,133, 115, 135, 123]
            }
        ]
    },
    options: {
        legend: {
            display: false
        },
    }
});

new Chart($("#chart-line-4"), {
    type: 'line',
    data: {
        labels: ["01", "02", "03", "04","05", "06", "07", "08","09", "10", "11", "12"],
        datasets: [{
            label: "收入",
            fill: false,
            borderWidth: 3,
            pointRadius: 5,
            borderColor: "#2292DD",
            pointBackgroundColor: "#2292DD",
            pointBorderColor: "#2292DD",
            pointHoverBackgroundColor: "#fff",
            pointHoverBorderColor: "#2292DD",
            data: [120, 125, 105, 153,100, 90, 160, 111,133, 115, 135, 123]
        }]
    },
    options: {
        legend: {
            display: false
        },
    }
});

new Chart($("#chart-area-1"), {
    type: 'line',
    data: {
        labels: ["01", "02", "03", "04","05", "06", "07", "08","09", "10", "11", "12"],
        datasets: [{
            label: "收入",
            backgroundColor: "rgba(51,202,185,0.5)",
            borderWidth: 0,
            borderColor: "rgba(0,0,0,0)",
            data: [10, 59, 80, 58, 20, 55, 40, 20, 30, 40, 38,45]
        }]
    },
    options: {
        legend: {
            display: false
        },
    }
});

new Chart($("#chart-area-2"), {
    type: 'line',
    data: {
        labels: ["周一", "周二", "周三", "周四", "周五", "周六", "周日"],
        datasets: [{
            label: "收入",
            backgroundColor: "rgba(51,202,185,0.5)",
            borderColor: "rgba(0,0,0,0)",
            pointBackgroundColor: "rgba(51,202,185,0.5)",
            pointBorderColor: "#fff",
            pointHoverBackgroundColor: "#fff",
            pointHoverBorderColor: "rgba(51,202,185,0.5)",
            data: [0, 59, 80, 58, 20, 55, 40]
        },
        {
            label: "支出",
            backgroundColor: "rgba(243,245,246,0.8)",
            borderColor: "rgba(0,0,0,0)",
            pointBackgroundColor: "rgba(243,245,246,0.8)",
            pointBorderColor: "#fff",
            pointHoverBackgroundColor: "#fff",
            pointHoverBorderColor: "rgba(243,245,246,0.8)",
            data: [28, 48, 40, 19, 86, 27, 90]
        }]
    },
    options: {}
});

new Chart($("#chart-vbar-1"), {
    type: 'bar',
    data: {
        labels: ["周一", "周二", "周三", "周四", "周五", "周六", "周日"],
        datasets: [{
            label: "收入",
            backgroundColor: "rgba(204,51,82,0.5)",
            borderColor: "rgba(0,0,0,0)",
            hoverBackgroundColor: "rgba(204,51,82,1)",
            hoverBorderColor: "rgba(0,0,0,0)",
            data: [10, 59, 80, 58, 20, 55, 40]
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
});

new Chart($("#chart-vbar-2"), {
    type: 'bar',
    data: {
        labels: ["周一", "周二", "周三", "周四", "周五", "周六", "周日"],
        datasets: [{
            label: "收入",
            backgroundColor: "rgba(204,51,82,0.5)",
            borderColor: "rgba(0,0,0,0)",
            hoverBackgroundColor: "rgba(204,51,82,1)",
            hoverBorderColor: "rgba(0,0,0,0)",
            data: [10, 59, 80, 58, 20, 55, 40]
        },
        {
            label: "支出",
            backgroundColor: "rgba(243,245,246,0.8)",
            borderColor: "rgba(0,0,0,0)",
            hoverBackgroundColor: "rgba(238,239,240,1)",
            hoverBorderColor: "rgba(0,0,0,0)",
            data: [28, 48, 40, 19, 86, 27, 90]
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
});

new Chart($("#chart-hbar-1"), {
    type: 'horizontalBar',
    data: {
        labels: ["周一", "周二", "周三", "周四", "周五", "周六", "周日"],
        datasets: [{
            label: "收入",
            backgroundColor: "rgba(51,202,185,0.5)",
            borderColor: "rgba(0,0,0,0)",
            hoverBackgroundColor: "rgba(51,202,185,0.7)",
            hoverBorderColor: "rgba(0,0,0,0)",
            data: [10, 59, 80, 58, 20, 55, 40]
        }]
    },
    options: {
        scales: {
            xAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
});

new Chart($("#chart-hbar-2"), {
    type: 'horizontalBar',
    data: {
        labels: ["周一", "周二", "周三", "周四", "周五", "周六", "周日"],
        datasets: [{
            label: "收入",
            backgroundColor: "rgba(51,202,185,0.5)",
            borderColor: "rgba(0,0,0,0)",
            hoverBackgroundColor: "rgba(51,202,185,0.7)",
            hoverBorderColor: "rgba(0,0,0,0)",
            data: [10, 59, 80, 58, 20, 55, 40]
        },
        {
            label: "支出",
            backgroundColor: "rgba(243,245,246,0.8)",
            borderColor: "rgba(0,0,0,0)",
            hoverBackgroundColor: "rgba(238,239,240,1)",
            hoverBorderColor: "rgba(0,0,0,0)",
            data: [28, 48, 40, 19, 86, 27, 90]
        }]
    },
    options: {
        scales: {
            xAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
});

new Chart($("#chart-radar"), {
    type: 'radar',
    data: {
        labels: ["饮食", "饮酒", "睡眠", "设计", "编码", "骑行", "运动"],
        datasets: [{
            label: "张三",
            backgroundColor: "rgba(51,202,185,0.7)",
            borderColor: "rgba(0,0,0,0)",
            pointBackgroundColor: "rgba(51,202,185,0.7)",
            pointBorderColor: "#fff",
            pointHoverBackgroundColor: "#fff",
            pointHoverBorderColor: "rgba(51,202,185,0.7)",
            data: [65, 59, 90, 81, 56, 55, 40]
        },
        {
            label: "李四",
            backgroundColor: "rgba(72,176,247,0.7)",
            borderColor: "rgba(0,0,0,0)",
            pointBackgroundColor: "rgba(72,176,247,0.7)",
            pointBorderColor: "#fff",
            pointHoverBackgroundColor: "#fff",
            pointHoverBorderColor: "rgba(72,176,247,0.7)",
            data: [28, 48, 40, 19, 96, 27, 100]
        }]
    },
    options: {
        responsive: false,
        legend: {
            display: false
        }
    }
});

new Chart($("#chart-polar"), {
    type: 'polarArea',
    data: {
        datasets: [{
            data: [11, 16, 7, 3, 14],
            backgroundColor: ['rgba(255,99,132,0.95)', 'rgba(75, 192, 192, 0.95)', 'rgba(255, 159, 64, 0.95)', 'rgba(231, 233, 237, 0.95)', 'rgba(54, 162, 235, 0.95)'],
            label: 'My dataset' // for legend
        }],
        labels: ["红色", "绿色", "橙色", "灰色", "蓝色"]
    },
    options: {
        responsive: false,
        legend: {
            display: false
        }
    }
});

new Chart($("#chart-pie"), {
    type: 'pie',
    data: {
        labels: ["红色", "蓝色", "橙色"],
        datasets: [{
            data: [300, 50, 100],
            backgroundColor: ['rgba(255,99,132,1)', 'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)']
        }]
    },
    options: {
        responsive: false
    }
});

new Chart($("#chart-doughnut"), {
    type: 'doughnut',
    data: {
        labels: ["红色", "蓝色", "橙色"],
        datasets: [{
            data: [300, 50, 100],
            backgroundColor: ['rgba(255,99,132,1)', 'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)']
        }]
    },
    options: {
        responsive: false
    }
});
</script>
</body>
</html>
