<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"
	  xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="description" content="Xenon Boostrap Admin Panel" />
	<meta name="author" content="" />

	<title>设备列表</title>

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
                    <h1 class="title">系统管理/设备管理</h1>
                </div>

                <div class="breadcrumb-env">

                    <ol class="breadcrumb bc-1">
                        <li>
                            <a href="#">设备管理</a>
                        </li>
                        <li class="active">
                            <strong>设备列表</strong>
                        </li>
                    </ol>

                </div>

            </div>

            <div class="panel panel-default">
                <div class="panel-heading">
                    <#--<h3 class="panel-title">Basic Setup</h3>-->
                    <button class="btn btn-info btn-block" style="width: 100px;" onclick="jQuery('#addEqu').modal('show', {backdrop: 'static'});">新增设备</button>

                </div>
                <div class="panel-body">

                    <table class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>设备型号</th>
                            <th>类型</th>
                            <th>厂商</th>
							<th>单价（元）</th>
							<th>总库存（台）</th>
							<th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
						<#list equipmentList as equipment>
						    <tr>
								<td>${equipment.emodel}</td>
								<td>${equipment.etype}</td>
								<td>${equipment.efactory}</td>
								<td>${equipment.eprice}</td>
								<td>${equipment.estock}</td>
								<td>
                                    <a href="javascript:;" style="color: blue;" onclick="showAjaxUpdate(${equipment.eid});">库存管理</a>
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

    <div class="modal fade" id="addEqu">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">新增设备</h4>
                </div>
                <form action="/addEqu" method="post" id="addShebei">
                <div class="modal-body">

					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label for="field-3" class="control-label">*设备型号</label>
								<input type="text" class="form-control" id="type" placeholder="支持6-40个字符" name="emodel">
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-12">

							<div class="form-group">
								<label class="control-label">*类型</label>
								<select class="form-control" name="etype" id="etype">
									<option value="0" checked>请选择</option>
									<option value="sheng" checked>生物质炉具</option>
									<option value="re" checked>热风机</option>
								</select>
							</div>
						</div>
					</div>

                    <div class="row">
                        <div class="col-md-12">

                            <div class="form-group">
                                <label class="control-label">*厂商</label>
                                <select class="form-control" name="efactory" id="efactory">
                                    <option value="0" checked>请选择</option>
                                    <option value="1" checked>格力</option>
                                    <option value="2" checked>长虹</option>
                                    <option value="3" checked>美的</option>
                                    <option value="4" checked>北方中能</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="field-3" class="control-label">*单价</label>
                                <input type="text" class="form-control"   placeholder="元" name="eprice" id="eprice">
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="field-3" class="control-label">*总库存</label>
                                <input type="text" class="form-control"  placeholder="台" name="estock" id="estock">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
					<input type="submit" class="btn btn-info" value="保存">
                </div>
                </form>
            </div>
        </div>
    </div>

    <div class="modal fade" id="updStock">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">库存管理</h4>
                </div>
                <form action="/updStock" method="post">
                    <div class="modal-body">
						<input id="upd_eid" type="hidden" name="eid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <p>
                                        <label for="field-3" class="control-label">操作：</label>
                                        <label class="radio-inline">
                                            <input id="updUser_status_normal" type="radio" name="act" value="1" checked>
                                            出库
                                        </label>
                                        &nbsp;&nbsp;&nbsp;
                                        <label class="radio-inline">
                                            <input id="updUser_status_lock" type="radio" name="act" value="0">
                                            入库
                                        </label>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="field-3" class="control-label">数量：</label>
                                    <div class="input-group spinner" data-step="1">
											<span class="input-group-btn">
												<button class="btn btn-gray" data-type="decrement" onclick="changeNum()">-</button>
											</span>
                                        	<input type="text" class="form-control text-center" name="amt" value="1" id="amt" oninput="changeNum()"/>
											<span class="input-group-btn">
												<button class="btn btn-gray" data-type="increment">+</button>
											</span>
                                    </div>
                                </div>
                            </div>
                        </div>

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
        function showAjaxUpdate(eid) {
            jQuery('#updStock').modal('show', {backdrop: 'static'});
            jQuery('#upd_eid').val(eid);
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

        function changeNum(){
        	var num = $("#amt").val()
			if(!/^\d$/.test(num)){
				alert("只能输入数字");
				return;
			}
			if(Number(num) < 1){
				alert("库存数量不能小于1")
				$("#amt").val(1)
			}
		}

		$("#addShebei").submit(function(){
		    var type=$("#type").val();
		    var etype=$("#etype").val();
		    var efactory=$("#efactory").val();
		    var eprice=$("#eprice").val();
		    var estock=$("#estock").val();
            var areareg = /^\d+(?=\.{0,1}\d+$|$)/;
		    if(!type){
		        alert("请填写设备型号");
		        return false;
            }

		    if(etype==0){
		        alert("请选择商品类型");
		        return false;
            }
		    if(efactory==0){
		        alert("请选择厂商");
		        return false;
            }
		    if(!eprice){
		        alert("请填写单价");
		        return false;
            }

            if(!areareg.test(eprice)){
                alert("单价填写有误，请重新填写");
                return false;
            }

		    if(!estock){
		        alert("请填写总库存");
		        return false;
            }

		    if(!areareg.test(estock)){
		        alert("总库存填写有误，请重新填写");
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
