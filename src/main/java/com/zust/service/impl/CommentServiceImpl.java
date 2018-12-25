package com.zust.service.impl;

import com.zust.bean.TBook;
import com.zust.bean.TComment;
import com.zust.bean.TUser;
import com.zust.bean.TUserRelation;
import com.zust.dao.BookDao;
import com.zust.dao.CommentDao;
import com.zust.dao.UserDao;
import com.zust.dao.UserRelationDao;
import com.zust.pageModel.Article;
import com.zust.pageModel.Comment;
import com.zust.pageModel.CommentList;
import com.zust.pageModel.PageInfo;
import com.zust.service.CommentService;
import org.hibernate.Session;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.context.request.SessionScope;

import javax.persistence.criteria.CriteriaBuilder;
import java.text.SimpleDateFormat;
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
    @Autowired UserDao userDao;

    /*根据title再TBook查到书id，然后再TComment搜索likeCount降序返回，五条*/
    @Override
    public CommentList findHotComment(String title, Integer page) {
        /*评论*/
        CommentList commentList = new CommentList();
        String bookHql = "from TBook b where b.title like '%"+ title + "%'";
        TBook b = bookDao.get(bookHql);
        String comHql = "from TComment c where c.bookId = "+ b.getId() + " order by c.likeCount desc";
        List<TComment> list = commentDao.find(comHql);
        List<Comment> comments = new ArrayList<>();
        if (list != null){
            for (TComment t:list) {
                Comment comment = new Comment();
                BeanUtils.copyProperties(t,comment);
                //根据commenterId查UserName
                TUser tUser = userDao.get("from TUser where id = "+t.getCommenterId());
                comment.setUserName(tUser.getUserName());
                comment.setAvatarUrl(tUser.getAvatarUrl());

                //date也是空的
                String publishDate = new SimpleDateFormat("yyyy-MM-dd").format(t.getPublishDate());
                comment.setPublishDate(publishDate);
                comments.add(comment);
            }
        }

        //根据书的id算评论数
        String countHql = "select count(*) from TComment c where c.bookId = "+ b.getId();
        String num = commentDao.count(countHql).toString();
        if (num != null){
            commentList.setCommentCount(num);
        }

        commentList.setComments(comments);
        return commentList;
    }

    /*根据title在TBook查到书id，然后再TComment搜索publishDate降序返回，五条*/
    @Override
    public CommentList findNewComment(String title, Integer page) {
        /*评论*/
        CommentList commentList = new CommentList();
        String bookHql = "from TBook b where b.title like '%"+ title + "%'";
        TBook b = bookDao.get(bookHql);
        String comHql = "from TComment c where c.bookId = "+ b.getId() + " order by c.publishDate desc";
        List<TComment> list = commentDao.find(comHql);
        List<Comment> comments = new ArrayList<>();
        if (list != null){
            for (TComment t:list) {
                Comment comment = new Comment();
                BeanUtils.copyProperties(t,comment);
                //根据commenterId查UserName
                TUser tUser = userDao.get("from TUser where id = "+t.getCommenterId());
                comment.setUserName(tUser.getUserName());
                comment.setAvatarUrl(tUser.getAvatarUrl());

                //date也是空的
                String publishDate = new SimpleDateFormat("yyyy-MM-dd").format(t.getPublishDate());
                comment.setPublishDate(publishDate);
                comments.add(comment);
            }
        }

        //根据书的id算评论数
        String countHql = "select count(*) from TComment c where c.bookId = "+ b.getId();
        String num = commentDao.count(countHql).toString();
        if (num != null){
            commentList.setCommentCount(num);
        }

        commentList.setComments(comments);
        return commentList;

    }

    /*userId=1查询到关注用户，title查到bookId,再TComment根据关注用户和bookId查到评论*/
    @Override
    public CommentList findConcerComment(String title, Integer page, Integer userId) {
        //假定这里直接处理用户Id=1的情况
        CommentList commentList = new CommentList();
        List<Comment> comments = new ArrayList<>();

        String bookHql = "from TBook b where b.title like '%"+ title + "%'";
        Integer bookId = bookDao.get(bookHql).getId();

        String userHql = "from TUserRelation r where r.relater = "+ userId +" and type = 1";
        List<TUserRelation> concerned = userRelationDao.find(userHql);

        //根据每个关注者的id，bookId,搜索TComment，获取list
        TComment concerComment;
        String id;
        String hql;
        Integer count = 0;
        for (TUserRelation user:concerned) {
            Comment comment = new Comment();
            id = user.getRelatered()+"";
            //一个用户对一本书只有一条评论不用循环
            hql = "from TComment where commenterId = "+ id +" and bookId = "+bookId;
            concerComment = commentDao.get(hql);
            if (concerComment == null){
                continue;
            }
            BeanUtils.copyProperties(concerComment, comment);
            //时间处理一下
            String publishDate = new SimpleDateFormat("yyyy-MM-dd ").format(concerComment.getPublishDate());
            comment.setPublishDate(publishDate);

            //用户姓名和头像处理一下
            TUser tUser = userDao.get("from TUser where id = "+ id);
            comment.setUserName(tUser.getUserName());
            comment.setAvatarUrl(tUser.getAvatarUrl());

            comments.add(comment);
            count++;
        }
        commentList.setComments(comments);
        commentList.setCommentCount(count+"");

        return commentList;
    }

    @Override
    public CommentList findCommentList(Integer tag, String title, Integer userId,Integer page) {

        PageInfo pageInfo = new PageInfo();

        CommentList commentList = new CommentList();
        String bookHql = "from TBook b where b.title like '%"+ title + "%'";
        TBook b = bookDao.get(bookHql);
        Integer bookId = 1;
        if (b != null){
            bookId = b.getId();
        }
        Integer total = 0;
        //关注
        if (tag == 3) {
            List<Comment> comments = new ArrayList<>();
            String userHql = "from TUserRelation r where r.relater = " + userId + " and type = 1";
            List<TUserRelation> concerned = userRelationDao.find(userHql);
            TComment concerComment;
            String id;
            String hql;
            Integer count = 0;
            for (TUserRelation user : concerned) {
                Comment comment = new Comment();
                id = user.getRelatered() + "";
                //一个用户对一本书只有一条评论不用循环
                hql = "from TComment where commenterId = " + id + " and bookId = " + bookId;
                concerComment = commentDao.get(hql);
                if(concerComment == null){
                   continue;
                }
                BeanUtils.copyProperties(concerComment, comment);
                //时间处理一下
                String publishDate = new SimpleDateFormat("yyyy-MM-dd ").format(concerComment.getPublishDate());
                comment.setPublishDate(publishDate);

                //用户姓名和头像处理一下
                TUser tUser = userDao.get("from TUser where id = " + id);
                comment.setUserName(tUser.getUserName());
                comment.setAvatarUrl(tUser.getAvatarUrl());
                comments.add(comment);
                count++;
            }
            commentList.setComments(comments);
            commentList.setCommentCount(count+"");

        }else{
            List<Comment> comments = new ArrayList<>();
            List<TComment> list = null;
            if (tag == 1){
                String comHql = "from TComment c where c.bookId = "+ b.getId() + " order by c.likeCount desc";
                list = commentDao.find(comHql,page,8);
            }
            if (tag == 2){
                String comHql = "from TComment c where c.bookId = "+ b.getId() + " order by c.publishDate desc";
                list = commentDao.find(comHql,page,8);
            }
            if (list != null){
                TUser tUser;
                for (TComment t:list) {
                    Comment comment = new Comment();
                    if (t != null){
                        BeanUtils.copyProperties(t,comment);
                    }
                    //根据commenterId查UserName
                    tUser = userDao.get("from TUser where id = "+t.getCommenterId());
                    comment.setUserName(tUser.getUserName());
                    comment.setAvatarUrl(tUser.getAvatarUrl());

                    //date也是空的
                    String publishDate = new SimpleDateFormat("yyyy-MM-dd").format(t.getPublishDate());
                    comment.setPublishDate(publishDate);
                    comments.add(comment);
                }
            }

            //根据书的id算评论数
            String countHql = "select count(*) from TComment c where c.bookId = "+ b.getId();
            String num = commentDao.count(countHql).toString();
            if (num != null){
                commentList.setCommentCount(num);
            }
            commentList.setComments(comments);
            total = Integer.parseInt(num)/8+1;
        }

        /*将当前页面的信息存进PageInfo,再存进bookList*/
        pageInfo.setCurrentPage(page);
        pageInfo.setTag(tag);
        pageInfo.setNextPage(page+1);
        pageInfo.setLastPage(page-1);
        if (pageInfo.getNextPage() >= total){
            pageInfo.setNextPage(total);
        }
        if (pageInfo.getLastPage() <= 0){
            pageInfo.setLastPage(1);
        }

        commentList.setPageInfo(pageInfo);

        return commentList;
    }
}
