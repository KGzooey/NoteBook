package com.zust.service;

import com.zust.pageModel.*;

import java.util.List;

public interface BookService {
    //这个方法是最开始写的，那时候数据都放在Article里面了，后来发现不可行就重写了其他方法
    Article findArticle(String title);
    BookList findBookList(Integer type, Integer listId, Integer page);
    Book findBookInfo(String title);
    CommentList findArticleComment(String title);
}
