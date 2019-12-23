<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="layui/css/layui.css">
    <link rel="stylesheet" href="Hui/css/Hui.css">
    <link rel="stylesheet" href="css/X.css">
    <script src="layui/lay/modules/jquery-3.3.1.min.js"></script>
    <script src="Hui/script/H.js"></script>
    <script src="layui/layui.js"></script>
    <script src="layui/layui.all.js"></script>
    <link rel="stylesheet" href="./icon/iconfont.css">
    <title>登录</title>
    <style>
        .desabled{
            background: #AAAAAA;
            border: #aaaaaa;
            color: white;
        }
        .desabled:active{
            background: #aaaaaa !important;
            border: #aaaaaa !important;
        }
    </style>
</head>
<body class="H-position-relative H-height-100-percent">
<!--<div style="padding-bottom: 64px;"></div>-->
<div class="main">
    <div style="width: 61px;height: 72px;margin: 39px auto 12px;background: url(./images/image_logo.png) no-repeat;background-size: cover;"></div>
    <div class="H-flexbox-vertical H-text-align-center">
        <span class="H-font-size-18"><b>鹤壁市冬季农村清洁取暖</b></span>
        <span class="H-font-size-16" style="margin-top: 8px;">智慧管理平台</span>
    </div>
    <div class="x-padding-40"></div>
    <div class="H-flexbox-horizontal H-border-vertical-both-after x-input x-ccc">
        <span class="H-icon H-vertical-middle H-margin-horizontal-left-10"><i class="iconfont icon-login H-font-size-18 H-vertical-middle H-theme-font-color-ccc"></i></span><input id="username" type="text" class="H-textbox H-vertical-align-middle H-vertical-middle H-font-size-15 H-flex-item H-box-sizing-border-box H-border-none H-outline-none H-margin-12 x-ccc" maxlength="20" placeholder="手机号" />
    </div>
    <div class="H-padding-vertical-bottom-20"></div>
    <div class="H-flexbox-horizontal H-border-vertical-bottom-after x-input">
        <span class="H-icon H-vertical-middle H-padding-horizontal-left-10 x-ccc"><i class="iconfont icon-login_mima H-theme-font-color-ccc H-font-size-18 H-vertical-middle"></i></span><input id="password" type="password" class="H-textbox H-vertical-align-middle H-vertical-middle H-font-size-15 H-flex-item H-box-sizing-border-box H-border-none H-outline-none H-padding-12 x-ccc" style="width: 10px;" maxlength="20" placeholder="短信验证码">
        <button class="H-button H-font-size-13 H-outline-none H-padding-vertical-both-8 H-padding-horizontal-both-20 H-theme-background-color6 H-theme-font-color-white H-theme-border-color6 H-theme-border-color6-click H-theme-background-color6-click H-theme-font-color6-click H-border-radius-3 x-btn"  style="width: 95px;height: 40px;margin-top: 3px;margin-right: 3px;" id="sendCode">发送验证码</button>
    </div>
    <button id="btn" class="H-button H-width-100-percent  H-font-size-15 H-outline-none H-padding-vertical-both-12 H-padding-horizontal-both-20 H-theme-background-color6 H-theme-font-color-white H-theme-border-color6 H-theme-border-color6-click H-theme-background-color6-click H-theme-font-color6-click H-border-radius-3 x-btn" style="margin-top: 75px">登录</button>
    <h3 align="center">${loginInfo!}</h3>
</div>
<div style="width: 100%;height: 111px;background: url(./images/image_bg.png);background-size:100% 100%;position: absolute;bottom: 0;display: flex;justify-content: center;align-items: center;">
    <span class="H-font-size-12 H-position-absolute" style="color: #1152B9;">&#169清洁取暖智慧管理平台</span>
</div>
<script>
    layui.use('layer',function () {
        var layer=layui.layer;
    })
    var sessionUsername=localStorage.getItem("username");
    var sessionPassword=localStorage.getItem("password");
    if(sessionUsername!=null && sessionPassword!=null){
        $("#username").val(sessionUsername);
        $("#password").val(sessionPassword);
    }

    var time =60
    var i = time;
    var flag = false;

    function send(){
        if(flag){
            return;
        }
        flag = true;
        countDown()
        var interval = setInterval(function(){
            countDown()
            if(i == 0){
                clearInterval(interval)
                i = time;
                flag = false
                $('#sendCode').text('发送验证码')
                $('#sendCode').removeClass('desabled')
                return;
            }
        }, 1000)
    }

    function countDown(){
        i--
        var text = '重新发送'+i+'s'
        $('#sendCode').text(text)
        $('#sendCode').addClass('desabled')
    }


    $(function () {
        $("#btn").click(function () {
            var username=$("#username").val();
            var password=$("#password").val();

            if(username==""){
                layer.msg("请输入手机号")
            }else if(password==""){
                layer.msg("请输入验证码")
            } else{
                //layer.msg("手机号或验证码不正确",{time:1000})
                location.href='/wokerLogin?phone='+username+"&pwd="+password;

            }
        });
    });


//验证码
/*   $(function () {
        $("#btn").click(function () {
            var username=$("#username").val();
            var password=$("#password").val();

            if(username==""){
                layer.msg("请输入手机号")
            }else if(password==""){
                layer.msg("请输入验证码")
            } else{
                //layer.msg("手机号或验证码不正确",{time:1000})
                location.href='/wokerLogin?phone='+username+"&pwd="+password;
            }
        });
        $("#sendCode").click(function () {
            if(flag){
                return;
            }
            var username=$("#username").val();
            if(username==""){
                layer.msg("请输入手机号");
                return;
            }else{
                $.post('/getCode/'+username, {param: JSON.stringify("")}, function (data) {
                    //alert(data.msg)
                    if(data.code == 200){
                        send()
                    }
                }, "json")
            }
        });
    });*/





    <#--function sendCode() {-->
        <#--event.stopPropagation();-->
        <#--var username=$("#username").val();-->
        <#--if (username==""){-->
            <#--layer.msg("请填写手机号");-->
            <#--return false;-->
        <#--}-->
        <#--var regPartton = new RegExp(/1[3-8]+\d{9}/);-->
        <#--if (!regPartton.test($("#username").val())){-->
            <#--// layer.msg("请填写11位有效手机号");-->
            <#--// return false;-->
            <#--let count = 60;-->
            <#--const countDown = setInterval(() => {-->
                <#--if (count === 0) {-->
                    <#--$('#sendCode').text('获取验证码').removeAttr('disabled');-->
                    <#--$('#sendCode').attr("onclick","sendCode()")-->
                    <#--clearInterval(countDown);-->
                <#--} else {-->
                    <#--$('#sendCode').attr('disabled', 'disabled');-->
                    <#--$('#sendCode').removeAttr('onclick');-->
                    <#--$('#sendCode').text("重新发送  "+count + 's');-->
                <#--}-->
                <#--count--;-->
            <#--}, 1000);-->
        <#--} else {-->
            <#--let count = 60;-->
            <#--const countDown = setInterval(() => {-->
                <#--if (count === 0) {-->
                    <#--$('#sendCode').text('获取验证码').removeAttr('disabled');-->
                    <#--$('#sendCode').attr("onclick","sendCode()")-->
                    <#--$("#sendCode").css("background","#0D68CE");-->
                    <#--clearInterval(countDown);-->
                <#--} else {-->
                    <#--$('#sendCode').attr('disabled', 'disabled');-->
                    <#--$('#sendCode').removeAttr('onclick');-->
                    <#--$("#sendCode").css("background","#990D68CE");-->
                    <#--$('#sendCode').text(count + '秒后可重新获取');-->
                <#--}-->
                <#--count--;-->
            <#--}, 1000);-->
            <#--$.ajax({-->
                <#--url : '${zzpt}/user/getCode',-->
                <#--type : 'POST',-->
                <#--async : true,-->
                <#--data : 'phone='+$("#phone").val(),-->
                <#--dataType : 'json',-->
                <#--success : function(data){-->

                <#--}-->

            <#--});-->

        <#--}-->

    <#--}-->
</script>
</body>
</html>
