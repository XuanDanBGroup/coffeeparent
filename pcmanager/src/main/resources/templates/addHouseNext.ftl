<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="description" content="Xenon Boostrap Admin Panel"/>
    <meta name="author" content=""/>

    <title>新增户信息</title>

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


<div class="page-container">
    <!-- add class "sidebar-collapsed" to close sidebar by default, "chat-visible" to make chat appear always -->

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
                        <img src="assets/images/user-4.png" alt="user-image" class="img-circle img-inline userpic-32"
                             width="28"/>
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
                <h1 class="title">设备采购信息</h1>
            </div>

            <div class="breadcrumb-env">

                <ol class="breadcrumb bc-1">
                    <li>
                        <a href="#">户信息管理</a>
                    </li>
                    <li class="active">
                        <strong>新增户信息</strong>
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
                        <div class="form-group">
                            <label class="col-sm-2 control-label">*设备：</label>

                            <div class="col-sm-10">
                                <select class="form-control" style="width: 18%;float: left;margin-right: 15px;" id="s1">
                                    <option value="" hassubinfo="true" id="s1_cp">请选择产品类型</option>
                                </select>
                                <select class="form-control" style="width: 15%;float: left;margin-right: 15px;" id="s2">
                                    <option value="" hassubinfo="true">请选择厂家</option>
                                </select>
                                <select class="form-control" style="width: 15%;float: left;margin-right: 20px;" id="s3">
                                    <option value="" hassubinfo="true">请选择型号</option>
                                </select>
                                <button class="btn btn-white" style="float: left" onclick="appendEqInfo()">添加设备</button>
                            </div>
                        </div>

                        <div class="form-group-separator"></div>
                        <input type="hidden" id="iter"/>
                        <form action="/addHouseInfoOrder" method="post" class="form-horizontal">
                            <input type="hidden" value="${hid}" name="hid">
                            <table class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <th>产品类型</th>
                                    <th>厂家</th>
                                    <th>型号</th>
                                    <th>单价</th>
                                    <th>数量</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody id="tbody">
                                </tbody>
                            </table>

                            <div class="form-group-separator"></div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">付款方式：</label>

                                <div class="col-sm-10">
                                    <input type="radio" value="现金" name="payMethod">&nbsp;&nbsp;现金
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio" value="转账" name="payMethod" checked>&nbsp;&nbsp;转账
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio" value="支付宝" name="payMethod" checked>&nbsp;&nbsp;支付宝
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">*付款时间：</label>

                                <div class="col-sm-10">

                                    <div class="date-and-time">
                                        <input type="text" class="form-control datepicker" name="pt1" id="pt1">
                                        <input type="text" class="form-control timepicker" name="pt2"
                                               data-template="dropdown" data-show-seconds="true"
                                               data-default-time="00:00 AM" data-show-meridian="true"
                                               data-minute-step="5" data-second-step="5"/>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">*收据编号：</label>

                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="receipt" id="receipt">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">*安装协议编号：</label>

                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="agreement" id="agreement">
                                </div>
                            </div>


                            <div class="form-group-separator"></div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">&nbsp;</label>

                                <div class="col-sm-10">
                                    <input type="submit" class="btn btn-blue" value="保存 进入下一步">
                                </div>
                            </div>
                        </form>
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
                            <input type="text" class="form-control" id="newPwd" placeholder="支持6-20个字符，区分大小写"
                                   name="newPwd">
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
    var tid = ${tid?c}

        getTeamEquipments()

    // 获取该工测小组有库存的设备
    function getTeamEquipments() {
        $.post('getTeamEquipments', {tid: tid}, function (data) {
            if (data.message == 'succ') {
                var result = []
                for (var i = 0; i < data.result.length; i++) {
                    var index = result.findIndex(function (obj, index) {
                        return obj.etype == data.result[i].etype
                    })
                    if (index == -1) {
                        result.push(data.result[i])
                    }
                }
                for (var i = 0; i < result.length; i++) {
                    $("#s1").append(
                        "<option value='" + result[i].etype + "' hassubinfo='true'>" + result[i].etype + "</option>"
                    )
                }
            }
        }, 'json')
    }

    jQuery("#s1").change(function () {
        jQuery("#s2").empty();
        jQuery("#s3").empty();
        jQuery("#s2").append("<option hassubinfo='true'>请选择厂家</option>");
        jQuery("#s3").append("<option hassubinfo='true'>请选择型号</option>");
        var etype = this.options[this.selectedIndex].value;
        if (etype != "") {
            $.post('getTeamEquipments', {etype: etype, tid: tid}, function (data) {
                if (data.message == 'succ') {
                    console.log(data)
                    var result = []
                    for (var i = 0; i < data.result.length; i++) {
                        var index = result.findIndex(function (obj, index) {
                            return obj.efactory == data.result[i].efactory
                        })
                        if (index == -1) {
                            result.push(data.result[i])
                        }

                    }
                    for (var i = 0; i < result.length; i++) {
                        $("#s2").append(
                            "<option value='" + result[i].efactory + "' hassubinfo=''>" + result[i].efactory + "</option>"
                        )
                    }
                }
            }, 'json')
        }
    });
    jQuery("#s2").change(function () {
        jQuery("#s3").empty();
        jQuery("#s3").append("<option hassubinfo='true'>请选择型号</option>");
        var etype = $("#s1").val();
        var fat = this.options[this.selectedIndex].value;
        if (etype != "" && fat != "") {
            $.post('getTeamEquipments', {etype: etype, efactory: fat, tid: tid}, function (data) {
                if (data.message == 'succ') {
                    console.log(data)
                    var result = []
                    for (var i = 0; i < data.result.length; i++) {
                        $("#s3").append(
                            "<option value='" + data.result[i].eid + "'>" + data.result[i].emodel + "</option>"
                        )
                    }
                }
            }, 'json')

        }
    });
    jQuery("#s3").change(function () {
        var curr_eid = this.options[this.selectedIndex].value;
        jQuery("#iter").val(curr_eid);
    });

    function appendEqInfo() {

        var s1_cp = $("#s1").val();
        var s2 = $("#s2").text();
        var s3 = $("#s3").text();

        /*if(!s1_cp){
            alert("请选择采购设备");
            return false;
        }

        if(s2=="请选择厂家"){
            alert("请选择采购设备");
            return false;
        }
        if(s3=="请选择型号"){
            alert("请选择采购设备");
            return false;
        }*/
        /*	else{*/
        var eid = jQuery("#iter").val();
        if (eid != "") {
            jQuery.ajax({
                type: "post",
                url: "/getEquInfoAjax",
                data: {"eid": eid},
                success: function (data) {
                    var node = jQuery("#tbody");
                    var ntr = $("<tr>" +
                        "<td style='display: none;'><input name='eid' value=" + "'" + eid + "'" + "></td></tr>" +
                        "<td>" + data.etype + "</td><td>" + data.efactory + "</td><td>" + data.emodel + "</td>" +
                        "<td>" + data.eprice + "</td>" +
                        "<td style='width: 18%;'><input type='text' value='1' name='amt'/></td>" +
                        "<td><a href='javascript:void(0)' onclick='cut(this)'>删除</a></td>"
                    );
                    node.append(ntr);
                    jQuery("#s2").empty();
                    jQuery("#s3").empty();
                    jQuery("#s2").append("<option hassubinfo='true'>请选择厂家</option>");
                    jQuery("#s3").append("<option hassubinfo='true'>请选择型号</option>");
                    $("#s1").val('')
                }
            });
        }
    }

    /*}*/

    function cut(dom) {
        $(dom).parent().parent().remove();
    }


    function updPwd(userPwd) {
        var oldPwd = jQuery('#oldPwd').val();
        var newPwd = jQuery('#newPwd').val();
        var cfmPwd = jQuery('#cfmPwd').val();
        if (oldPwd != userPwd) {
            alert("原密码输入有误");
            return;
        }
        if (newPwd.length < 6 || newPwd.length > 20) {
            alert("密码应该在6-20位之间");
            return;
        }
        if (newPwd != cfmPwd) {
            alert("新密码和确认密码不符");
            return;
        }
        location.href = "/updPwdAction?pwd=" + newPwd;

    }

    $("form").submit(function () {
        var pt1 = $("#pt1").val();
        var receipt = $("#receipt").val();
        var agreement = $("#agreement").val();
        var amts = $('input[name=amt]')
        for (var i = 0; i < amts.length; i++) {
            if (!amts.val()) {
                alert('请填写产品数量')
                return false;
            }
        }

        /*     if (pt1 == "") {
                 alert("请完善信息");
                 return false;
             }
             if (receipt == "") {
                 alert("请完善信息");
                 return false;
             }
             if (agreement == "") {
                 alert("请完善信息");
                 return false;
             }*/
        var requestParam = {}
        var param = $('form').serializeArray()
        var tempEid = 0
        for (var i = 0; i < param.length; i++) {
            if (param[i].name == 'eid') {
                tempEid = param[i].value
            } else if (param[i].name == 'amt') {
                if (!requestParam.eq) {
                    requestParam.eq = []
                }
                requestParam.eq.push({eid: tempEid, amt: param[i].value})
            } else {
                requestParam[param[i].name] = param[i].value
            }
        }
        requestParam.tid = tid
        requestParam.flag = '${flag}'
        console.log(requestParam);
        $.post('addHouseInfoOrderWorker', {param: JSON.stringify(requestParam)}, function (data) {
            if (data.message == 'succ') {
                location.href = "/addHouseholdPic?hid=" + requestParam.hid
            } else {
                alert(data.result)
            }
        }, "json")
        return false;
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
