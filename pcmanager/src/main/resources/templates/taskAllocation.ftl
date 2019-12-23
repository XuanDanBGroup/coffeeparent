<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"
	  xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="description" content="Xenon Boostrap Admin Panel" />
	<meta name="author" content="" />
	
	<title>任务管理</title>

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
    <style type="text/css">
        #monthPlan input{
            margin-left: 20px;
            width: 80px;
        }
        #monthPlan td{
            margin-top: 5px;
        }
    </style>

</head>
<body class="page-body">

	
	<div class="page-container"><!-- add class "sidebar-collapsed" to close sidebar by default, "chat-visible" to make chat appear always -->
			
		<div class="sidebar-menu toggle-others fixed">
			<div class="sidebar-menu-inner">	
				<header class="logo-env">
					<div class="logo">
                        <a href="#" class="logo-expanded">
                            <img src="assets/images/8899.png" width="170" alt="" />
                        </a>
					</div>
				</header>

                <ul id="main-menu" class="main-menu">
                    <li>
                        <a href="/init">
                            <i class="linecons-star"></i>
                            <span class="title">首页</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="linecons-cog"></i>
                            <span class="title">户信息管理</span>
                        </a>
                        <ul>
                            <li>
                                <a href="/householdList">
                                    <span class="title">户信息列表</span>
                                </a>
                            </li>
							<#if user.role==1>
							<li>
                                <a href="/addHousehold">
                                    <span class="title">新增户信息</span>
                                </a>
                            </li>
							</#if>
                        </ul>
                    </li>
					<#if user.role==1>
					<li>
                        <a href="#">
                            <i class="linecons-cog"></i>
                            <span class="title">设备管理</span>
                        </a>
                        <ul>
                            <li>
                                <a href="/equipmentList">
                                    <span class="title">设备列表</span>
                                </a>
                            </li>
                        </ul>
                    </li>
					</#if>
                    <li>
                        <a href="#">
                            <i class="linecons-cog"></i>
                            <span class="title">统计</span>
                        </a>
                        <ul>
							<#if user.role==1>
							<li>
                                <a href="/regionalStatistics">
                                    <span class="title">区域统计</span>
                                </a>
                            </li>
							<li>
                                <a href="/firmStatistics">
                                    <span class="title">厂家统计</span>
                                </a>
                            </li>
							</#if>
                            <li>
                                <a href="/engineeringStatistics">
                                    <span class="title">工程统计</span>
                                </a>
                            </li>
                        </ul>
                    </li>
					<#if user.role==1>
					<li>
                        <a href="#">
                            <i class="linecons-cog"></i>
                            <span class="title">监测数据</span>
                        </a>
                        <ul>
                            <li>
                                <a href="/temperatureMonitor">
                                    <span class="title">室温实时数据</span>
                                </a>
                            </li>
                            <li>
                                <a href="/electricityMonitor">
                                    <span class="title">区域用电趋势</span>
                                </a>
                            </li>
                            <li>
                                <a href="/switchList">
                                    <span class="title">智能开关列表</span>
                                </a>
                            </li>
                            <li>
                                <a href="/frequencySetting">
                                    <span class="title">采集频次设置</span>
                                </a>
                            </li>
                        </ul>
                    </li>
					<li>
                        <a href="#">
                            <i class="linecons-cog"></i>
                            <span class="title">计划任务管理</span>
                        </a>
                        <ul>
                            <li>
                                <a href="/taskAllocation">
                                    <span class="title">计划任务分配</span>
                                </a>
                            </li>
                            <li>
                                <a href="/taskCharts">
                                    <span class="title">进度完成图表</span>
                                </a>
                            </li>
                        </ul>
                    </li>
					<li>
                        <a href="#">
                            <i class="linecons-cog"></i>
                            <span class="title">账号管理</span>
                        </a>
                        <ul>
                            <li>
                                <a href="/accountList">
                                    <span class="title">账号列表</span>
                                </a>
                            </li>
                            <li>
                                <a href="/roleList">
                                    <span class="title">角色列表</span>
                                </a>
                            </li>
                        </ul>
                    </li>
					<li>
                        <a href="#">
                            <i class="linecons-cog"></i>
                            <span class="title">工程小组管理</span>
                        </a>
                        <ul>
                            <li>
                                <a href="/teamList">
                                    <span class="title">工程小组列表</span>
                                </a>
                            </li>
                        </ul>
                    </li>
					<li>
                        <a href="#">
                            <i class="linecons-cog"></i>
                            <span class="title">意见反馈管理</span>
                        </a>
                        <ul>
                            <li>
                                <a href="/feedbackList">
                                    <span class="title">意见反馈列表</span>
                                </a>
                            </li>
                        </ul>
                    </li>
					</#if>
                </ul>
			</div>
			
		</div>
		
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
                    <h1 class="title">任务管理/区计划列表</h1>
                </div>

                <div class="breadcrumb-env">

                    <ol class="breadcrumb bc-1">
                        <li>
                            <a href="#">计划任务管理</a>
                        </li>
                        <li class="active">

                            <strong>计划任务分配</strong>
                        </li>
                    </ol>

                </div>

            </div>

            <div class="panel panel-default">
                <div class="panel-heading">
                    <#--<h3 class="panel-title">Basic Setup</h3>-->
                    <button class="btn btn-info btn-block" style="width: 100px;" onclick="jQuery('#addPlan').modal('show', {backdrop: 'static'});">新增区计划</button>

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
                            <th>区</th>
                            <th>市</th>
                            <th>省</th>
                            <th>计划年度</th>
                            <th>生物质炉具计划量</th>
                            <th>热风机计划量</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tfoot>
                        <tr>
                            <th>区</th>
                            <th>市</th>
                            <th>省</th>
                            <th>计划年度</th>
                            <th>生物质炉具计划量</th>
                            <th>热风机计划量</th>
                            <th>操作</th>
                        </tr>
                        </tfoot>

                        <tbody>
							<#list plans as p>
								<tr>
									<td>${p.areaName}</td>
									<td>鹤壁</td>
									<td>河南</td>
                                    <td>${p.planyear?c}</td>
                                    <td>${p.amtlu?c}</td>
                                    <td>${p.amtre?c}</td>
									<td>
                                        <a href="javascript:;" onclick="moon(${p.plid});">月计划</a>
										&nbsp;&nbsp;
                                        <a href="javascript:;" onclick="editPlan(${p.plid},'${p.areaName}');">编辑</a>
                                        &nbsp;&nbsp;
										<a href="javascript:;" onclick="showRoleList(${p.plid})">删除</a>
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

    <div class="modal fade" id="addPlan">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">新增区计划</h4>
                </div>
                <form action="/addPlan" method="post">
                <div class="modal-body">

						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
                                    <label class="col-sm-3 control-label">计划区域：</label>

                                    <div class="col-sm-10">
                                        <select id="s1" class="form-control"
                                                style="width: 21%;float: left;margin-right: 15px;">
                                            <option>河南</option>
                                        </select>
                                        <select id="s2" class="form-control"
                                                style="width: 21%;float: left;margin-right: 15px;">
                                            <option>鹤壁</option>
                                        </select>
                                        <select id="s3" class="form-control" name="areaid"
                                                style="width: 25%;float: left;margin-right: 15px;">
                                            <option value="386710">市辖区</option>
                                            <option value="386711">鹤山区</option>
                                            <option value="386800">山城区</option>
                                            <option value="386910">淇滨区</option>
                                            <option value="387071">浚县</option>
                                            <option value="387545">淇县</option>
                                        </select>
                                    </div>
								</div>

							</div>
						</div>

                        <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">计划年度：</label>

                                <div class="col-sm-10">
                                    <select id="s0" class="form-control" name="planyear"
                                            style="width: 21%;float: left;margin-right: 15px;">
                                        <option value="2019">2019</option>
                                        <option value="2020">2020</option>
                                        <option value="2021">2021</option>
                                        <option value="2022">2022</option>
                                        <option value="2023">2023</option>
                                    </select>
                                </div>
                            </div>

                        </div>
                    </div>

						<div class="row">
							<div class="col-md-12">

								<div class="form-group">
									<label for="field-3" class="control-label">生物质炉具计划</label>
									<input type="text" class="form-control" id="field-3" placeholder="台" name="amtlu">
								</div>

							</div>
						</div>

						<div class="row">
							<div class="col-md-12">

								<div class="form-group">
									<label for="field-3" class="control-label">热风机计划</label>
									<input type="text" class="form-control" id="field-3" placeholder="台" name="amtre">
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

    <div class="modal fade" id="updPlan">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">编辑区计划</h4>
                </div>
                <form action="/updPlan" method="post">
                    <div class="modal-body">
                        <input type="hidden" id="plid" name="plid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">计划区域：</label>

                                    <div class="col-sm-10">
                                        <select id="s1" class="form-control"
                                                style="width: 21%;float: left;margin-right: 15px;">
                                            <option>河南</option>
                                        </select>
                                        <select id="s2" class="form-control"
                                                style="width: 21%;float: left;margin-right: 15px;">
                                            <option>鹤壁</option>
                                        </select>
                                        <select id="s3" class="form-control"
                                                style="width: 25%;float: left;margin-right: 15px;">
                                            <option id="areaName" value="">市辖区</option>
                                        </select>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">计划年度：</label>

                                    <div class="col-sm-10">
                                        <select class="form-control"
                                                style="width: 21%;float: left;margin-right: 15px;">
                                            <option id="updyear" value="0">待加载</option>
                                        </select>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">

                                <div class="form-group">
                                    <label for="field-3" class="control-label">生物质炉具计划</label>
                                    <input type="text" id="amtlu" class="form-control" id="field-3" placeholder="台" name="amtlu">
                                </div>

                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">

                                <div class="form-group">
                                    <label for="field-3" class="control-label">热风机计划</label>
                                    <input type="text" id="amtre" class="form-control" id="field-3" placeholder="台" name="amtre">
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

    <div class="modal fade" id="moonPlan">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">月计划</h4>
                </div>
                <form action="/updPlanDetail" method="post">
                    <div class="modal-body">

                        <div class="row">
                            <div class="col-md-12">
                                <table align="center">
                                    <thead>
                                    <tr>
                                        <th>月计划</th>
                                        <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;生物质炉具</th>
                                        <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;热风机</th>
                                    </tr>
                                    </thead>
                                    <tbody id="monthPlan">

                                    </tbody>
                                </table>
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
        function moon(plid)
        {
            jQuery('#moonPlan').modal('show', {backdrop: 'static'});
            jQuery.ajax({
                url: "/getMoonAjax?plid="+plid,
                success: function(result)
                {
                    $("#monthPlan").empty();
                    var str="";
                    for(var i=0;i<result.length;i++){
                        // str+=("<tr><input type='hidden' name='mon_id"+(i+1)+"' value='"+yuejihua[i].mon_id+"'>");
                        // str+=("<td>"+(i+1)+"</td>");
                        str+="<tr><input type='hidden' name='pdid"+(i+1)+"' value='"+result[i].pdid+"'><td>"+result[i].year+"年"+result[i].month+"月</td>";
                        str+="<td><input type='text' name='amtlu"+(i+1)+"' value='"+result[i].amtlu+"'>台</td>";
                        str+="<td><input type='text' name='amtre"+(i+1)+"' value='"+result[i].amtre+"'>台</td>";
                        str+="</tr>";
                    }
                    $("#monthPlan").append(str);

                },
                data:"json"
            });
        }
        function editPlan(plid,areaName)
        {
            jQuery('#updPlan').modal('show', {backdrop: 'static'});
            jQuery.ajax({
                url: "/getPlanAjax?plid="+plid,
                success: function(result)
                {
                    jQuery('#plid').val(plid);
                    jQuery('#amtlu').val(result.amtlu);
                    jQuery('#amtre').val(result.amtre);
                    jQuery('#updyear').html(result.planyear);
                    jQuery('#areaName').html(areaName);
                }
            });
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