<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"
	  xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="description" content="Xenon Boostrap Admin Panel" />
	<meta name="author" content="" />

	<title>工程统计</title>

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
                    <h1 class="title">统计/工程小组统计</h1>
                </div>

                <div class="breadcrumb-env">

                    <ol class="breadcrumb bc-1">
                        <li>
                            <a href="#">统计</a>
                        </li>
                        <li class="active">

                            <strong>工程小组统计</strong>
                        </li>
                    </ol>

                </div>

            </div>

            <div class="row">
                <div class="col-sm-12">

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="panel-options">
                                <a href="#" data-toggle="panel">
                                    <span class="collapse-icon">&ndash;</span>
                                    <span class="expand-icon">+</span>
                                </a>
                                <a href="#" data-toggle="remove">
                                    &times;
                                </a>
                            </div>
                        </div>
                        <div class="panel-body">

                            <form action="/engineeringReportAction" method="post" class="form-horizontal">

                                <div class="form-group">
                                    <label class="col-sm-2 control-label" style="text-align: center">开始日期：</label>

                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <input type="text" class="form-control datepicker" name="startDate">
                                            <div class="input-group-addon">
                                                <a href="#"><i class="linecons-calendar"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                    <label class="col-sm-2 control-label" style="text-align: center">结束日期：</label>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <input type="text" class="form-control datepicker" name="endDate">
                                            <div class="input-group-addon">
                                                <a href="#"><i class="linecons-calendar"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                    <input type="submit" class="btn btn-blue" style="width: 10%" value="统计">
                            </form>
								</div>

                                <div class="form-group-separator"></div>

                                <div class="form-group">
                                    <div class="col-sm-10" style="text-align: center">
                                        <div id="content" style="text-align: center">
                                            <div id="myPieDiv" style="height: 400px; width: 550px;display:inline-block" ></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group-separator"></div>

								<div class="form-group">
									<div class="col-sm-10" style="text-align: center">
                                        <table class="table table-bordered table-striped">
                                            <thead>
                                            <tr>
                                                <th>小组名称</th>
                                                <th>小组长</th>
                                                <th>登记量</th>
                                                <th>缴费量</th>
                                                <th>出库量</th>
                                                <th>安装量</th>
                                            </tr>
                                            </thead>
                                            <tbody>
												<#list engStacVoList as vo>
												<tr>
													<td>${vo.teamName}</td>
													<td>${vo.teamLeader}</td>
													<td>${vo.dengji}</td>
													<td>${vo.jiaofei}</td>
													<td>${vo.chuku}</td>
													<td>${vo.anzhuang}</td>
												</tr>
												</#list>
												<tr>

												</tr>
                                            </tbody>
                                        </table>
									</div>
								</div>
                        </div>
                    </div>
                </div>
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
    </script>

    <script type="text/javascript">
		$(document).ready(function () {

            var myChart = echarts.init(document
                    .getElementById('myPieDiv'));
            var option = {
                title: {
                    text: '工程小组完成占比',
                    x: 'center',
                },
				legend:{
                    y:'bottom',
                  	data:[
                  	    <#list engStacVoList as esvo>
							'${esvo.teamName}',
						</#list>
					]
				},
                series : [ {
                    name : '',
                    type : 'pie',
                    radius : '65%',
                    data : [
                        <#list engStacVoList as esvo>
							{
							    value:${esvo.anzhuang},
								name:'${esvo.teamName}'
							},
                        </#list>
					],
                } ]
            };

            myChart.setOption(option);

        })

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
	<script src="echarts/echarts.js"></script>
	<script src="assets/js/devexpress-web-14.1/js/knockout-3.1.0.js"></script>
	<script src="assets/js/devexpress-web-14.1/js/globalize.min.js"></script>
	<script src="assets/js/devexpress-web-14.1/js/dx.chartjs.js"></script>
    <script src="assets/js/datatables/dataTables.bootstrap.js"></script>
    <script src="assets/js/datatables/yadcf/jquery.dataTables.yadcf.js"></script>
    <script src="assets/js/datatables/tabletools/dataTables.tableTools.min.js"></script>
    <script src="assets/js/daterangepicker/daterangepicker.js"></script>
    <script src="assets/js/datepicker/bootstrap-datepicker.js"></script>
    <script src="assets/js/timepicker/bootstrap-timepicker.min.js"></script>
    <script src="assets/js/colorpicker/bootstrap-colorpicker.min.js"></script>
    <script src="assets/js/select2/select2.min.js"></script>
    <script src="assets/js/jquery-ui/jquery-ui.min.js"></script>
    <script src="assets/js/selectboxit/jquery.selectBoxIt.min.js"></script>
    <script src="assets/js/tagsinput/bootstrap-tagsinput.min.js"></script>
    <script src="assets/js/typeahead.bundle.js"></script>
    <script src="assets/js/handlebars.min.js"></script>
    <script src="assets/js/multiselect/js/jquery.multi-select.js"></script>
	<!-- JavaScripts initializations and stuff -->
	<script src="assets/js/xenon-custom.js"></script>

</body>
</html>
