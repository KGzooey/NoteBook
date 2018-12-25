<%--
  Created by IntelliJ IDEA.
  User: zooey
  Date: 2018/12/23
  Time: 18:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>我的评论</title>
    <link href="../../css/bootstrap.css" rel="stylesheet">
    <link href="../../css/note.css" rel="stylesheet">
    <script src="../../js/jquery.min.js"></script>
    <script src="../../js/note.js"></script>

    <link href="../../css/bootstrap-combined.no-icons.min.css" rel="stylesheet">
    <link href="../../css/font-awesome.css" rel="stylesheet">
    <script src="https://mindmup.s3.amazonaws.com/lib/jquery.hotkeys.js"></script>
    <script src="../../js/bootstrap.js"></script>
    <script src="http://twitter.github.com/bootstrap/assets/js/google-code-prettify/prettify.js"></script>
    <script src="../../js/bootstrap-wysiwyg.js"></script>

</head>
<body>
<!--导航栏-->
<nav class="navbar navbar-inverse navbar-fixed-top" style="background-color: #f0f0f0;border-color: #f0f0f0">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">我的评论</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">预览</a></li>
                <li><a href="#">提交</a></li>
            </ul>
        </div>
    </div>
</nav>

<div id="wrapper">
    <div class="article">
        <div class="article-editor">
            <!--书名-->
            <div class="article-editor-title">
                <div class="title-img">
                    <img src="../../images/rabbit.jpg" style="height: 100%;width: 100%;">
                </div>
                <div class="title-intro">
                    <div class="title-title">BookName</div>
                    <div class="title-author">[中]大兔子 / 兔子出版公司</div>
                </div>
            </div>

            <!--点赞评价-->
            <div class="article-editor-likes">
                <div class="article-editor-likes-label">给个评价吧:☆☆☆☆☆</div>
                <div class="article-editor-likes-stars">
                        <span class="star-rate">
                            <svg width="16" height="16" viewBox="0 0 18 17"></svg>
                        </span>
                </div>
            </div>
            <!--添加标题-->
            <div class="article-editor-add">
                <span><input placeholder="添加标题"></span>
            </div>

            <div class="article-editor-body">
                <div class="btn-toolbar" data-role="editor-toolbar" data-target="#editor">
                    <div class="btn-group">
                        <a class="btn dropdown-toggle" data-toggle="dropdown" title="Font"><i class="icon-font"></i><b class="caret"></b></a>
                        <ul class="dropdown-menu">
                        </ul>
                    </div>

                    <div class="btn-group">
                        <a class="btn dropdown-toggle" data-toggle="dropdown" title="Font Size"><i class="icon-text-height"></i>&nbsp;<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a data-edit="fontSize 5"><font size="5">Huge</font></a></li>
                            <li><a data-edit="fontSize 3"><font size="3">Normal</font></a></li>
                            <li><a data-edit="fontSize 1"><font size="1">Small</font></a></li>
                        </ul>
                    </div>

                    <div class="btn-group">
                        <a class="btn" data-edit="bold" title="Bold (Ctrl/Cmd+B)"><i class="icon-bold"></i></a>
                        <a class="btn" data-edit="italic" title="Italic (Ctrl/Cmd+I)"><i class="icon-italic"></i></a>
                        <a class="btn" data-edit="strikethrough" title="Strikethrough"><i class="icon-strikethrough"></i></a>
                        <a class="btn" data-edit="underline" title="Underline (Ctrl/Cmd+U)"><i class="icon-underline"></i></a>
                    </div>

                    <div class="btn-group">
                        <a class="btn" data-edit="undo" title="Undo (Ctrl/Cmd+Z)"><i class="icon-undo"></i></a>
                        <a class="btn" data-edit="redo" title="Redo (Ctrl/Cmd+Y)"><i class="icon-repeat"></i></a>
                    </div>

                    <input type="text" data-edit="inserttext" id="voiceBtn" x-webkit-speech="">
                </div>

                <div id="editor" aria-placeholder="写评论..."></div>
            </div>
        </div>
    </div>
</div>
<script>

    $(function(){
        function initToolbarBootstrapBindings() {
            var fonts = ['Serif', 'Sans', 'Arial', 'Arial Black', 'Courier',
                    'Courier New', 'Comic Sans MS', 'Helvetica', 'Impact', 'Lucida Grande', 'Lucida Sans', 'Tahoma', 'Times',
                    'Times New Roman', 'Verdana'],
                fontTarget = $('[title=Font]').siblings('.dropdown-menu');
            $.each(fonts, function (idx, fontName) {
                fontTarget.append($('<li><a data-edit="fontName ' + fontName +'" style="font-family:\''+ fontName +'\'">'+fontName + '</a></li>'));
            });
            $('a[title]').tooltip({container:'body'});
            $('.dropdown-menu input').click(function() {return false;})
                .change(function () {$(this).parent('.dropdown-menu').siblings('.dropdown-toggle').dropdown('toggle');})
                .keydown('esc', function () {this.value='';$(this).change();});

            $('[data-role=magic-overlay]').each(function () {
                var overlay = $(this), target = $(overlay.data('target'));
                overlay.css('opacity', 0).css('position', 'absolute').offset(target.offset()).width(target.outerWidth()).height(target.outerHeight());
            });
            if ("onwebkitspeechchange"  in document.createElement("input")) {
                var editorOffset = $('#editor').offset();
                $('#voiceBtn').css('position','absolute').offset({top: editorOffset.top, left: editorOffset.left+$('#editor').innerWidth()-35});
            } else {
                $('#voiceBtn').hide();
            }
        };

        function showErrorAlert (reason, detail) {
            var msg='';
            if (reason==='unsupported-file-type') { msg = "Unsupported format " +detail; }
            else {
                console.log("error uploading file", reason, detail);
            }
            $('<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>'+
                '<strong>File upload error</strong> '+msg+' </div>').prependTo('#alerts');
        };
        initToolbarBootstrapBindings();
        $('#editor').wysiwyg({ fileUploadError: showErrorAlert} );
        window.prettyPrint && prettyPrint();
    });

</script>

</body>
</html>
