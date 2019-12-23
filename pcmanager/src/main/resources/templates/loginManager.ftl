<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>鹤壁清洁能源管理平台</title>
    <link href="../css/login.css" rel="stylesheet"/>
</head>

<#--<body class="gray-bg">
<h1 align="center">${loginInfo!}</h1>
    <form action="/loginManager" method="post">
        <input type="text" name="phone">
        <input type="text" name="password">
        <input type="submit">
    </form>
</body>-->
<body>
<form action="/loginManager" method="post">
    <div>
        <header>
            <div class="logo">
                <img src="../images/image_pc_logo.png"/>
                <div>鹤壁市农村清洁取暖智能管理平台</div>
            </div>
        </header>

        <div class="container">
            <div class="login_model">
                <div class="title">
                    <img src="../images/icon_smile.svg">
                    <span>欢迎登录</span>
                </div>
                <div>
                    <input type="text" name="phone" placeholder="请输入用户名">
                </div>
                <div>
                    <input type="password" name="password" placeholder="请输入密码">
                </div>
                <#if loginInfo??>${loginInfo}</#if>
                <div>
                    <button type="submit">登 录</button>
                </div>
                <div class="text">Copyright &#169 2019-2024 中能北方科技有限公司</div>
            </div>
        </div>
    </div>
</form>
</body>

</html>
