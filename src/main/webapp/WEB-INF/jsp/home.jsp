<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <!--最好设置编码方式“gb2312”-->
  <title>home_NotationSystem</title>
  <link rel="icon" href="../../images/headshot.jpg">
  <link rel="stylesheet" href="../../css/home.css">
  <link href="../../css/bootstrap.css" rel="stylesheet">
  <script src="../../js/jquery.min.js"></script>
  <!--“./表示指向css文件”-->

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
<!--头部开始  -->
<div class="nav">
  <div id="hd-header">
    <div class="top-nav-info">
      <a href="https://www.douban.com/accounts/login?source=book" class="nav-login">登录</a>
      <a href="https://www.douban.com/accounts/register?source=book" class="nav-register">注册</a>
    </div>
    <form class="navbar-form navbar-left" role="search">
      <div class="form-group">
        <input type="text" id="search_title" class="form-control" placeholder="Search">
      </div>
      <button type="button" class="btn btn-default" onclick="search($('#search_title').val())">搜索</button>
    </form>
  </div>
</div>
<!--头部结束 -->


<!-- 内容区域 -->
<div id="hd-con">
  <div class="con-left">
    <h2 class="title">热点内容 (<span><a href="/more?listId=1&type=0&page=1">更多</a></span>)</h2>
    <ul>
      <li>
        <a href="/information?title=无羁" class="thumbnail">
          <img name="hotBook" src="../../images/cover/1545231678.jpg" alt="" />
        </a>
        <a href="/information?title=无羁" name="title">无羁</a>
        <span>129条评论</span>
      </li>
      <li>
        <a href="/information?title=世界观" class="thumbnail">
          <img name="hotBook" src="../../images/cover/1545231693.jpg" alt="" />
        </a>
        <a  href="/information?title=世界观" name="title" >世界观</a>
        <span>129条评论</span>
      </li>
      <li>
        <a  href="/information?title=爱你，西蒙" class="thumbnail">
          <img name="hotBook" src="../../images/cover/1545231700.jpg" alt="" />
        </a>
        <a href="/information?title=爱你，西蒙"  name="title">爱你，西蒙</a>
        <span>129条评论</span>
      </li>
      <li>
        <a href="/information?title=尔雅诂林"  class="thumbnail"><img name="hotBook" src="../../images/cover/1545232177.jpg" alt="" /></a>
        <a href="/information?title=尔雅诂林" name="title" >尔雅诂林</a>
        <span>129条评论</span>
      </li>
    </ul>
  </div>
  <div class="con-mid">
    <ul>
      <li>
        <a href="">仍然沉默和不再沉默的——王小波十五年忌日访王小波墓</a>
        <h2>室内滂沱的日记 </h2>
        <p>《仍然沉默和不再沉默的——王小波十五年忌日访王小波墓》 我只希望我们的灵魂可以...</p>
      </li>
      <li>
        <a href="">鬼</a>
      </li>
      <li>
        <a href="">无声狗</a>
      </li>
      <li>
        <a href="">“我以为我们的感情经得起当面要钱” | 45个关于爱和钱的故事，最后谁赢了？</a>
      </li>
      <li>
        <a href="">收了那么多官二代，全真派的事业还是失败了</a>
      </li>
      <li>
        <a href="">いし橋——为何会把一顿寿喜烧吃成修行</a>
      </li>
      <li>
        <a href="">信号#7：如果有一天我失忆，但愿能被照片唤醒</a>
      </li>
      <li>
        <a href="">纪念王小波 | “我不要孤独，孤独是丑的，令人作呕的”</a>
      </li>

    </ul>
  </div>
  <div class="right">
    <!-- <ul>
      <li>
        <img src="./img/file-1431585796.jpg" width="268" height="112" alt="" />
      </li>
    </ul> -->
    <h2 class="title">线上活动 · · · · · · (<span><a href="more">更多</a></span>)</h2>
    <ul>
      <li>
        <a href="">来一句王家卫式的话</a>
        <h2>时间：2月25日 - 5月24日</h2>
        <h2>1360人参加</h2>
      </li>
      <li>
        <a href="">给我你的照片，让我为你画张肖像。2017鸡年大吉有奖版吧</a>
        <h2>时间：2月8日 - 5月7日</h2>
        <h2>1463人参加</h2>
      </li>
      <li>
        <a href="">分享至今你读过的最喜欢的书</a>
        <h2>时间：2月13日 - 4月14日</h2>
        <h2>1073人参加</h2>
      </li>
    </ul>
  </div>
</div>
<!-- 内容区域结束 -->

<!-- 读书区域 -->
<div id="hd-book">
  <div class="left">
    <a href="" class="left-title">读书</a>
    <ul class="left-up">
      <li>
        <a href="">分类浏览</a>
      </li>
      <li>
        <a href="">书单推荐</a>
      </li>
      <li>
        <a href="">作者</a>
      </li>
      <li>
        <a href="">书评</a>
      </li>
      <li>
        <a href="">藏书馆</a>
      </li>
    </ul>
  </div>
    <div class="mid">

        <h2 class="title">新书速递 · · · · · · (<span><a href="/more?listId=2&type=0&page=1">更多</a></span>)</h2>
        <ul>
            <li>
                <a href="/information?title=生命中不能承受之輕" class="thumbnail"><img name="newBook" src="../../images/cover/1545236380.jpg" alt="" /></a>

                <p><a href="/information?title=生命中不能承受之輕" name="title">生命中不能承受之輕</a></p>

                <span>米蘭‧昆德拉</span>

                <a href="/information?title=校勘杂志" class="book-free-read">免费试读</a>
            </li>
            <li>
                <a href="/information?title=瓦尔登湖" class="thumbnail"><img name="newBook" src="../../images/cover/1545236935.jpg" alt="" /></a>

                <p><a href="/information?title=瓦尔登湖" name="title" >瓦尔登湖</a></p>

                <span>[[美]亨利·戴维</span>

                <a href="/information?title=校勘杂志" class="book-free-read">免费试读</a>
            </li>
            <li>
                <a href="/information?title=圣经" class="thumbnail"><img name="newBook" src="../../images/cover/1545237919.jpg" alt="" /></a>
                <p><a href="/information?title=圣经" name="title" >《圣经》的文学性..</a></p>
                <span>刘锋</span>
                <a href="/information?title=圣经" class="book-free-read">免费试读</a>

            </li>

            <li>

                <a href="/information?title=哲学之诗" class="thumbnail"><img name="newBook" src="../../images/cover/1545238141.jpg" alt="" /></a>

                <p><a href="/information?title=哲学之诗" name="title">哲学之诗</a></p>

                <span>张文涛</span>

                <a href="/information?title=哲学之诗" class="book-free-read">免费试读</a>

            </li>

        </ul>

        <h2 class="title book-title">历史文学 · · · · · · (<span><a href="/more?listId=3&type=0&page=1">更多</a></span>)</h2>

        <ul class="hd-book-cread">
            <li>
                <a href="/information?title=留真谱" class="thumbnail"><img name="histBook" src="../../images/cover/1545242481.jpg" alt="" /></a>
                <p><a href="/information?title=留真谱" name="title" >留真谱</a></p>
                <span>(清)杨守敬</span>
                <a href="/information?title=留真谱" class="book-free-read">免费试读</a>
            </li>
            <li>
                <a href="/information?title=校勘杂志" class="thumbnail"><img name="histBook" src="../../images/cover/1545243698.jpg" alt="" /></a>
                <p><a href="/information?title=校勘杂志" name="title" >校勘杂志</a></p>
                <span>郑慧生</span>
                <a href="/information?title=校勘杂志" class="book-free-read">免费试读</a>
            </li>

            <li>
                <a href="/information?title=万廷言集"class="thumbnail"><img name="histBook"  src="../../images/cover/1545244839.jpg" alt="" /></a>
                <p><a href="/information?title=万廷言集" name="title">万廷言集</a></p>
                <span>[明]万廷言 著</span>
                <a href="/information?title=万廷言集" class="book-free-read">免费试读</a>
            </li>
            <li>
                <a href="/information?title=晃岩集" class="thumbnail"><img name="histBook" src="../../images/cover/1545246712.jpg" alt="" /></a>
                <p><a href="/information?title=晃岩集" name="title">晃岩集</a></p>
                <span>池显方</span>
                <a href="/information?title=晃岩集" class="book-free-read">免费试读</a>
            </li>
        </ul>
    </div>
  <div class="right">
    <h2 class="title">热门标签 · · · · · · (<span><a href="#">更多</a></span>)</h2>
    <ul class="hd-book-right">
      <li class="right-top">
        <h2>[文学]</h2>
      </li>
      <li><a href=""><a href="">小说</a></a></li>
      <li><a href=""><a href="">随笔</a></a></li>
      <li class="right-wen"><a href=""><a href="">日本文学</a></a></li>
      <li><a href=""><a href="">散文</a></a></li>
      <li><a href=""><a href="">诗歌</a></a></li>
      <li><a href=""><a href="">童话</a></a></li>
      <li><a href=""><a href="">名著</a></a></li>
      <li><a href=""><a href="">港台</a></a></li>
      <li><a href=""><a href="">更多</a></a></li>
    </ul>
    <ul class="hd-book-right">
      <li class="right-top">
        <h2>[流行]</h2>
      </li>
      <li><a href=""><a href="">漫画</a></a></li>
      <li><a href=""><a href="">推理</a></a></li>
      <li><a href=""><a href="">绘本</a></a></li>
      <li><a href=""><a href="">青春</a></a></li>
      <li><a href=""><a href="">科幻</a></a></li>
      <li><a href=""><a href="">言情</a></a></li>
      <li><a href=""><a href="">奇幻</a></a></li>
      <li><a href=""><a href="">武侠</a></a></li>
      <li><a href=""><a href="">更多</a></a></li>
    </ul>
    <ul class="hd-book-right">
      <li class="right-top">
        <h2>[文化]</h2>
      </li>
      <li><a href=""><a href="">历史</a></a></li>
      <li><a href=""><a href="">哲学</a></a></li>
      <li><a href=""><a href="">传记</a></a></li>
      <li><a href=""><a href="">设计</a></a></li>
      <li><a href=""><a href="">建筑</a></a></li>
      <li><a href=""><a href="">电影</a></a></li>
      <li><a href=""><a href="">回忆</a></a></li>
      <li><a href=""><a href="">音乐</a></a></li>
      <li><a href=""><a href="">更多</a></a></li>
    </ul>
    <ul class="hd-book-right">
      <li class="right-top">
        <h2>[生活]</h2>
      </li>
      <li><a href=""><a href="">旅行</a></a></li>
      <li><a href=""><a href="">励志</a></a></li>
      <li><a href=""><a href="">教育</a></a></li>
      <li><a href=""><a href="">职场</a></a></li>
      <li><a href=""><a href="">美食</a></a></li>
      <li><a href=""><a href="">灵修</a></a></li>
      <li><a href=""><a href="">健康</a></a></li>
      <li><a href=""><a href="">家居</a></a></li>
      <li><a href=""><a href="">更多</a></a></li>
    </ul>
    <ul class="hd-book-right">
      <li class="right-top">
        <h2>[经管]</h2>
      </li>
      <li><a href=""><a href="">经济</a></a></li>
      <li><a href=""><a href="">管理</a></a></li>
      <li><a href=""><a href="">商业</a></a></li>
      <li><a href=""><a href="">金融</a></a></li>
      <li><a href=""><a href="">营销</a></a></li>
      <li><a href=""><a href="">理财</a></a></li>
      <li><a href=""><a href="">股票</a></a></li>
      <li><a href=""><a href="">企业</a></a></li>
      <li><a href=""><a href="">更多</a></a></li>
    </ul>
  </div>
</div>
<!-- 读书区域结束-->

<!-- 结尾区域 -->

<!-- 结尾区域结束 -->
</body>
</html>