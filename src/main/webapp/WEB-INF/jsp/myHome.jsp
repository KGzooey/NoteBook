<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>个人主页</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/people.css" charset="utf-8">
	<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
	<script src="<%=request.getContextPath()%>/js/bootstrap-wysiwyg.js"></script>
	<script>
        $.ajax({
            url : '/ks/relatedUsers',
            type : 'post',
            success : function (result) {
                var relatedUsers = eval(result);
                console.log(result);
                for (var i = 0; i < relatedUsers.length; i++){
                    var str = "";
                    str += "<a class='report' data-toggle='modal' href='/ks/preOtherHome?relatedUserId="
                    str += relatedUsers[i].id
					str +="'>"
                    str += relatedUsers[i].username
                    str += "</a>"
					if(relatedUsers[i].operateType==1&&relatedUsers[i].relateType==1){
                        $('#fanList').append(str);
					}else if(relatedUsers[i].operateType==0&&relatedUsers[i].relateType==0){
                        $('#blackList').append(str);
					}else if(relatedUsers[i].operateType==1&&relatedUsers[i].relateType==0){
                        $('#concernList').append(str);
                    }
                }
            },
            error : function (result) {
                alert("获取失败！");
            }
        });

        $(document).ready(function () {
            $('.dropdown-toggle').dropdown();
        });

	</script>
</head>
<body>
	<div class="all">
	<div class="left">
	<div id="user-profile">
		<div class="userPic">
			<img src="<%=request.getContextPath()%>/images/avatar/${user.avatarUrl}" width="100px;" class="pic">
		</div>
		<div class="info">
			${user.username}<br>
			<input placeholder="签名档">
		</div>
	</div>
	<div id="tags">
		<div class="tag">
			<a href="/ks/myHome">我的主页</a>
		</div>
		<div class="tag">
			<a href="/ks/account">设置</a>
		</div>
	</div>
	<div id="userGuide">
		<p class="guide font1">这里是你的主页，用来展示你的生活和发现，也是别人认识你的地方。<br>
完善你的个人资料，开始全新的读书之旅吧。</p>
	</div>
	<div class="sort" id="note">
		<h2>
			我的评论&nbsp;· · · · · ·
			<span>
				<a href="#">全部</a>
			</span>
			<c:forEach var="comment" items="${comments}">
				<div class="comment">
					<div class="c-left">
						<img src="<%=request.getContextPath()%>/images/cover/${comment.bookModel.coverUrl}" height="100px">
					</div>
					<div class="c-right">
						<div>
							<div class="title">评论：<a href="#">${comment.bookModel.title}</a></div>
							<div class="likeNum">点赞数：${comment.likeCount}</div>
						</div><br><br>
						<div class="detail">
								${comment.content}
						</div>
					</div>
				</div>
			</c:forEach>
        </h2>
	</div>
	<dir class="sort" id="words">
		<h2>
			留言板&nbsp;· · · · · ·
			<span>
				<a href="myHome.jsp">全部</a>
			</span>
		</h2>
		<form name="note" class="note">
			<textarea name="message"></textarea><br>
			<input type="submit" value="留言">
		</form>
		<div class="list">
			<div class="c-left">
				<img src="<%=request.getContextPath()%>/images/avatar/${user.avatarUrl}" width="50px"  class="pic">
			</div>
			<div class="c-right">
				<div>
					<a href="#">卖女孩的小火柴</a>
					&nbsp;&nbsp;&nbsp;2018-12-10 13:15
				</div><br>
				<div>
					你这个人有意思得很呀！
				</div>
			</div>
		</div>
	</dir>
</div>
<div class="right">
	<div class="rectangle">
		<div class="basic-info">
			<img src="<%=request.getContextPath()%>/images/avatar/${user.avatarUrl}">
			<div class="txt">
				${user.id}<br>
				${fn:substring(user.registerDate, 0, 11)}加入
			</div>
		</div>
		<div class="sep-line"></div>
		<div class="user-intro">
			<div class="edit-intro">
				${user.biography}
			</div>
		</div>
	</div>
	<div class="sort" id="broadcast">
		<h2>
			我的广播&nbsp;· · · · · ·
			<span>
				<a href="<%=request.getContextPath()%>/jsp/people.jsp">全部</a>
			</span>
        </h2>
        <a href="myHome.jsp">删除</a>
	</div>
	<div class="sort" id="rev-link">
		<form name="fanForm" method="post" action="/ks/preOtherHome">
		<div class="fans">
			<ul class="nav nav-pills">
				<li class="dropdown all-camera-dropdown">
					<a class="dropdown-toggle btn3" data-toggle="dropdown" href="#">
						我被${fansNum}人关注
						<b class="caret"></b>
					</a>
					<ul class="dropdown-menu">
						<li data-filter-camera-type="all" id="fanList">
						</li>
					</ul>
				</li>
			</ul>
		</div>
		<div class="concernList">
			<ul class="nav nav-pills">
				<li class="dropdown all-camera-dropdown">
					<a class="dropdown-toggle btn3" data-toggle="dropdown" href="#">
						我已关注${likesNum}人
						<b class="caret"></b>
					</a>
					<ul class="dropdown-menu">
						<li data-filter-camera-type="all" id="concernList">
						</li>
					</ul>
				</li>
			</ul>
		</div>
		<div class="blackList">
			<ul class="nav nav-pills">
				<li class="dropdown all-camera-dropdown">
					<a class="dropdown-toggle btn3" data-toggle="dropdown" href="#">
						我已拉黑${dislikesNum}人
						<b class="caret"></b>
					</a>
					<ul class="dropdown-menu">
						<li data-filter-camera-type="all" id="blackList">
						</li>
					</ul>
				</li>
			</ul>
		</div>
		</form>
	</div>
</div>
</div>
</body>
</html>