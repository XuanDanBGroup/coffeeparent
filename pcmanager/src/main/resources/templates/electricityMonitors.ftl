<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="Xenon Boostrap Admin Panel" />
    <meta name="author" content="" />

    <title>Index</title>

    <link rel="stylesheet" href="assets/css/fonts/linecons/css/linecons.css">
    <link rel="stylesheet" href="assets/css/fonts/fontawesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <link rel="stylesheet" href="assets/css/xenon-core.css">
    <link rel="stylesheet" href="assets/css/xenon-forms.css">
    <link rel="stylesheet" href="assets/css/xenon-components.css">
    <link rel="stylesheet" href="assets/css/xenon-skins.css">
    <link rel="stylesheet" href="assets/css/custom.css">

    <script src="assets/js/jquery-1.11.1.min.js"></script>

    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <script src="assets/js/daterangepicker/daterangepicker.js"></script>
    <script src="assets/js/datepicker/bootstrap-datepicker.js"></script>

    <script type="text/javascript" src="https://cdn.bootcss.com/echarts/4.3.0-rc.2/echarts.js"></script>
    <script type="text/javascript" src="https://cdn.bootcss.com/echarts/4.3.0-rc.2/extension/dataTool.min.js"></script>
    <script type="text/javascript" src="https://cdn.bootcss.com/echarts/4.3.0-rc.2/extension/bmap.min.js"></script>

    <style>
        /*.page-container .main-content .page-title{
        background: white !important;
        }
        .page-container .main-content{
        background: white !important;
        }*/
        footer.main-footer{
            margin-left: 0px !important;
        }
        .form-horizontal{
            background: white;
            min-width: 1000px;
            padding: 30px;
        }

    </style>
</head>
<body class="page-body">


<div class="page-container"><!-- add class "sidebar-collapsed" to close sidebar by default, "chat-visible" to make chat appear always -->

    <#include "components/left.ftl" />

    <div class="main-content">

        <!-- User Info, Notifications and Menu Bar -->
        <nav class="navbar user-info-navbar" role="navigation">

            <!-- Left links for user info navbar -->
            <ul class="user-info-menu left-links list-inline list-unstyled">
                <li class="hidden-sm hidden-xs">
                    <a href="#" data-toggle="sidebar">
                        <i class="fa-bars"></i>
                    </a>
                </li>
                <li class="dropdown hover-line">
                </li>
                <li class="dropdown hover-line">
                </li>

            </ul>

            <!-- Right links for user info navbar -->
            <ul class="user-info-menu right-links list-inline list-unstyled">
                <li class="search-form"><!-- You can add "always-visible" to show make the search input visible -->
                </li>
                <li class="dropdown user-profile">
                    <a href="#" data-toggle="dropdown">
                        <img src="assets/images/user-4.png" alt="user-image" class="img-circle img-inline userpic-32" width="28" />
                        <span>
								${user.uname}
								<i class="fa-angle-down"></i>
							</span>
                    </a>

                    <ul class="dropdown-menu user-profile-menu list-unstyled">
                        <li>
                            <a href="javascript:;" onclick="jQuery('#updPwd').modal('show', {backdrop: 'static'});">
                                <i class="fa-info"></i>
                                修改密码
                            </a>
                        </li>
                        <li class="last">
                            <a href="/logOut">
                                <i class="fa-lock"></i>
                                退出登录
                            </a>
                        </li>
                    </ul>
                </li>
                <li>
                </li>

            </ul>
        </nav>

        <div class="page-title">

            <div class="title-env">
                <h1 class="title">监测数据/区域用电趋势</h1>
            </div>

            <div class="breadcrumb-env">

                <ol class="breadcrumb bc-1">
                    <li>
                        <a href="#">监测数据</a>
                    </li>
                    <li class="active">

                        <strong>区域用电趋势</strong>
                    </li>
                </ol>

            </div>

        </div>

        <form action="/areaReportAction" method="post" class="form-horizontal">

            <div class="form-group">
                <label class="col-sm-2 control-label">*统计区域：</label>

                <div class="col-sm-10">
                    <select id="s1" class="form-control"
                            style="width: 12%;float: left;margin-right: 15px;">
                        <option>河南</option>
                    </select>
                    <select id="s2" class="form-control"
                            style="width: 12%;float: left;margin-right: 15px;">
                        <option>鹤壁</option>
                    </select>
                    <select id="s3" class="form-control" name="qu"
                            style="width: 15%;float: left;margin-right: 15px;">
                        <option value="111">请选择</option>
                        <option value="386710">市辖区</option>
                        <option value="386711">鹤山区</option>
                        <option value="386800">山城区</option>
                        <option value="386910">淇滨区</option>
                        <option value="387071">浚县</option>
                        <option value="387545">淇县</option>
                    </select>
                    <select id="s4" name="zhen" class="form-control"
                            style="width: 18%;float: left;margin-right: 15px;">
                        <option value="111">请选择</option>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">开始日期：</label>

                <div class="col-sm-3">
                    <div class="input-group">
                        <input type="text" class="form-control datepicker" name="startDate">
                        <div class="input-group-addon">
                            <a href="#"><i class="linecons-calendar"></i></a>
                        </div>
                    </div>
                </div>
                <label class="col-sm-2 control-label" style="width: 100px">结束日期：</label>
                <div class="col-sm-3">
                    <div class="input-group">
                        <input type="text" class="form-control datepicker" name="endDate">
                        <div class="input-group-addon">
                            <a href="#"><i class="linecons-calendar"></i></a>
                        </div>
                    </div>
                </div>
                <input type="submit" class="btn btn-blue" style="width: 10%" value="查询">
        </form>

            <div id="container" style="width:100% ;height:500px;margin-top: 20px"></div>

            <h1 align="center">${info!}</h1>
    </div>
    <!-- Main Footer -->
    <footer class="main-footer sticky footer-type-1">
        <div class="footer-inner">
            <div class="footer-text">
                &copy; 2019
                <strong>FinaleGEM</strong>
                More Information
            </div>
            <!-- Go to Top Link, just add rel="go-top" to any link to add this functionality -->
            <div class="go-up">
                <a href="#" rel="go-top">
                    <i class="fa-angle-up"></i>
                </a>
            </div>
        </div>
    </footer>
</div>

<div class="modal fade" id="updPwd">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">修改密码</h4>
            </div>
            <div class="modal-body">

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="field-3" class="control-label">原密码：</label>
                            <input type="text" class="form-control" id="oldPwd" placeholder="请输入原密码" name="oldPwd">
                        </div>

                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">

                        <div class="form-group">
                            <label for="field-3" class="control-label">新密码：</label>
                            <input type="text" class="form-control" id="newPwd" placeholder="支持6-20个字符，区分大小写" name="newPwd">
                        </div>

                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">

                        <div class="form-group">
                            <label for="field-3" class="control-label">确认密码：</label>
                            <input type="text" class="form-control" id="cfmPwd" placeholder="请再次输入密码">
                        </div>
                    </div>
                </div>

            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-white" onclick="updPwd(${user.password})">保存</button>
                <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    jQuery("#s3").change(function () {
        jQuery("#s4").empty();
        jQuery("#s4").append("<option value='111' hassubinfo='true'>请选择</option>");
        var area_id = this.options[this.selectedIndex].value;
        if (area_id != ""&&area_id != "111") {
            jQuery.ajax({
                type: "post",
                url: "/getSubAreaAjax",
                data: {"areaid": area_id},
                success: function (returnData) {
                    var province = jQuery("#s4").first();
                    jQuery.each(returnData, function (index, a) {
                        province.append("<option value='" + a.areaId + "'>" + a.areaName + "</option>");
                    });
                }
            })
        }
    });
</script>

<script type="text/javascript">
    function updPwd(userPwd) {
        var oldPwd=jQuery('#oldPwd').val();
        var newPwd=jQuery('#newPwd').val();
        var cfmPwd=jQuery('#cfmPwd').val();
        if (oldPwd!=userPwd){
            alert("原密码输入有误");
            return;
        }
        if (newPwd.length<6||newPwd.length>20){
            alert("密码应该在6-20位之间");
            return;
        }
        if (newPwd!=cfmPwd){
            alert("新密码和确认密码不符");
            return;
        }
        location.href="/updPwdAction?pwd="+newPwd;
    }

    var dom = document.getElementById("container");
    var myChart = echarts.init(dom);
    var app = {};
    option = null;
    option = {
        title: {
            text: '区域用电趋势',
            left: '3%',
            top: '1%'
        },
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data:['累计电流']
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis: {
            type: 'category',
            boundaryGap: false,
            data: ['00:30:00', '01:00:00', '01:30:00', '02:00:00', '03:30:00', '04:00:00', '04:30:00']
        },
        yAxis: {
            type: 'value'
        },
        series: [
            {
                name:'累计电流',
                type:'line',
                stack: '总量',
                color:"#0072E3",
                data: [80, 95, 103, 120, 111, 110, 101],
            }
        ]
    };

    if (option && typeof option === "object") {
        myChart.setOption(option, true);
    }
</script>

<!-- Bottom Scripts -->
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/TweenMax.min.js"></script>
<script src="assets/js/resizeable.js"></script>
<script src="assets/js/joinable.js"></script>
<script src="assets/js/xenon-api.js"></script>
<script src="assets/js/xenon-toggles.js"></script>

<!-- Imported scripts on this page -->
<script src="assets/js/xenon-widgets.js"></script>
<script src="assets/js/devexpress-web-14.1/js/knockout-3.1.0.js"></script>
<script src="assets/js/devexpress-web-14.1/js/globalize.min.js"></script>
<script src="assets/js/devexpress-web-14.1/js/dx.chartjs.js"></script>

<!-- JavaScripts initializations and stuff -->
<script src="assets/js/xenon-custom.js"></script>

</body>
</html>
