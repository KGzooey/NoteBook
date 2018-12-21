<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!--
      The above 2 meta tags *must* come first in the head; any other head content must come *after* these tags
    -->
  <meta name="description" content="" />
  <meta name="author" content="" />

  <!-- Note there is no responsive meta tag here -->

  <link rel="icon" href="../../images/headshot.jpg" />

  <title>article_NotationSystem</title>
  <link href="../../css/bootstrap.css" rel="stylesheet" />
  <link href="../../css/article.css" rel="stylesheet" />
</head>

<body>
  <!-- 头部开始 -->
  <div id="hd-header">
    <div class="top-nav-info">
      <a href="https://www.douban.com/accounts/login?source=book" class="nav-login">登录</a>
      <a href="https://www.douban.com/accounts/register?source=book" class="nav-register">注册</a>

    </div>
    
    <form class="navbar-form navbar-left" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">搜索</button>
      </form>
  </div>
  <!-- 头部结束 -->

  <!-- 内容部分 -->
  <div class="container">
    <!-- 书籍信息 -->
    <div class="page-header">
      <h3 id="title">${sessionScope.article.title}</h3>
      <div class="indent ">
        <div id="mainpic" class="">
          <a class="nbg" id="coverUrl" href="../../images/cover/"+${sessionScope.article.coverUrl} title="盛夏方程式">
            <img src="https://img3.doubanio.com/view/subject/l/public/s29917283.jpg" title="点击看大图" alt="盛夏方程式" rel="v:photo" />
          </a>
        </div>
        <div id="info">
          <span>
            <span class="pl" > 作者</span>:
            <a class="" href="javascript:void(0);" id="author"> ${sessionScope.article.author}</a> </span><br />
          <span class="pl">出版社:</span> ${sessionScope.article.publishOrg}<br />
          <%--<span class="pl">出版年:</span> 2018-11<br />--%>
          <%--<span class="pl">页数:</span> 400<br />--%>
          <%--<span class="pl">定价:</span> 59.00<br />--%>
        </div>
      </div>
      <div class="writer">
        <img src="https://img3.doubanio.com/f/shire/5bbf02b7b5ec12b23e214a580b6f9e481108488c/pics/add-review.gif">&nbsp;<a
          href="https://book.douban.com/subject/30317420/new_review" rel="nofollow">写书评</a>
      </div>
    </div>

    <!-- 内容简介 -->
    <div class="page-header">
      <div class="related_info">
        <h2>
          <span>内容简介</span>&nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·
        </h2>
        ${sessionScope.article.synopsis}
      </div>
    </div>
    <!-- 内容简介结束 -->
    <!-- 作者简介 -->
    <div class="page-header">
      <div class="related_info">
        <h2>
          <span>作者简介</span>&nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·
        </h2>
        ${sessionScope.article.writerInfo}
      </div>
    </div>
    <!-- 作者简介结束 -->
    <!-- 书籍信息结束 -->

    <!-- 短评 -->
    <div class="related_info">
      <h2><span>短评</span>&nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·</h2>
    </div>
    <div class="nav-tab">
      <div>
        <a href="hot" data-tab="hot">热门</a> <span>/</span>
        <a href="new" data-tab="new">最新</a> <span>/</span>
        <a href="follows" data-tab="follows">关注</a>
      </div>
    </div>
    <div id="comment_list" class="indent">
      <div id="comments">
        <ul>
          <c:forEach var="comment" items="${sessionScope.article.commentList}">
            <%--还有个replyCount没有加--%>
            <li class="comment-item">
              <div class="comment">
                <h3>
                <span class="comment-vote">
                  <span id="wait1" class="vote-count">${comment.likeCount}</span>
                  <a href="javascript:void(0);" id="wait2" class="j vote-comment" data-cid="1470176865">有用</a>
                </span>
                  <span class="comment-info">
                  <a href="javascript:void(0);">${comment.userName}</a>
                  <span>${comment.publishDate}</span>
                </span>
                </h3>
                <p class="comment-content">
                  <span class="short">${comment.content}</span>
                </p>
              </div>
            </li>
          </c:forEach>
        </ul>
      </div>
    </div>
    <p>
      &gt;
      <a href="javascript:void(0);">更多短评 ${comment.commentCount} 条</a>
    </p>
    <!-- 短评结束 -->
  </div>
  <!-- 内容结束 -->

  <!--
      Bootstrap core JavaScript
      ==================================================
    -->
  <!-- Placed at the end of the document so the pages load faster -->
  <script src="../../js/jquery.min.js"></script>
  <script src="../../js/bootstrap.js"></script>
</body>

</html>