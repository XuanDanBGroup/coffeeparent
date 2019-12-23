<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"
	  xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="description" content="Xenon Boostrap Admin Panel" />
	<meta name="author" content="" />

	<title>开关列表</title>

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
                    <h1 class="title">监测管理/智能开关列表</h1>
                </div>

                <div class="breadcrumb-env">

                    <ol class="breadcrumb bc-1">
                        <li>
                            <a href="#">监测数据</a>
                        </li>
                        <li class="active">

                            <strong>开关列表</strong>
                        </li>
                    </ol>

                </div>

            </div>

            <div class="panel panel-default">
                <div class="panel-heading">
                    <#--<h3 class="panel-title">Basic Setup</h3>-->
                    <button class="btn btn-info btn-block" style="width: 100px;" onclick="jQuery('#addSwitch').modal('show', {backdrop: 'static'});">新增智能开关</button>

                </div>
                <div class="panel-body">

                    <script type="text/javascript">
                        jQuery(document).ready(function($)
                        {
                            $("#example-1").dataTable({
                                aLengthMenu: [
                                    [10, 25, 50, 100, -1], [10, 25, 50, 100, "All"]
                                ]
                            });
                        });
                    </script>

                    <table id="users" class="table table-striped table-bordered" cellspacing="0" width="100%">
                        <thead>
                        <tr>
                            <th>智能开关编号</th>
                            <th>接入时间</th>
                            <th>绑定户编号</th>
                            <th>绑定户设备</th>
                            <th>设备类型</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tfoot>
                        <tr>
                            <th>智能开关编号</th>
                            <th>接入时间</th>
                            <th>绑定户编号</th>
                            <th>绑定户设备</th>
                            <th>设备类型</th>
                            <th>操作</th>
                        </tr>
                        </tfoot>

                        <tbody>
							<#list switchVoList as vo>
								<tr>
									<td>${vo.swcode}</td>
									<#if vo.switchTime??>
									    <td>${vo.switchTime?datetime}</td>
									<#else>
										<td>--</td>
									</#if>
									<#if vo.hid=0>
									    <td>--</td>
									<#else>
										<td>${vo.hid}</td>
									</#if>
									<#if vo.code??>
									    <td>${vo.code}</td>
									<#else>
										<td>--</td>
									</#if>
									<#if vo.etype??>
									    <td>${vo.etype}</td>
									<#else>
										<td>--</td>
									</#if>
									<td>
                                        <a href="javascript:;" onclick="updSwitch(${vo.swid?c});">编辑</a>
										&nbsp;&nbsp;
										<a href="javascript:;" onclick="tie('${vo.swcode}')">绑定</a>
									</td>
								</tr>
							</#list>
                        </tbody>
                    </table>

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

    <div class="modal fade" id="addSwitch">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">新增智能开关</h4>
                </div>
                <form action="/addSwitch" method="post">
                <div class="modal-body">
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label for="field-3" class="control-label">*智能开关编号</label>
								<input type="text" class="form-control" id="swcode" placeholder="支持6-20个字符" name="swcode">
							</div>

						</div>
					</div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                    <#--<button type="button" class="btn btn-info">保存</button>-->
					<input type="submit" class="btn btn-info" value="保存">
                </div>
                </form>
            </div>
        </div>
    </div>

    <div class="modal fade" id="updSwitch">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">编辑智能开关</h4>
                </div>
                <form action="/updSwitch" method="post">
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="field-3" class="control-label">*智能开关编号</label>
                                    <input type="text" class="form-control" id="updUser_phone" placeholder="" name="swcode">
                                </div>

                            </div>
                        </div>
						<input type="hidden" name="swid" id="upd_swid">
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                        <input type="submit" class="btn btn-info" value="保存">
                    </div>
                </form>
            </div>
		</div>
    </div>
	<script type="text/javascript">
        $(document).ready(function(){
            $("#users").dataTable().fnDestroy();
		  $('#users').dataTable({
						"language":{
							"sLengthMenu":"每页显示 _MENU_ 条记录",
                            "zeroRecords": "没有匹配结果",
                            "info": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
                            "infoEmpty": "显示第 0 至 0 项结果，共 0 项",
                            "infoFiltered": "(由 _MAX_ 项结果过滤)",
                            "search": "搜索:",
                            "searchPlaceholder": "搜索...",
                            "url": "",
                            "emptyTable": "表中数据为空",
							"paginate":{
								"previous":"上一页",
								"next":"下一页"
							},
						}
		  });
		});
	</script>
    <script type="text/javascript">
        function updSwitch(swid) {
            jQuery('#updSwitch').modal('show', {backdrop: 'static'});
			jQuery('#upd_swid').val(swid);

		}

        function tie(code) {
            location.href="/toTieEqu?code="+code;
        }
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

        $("form").submit(function(){
            var swcode=$("#swcode").val();
            if(!swcode){
                alert("填写设备编号");
                return false;
            }
        })
    </script>
    <link rel="stylesheet" href="assets/js/datatables/dataTables.bootstrap.css">

    <!-- Bottom Scripts -->
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/TweenMax.min.js"></script>
	<script src="assets/js/resizeable.js"></script>
	<script src="assets/js/joinable.js"></script>
	<script src="assets/js/xenon-api.js"></script>
	<script src="assets/js/xenon-toggles.js"></script>
    <script src="assets/js/datatables/js/jquery.dataTables.min.js"></script>

	<!-- Imported scripts on this page -->
    <script src="assets/js/datatables/dataTables.bootstrap.js"></script>
    <script src="assets/js/datatables/yadcf/jquery.dataTables.yadcf.js"></script>
    <script src="assets/js/datatables/tabletools/dataTables.tableTools.min.js"></script>

    <!-- JavaScripts initializations and stuff -->
	<script src="assets/js/xenon-custom.js"></script>

</body>
</html>
