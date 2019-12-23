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
    .operation{
        color: #169AD4;
        margin: 0 10px;
    }
    .table td,.table th{
        border-bottom: 1px solid #EEEEEE !important;
        vertical-align: middle !important;
        text-align: center;
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
                <h1 class="title">系统管理/菜单及权限配置</h1>
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
                <span>当前角色: </span>
                <span>信息员</span>
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
                            <th>模块</th>
                            <th>排序</th>
                            <th>菜单</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <div>移动端</div>
                    <tbody>
                        <tr>
                            <td rowspan="10" valign="middle">移动端</td>
                            <td>
                                <img src="/img/sort.png">
                            </td>
                            <td>
                                <input type="checkbox"/>户信息
                            </td>
                            <td>
                                <span><input type="checkbox"/>编辑</span>
                                <span><input type="checkbox"/>删除</span>
                                <span><input type="checkbox"/>查看</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img src="img/sort.png">
                            </td>
                            <td>
                                <input type="checkbox"/>新增（户信息）
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img src="img/sort.png">
                            </td>
                            <td>
                                <input type="checkbox"/>出库
                            </td>
                            <td>
                                <span><input type="checkbox"/>出库</span>
                                <span><input type="checkbox"/>查看</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img src="img/sort.png">
                            </td>
                            <td>
                                <input type="checkbox"/>设备
                            </td>
                            <td>
                                <span><input type="checkbox"/>入库</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img src="img/sort.png">
                            </td>
                            <td>
                                <input type="checkbox"/>分配
                            </td>
                            <td>
                                <span><input type="checkbox"/>分配</span>
                                <span><input type="checkbox"/>查看</span>
                                <span><input type="checkbox"/>修改</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img src="img/sort.png">
                            </td>
                            <td>
                                <input type="checkbox"/>安装
                            </td>
                            <td>
                                <span><input type="checkbox"/>安装</span>
                                <span><input type="checkbox"/>查看</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img src="img/sort.png">
                            </td>
                            <td>
                                <input type="checkbox"/>区域统计
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img src="img/sort.png">
                            </td>
                            <td>
                                <input type="checkbox"/>厂家统计
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img src="img/sort.png">
                            </td>
                            <td>
                                <input type="checkbox"/>工程统计
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img src="img/sort.png">
                            </td>
                            <td>
                                <input type="checkbox"/>我的
                            </td>
                            <td>
                            </td>
                        </tr>
                    </tbody>
                </table>

                <table id="admin" class="table table-striped table-bordered" cellspacing="0" width="100%">
                    <thead>
                    <tr>
                        <th>管理端模块</th>
                        <th>菜单</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <div>管理端</div>
                    <tbody>
                        <tr>
                            <td rowspan="2">户信息管理</td>
                            <td>
                                <input type="checkbox"/>户信息列表
                            </td>
                            <td>
                                <span><input type="checkbox"/>编辑</span>
                                <span><input type="checkbox"/>删除</span>
                                <span><input type="checkbox"/>查看</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox"/>新增户信息
                            </td>
                            <td>
                                <span><input type="checkbox"/>编辑</span>
                                <span><input type="checkbox"/>删除</span>
                                <span><input type="checkbox"/>查看</span>
                            </td>
                        </tr>
                        <tr>
                            <td rowspan="2">设备管理</td>
                            <td>
                                <input type="checkbox"/>设备列表
                            </td>
                            <td>
                                <span><input type="checkbox"/>入库</span>
                                <span><input type="checkbox"/>删除</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox"/>新增设备
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td rowspan="3">统计</td>
                            <td>
                                <input type="checkbox"/>区域统计
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox"/>工程小组统计
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox"/>厂家统计
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td rowspan="3">账号管理</td>
                            <td>
                                <input type="checkbox"/>账号列表
                            </td>
                            <td>
                                <span><input type="checkbox"/>编辑</span>
                                <span><input type="checkbox"/>账号角色分配</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox"/>新增账号
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox"/>角色列表
                            </td>
                            <td>
                                <span><input type="checkbox"/>菜单及权限配置</span>
                                <span><input type="checkbox"/>新增角色</span>
                            </td>
                        </tr>
                        <tr>
                            <td rowspan="2">工程小组管理</td>
                            <td>
                                <input type="checkbox"/>工程小组列表
                            </td>
                            <td>
                                <span><input type="checkbox"/>编辑</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox"/>新增工程小组
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>意见反馈</td>
                            <td>
                                <input type="checkbox"/>意见反馈列表
                            </td>
                            <td></td>
                        </tr>
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

<script type="text/javascript">

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
