<%--
  Created by IntelliJ IDEA.
  User: zooey
  Date: 2018/12/23
  Time: 18:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>个人图书管理</title>
    <link href="../../css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="../../css/mybooks.css">
    <script src="../../js/jquery.min.js"></script>
    <script src="../../js/bootstrap.js"></script>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" style="background-color: #f0f0f0;border-color: #f0f0f0">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">xxx的图书管理</a>
        </div>
    </div>
</nav>

<div id="wrapper">
    <div class="content">
        <div class="content-editor">
            <!--当前藏书-->
            <div class="content-editor-title">
                <div class="content-border">
                    <div class="title-title">当前藏书：5</div>
                </div>
            </div>

            <!--点赞评价-->
            <div class="bookstore">
                <div class="bookstore-label">我的书柜</div>
                <div class="imgs">
                    <ul>
                        <li>
                            <div class="bookshow" >
                                <a href="showCabinet.html">
                                    <img src="../../images/bling.jpg" >
                                    <span class="show">默认书柜</span>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="bookshow">
                                <a href="showCabinet.html">
                                    <img src="../../images/bling.jpg" >
                                    <span class="show">Cabinet1</span>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="bookshow">
                                <a href="#"></a>
                            </div>

                            <a class="show" data-toggle="modal" data-target="#myModal">新建书柜</a>
                            <!--模态框-->
                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top: 85px;">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                                &times;
                                            </button>
                                            <h4 class="modal-title" id="myModalLabel">新建书柜</h4>
                                        </div>
                                        <div class="modal-body">
                                            <form action method="post">
                                                书柜名：<input class="ipt" name="reportreason" ><br>
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">取消
                                            </button>
                                            <button type="button" class="btn btn-primary">确定</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>