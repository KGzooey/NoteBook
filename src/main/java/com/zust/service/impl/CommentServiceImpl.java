package com.zust.service.impl;

import com.zust.bean.TBook;
import com.zust.bean.TComment;
import com.zust.bean.TUserRelation;
import com.zust.dao.BookDao;
import com.zust.dao.CommentDao;
import com.zust.dao.UserDao;
import com.zust.dao.UserRelationDao;
import com.zust.pageModel.Article;
import com.zust.pageModel.Comment;
import com.zust.pageModel.CommentList;
import com.zust.service.CommentService;
import org.hibernate.Session;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.context.request.SessionScope;

import java.util.ArrayList;
import java.util.List;

/**
 * @description:
 * 1、书籍底下评论的按标签更新
 * 2、评论列表的按标签更新
 * @create: 2018-12-22 15:15
 **/
@Service
public class CommentServiceImpl implements CommentService {
    @Autowired BookDao bookDao;
    @Autowired UserRelationDao userRelationDao;
    @Autowired CommentDao commentDao;

    /*根据title再TBook查到书id，然后再TComment搜索likeCount降序返回，五条*/    @Override
    public CommentList findHotComment(String title, Integer page) {
        String bookHql = "from TBook b where b.title like '%"+ title + "%'";
        Integer bookId = bookDao.get(bookHql).getId();


        return null;
    }

    /*根据title在TBook查到书id，然后再TComment搜索publishDate降序返回，五条*/
    @Override
    public CommentList findNewComment(String title, Integer page) {
        String bookHql = "from TBook b where b.title like '%"+ title + "%'";
        Integer bookId = bookDao.get(bookHql).getId();

        return null;
    }

    /*userId=1查询到关注用户，title查到bookId,再TComment根据关注用户和bookId查到评论*/
    @Override
    public CommentList findConcerComment(String title, Integer page) {
        List<Comment> comments = new ArrayList<>();
        CommentList commentList = new CommentList();
        String bookHql = "from TBook b where b.title like '%"+ title + "%'";
        Integer bookId = bookDao.get(bookHql).getId();

        String userHql = "from TUserRelation r where r.relater = 1";
        List<TUserRelation> concerned = userRelationDao.find(userHql);

        //根据每个关注者的id，bookId,搜索TComment，获取list
        Comment comment = new Comment();
        List<TComment> userComment;
        String id;
        String hql;
        Integer count = 0;
        for (TUserRelation user:concerned) {
            id = user.getId()+"";
            hql = "from TComment where commenterId = "+ id +"and bookId = "+bookId;
            userComment = commentDao.find(hql);
            //将每个用户的List转型后追加到commentList
            if (userComment != null) {
                for (TComment t:userComment) {
                    BeanUtils.copyProperties(t, comment);
                    comments.add(comment);
                    count++;
                }
            }
        }
        commentList.setComments(comments);
        commentList.setCommentCount(count+"");

        return commentList;
    }

}
