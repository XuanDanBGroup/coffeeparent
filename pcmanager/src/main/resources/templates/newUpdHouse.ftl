<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="description" content="Xenon Boostrap Admin Panel"/>
    <meta name="author" content=""/>

    <title>修改户信息</title>

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
                <h1 class="title">户基础信息</h1>
            </div>

            <div class="breadcrumb-env">

                <ol class="breadcrumb bc-1">
                    <li>
                        <a href="#">户信息管理</a>
                    </li>
                    <li class="active">
                        <strong>编辑户信息222</strong>
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

                        <form method="post" class="form-horizontal" id="form">
                            <input type="hidden" value="${households.hid?c}" name="hid" id="hid" />
                            <div class="form-group">
                                <label class="col-sm-2 control-label">*区域：</label>

                                <div class="col-sm-10">
                                    <#--<input type="text" class="form-control" placeholder="不超过40个字符">-->
                                    <select id="s1" class="form-control"
                                            style="width: 11%;float: left;margin-right: 15px;">
                                        <option>河南</option>
                                    </select>
                                    <select id="s2" class="form-control"
                                            style="width: 11%;float: left;margin-right: 15px;">
                                        <option>鹤壁</option>
                                    </select>
                                    <select id="s3" class="form-control" style="width: 15%;float: left;margin-right: 15px;">
                                        <#list areaMap.countyList as item>
                                            <#if curArea.county == item.areaId>
                                                <option value="${item.areaId?c}" selected>${item.areaName}</option>
                                            <#else >
                                                <option value="${item.areaId?c}" >${item.areaName}</option>
                                            </#if>
                                        </#list>
                                    </select>
                                    <select id="s4" class="form-control" style="width: 15%;float: left;margin-right: 15px;">
                                        <option>请选择</option>
                                        <#list areaMap.townList as item>
                                            <#if curArea.town == item.areaId>
                                                <option value="${item.areaId?c}" selected>${item.areaName}</option>
                                            <#else >
                                                <option value="${item.areaId?c}" >${item.areaName}</option>
                                            </#if>
                                        </#list>
                                    </select>
                                    <select id="s5" name="hareaid" class="form-control" style="width: 15%;float: left;margin-right: 15px;" >
                                        <option value="">请选择</option>
                                        <#list areaMap.villageList as item>
                                            <#if curArea.village == item.areaId>
                                                <option value="${item.areaId?c}" selected>${item.areaName}</option>
                                            <#else >
                                                <option value="${item.areaId?c}" >${item.areaName}</option>
                                            </#if>
                                        </#list>
                                        <option>请选择</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">*住址：</label>

                                <div class="col-sm-10">
                                    <input type="text" class="form-control" placeholder="不超过40个字符" name="haddress"
                                           id="haddress" value="${households.haddress}">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">门牌号：</label>

                                <div class="col-sm-10">
                                    <input type="text" class="form-control" placeholder="不超过20个字符" name="hdoorNum" value="${households.hdoorNum}">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">*户主姓名：</label>

                                <div class="col-sm-10">
                                    <input type="text" class="form-control" placeholder="不超过20个字符" name="hname"
                                           id="hname" value="${households.hname}">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">*身份证号：</label>

                                <div class="col-sm-10">
                                    <input type="text" class="form-control" placeholder="请输入身份证号" name="hIDcard"
                                           id="hIDcard" value="${households.hIDcard}">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">*出生日期：</label>

                                <div class="col-sm-10">
                                    <div class="input-group">
                                        <input type="text" class="form-control datepicker" name="hbirthday"
                                               id="hbirthday" value="${households.hbirthday}">

                                        <div class="input-group-addon">
                                            <a href="#"><i class="linecons-calendar"></i></a>
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">*联系电话：</label>

                                <div class="col-sm-10">
                                    <input type="text" class="form-control" placeholder="请输入手机号码" name="hphone"
                                           id="hphone" value="${households.hphone}" onblur="checkPhone()">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">*建筑面积：</label>

                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="hbuildsqa" id="hbuildsqa" value="${households.hbuildsqa}">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">*采暖面积：</label>

                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="hheatsqa" id="hheatsqa" value="${households.hheatsqa}">
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="col-sm-2 control-label">是否贫困户：</label>

                                <div class="col-sm-10">
                                    <input type="radio" value="1" name="hpoor" <#if households.hpoor==1>checked</#if>  >是
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio" value="0" name="hpoor" <#if households.hpoor==0>checked</#if>   >否


                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">*工程小组：</label>

                                <div class="col-sm-10">
                                    <select id="team" name="hteam">
                                        <option>请选择</option>
                                        <#list teams as team>
                                            <#if team.tid == households.hteam>
                                                <option value="${team.tid?c}" selected>${team.tname}</option>
                                            <#else >
                                                <option value="${team.tid?c}">${team.tname}</option>
                                            </#if>
                                        </#list>
                                    </select>

                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">备注：</label>

                                <div class="col-sm-10">
                                    <input type="text" class="form-control" placeholder="" name="hnotes" value="${households.hnotes}">
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
    jQuery("#s3").change(function () {
        jQuery("#s4").empty();
        jQuery("#s5").empty();
        jQuery("#s4").append("<option hassubinfo='true'>请选择</option>");
        jQuery("#s5").append("<option hassubinfo='true'>请选择</option>");
        var area_id = this.options[this.selectedIndex].value;
        if (area_id != "") {
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
    jQuery("#s4").change(function () {
        jQuery("#s5").empty();
        jQuery("#s5").append("<option hassubinfo='true'>请选择</option>");
        var area_id = this.options[this.selectedIndex].value;
        if (area_id != "") {
            jQuery.ajax({
                type: "post",
                url: "/getSubAreaAjax",
                data: {"areaid": area_id},
                success: function (returnData) {
                    var province = jQuery("#s5").first();
                    jQuery.each(returnData, function (index, a) {
                        province.append("<option value='" + a.areaId + "'>" + a.areaName + "</option>");
                    });
                }
            })
        }
    });

    function showAjaxUpdate(tid) {
        jQuery('#updTeam').modal('show', {backdrop: 'static'});
        jQuery.ajax({
            url: "/getTeamInfoAjax?tid=" + tid,
            success: function (result) {
                jQuery('#upd_team_tid').val(result.tid);
                jQuery('#upd_team_tname').val(result.tname);
                // jQuery('#upd_team_leader').prepend("<option value='"+result.lid+"'>"+result.tleader+"</option>");
                $.each(result.xxy, function (n, value) {
                    var apx = $("<label class='checkbox-inline'><input type='checkbox' value='" + value.uid + "' name='mid' checked>" + value.uname + "</label>");
                    jQuery('#upd_team_xxy').prepend(apx);
                });
                $.each(result.kgy, function (n, value) {
                    var apk = $("<label class='checkbox-inline'><input type='checkbox' value='" + value.uid + "' name='mid' checked>" + value.uname + "</label>");
                    jQuery('#upd_team_kgy').prepend(apk);
                });
                $.each(result.azg, function (n, value) {
                    var apa = $("<label class='checkbox-inline'><input type='checkbox' value='" + value.uid + "' name='mid' checked>" + value.uname + "</label>");
                    jQuery('#upd_team_azg').prepend(apa);
                });

            }
        });
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


    // 验证手机号码唯一， 失去焦点的时候触发
    function checkPhone(){
        // 采用异步的形式
        var phone = $('#hphone').val()
        $.post('checkPhone', {phone: phone}, function(data){
            // data 后台返回的数据， 如果code==-1， 则是失败的信息
            if(data.code == -1){
                alert(data.message)
            }
        })
    }

    $("form").submit(function () {
        var s5 = $("#s5").val();
        var haddress = $("#haddress").val();
        var hname = $("#hname").val();
        var hIDcard = $("#hIDcard").val();
        var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
        var hbirthday = $("#hbirthday").val();
        var hphone = $("#hphone").val();
        var myreg = /^[1][3,4,5,7,8][0-9]{9}$/;
        var hbuildsqa = $("#hbuildsqa").val()
        var areareg = /^\d+(?=\.{0,1}\d+$|$)/;
        var team = $("#team").val();
        var hheatsqa = $("#hheatsqa").val();
        var hid = $("#hid").val()

        if (s5 == "请选择") {
            alert("请选择村委会");
            return false;
        }

        if (haddress == null || haddress == undefined || haddress == '' || haddress.length == 0) {
            alert("请填写住址");
            return false;
        }

        if (hname == null || hname == undefined || hname == '' || hname.length == 0) {
            alert("请选择户主姓名");
            return false;
        }

        if (hIDcard == '' || hIDcard.length == 0) {
            alert("请填写身份证号");
            return false;
        }
        if (!reg.test(hIDcard)) {
            alert("身份证号填写有误，请重新填写身份证号");
            return false;
        }
        if (hbirthday == '') {
            alert("请选择出生日期");
            return false;
        }
        if (hphone == '' || hphone.length == 0) {
            alert("请填写联系号码");
            return false;
        }
        if (!myreg.test(hphone)) {
            alert("填写的联系号码有误,请重新填写");
            return false;
        }
        if (hbuildsqa == '' || hbuildsqa.length == 0 || hbuildsqa == null || hbuildsqa == undefined) {
            alert("请填写建筑面积");
            return false;
        }
        if (!areareg.test(hbuildsqa)) {
            alert("建筑面积有误，请重新填写");
            return false;
        }

        if (hheatsqa == '' || hheatsqa.length == 0 || hheatsqa == null || hheatsqa == undefined) {
            alert("请填写采暖面积");
            return false;
        }
        if (!areareg.test(hheatsqa)) {
            alert("采暖面积有误，请重新填写");
            return false;
        }

        if (team == "请选择") {
            alert("请选择工程小组");
            return false;
        }
        console.log(decodeURIComponent($("#form").serialize()))
        $.post('updateHouseold', decodeURIComponent($("#form").serialize()), function (data) {
            if (data.message == 'succ'){
                location.href = "updHouseNext?hid="+hid
            }else {
                alert(data.result)
            }
        }, "json")
        return false;
    });
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
