package com.zust.service;

import com.zust.pageModel.Article;
import com.zust.pageModel.CommentList;

public interface CommentService {
    CommentList findHotComment(String title, Integer page);
    CommentList findNewComment(String title, Integer page);
    CommentList findConcerComment(String title, Integer page);
//    CommentList findCommentList(Integer tag,);
}
