<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="description" content="Xenon Boostrap Admin Panel"/>
    <meta name="author" content=""/>

    <title>修改商铺信息</title>

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

        article {
            /*border: 1px solid #ccc;*/
            padding: 20px;
        }
        .icon {
            width: 2em;
            height: 2em;
            vertical-align: -0.15em;
            fill: currentColor;
            overflow: hidden;
        }
        .item {
            float: left;
            position: relative;
            margin: 20px;
        }
        .addImg {
            width: 190px;
            height: 190px;
        }
        .upload_input {
            display: none;
        }
        .preview {
            position: absolute;
            width: 190px;
            height: 190px;
            left: 0;
            top: 0;
        }
        .click {
            position: absolute;
            width: 190px;
            height: 190px;
            left: 0;
            top: 0;
            z-index: 1;
            cursor: pointer;
        }
        .delete {
            position: absolute;
            right: -2rem;
            top: -1rem;
            cursor: pointer;
            display: none;
        }
        .preview img {
            width: 100%;
            height: 100%;
        }
    </style>

</head>
<body class="page-body">


<div class="page-container">
    <!-- add class "sidebar-collapsed" to close sidebar by default, "chat-visible" to make chat appear always -->



    <div class="main-content">

        <!-- User Info, Notifications and Menu Bar -->
        <#--<nav class="navbar user-info-navbar" role="navigation">-->

            <#--<!-- Left links for user info navbar &ndash;&gt;-->
            <#--<ul class="user-info-menu left-links list-inline list-unstyled">-->
                <#--<li class="hidden-sm hidden-xs">-->
                    <#--<a href="#" data-toggle="sidebar">-->
                        <#--<i class="fa-bars"></i>-->
                    <#--</a>-->
                <#--</li>-->
                <#--<li class="dropdown hover-line">-->
                <#--</li>-->
                <#--<li class="dropdown hover-line">-->
                <#--</li>-->

            <#--</ul>-->

            <#--<!-- Right links for user info navbar &ndash;&gt;-->
            <#--<ul class="user-info-menu right-links list-inline list-unstyled">-->
                <#--<li class="search-form"><!-- You can add "always-visible" to show make the search input visible &ndash;&gt;-->
                <#--</li>-->
                <#--<li class="dropdown user-profile">-->
                    <#--<a href="#" data-toggle="dropdown">-->
                        <#--<img src="assets/images/user-4.png" alt="user-image" class="img-circle img-inline userpic-32"-->
                             <#--width="28"/>-->
                        <#--<span>-->
								<#--谁登录-->
								<#--<i class="fa-angle-down"></i>-->
							<#--</span>-->
                    <#--</a>-->

                    <#--<ul class="dropdown-menu user-profile-menu list-unstyled">-->
                        <#--<li>-->
                            <#--<a href="javascript:;" onclick="jQuery('#updPwd').modal('show', {backdrop: 'static'});">-->
                                <#--<i class="fa-info"></i>-->
                                <#--修改密码-->
                            <#--</a>-->
                        <#--</li>-->
                        <#--<li class="last">-->
                            <#--<a href="/logOut">-->
                                <#--<i class="fa-lock"></i>-->
                                <#--退出登录-->
                            <#--</a>-->
                        <#--</li>-->
                    <#--</ul>-->
                <#--</li>-->
                <#--<li>-->
                <#--</li>-->

            <#--</ul>-->
        <#--</nav>-->

        <div class="page-title">

            <div class="title-env">
                <h1 class="title">店铺信息</h1>
            </div>

            <div class="breadcrumb-env">

                <ol class="breadcrumb bc-1">
                    <li>
                        <a href="#">商铺管理</a>
                    </li>
                    <li class="active">
                        <strong>修改商铺信息</strong>
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

                        <form action="/managerAddStores" method="post" class="form-horizontal" enctype="multipart/form-data">
                            <div class="form-group">
                                <input type="hidden" name="storeid" value="${store.storeid}">
                                <label class="col-sm-2 control-label">*店铺名称:</label>

                                <div class="col-sm-10">
                                    <input type="text" class="form-control" placeholder="不超过40个字符" name="sname"
                                     value="${store.sname}"     id="sname">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">*联系电话：</label>

                                <div class="col-sm-10">
                                    <input type="text" class="form-control" placeholder="请输入手机号码" name="sphone"
                                           value="${store.sphone}"  id="sphone" onblur="checkPhone()">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">*店铺地址：</label>

                                <div class="col-sm-10">
                                    <input type="text" class="form-control" placeholder="请输入店铺地址" name="saddress"
                                           value="${store.saddress}"     id="saddress" value="">
                                </div>
                            </div>
                            <div class="wrapper wrapper-content animated fadeInRight">
                                <section style="text-align: center">
                                    <article style="margin: 0 auto;">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="ibox float-e-margins">
                                            <div class="ibox-content">
                                                <section style="text-align: center">
                                                    <article style="margin: 0 auto;">
                                                        <div class="item">
                                                            <svg class="icon addImg" aria-hidden="true">
                                                                <use xlink:href="#icon-tianjiatupian"></use>
                                                            </svg>
                                                            <input style="display: none" name="file" type="file" class="upload_input" id="url1"  onChange="preview(this)" >
                                                            <div class="preview">

                                                            </div>
                                                            <div class="click" onClick="loadImg(this)">
                                                            </div>
                                                            <div class="delete" onClick="deleteImg(this)" >
                                                                <svg class="icon" aria-hidden="true">
                                                                    <use xlink:href="#icon-shanchu4"></use>
                                                                </svg>
                                                            </div>
                                                            <div align="center">店铺首页图</div>
                                                        </div>

                                                        <div style="clear: left;"></div>
                                                    </article>
                                                </section>

                                                <script type="text/javascript">
                                                    //选择图片
                                                    var loadImg = function(obj){
                                                        $(obj).parent().find(".upload_input").click();
                                                    }
                                                    //删除
                                                    var deleteImg = function(obj){
                                                        if(confirm('确认删除图片吗？')){
                                                            $(obj).parent().find('input').val('');
                                                            $(obj).parent().find('.preview').html('');
                                                            $(obj).parent().find('input[name=imgSrc]').val('1')
                                                            $(obj).hide();
                                                        }
                                                    }
                                                </script>

                                                <!-- 预览 -->
                                                <script type="text/javascript">
                                                    function preview(file) {
                                                        var prevDiv = $(file).parent().find('.preview');
                                                        if (file.files && file.files[0]) {
                                                            var reader = new FileReader();
                                                            reader.onload = function(evt) {
                                                                prevDiv.html('<img src="' + evt.target.result + '" />');
                                                            }
                                                            reader.readAsDataURL(file.files[0]);
                                                        } else {//IE
                                                            prevDiv.html('<div class="img" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>');
                                                        }
                                                        $(file).parent().find('.delete').show();
                                                    }
                                                </script>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group-separator"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">&nbsp;</label>
                                <div class="col-sm-10"  align="center">
                                    <input type="submit" value="保存信息" id="tj" class="btn btn-blue" style="width: 10%">
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
                <button type="button" class="btn btn-white" onclick="updPwd()">保存</button>
                <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

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
<script type="text/javascript" src="js/svg.js"></script>

</body>
</html>
