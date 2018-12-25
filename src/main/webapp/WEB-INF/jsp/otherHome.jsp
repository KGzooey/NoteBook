<%@ page import="com.zust.pageModel.RelationModel" %>
<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>${other.username}</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/people.css" charset="utf-8">
	<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
	<script src="<%=request.getContextPath()%>/js/bootstrap-wysiwyg.js"></script>
	<script>
        $(document).ready(function () {
            $('.dropdown-toggle').dropdown();
        });
        function returnTo() {
			window.location.href="/ks/return";
        }
	</script>
</head>
<body>
<button type="button" class="btn btn-default" onclick="returnTo()">
	<span class="glyphicon glyphicon-arrow-left">
	</span>
</button>
	<div class="all">
	<div class="left">
	<div id="user-profile">
		<div class="userPic">
			<img src="<%=request.getContextPath()%>/images/avatar/${other.avatarUrl}" width="100px;" class="pic">
		</div>
		<div class="info">
			${other.username}<br>
		</div>
	</div>
	<div id="tags">
		<div class="tag">
			<a href="/ks/otherHome">${other.username}的主页</a>
		</div>
	</div>
	<div class="sort">
		<h2>
			${other.username}的日记&nbsp;· · · · · ·
			<span>
				<a href="#">全部</a>
			</span>
		</h2>
		<div class="diary">
			<a href="#">想念的诗都写在杰伦的歌里</a>
			<div class="font1">2018-10-23 14:23:43</div>
			<div class="diary-content">
				<div style="float:left;margin-top: -5px;margin-right: 5px">
					<img src="<%=request.getContextPath()%>/images/avatar/4.jpg" height="50px">
				</div>
				&nbsp;&nbsp;我常有写不出文章的体验。常常是整天的呆坐在那里，虽至于形神俱焦，亦凑不出一句话。
				有时候天可怜见，在苦思冥想的煎熬的黑暗里，仿佛突然看见了光，一下子有了思路，就此得大欢喜，写了开来。
			</div>
		</div>
	</div>
	<div class="sort" id="note">
		<h2>
			${other.username}的评论&nbsp;· · · · · ·
			<span>
				<a href="#">全部</a>
			</span>
			<c:forEach var="comment" items="${othersComments}">
			<div class="comment">
				<div class="c-left">
					<img src="<%=request.getContextPath()%>/images/cover/${comment.bookModel.coverUrl}" height="100px">
				</div>
				<div class="c-right">
					<div>
						<div class="title">评论：<a href="#">${comment.bookModel.title}</a></div>
						<div class="likeNum">点赞数：${comment.likeCount}</div>
					</div><br><br>
					<div class="detail" style="width: 500px">
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
				<img src="<%=request.getContextPath()%>/images/avatar/${other.avatarUrl}" width="50px"  class="pic">
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
			<img src="<%=request.getContextPath()%>/images/avatar/${other.avatarUrl}">
			<div class="txt">
				${other.id}<br>
				${fn:substring(other.registerDate,0,11)}加入
			</div>
		</div>
		<form name="relateForm" method="post" action="">
		<div class="else">
			<%
				RelationModel isLike = (RelationModel) session.getAttribute("isLike");
				RelationModel isDislike1 = (RelationModel) session.getAttribute("isDislike1");
				RelationModel isDislike2 = (RelationModel) session.getAttribute("isDislike2");
				if (isLike==null&&isDislike1==null&&isDislike2==null){%>
				<a href="/ks/operation1" class="btn1" id="relate1">关注此人+</a>
			<%}else if (isLike!=null){%>
				<a href="/ks/operation1" class="btn1" id="relate1">已关注</a>
			<%}else if (isDislike1!=null||isDislike2!=null) {%>
				<a href="" class="btn1" id="relate1">无法关注</a>
			<%}%>
			<a href="javascript:void(0)" class="btn2">发书邮</a>
			<div class="more">
					<ul class="nav nav-pills">
						<li class="dropdown all-camera-dropdown">
							<a class="dropdown-toggle btn3" data-toggle="dropdown" href="#">
								更多
								<b class="caret"></b>
							</a>
							<ul class="dropdown-menu">
								<li data-filter-camera-type="all">
									<a class="report" data-toggle="modal" data-target="#myModal1">举报</a>
									<%if(isDislike1 == null){%>
									<a class="report" data-toggle="modal" data-target="#myModal2">加入黑名单</a>
									<%}else{%>
									<a class="report" data-toggle="modal" href="/ks/operation2">已加入黑名单</a>
									<%}%>
								</li>
							</ul>
						</li>
					</ul>
			</div>
		</div>
		</form>
		<div class="sep-line"></div>
		<div class="user-intro">
			<div class="edit-intro">
				${other.biography}
			</div>
		</div>
	</div>
	<div class="sort" id="broadcast">
		<h2>
			${other.username}的广播&nbsp;· · · · · ·
			<span>
				<a href="">全部</a>
			</span>
        </h2>
	</div>
	</div>
</div>
	<div class="comment-report" >
		<!--举报的模态框-->
		<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top: 85px;">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title">
							选择举报原因
						</h4>
					</div>
					<div class="modal-body">
						<form action="" method="post">
							<input class="ipt" type="radio" name="reportreason" value="r1" checked>广告或垃圾信息<br>
							<input class="ipt" type="radio" name="reportreason" value="r1" >低俗或色情<br>
							<input class="ipt" type="radio" name="reportreason" value="r1" >违反相关法律法规或管理规定<br>
							<input class="ipt" type="radio" name="reportreason" value="r1" >未经授权的下载资源<br>
							<input class="ipt" type="radio" name="reportreason" value="r1" >辱骂或不友善<br>
							<input class="ipt" type="radio" name="reportreason" value="r1" >引战或过于偏激的主观判断<br>
							<input class="ipt" type="radio" name="reportreason" value="r1" >泄露他人隐私<br>
							<input class="ipt" type="radio" name="reportreason" value="r1" >影响评分公正性<br>
							<input class="ipt" type="radio" name="reportreason" value="r1" >与作品或讨论区主题无关<br>
							<input class="ipt" type="radio" name="reportreason" value="r1" >刷屏<br>
							<input class="ipt" type="radio" name="reportreason" value="r1" >其他原因<br>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消
						</button>
						<button type="button" class="btn btn-primary">
							举报
						</button>
					</div>
				</div>
			</div>
		</div>
		<%if(isDislike1 == null){%>
		<!--报告不良信息的模态框-->
		<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top: 85px;">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
							加入黑名单
						</h4>
					</div>
					<div class="modal-body">
						<form action="/ks/operation2" method="post">
							${other.username}将不能：<br>
								-关注你(已关注的会自动取消)<br>
								-给你发书邮<br>
								-在你的日记、广播、留言板留言<br><br>
								确定把${other.username}加入黑名单？
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
								<button type="submit" class="btn btn-primary" id="relate2">确定</button>
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>
		<%}%>
	</div>
</body>
</html>