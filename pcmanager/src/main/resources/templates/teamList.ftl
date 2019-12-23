<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"
	  xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="description" content="Xenon Boostrap Admin Panel" />
	<meta name="author" content="" />

	<title>工程小组列表</title>

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
				<h1 class="title">系统管理/工程小组管理</h1>
			</div>

			<div class="breadcrumb-env">

				<ol class="breadcrumb bc-1">
					<li>
						<a href="#">工程小组管理</a>
					</li>
					<li class="active">
						<strong>工程小组列表</strong>
					</li>
				</ol>

			</div>

		</div>

		<div class="panel panel-default">
			<div class="panel-heading">
				<#--<h3 class="panel-title">Basic Setup</h3>-->
				<button class="btn btn-info btn-block" style="width: 100px;" onclick="jQuery('#addTeam').modal('show', {backdrop: 'static'});">新增小组</button>

			</div>
			<div class="panel-body">

				<table class="table table-bordered table-striped">
					<thead>
					<tr>
						<th>小组名称</th>
						<th>组长</th>
						<th>组员</th>
						<th>创建日期</th>
						<th>创建人</th>
						<th>操作</th>
					</tr>
					</thead>
					<tbody>
					<#list teamVoList as teamVo>
						<tr>
							<td>${teamVo.tname}</td>
							<td>${teamVo.leaderName}</td>
							<td>
								<#list teamVo.members as user>
									<#if user.role!=2>
										${user.uname}&nbsp;
									</#if>
								</#list>
							</td>
							<td>${teamVo.createdTime?string("yyyy-MM-dd")}</td>
							<td>${teamVo.tcreater}</td>
							<td>
								<a href="javascript:;" onclick="showAjaxUpdate(${teamVo.tid});">编辑信息</a>
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

<div class="modal fade" id="addTeam">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title">新增工作小组</h4>
			</div>
			<form action="/addTeam" method="post">
				<div class="modal-body">

					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label for="field-3" class="control-label">*小组名</label>
								<input type="text" class="form-control xz" placeholder="支持6-20个字符" name="tname" id="field-3" onblur="checkTname()">
							</div>

						</div>
					</div>

					<div class="row">
						<div class="col-md-12">

							<div class="form-group">
								<label class="control-label">请选择组长</label>
								<select class="form-control" name="tleader" id="tleader">
									<option value="请选择">请选择</option>
									<#list leaders as leader>
										<option value="${leader.uid}">${leader.uname}</option>
									</#list>
								</select>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label for="field-3" class="control-label">选择信息员</label>
								<p>
									<#list members as member>
										<#if member.role=3>
											<label class="checkbox-inline">
												<input type="checkbox" value="${member.uid}" name="mid" >
												${member.uname}
											</label>
										</#if>
									</#list>
								</p>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label for="field-3" class="control-label">选择库管员</label>
								<p>
									<#list members as member>
										<#if member.role=4>
											<label class="checkbox-inline">
												<input type="checkbox" value="${member.uid}" name="kid">
												${member.uname}
											</label>
										</#if>
									</#list>
								</p>
							</div>

						</div>
					</div>

					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label for="field-3" class="control-label">选择安装工</label>
								<p>
									<#list members as member>
										<#if member.role=5>
											<label class="checkbox-inline">
												<input type="checkbox" value="${member.uid}" name="aid">
												${member.uname}
											</label>
										</#if>
									</#list>
								</p>
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

<div class="modal fade" id="updTeam">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title">编辑工作组信息</h4>
			</div>
			<form action="/updTeam" method="post">
				<div class="modal-body">
					<input id="upd_team_tid" type="hidden" name="tid">
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label for="field-3" class="control-label">*小组名</label>
								<input type="text" class="form-control" id="upd_team_tname" placeholder="" name="tname" onblur="updCheckPhone()">
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-12">

							<div class="form-group">
								<label class="control-label">请选择组长</label>
								<select id="upd_team_leader" class="form-control" name="tleader">
									<#list leaders as leader>
										<option value="${leader.uid}">${leader.uname}</option>
									</#list>
								</select>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label for="field-3" class="control-label">选择信息员</label>
								<p id="upd_team_xxy">
									<#list members as member>
										<#if member.role=3>
											<label class="checkbox-inline">
												<input type="checkbox" value="${member.uid}" name="mid">
												${member.uname}
											</label>
										</#if>
									</#list>
								</p>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label for="field-3" class="control-label">选择库管员</label>
								<p id="upd_team_kgy">
									<#list members as member>
										<#if member.role=4>
											<label class="checkbox-inline">
												<input type="checkbox" value="${member.uid}" name="kid">
												${member.uname}
											</label>
										</#if>
									</#list>
								</p>
							</div>

						</div>
					</div>

					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label for="field-3" class="control-label">选择安装工</label>
								<p id="upd_team_azg">
									<#list members as member>
										<#if member.role=5>
											<label class="checkbox-inline">
												<input type="checkbox" value="${member.uid}" name="aid">
												${member.uname}
											</label>
										</#if>
									</#list>
								</p>
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
	$("form").submit(function(){
		var  tname=$(".xz").val();
		var upd_team_tname=$("#upd_team_tname").val();
		var tleader=$("#upd_team_leader option:selected").text();

		var chk_value =[];//定义一个数组
		$('input[name="mid"]:checked').each(function(){//遍历每一个名字为nodes的复选框，其中选中的执行函数
			chk_value.push($(this).val());//将选中的值添加到数组chk_value中
		});
		console.log(ku_value);
		var ku_value=[];
		$('input[name="kid"]:checked').each(function(){//遍历每一个名字为nodes的复选框，其中选中的执行函数
			ku_value.push($(this).val());//将选中的值添加到数组chk_value中
		});

		var an_value=[];
		$('input[name="aid"]:checked').each(function(){//遍历每一个名字为nodes的复选框，其中选中的执行函数
			an_value.push($(this).val());//将选中的值添加到数组chk_value中
		});
		/*if(!tname){
            alert("请填写组名");
            return false;
        }*/
		if(!tname && !upd_team_tname){
			alert("请填写组名");
			return false;
		}
		if(tleader=="请选择"){
			alert("请选择组长");
			return false;
		}

		if(chk_value.length < 1){
			alert("请选择信息员");
			return false;
		}
		if(ku_value.length < 1){
			alert("请选择库管员");
			return false;
		}
		if(an_value.length<1){
			alert("请选择安装工");
			return false;
		}
	})


	function showAjaxUpdate(tid)
	{
		jQuery('#updTeam').modal('show', {backdrop: 'static'});
		jQuery.ajax({
			url: "/getTeamInfoAjax?tid="+tid,
			success: function(result)
			{
				console.log(result)
				$('#upd_team_xxy input:checked').parent().remove()
				$('#upd_team_kgy input:checked').parent().remove()
				$('#upd_team_azg input:checked').parent().remove()
				jQuery('#upd_team_tid').val(result.tid);
				$('#upd_team_leader').val(result.lid);
				jQuery('#upd_team_tname').val(result.tname);
				// jQuery('#upd_team_leader').prepend("<option value='"+result.lid+"'>"+result.tleader+"</option>");
				$.each(result.xxy,function (n,value) {
					var apx=$("<label class='checkbox-inline'><input type='checkbox' value='"+value.uid+"' name='mid' checked>"+value.uname+"</label>");
					jQuery('#upd_team_xxy').prepend(apx);
				});
				$.each(result.kgy,function (n,value) {
					var apk=$("<label class='checkbox-inline'><input type='checkbox' value='"+value.uid+"' name='kid' checked>"+value.uname+"</label>");
					jQuery('#upd_team_kgy').prepend(apk);
				});
				$.each(result.azg,function (n,value) {
					var apa=$("<label class='checkbox-inline'>" +
							"<input type='checkbox' value='"+value.uid+"' name='aid' checked>"+value.uname+
							"</label>");
					jQuery('#upd_team_azg').prepend(apa);
				});
			}
		});
	}
	function addTeam() {
		jQuery('#roles').modal('show', {backdrop: 'static'});
		jQuery('#role_uid').val(uid);
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

	function checkTname(){
		var tname=$("#field-3").val();
		console.log('tname: '+tname)
		$.post("checkTeamName",{tname:tname},function(data){
			if(data.message == 'error'){
				alert(data.result);
			}
		},"json")
	}

	function updCheckPhone(){
		var tname=$("#upd_team_tname").val();
		console.log('tname: '+tname);
		$.post("checkTeamName",{tname:tname},function(data){
			if(data.message == 'error'){
				alert(data.result);
			}
		},"json")
	}
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
