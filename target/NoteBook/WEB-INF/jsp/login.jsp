<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>读者登录</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/login.css">
    <style>
        .glyphicon{
            top: 0 !important;
        }
        #login #owl-login {
            width: 211px;
            height: 108px;
            background-image: url("<%=request.getContextPath()%>/images/owl-login.png");
            position: absolute;
            top: -100px;
            left: 50%;
            margin-left: -111px;
        }

        #login #owl-login .arms .arm {
            width: 40px;
            height: 65px;
            position: absolute;
            left: 20px;
            top: 40px;
            background-image: url("<%=request.getContextPath()%>/images/owl-login-arm.png");
            transition: 0.3s ease-out;
            transform: rotate(-20deg);
        }
    </style>
    <script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/login.js"></script>
    <script>
        $(function () {
            $("#forget").click(function () {
                alert("请联系管理员");
            });
            $("#logining").click(function(){
                var $username = $("#username");
                var $password = $("#password");
                if($username.val().length === 0){
                    alert("请输入用户名");
                    return false;
                } else if($password.val().length === 0){
                    alert("请输入密码");
                    return false
                }
            })
        })
    </script>
</head>
<body>
<div id="login">
    <div class="wrapper">
        <div class="login">
            <form action="/ks/login" method="post" class="container loginform" name="loginForm">
                <h1 class="text-center">徜徉在书的海洋</h1>
                <div id="owl-login">
                    <div class="hand"></div>
                    <div class="hand hand-r"></div>
                    <div class="arms">
                        <div class="arm"></div>
                        <div class="arm arm-r"></div>
                    </div>
                </div>
                <div class="pad">
                    <div class="form-group form-username">
                        <div class="controls input-group"><!-- BootStrap输入框组 -->
                            <span class="input-group-addon glyphicon glyphicon-user"></span><!-- 用户图标 -->
                            <input id="username" type="text" name="username" placeholder="输入用户名" autofocus="autofocus" class="form-control">
                        </div>
                    </div>
                    <div class="form-group form-password">
                        <div class="controls input-group"><!-- BootStrap输入框组 -->
                            <input id="password" type="password" name="password" placeholder="输入密码" class="form-control">
                            <span id="eye" class="input-group-addon glyphicon glyphicon-eye-open"></span><!-- 眼睛图标 -->
                        </div>
                    </div>
                </div>
                <div class="form-actions">
                    <a id="forget" href="#" class="btn btn-link">忘记密码？</a>
                    <a id="register" href="/ks/showRegister" class="btn btn-link">注册</a>
                    <button id="logining" type="submit" class="btn btn-primary submit">登录</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
