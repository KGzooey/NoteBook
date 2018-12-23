<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zooey
  Date: 2018/12/21
  Time: 20:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>书单列表</title>
    <link href="../../css/booktop.css" rel="stylesheet">
    <link href="../..//css/bootstrap.css" rel="stylesheet">
    <script src="../../js/jquery.min.js"></script>
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
</head>
<body>
<!--导航条-->
<div id="note-top-nav"></div>
<div id="note-nav-search" class="nav">
    <div class="note-nav-wrap">
        <div class="note-nav-primary">
            <div class="note-nav-logo">NoteBook</div>
            <form action="">
                <div class="nav-search">
                    <input id="search" name="search" placeholder="书名" >
                </div>
                <div class="search-btn">
                    <div id="search_logo"  href="#" onclick="search($('#search').val())">
                        <img src="../../images/sousuo.png">
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<div id="wrapper">
    <div id="content">
        <h2>书单 &nbsp;&nbsp;${sessionScope.bookItemList.listName}</h2>
        <div class="book-body">
            <div class="book-body-article">
                <div class="book-wrapper">
                    <div id="article-books" class="article-books-list">
                        <ul>
                            <c:forEach var="item" items="${sessionScope.bookItemList.bookItem}">
                                <li class="books-item">
                                    <div class="avatar">
                                        <a title=${item.title} href="/information?title=${item.title}">
                                            <img src="../../images/cover/${item.coverUrl}">
                                        </a>
                                    </div>
                                    <div class="book">
                                        <h3>
                                                <span class="book-info">
                                                    <a href="/information?title=${item.title}">${item.title}</a>
                                                    <span title="推荐指数">★★★★☆</span>
                                                    <div>
                                                        <span>${item.author} / ${item.publishOrg} </span>
                                                    </div>
                                                </span>
                                        </h3>
                                        <p class="book-content">
                                                <span class="short-comment">
                                                    ${item.synopsis}
                                                </span>
                                        </p>
                                        <div class="read-statue">
                                            <a href="javascript:void(0);">想读</a>
                                            <a href="javascript:void(0);">在读</a>
                                            <a href="javascript:void(0);">读过</a>
                                        </div>
                                        <!--举报-->
                                        <div class="booklist" >
                                            <button>加入我的藏书馆</button>
                                        </div>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="book-page">
                        <ul class="book-page">
                            <li><span class="pagee">第${sessionScope.bookItemList.pageInfo.currentPage}页</span></li>
                            <li><a href="/more?listId=${sessionScope.bookItemList.pageInfo.listId}
                            &type=${sessionScope.bookItemList.pageInfo.type}
                            &page=${sessionScope.bookItemList.pageInfo.lastPage}"
                                   class="pagee">前一页</a></li>
                            <li><a href="/more?listId=${sessionScope.bookItemList.pageInfo.listId}
                            &type=${sessionScope.bookItemList.pageInfo.type}
                            &page=${sessionScope.bookItemList.pageInfo.nextPage}"
                                   class="pagee">后一页</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!--右边栏-->
            <div class="book-body-intro">
                <span class="p1">NoteBook根据每本书读过的人数以等综合数据，通过算法分析产生了豆瓣图书 Top 50。</span>
            </div>
        </div>
    </div>
</div>
</body>
</html>
