<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="Xenon Boostrap Admin Panel" />
    <meta name="author" content="" />

    <title>添加新闻</title>

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
<body>
<div class="row">
    <div class="col-sm-12">

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">用户添加</h3>
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

                <form role="form" class="form-horizontal" action="/doAddUsers" enctype="multipart/form-data" method="post">

                <#--用户名-->
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="field-1">用户名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="field-1" placeholder="请输入用户名" name="uname">
                        </div>
                    </div>
                    <div class="form-group-separator"></div>
                <#--微信号-->
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="field-1">微信号</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="field-1" placeholder="请输入微信号" name="wxaccount">
                        </div>
                    </div>
                    <div class="form-group-separator"></div>
                <#--手机号-->
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="field-1">手机号</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="field-1" placeholder="请输入手机号" name="phone">
                        </div>
                    </div>
                    <div class="form-group-separator"></div>
                <#--邮箱地址-->
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="field-1">E-mail</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="field-1" placeholder="请输入电子邮件" name="email">
                        </div>
                    </div>
                    <div class="form-group-separator"></div>






                    <button type="submit" class="btn btn-info btn-single pull-right" >添加</button>
                </form>

            </div>
        </div>

    </div>
</div>

<!-- Bottom Scripts -->
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/TweenMax.min.js"></script>
<script src="assets/js/resizeable.js"></script>
<script src="assets/js/joinable.js"></script>
<script src="assets/js/xenon-api.js"></script>
<script src="assets/js/xenon-toggles.js"></script>


<!-- JavaScripts initializations and stuff -->
<script src="assets/js/xenon-custom.js"></script>

</body>
</html>
