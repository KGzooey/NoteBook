package com.zust.pageModel;

import java.util.List;

/**
 * @description: article页面数据
 * @create: 2018-12-20 14:42
 **/
public class Article {
    private String title;
    private String author;
    private String publishOrg;
    private String synopsis;
    private String writerInfo;
    private String coverUrl;

    private List<Comment> commentList;

    private String commentCount;

    public List<Comment> getCommentList() {
        return commentList;
    }

    public void setCommentList(List<Comment> commentList) {
        this.commentList = commentList;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPublishOrg() {
        return publishOrg;
    }

    public void setPublishOrg(String publishOrg) {
        this.publishOrg = publishOrg;
    }

    public String getSynopsis() {
        return synopsis;
    }

    public void setSynopsis(String synopsis) {
        this.synopsis = synopsis;
    }

    public String getWriterInfo() {
        return writerInfo;
    }

    public void setWriterInfo(String writerInfo) {
        this.writerInfo = writerInfo;
    }

    public String getCoverUrl() {
        return coverUrl;
    }

    public void setCoverUrl(String coverUrl) {
        this.coverUrl = coverUrl;
    }

    public String getCommentCount() {
        return commentCount;
    }

    public void setCommentCount(String commentCount) {
        this.commentCount = commentCount;
    }
}
