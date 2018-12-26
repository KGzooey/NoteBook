<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page isELIgnored="false" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>账号设置</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/accounts.css">
	<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
	<script>
        $(function(){
            var begin = $("#second").hide();
            $(".nav li").click(function(){
                var divShow = $(".content").children('.list');
                if (!$(this).hasClass('selected')) {
                    var index = $(this).index();
                    $(this).addClass('selected').siblings('li').removeClass('selected');
                    $(divShow[index]).show();
                    $(divShow[index]).siblings('.list').hide();
                }
            });
        });
	</script>
</head>
<body>
<ul class="nav">
	<li class="selected">基本设置</li>
	<li>密码设置</li>
</ul>
<div class="content">
	<div class="list ">
		<div class="left">
			<div class="top-line"></div>
			<form id="basicXX" name="basicXX" method="post" action="/ks/changeXX" enctype="multipart/form-data">
				<table cellpadding="5" width="600px">
					<tr>
						<td align="right" width="100px">名 号：</td>
						<td>
							${user.username}
						</td>
					</tr>
					<tr>
						<td align="right">账号id：</td>
						<td>
							${user.id}
						</td>
					</tr>
					<tr>
						<td align="right">头 像：</td>
						<td>
							<img src="<%=request.getContextPath()%>/images/avatar/${user.avatarUrl}" width="150px;">
							<input type="file" name="filePic">
						</td>
					</tr>
					<tr>
						<td align="right">自我介绍：</td>
						<td>
							<textarea name="self-intro" id="self-intro">${user.biography}</textarea>
						</td>
					</tr>
				</table>
				<input type="submit" name="ok" value="修改" class="ok">
			</form>
		</div>
		<div class="right">
			<div class="sort">
				<h2>
					我的用户名:
				</h2>
				<div class="content">
					注册时设定，最多10个数字或字母，一经设定则不可更改。
				</div>
			</div>
			<div class="sort">
				<h2>
					我的签名:
				</h2>
				<div class="content">
					根据自己的喜好、心情来设置自己与众不同的个性签名，广泛交友。
				</div>
			</div>
			<div class="sort">
				<h2>
					自我介绍:
				</h2>
				<div class="content">
					介绍自己喜欢的书籍类型，以书交友，以评论道。
				</div>
			</div>
		</div>

	<!-- 修改密码 -->
	</div>
	<div class="list" id="second">
		<form name="pswForm" method="post" action="/ks/changePsw">
			<div style="margin-left: 200px">
				<img src="<%=request.getContextPath()%>/images/people.jpg" width="150px">
			</div>
			<div class="fff">
			<table cellpadding="5" width="600px">
				<tr>
					<td align="right" width="100px"> 原 密 码：</td>
					<td>
						<input type="text" name="oldPsw" id="oldPsw">
					</td>
				</tr>
				<tr>
					<td align="right" width="100px"> 新 密 码：</td>
					<td>
						<input type="text" name="newPsw" id="newPsw">
					</td>
				</tr>
				<tr>
					<td align="right" width="100px">确认新密码：</td>
					<td>
						<input type="text" name="newPsw2" id="newPsw2">
					</td>
				</tr>
			</table>
			</div>
			<div class="sub">
				<input type="submit" value="确认修改" id="change">
			</div>
		</form>
	</div>
	</div>
</body>
<%
	String error=(String)request.getAttribute("error");
	if(error!=null){
%>
<script>
	alert("${answer}");
</script>
<%}%>
</html>