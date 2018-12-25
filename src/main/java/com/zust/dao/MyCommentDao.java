package com.zust.dao;

import com.zust.bean.CommentEntity;

import java.util.List;

public interface MyCommentDao extends BaseDao<CommentEntity> {
    int sizeOfComment(int id);//查找评论数量
    List<CommentEntity> findCommentByUserAndPage(int userId);
}
