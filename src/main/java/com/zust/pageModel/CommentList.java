package com.zust.pageModel;

import java.util.List;

/**
 * @description: 评论列表页面，存储书名、评论数、Comment的List、
 * @create: 2018-12-22 14:56
 **/
public class CommentList {
    private List<Comment> comments;
    private String commentCount;
    private PageInfo pageInfo;

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public String getCommentCount() {
        return commentCount;
    }

    public void setCommentCount(String commentCount) {
        this.commentCount = commentCount;
    }

    public PageInfo getPageInfo() {
        return pageInfo;
    }

    public void setPageInfo(PageInfo pageInfo) {
        this.pageInfo = pageInfo;
    }
}
