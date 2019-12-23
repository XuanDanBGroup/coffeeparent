<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"
	  xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="description" content="Xenon Boostrap Admin Panel" />
	<meta name="author" content="" />

	<title>账号列表</title>

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
<style>
	#role_list{
		width: 450px;
	}
	#role_list .radio-inline{
		margin-left: 0px !important;
		margin-right: 0px !important;
		width: 150px;
		margin-top: 10px;
	}
</style>
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
                    <h1 class="title">账号管理/账号列表</h1>
                </div>

                <div class="breadcrumb-env">

                    <ol class="breadcrumb bc-1">
                        <li>
                            <a href="#">账号管理</a>
                        </li>
                        <li class="active">

                            <strong>账号列表</strong>
                        </li>
                    </ol>

                </div>

            </div>

            <div class="panel panel-default">
                <div class="panel-heading">
                    <#--<h3 class="panel-title">Basic Setup</h3>-->
                    <button class="btn btn-info btn-block" style="width: 100px;" onclick="jQuery('#addUser').modal('show', {backdrop: 'static'});">新增账号</button>

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
                            <th>手机号</th>
                            <th>姓名</th>
                            <th>邮箱</th>
                            <th>性别</th>
                            <th>状态</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tfoot>
                        <tr>
                            <th>手机号</th>
                            <th>姓名</th>
                            <th>邮箱</th>
                            <th>性别</th>
                            <th>状态</th>
                            <th>操作</th>
                        </tr>
                        </tfoot>

                        <tbody>
							<#list users as user>
								<tr>
									<td>${user.phone}</td>
									<td>${user.uname}</td>
									<td>${user.mail}</td>
									<td>
										<#if user.gender=1>
										    男
										<#elseif user.gender=0>
											女
										</#if>
									</td>
									<td>
										<#if user.status=1>
										    正常
										<#elseif user.status=0>
											注销
										</#if>
									</td>
									<td>
                                        <a href="javascript:;" onclick="showAjaxUpdate(${user.uid});">编辑信息</a>
										&nbsp;&nbsp;
										<a href="javascript:;" onclick="showRoleList(${user.uid},${user.role})">用户角色</a>
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

    <div class="modal fade" id="roles">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="/updRole" method="post">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">分配角色</h4>
                </div>

                <div class="modal-body">

                    <div class="row">
                        <div class="col-md-12">

                            <div class="form-group">
                                <label for="field-3" class="control-label">用户角色</label>
                                <br>
                                <br>
								<input type="hidden" name="uid" id="role_uid">
								<p id="role_list">
                                   <#-- <label class="radio-inline">
                                        <input type="radio" name="role" value="3">
                                        信息员
                                    </label>
									&nbsp;&nbsp;&nbsp;&nbsp;
                                    <label class="radio-inline">
                                        <input type="radio" name="role" value="4">
                                        库管员
                                    </label>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <label class="radio-inline">
                                        <input type="radio" name="role" value="2">
                                        工程组长
                                    </label>
                                </p>
                                <p>
                                    <label class="radio-inline">
                                        <input type="radio" name="role" value="5">
                                        安装工
                                    </label>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <label class="radio-inline">
                                        <input type="radio" name="role" value="6">
                                        政府人员
                                    </label>
                                    &nbsp;
                                    <label class="radio-inline">
                                        <input type="radio" name="role" value="7">
                                        运维人员
                                    </label>-->
                                </p>
                            </div>

                        </div>
                    </div>

                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                    <input type="button" class="btn btn-info" value="保存" onclick="setRole()">
					<#--<button type="button" class="btn btn-info">保存</button>-->
                </div>
                </form>
            </div>
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

    <div class="modal fade" id="addUser">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">新增用户</h4>
                </div>
                <form action="/addUser" method="post">
                <div class="modal-body">

						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label for="field-3" class="control-label">*手机号</label>
									<input type="text" class="form-control" id="phone" placeholder="手机号码" name="phone">
								</div>

							</div>
						</div>

						<div class="row">
							<div class="col-md-12">

								<div class="form-group">
									<label for="field-3" class="control-label">*姓名</label>
									<input type="text" class="form-control" id="uname" placeholder="不超过20个字符" name="uname" >
								</div>

							</div>
						</div>

						<div class="row">
							<div class="col-md-12">

								<div class="form-group">
									<label for="field-3" class="control-label">邮箱</label>
									<input type="text" class="form-control" id="field-3" placeholder="请输入正确的邮箱格式" name="mail">
								</div>

							</div>
						</div>

						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label for="field-3" class="control-label">性别</label>
									<p>
										<label class="radio-inline">
											<input type="radio" name="gender" value="1" checked>
											男
										</label>
										&nbsp;&nbsp;&nbsp;
										<label class="radio-inline">
											<input type="radio" name="gender" value="0">
											女
										</label>
									</p>
								</div>

							</div>
						</div>

						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label for="field-3" class="control-label">状态</label>
									<p>
										<label class="radio-inline">
											<input type="radio" name="status" value="1" checked>
											正常
										</label>
										&nbsp;&nbsp;&nbsp;
										<label class="radio-inline">
											<input type="radio" name="status" value="0">
											锁定
										</label>
									</p>
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

    <div class="modal fade" id="updUser">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">编辑用户</h4>
                </div>
                <form action="/updUser" method="post">
                    <div class="modal-body">


                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="field-3" class="control-label">*手机号</label>
                                    <input type="text" class="form-control" id="updUser_phone" placeholder="" name="phone" >
                                </div>

                            </div>
                        </div>
						<!-- 隐藏域，保存用户看不到的表单信息 -->
						<input type="hidden" name="uid" id="updUser_uid">
                        <div class="row">
                            <div class="col-md-12">

                                <div class="form-group">
                                    <label for="field-3" class="control-label">*姓名</label>
                                    <input type="text" class="form-control" id="updUser_uname" placeholder="" name="uname">
                                </div>

                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">

                                <div class="form-group">
                                    <label for="field-3" class="control-label">邮箱</label>
                                    <input type="text" class="form-control" id="updUser_mail" placeholder="请输入正确的邮箱格式" name="mail">
                                </div>

                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="field-3" class="control-label">性别</label>
                                    <p>
                                        <label class="radio-inline">
                                            <input id="updUser_gender_male" class="update_sex" type="radio" name="gender" value="1" checked>
                                            男
                                        </label>
                                        &nbsp;&nbsp;&nbsp;
                                        <label class="radio-inline">
                                            <input id="updUser_gender_female"  class="update_sex" type="radio" name="gender" value="0">
                                            女
                                        </label>
                                    </p>
                                </div>

                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="field-3" class="control-label">状态</label>
                                    <p>
                                        <label class="radio-inline">
                                            <input id="updUser_status_normal" class="update_status" type="radio" name="status" value="1" checked>
                                            正常
                                        </label>
                                        &nbsp;&nbsp;&nbsp;
                                        <label class="radio-inline">
                                            <input id="updUser_status_lock" class="update_status" type="radio" name="status" value="0" onclick="checkStatus()">
                                            锁定
                                        </label>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
					<#--<button type="button" class="btn btn-info">保存</button>-->
                        <input type="button" class="btn btn-info" onclick="save()" value="保存">
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
		getRoleList()
        function showAjaxUpdate(uid)
        {
            jQuery('#updUser').modal('show', {backdrop: 'static'});
            jQuery.ajax({
                url: "/getUserAjax?uid="+uid,
                success: function(result)
                {
                    jQuery('#updUser_phone').val(result.phone);
                    jQuery('#updUser_uname').val(result.uname);
                    jQuery('#updUser_mail').val(result.mail);
                    jQuery('#updUser_uid').val(result.uid);
					if (result.gender==0){
					    jQuery('#updUser_gender_female').attr('checked','checked');
					}else{
                        jQuery('#updUser_gender_male').attr('checked','checked');
					}
                    if (result.status==0){
                        jQuery('#updUser_status_lock').attr('checked','checked');
                    }else{
                        jQuery('#updUser_status_normal').attr('checked','checked');
					}
                }
            });
        }
        function showRoleList(uid,rid) {
            jQuery('#roles').modal('show', {backdrop: 'static'});
            jQuery('#role_uid').val(uid);
			$(".update_role[value="+rid+"]").attr("checked",true);
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




		function checkStatus(){
			var team=$("#updUser_status_lock").val();
			console.log(team)
			/*if (team == '0'){*/
				// 点击了锁定
				// 这个是隐藏域保存的userid
				var uid = $("#updUser_uid").val();
				$.post("/checkTeamByUser",{uid:uid},function(data){
					if(data.message == 'error'){
						alert(data.result)
						// 单选框设置到正常处
						$('#updUser_status_normal').prop('checked','true')
					}
				},"json")
			}
		/*}*/

        // 保存修改信息
        function save(){
            var phone = $('#updUser_phone').val();
            var uname = $('#updUser_uname').val();
            var mail = $('#updUser_mail').val();
            var uid = $('#updUser_uid').val();
            // 获取 input 标签  name 为 status 并且为选中的值
            var status = $(".update_status:checked").val()
            var gender = $('.update_sex:checked').val()
			var myreg = /^[1][3,4,5,7,8][0-9]{9}$/;
            console.log(status)
            var data = {}
            data.gender = gender
            data.status = status;
            data.phone = phone;
            data.uname = uname;
            data.mail = mail;
            data.uid = uid;
            if (!phone){
                alert('手机号码不能为空')
                return;
            }
			if (!myreg.test(phone)) {
				alert("填写的联系号码有误,请重新填写");
				return false;
			}
            if (!uname){
                alert('用户姓名不能为空')
                return;
            }
            if (!uid){
                return;
            }

            $.post('updUser', data, function(data){
                if(data.message == 'succ'){
                    alert('保存成功')
                    // 保存成功后刷新页面
                    location.reload()
                }else{
                    alert(data.result)
                }
            }, "json")
        }


		function getRoleList(){
			$.post('getRoleList', function(data){
				if(data.message == 'succ'){
					for (var i = 0; i < data.result.length; i++){
						$('#role_list').append(
								'<label class="radio-inline">' +
								'<input type="radio" name="role" class="update_role" value="'+data.result[i].rid+'">' +
								data.result[i].rname +
								'</label>'
						)
					}
				}
			}, "json")
		}

		function setRole(){
			var uid = $("#role_uid").val();
			var rid = $(".update_role:checked").val()
			console.log(rid)
			$.post('setRole', {uid: uid, rid: rid}, function(data){
				if(data.message == 'succ'){
					alert('分配成功')
					// 保存成功后刷新页面
					location.reload()
				}else{
					alert(data.result)
				}
			}, "json")
		}

		$("form").submit(function(){
			var phone = $('#phone').val();
			var uname = $('#uname').val();
			var myreg = /^[1][3,4,5,7,8][0-9]{9}$/;
			var namereg=/^[\u4E00-\u9FA5A-Za-z\s]+(·[\u4E00-\u9FA5A-Za-z]+)*$/;
			// 获取 input 标签  name 为 status 并且为选中的值

			if (!phone){
				alert('手机号码不能为空')
				return false;
			}
			if (!myreg.test(phone)) {
				alert("填写的联系号码有误,请重新填写");
				return false;
			}
			if (!uname){
				alert('用户姓名不能为空')
				return false;
			}
			if(!namereg.test(uname)){
				alert("填写的姓名有误,请重新填写");
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
