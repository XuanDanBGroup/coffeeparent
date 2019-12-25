<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="Xenon Boostrap Admin Panel" />
    <meta name="author" content="" />

    <title>首页</title>

    <link rel="stylesheet" href="http://fonts.useso.com/css?family=Arimo:400,700,400italic">
    <link rel="stylesheet" href="assets/css/fonts/linecons/css/linecons.css">
    <link rel="stylesheet" href="assets/css/fonts/fontawesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <link rel="stylesheet" href="assets/css/xenon-core.css">
    <link rel="stylesheet" href="assets/css/xenon-forms.css">
    <link rel="stylesheet" href="assets/css/xenon-components.css">
    <link rel="stylesheet" href="assets/css/xenon-skins.css">
    <link rel="stylesheet" href="assets/css/custom.css">

    <script src="assets/js/jquery-1.11.1.min.js"></script>

</head>
<body class="page-body">


<div class="page-container"><!-- add class "sidebar-collapsed" to close sidebar by default, "chat-visible" to make chat appear always -->

    <div class="sidebar-menu toggle-others fixed">
        <div class="sidebar-menu-inner">
            <header class="logo-env">
                <!-- logo -->
                <div class="logo">
                    <!-- <a href="dashboard-1.html" class="logo-expanded">
                        <img src="assets/images/logo@2x.png" width="80" alt="" />
                    </a> -->

                    <!-- <a href="dashboard-1.html" class="logo-collapsed">
                        <img src="assets/images/logo-collapsed@2x.png" width="40" alt="" />
                    </a> -->
                </div>

                <!-- This will toggle the mobile menu and will be visible only on mobile devices -->
                <div class="mobile-menu-toggle visible-xs">
                    <a href="#" data-toggle="user-info-menu">
                        <i class="fa-bell-o"></i>
                        <span class="badge badge-success">7</span>
                    </a>

                    <a href="#" data-toggle="mobile-menu">
                        <i class="fa-bars"></i>
                    </a>
                </div>

                <!-- This will open the popup with user profile settings, you can use for any purpose, just be creative -->
                <!-- <div class="settings-icon">
                    <a href="#" data-toggle="settings-pane" data-animate="false">
                        <i class="linecons-cog"></i>
                    </a>
                </div> -->
            </header>

            <ul id="main-menu" class="main-menu">
                <li>
                    <a href="/first" target="home">
                        <i class="linecons-star"></i>
                        <span class="title">首页</span>
                    </a>
                </li>
                <#--用户-->
                <li>
                    <a href="#">
                        <i class="linecons-cog"></i>
                        <span class="title">用户管理</span>
                    </a>
                    <ul>
                        <li>
                            <a href="/home" target="home">
                                <span class="title">用户列表</span>
                            </a>
                        </li>
                        <li>
                            <a href="/toAddUsers" target="home">
                                <span class="title">用户添加</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <#--商家-->
                <li>
                    <a href="#">
                        <i class="linecons-cog"></i>
                        <span class="title">商家管理</span>
                    </a>
                    <ul>
                        <li>
                            <a href="/householdList" target="home">
                                <span class="title">商家列表</span>
                            </a>
                        </li>
                        <li>
                            <a href="/toManagerAddStores" target="home">
                                <span class="title">商家添加</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <#--新闻-->
                <li>
                    <a href="#">
                        <i class="linecons-cog"></i>
                        <span class="title">新闻管理</span>
                    </a>
                    <ul>
                        <li>
                            <a href="/showItem" target="home">
                                <span class="title">新闻列表</span>
                            </a>
                        </li>
                        <li>
                            <a href="/addItem" target="home">
                                <span class="title">新闻添加</span>
                            </a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="#">
                        <i class="linecons-cog"></i>
                        <span class="title">意见反馈</span>
                    </a>
                    <ul>
                        <li>
                            <a href="/feedbackList">
                                <span class="title">意见反馈列表</span>
                            </a>
                        </li>
                    </ul>
                </li>
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
                    <!-- <div style="padding: 0,auto;"><h4>账号管理/账号列表</h4></div> -->
                    <!-- <a href="#" data-toggle="dropdown">
                        <i >mmd</i>
                        <span class="badge badge-purple">7</span>
                    </a> -->
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
								超级管理员：admin
								<i class="fa-angle-down"></i>
							</span>
                    </a>

                    <ul class="dropdown-menu user-profile-menu list-unstyled">
                        <li>
                            <a href="#edit-profile">
                                <i class="fa-edit"></i>
                                修改密码
                            </a>
                        </li>

                        <li>
                            <a href="outLogin">
                                <i class="fa-lock"></i>
                                退出系统
                            </a>
                        </li>

                    </ul>
                </li>
                <li>
                </li>

            </ul>
        </nav>


        <iframe name="home" width="90%" height="90%" style="border: none;" src="/first">

        </iframe>

    </div>
</div>
<div class="page-loading-overlay">
    <div class="loader-2"></div>
</div>

<!-- Bottom Scripts -->
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/TweenMax.min.js"></script>
<script src="assets/js/resizeable.js"></script>
<script src="assets/js/joinable.js"></script>
<script src="assets/js/xenon-api.js"></script>
<script src="assets/js/xenon-toggles.js"></script>

<!-- Imported scripts on this page -->
<script src="assets/js/xenon-widgets.js"></script>
<script src="assets/js/devexpress-web-14.1/js/knockout-3.1.0.js"></script>
<script src="assets/js/devexpress-web-14.1/js/globalize.min.js"></script>
<script src="assets/js/devexpress-web-14.1/js/dx.chartjs.js"></script>

<!-- JavaScripts initializations and stuff -->
<script src="assets/js/xenon-custom.js"></script>

</body>
</html>
