<%--
  Created by IntelliJ IDEA.
  User: zooey
  Date: 2018/12/23
  Time: 18:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>我的书柜</title>
    <link rel="stylesheet" href="../../css/showCabinet.css">
    <link href="../../css/bootstrap.css" rel="stylesheet">
    <script src="../../js/jquery.min.js"></script>
</head>
<body>
<!--导航条-->
<div id="note-top-nav"></div>
<div id="note-nav-search" class="nav">
    <div class="note-nav-wrap">
        <div class="note-nav-primary">
            <div class="note-nav-logo">myCabinet1</div>
        </div>
    </div>
</div>

<div id="wrapper">
    <div id="content">
        <h4 style="color: #999;">当前藏书：3</h4>
        <div class="book-body">
            <div class="book-body-article">
                <div class="book-wrapper">
                    <div id="article-books" class="article-books-list">
                        <ul>
                            <li class="books-item">
                                <div class="avatar">
                                    <a title="追风筝的人" href="/information?title=${sessionScope.article.title}">
                                        <img src="../../images/rabbit.jpg">
                                    </a>
                                </div>
                                <div class="book">
                                    <h3>
                                                    <span class="book-info">
                                                        <a href="article.html">追风筝的人</a>
                                                        <span title="推荐指数">★★★☆☆</span>
                                                        <div>
                                                            <!--<span>[美] 卡勒德·胡赛尼 / 李继宏 / 上海人民出版社 / 2006-5 / 29.00元</span>-->
                                                            <span class="short-comment">“为你，千千万万遍”</span>
                                                        </div>
                                                    </span>
                                    </h3>
                                    <p class="book-content">
                                                    <span >
                                                       5小时前 &nbsp;&nbsp;第十八章 - 快乐
                                                    </span>
                                    </p>
                                </div>
                            </li>
                            <li class="books-item">
                                <div class="avatar">
                                    <a title="追风筝的人" href="article.html">
                                        <img src="../../images/rabbit.jpg">
                                    </a>
                                </div>
                                <div class="book">
                                    <h3>
                                                    <span class="book-info">
                                                        <a href="article.html">追风筝的人</a>
                                                        <span title="推荐指数">★★★★☆</span>
                                                        <div>
                                                            <span class="short-comment">“为你，千千万万遍”</span>
                                                        </div>
                                                    </span>
                                    </h3>
                                    <p class="book-content">
                                                    <span >
                                                       10小时前 &nbsp;&nbsp;第一百零五章 - 忧郁
                                                    </span>
                                    </p>
                                    <!--<div class="read-statue">-->
                                    <!--<a href="#">想读</a>-->
                                    <!--<a href="#">在读</a>-->
                                    <!--<a href="#">读过</a>-->
                                    <!--</div>-->
                                </div>

                            </li>
                            <li class="books-item">
                                <div class="avatar">
                                    <a title="追风筝的人" href="article.html">
                                        <img src="../../images/rabbit.jpg">
                                    </a>
                                </div>
                                <div class="book">
                                    <h3>
                                                    <span class="book-info">
                                                        <a href="article.html">追风筝的人</a>
                                                        <span title="推荐指数">★★☆☆☆</span>
                                                        <div>
                                                            <span class="short-comment">“为你，千千万万遍”</span>
                                                        </div>
                                                    </span>
                                    </h3>
                                    <p class="book-content">
                                                    <span >
                                                       1小时前 &nbsp;&nbsp;第四章 - 酸
                                                    </span>
                                    </p>
                                    <!--<div class="read-statue">-->
                                    <!--<a href="#">想读</a>-->
                                    <!--<a href="#">在读</a>-->
                                    <!--<a href="#">读过</a>-->
                                    <!--</div>-->
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="book-page">
                        <ul class="book-page">
                            <li><span class="pagee">第一页</span></li>
                            <li><a href="#" class="pagee">前一页</a></li>
                            <li><a href="#" class="pagee">后一页</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
