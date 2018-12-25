<%--
  Created by IntelliJ IDEA.
  User: 13600
  Date: 2018/12/20
  Time: 12:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>注册页面</title>
    <script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {

            loginNameFlag = false;
            password1Flag = false;
            password2Flag = false;

            //用户名验证
            $("#login_name").blur(function () {
                var name = $("#login_name").val();
                if (name.length == 0 || name == 0) {
                    $("#loginNameError").show();
                    loginNameFlag = false;
                } else {
                    $("#loginNameError").hide();
                    loginNameFlag = true;
                }
            });
            //密码长度验证
            $("#password1").blur(function () {
                var password1 = $("#password1").val();
                if (password1.length > 15) {
                    $("#password1Error").show();
                    password1Flag = false;
                } else {
                    $("#password1Error").hide();
                    password1Flag = true;
                }
            });
            //密码确认验证
            $("#password2").blur(function () {
                var password2 = $("#password2").val();
                var password1 = $("#password1").val();
                if (password2 != password1) {
                    $("#password2Error").show();
                    password2Flag = false;
                } else {
                    $("#password2Error").hide();
                    password2Flag = true;
                }
            });

        });
        function register() {
            if (confirm("确认提交注册信息？")) {
                if (loginNameFlag==false|| password1Flag==false|| password2Flag==false) {
                    return false;
                } else {
                    return true;
                }
            }
        }
        function cancelRegister() {
            if (confirm("确认取消？")) {
                window.location.href = "/ks/showLogin";
            } else {
                return false;
            }
        }
    </script>
</head>
<body>
<div align="center">
    <div>
        <h1>注册成为阅读者</h1>
    </div>
    <div>
        <form name="registerForm" action="/ks/register" method="post">
            <table>
                <tr>
                    <td>用户名</td>
                    <td><input id="login_name" name="loginName" type="text" placeholder="请输入您的用户名"/></td>
                    <td id="loginNameError" style="display:none;color: red;font-size: x-small">用户名不能为空！</td>
                </tr>
                <tr>
                    <td>密码</td>
                    <td><input id="password1" name="password" type="password" placeholder="请输入您的密码"/></td>
                    <td id="password1Error" style="display:none;color: red;font-size: x-small">密码不得超过15位！</td>
                </tr>
                <tr>
                    <td>密码确认</td>
                    <td><input id="password2" name="password2" type="password" placeholder="请输入您的密码进行确认"/></td>
                </tr>
                <tr>
                    <td>性别</td>
                    <td>
                        <input type="radio" name="gender" value="0">女
                        <input type="radio" name="gender" value="1">男
                    </td>
                </tr>
                <tr><td></td><td id="password2Error" style="display:none;color: red;font-size: x-small">两次密码不一致！</td></tr>
            </table>
            <p></p>
            <div class="anNiu">
                <input id="register" name="register" type="submit" value="注册" onclick="register()"/>
                <input id="cancel" name="cancel" type="button" value="取消" onclick="cancelRegister()" />
            </div>
        </form>
    </div>
</div>
</body>
</html>

