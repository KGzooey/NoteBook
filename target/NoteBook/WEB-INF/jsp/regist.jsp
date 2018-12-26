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

        });

        $(function () {
            $("#register").click(function () {
                $.ajax({
                    url : '/ks/register',
                    type : 'post',
                    data: $( '#registerForm').serialize() ,
                    dataType : 'json',
                    success: function (result) {
                        var error_type = result.errorType;
                        var msg = result.msg;
                        if(error_type==1){
                            alert(msg);
                        }else if(error_type==2){
                            alert(msg);
                        }else{
                            alert(msg);
                            window.location.href="/ks/showLogin";
                        }
                    },
                    error: function (error) {
                        alert(error+"23234")
                    }
                })
            })
        })
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
        <form id="registerForm" action="" method="post">
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
            </table>
            <p></p>
            <div class="anNiu">
                <button id="register" name="register">注册</button>
                <input id="cancel" name="cancel" type="button" value="取消" onclick="cancelRegister()" />
            </div>
        </form>
    </div>
</div>
</body>
</html>

