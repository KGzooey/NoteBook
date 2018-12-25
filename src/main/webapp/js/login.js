$(function () {
    //控制手
    $('#password').focus(function () {
        $('#owl-login').addClass('password');
    }).blur(function () {
        $('#owl-login').removeClass('password');
    });


    //控制密码显示与否
    controlPwd();
/*    $(window).on("resize", function () {
        $("#eye").unbind();
        controlPwd();
    });*/

    function controlPwd() {
        var $eye = $("#eye");
        var $password = $("#password");
        var flag = 1;
            $eye.click(function () {
                if(flag === 1){
                    $password.attr("type", "text");
                    flag = 0;
                } else {
                    $password.attr("type", "password");
                    flag = 1;
                }
            })
    }

});
