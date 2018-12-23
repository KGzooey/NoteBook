<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zooey
  Date: 2018/12/22
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>全部评论</title>
    <link href="../../css/bootstrap.css" rel="stylesheet">
    <link href="../../css/shownote.css" rel="stylesheet">
    <script src="../../js/jquery.min.js"></script>
    <script src="../../js/bootstrap.js"></script>
</head>
<script>
    function search(title){
        // alert("e.title: "+title);
        $.ajax({
            url:"/search",
            type:"post",
            data:{
                title:title
            },
            success:function(data){
                if(data){
                    // alert(data);
                    window.location.href = "/showArticle";
                }else {
                    alert("查询无结果");
                }
            }
        });
    }
</script>
<body>
<!--导航条-->
<div id="note-top-nav"></div>
<div id="note-nav-search" class="nav">
    <div class="note-nav-wrap">
        <div class="note-nav-primary">
            <div class="note-nav-logo">NoteBook</div>
            <form action="">
                <div class="nav-search">
                    <input id="search" name="search" placeholder="书名">
                </div>
                <div class="search-btn">
                    <div id="search_logo" href="javascript:void(0);" onclick="search($('#search').val())">
                        <img src="../../images/sousuo.png">
                    </div>
                </div>
            </form>

        </div>
    </div>
</div>

<div id="wrapper">
    <div id="content">
        <h2>${sessionScope.article.title} &nbsp;全部评论</h2>
        <div class="note-body">
            <div class="note-body-article">
                <div class="article-comment-wrapper">
                    <!--评论-->
                    <div class="article-comment-total">
                        <!--::before-->
                        <span id="comment-total">全部共${sessionScope.articleComment.commentCount} 条</span>
                        <div class="comment-classify">
                            <%--传tag区分 热门1 最新2 关注3--%>
                            <a href="/comment/page?tag=1&page=1&title=${sessionScope.article.title}">热门</a>
                            <span>/</span>
                            <a href="/comment/page?tag=2&page=1&title=${sessionScope.article.title}">最新</a>
                            <span>/</span>
                            <a href="/comment/page?tag=3&page=1&title=${sessionScope.article.title}">关注</a>
                        </div>
                        <!--::after-->
                    </div>

                    <div id="article-comments" class="article-comments-list">
                        <ul>
                            <c:forEach var="comment" items="${sessionScope.articleComment.comments}">
                                <li class="comments-item">
                                    <!--::before-->
                                    <div class="avatar">
                                        <a title="${comment.userName}" href="#">
                                            <img src="../../images/avatar/${comment.avatarUrl}">
                                        </a>
                                    </div>
                                    <div class="comment">
                                        <h3>
                                            <span class="comment-likes">
                                                <span>${comment.likeCount}</span>
                                                <a href="#">有用</a>
                                            </span>
                                            <span class="comment-info">
                                                <a href="#">${comment.userName}</a>
                                                <!--推荐指数-->
                                                <span title="推荐指数">★★★★☆</span>
                                                <span>${comment.publishDate}</span>
                                            </span>
                                        </h3>
                                        <p class="comment-content">
                                            <span class="short">${comment.content}</span>
                                        </p>
                                        <!--举报-->
                                        <div class="comment-report" >
                                            <a class="report" data-toggle="modal" data-target="#myModal">举报</a>
                                            <!--模态框-->
                                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top: 85px;">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                                                &times;
                                                            </button>
                                                            <h4 class="modal-title" id="myModalLabel">
                                                                选择举报原因
                                                            </h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <form action method="post">
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
                                        </div>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                        <div class="fold"></div>
                    </div>
                    <div class="note-page">
                        <ul class="comment-page">
                            <li><span class="pagee">第${sessionScope.articleComment.pageInfo.currentPage}页</span></li>
                            <li><a href="/comment/page?tag=${sessionScope.articleComment.pageInfo.tag}&title=${sessionScope.article.title}&page=${sessionScope.articleComment.pageInfo.lastPage}"
                                   class="pagee">前一页</a></li>
                            <li><a href="/comment/page?tag=${sessionScope.articleComment.pageInfo.tag}&title=${sessionScope.article.title}&page=${sessionScope.articleComment.pageInfo.nextPage}"
                                   class="pagee">后一页</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!--右边栏-->
            <div class="note-body-intro">
                <div class="intro-comment">
                    <p class="comment-w">
                        <a data-toggle="modal" data-target="#myShort">我来写短评</a>
                    <div class="modal fade" id="myShort" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top: 85px;">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        &times;
                                    </button>
                                    <h4 class="modal-title" id="myShortLabel">
                                        添加收藏：我读过这本书
                                    </h4>
                                </div>
                                <div class="modal-body">
                                    <!--<div>给个评价吧？ &nbsp;&nbsp;☆☆☆☆☆</div>-->
                                    <div>简短附注</div>
                                    <div style="margin-top: 10px;border: 1px black solid;width: 420px;height: 100px;">
                                        <textarea  rows="4" cols="62" style="border-style: none;"></textarea>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <!--<button type="button" class="btn btn-default" data-dismiss="modal">关闭-->
                                    </button>
                                    <button type="button" class="btn btn-primary">保存</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    </p>
                    <p class="comment-w">
                        <a href="/information?title=${sessionScope.article.title}">${sessionScope.article.title}</a>
                    </p>
                    <div class="book-intro">
                        <div>
                            <a href="/information?title=${sessionScope.article.title}">
                                <img class="boook" alt="bookname" title="bookname" src="../../images/cover/${sessionScope.article.coverUrl}" >
                            </a>
                            <br style="clear: both;">
                            <span class="p1">作者：</span>${sessionScope.article.author}<br>
                            <span class="p1">isbn：</span>7758258<br>
                            <span class="p1">书名：</span>${sessionScope.article.title}<br>
                            <span class="p1">页数：</span>521<br>
                            <span class="p1">译者：</span>大老虎<br>
                            <span class="p1">定价：</span>46.00<br>
                            <span class="p1">出版社：</span>${sessionScope.article.publishOrg}<br>
                            <span class="p1">出版年：</span>2018-01-01<br>
                            <span class="p1">装帧：</span>精装<br>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>