package com.zust.service.impl;

import com.zust.service.impl.BookService;
import com.zust.bean.TBook;
import com.zust.bean.TComment;
import com.zust.bean.TUser;
import com.zust.dao.BookDao;
import com.zust.dao.CommentDao;
import com.zust.dao.UserDao;
import com.zust.pageModel.Article;
import com.zust.pageModel.Book;
import com.zust.pageModel.Comment;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @description:
 * @create: 2018-12-20 14:31
 **/
@Service
public class BookServiceImpl implements BookService {

    @Autowired BookDao bookDao;
    @Autowired CommentDao commentDao;
    @Autowired UserDao userDao;

    @Override
    public Article findArticle(String title) {
        Article article = new Article();

        /*书籍*/
        String bookHql = "from TBook b where b.title like '%"+ title + "%'";
        TBook b = bookDao.get(bookHql);
        if (b != null){
            BeanUtils.copyProperties(b, article);
        }

        /*评论*/
        String comHql = "from TComment c where c.bookId = "+ b.getId();
        List<TComment> list = commentDao.find(comHql);
        if (list != null){
            List<Comment> comments = new ArrayList<>();
            for (TComment t:list) {
                Comment comment = new Comment();
                BeanUtils.copyProperties(t,comment);
                //根据commenterId查UserName
                String userName = userDao.get("from TUser where id = "+t.getCommenterId()).getUserName();
                comment.setUserName(userName);
                //date也是空的
                String publishDate = new SimpleDateFormat("yyyy-MM-dd                                                                                                                          ").format(t.getPublishDate());
                comment.setPublishDate(publishDate);
                comments.add(comment);
            }
            article.setCommentList(comments);
        }

        //最后设置一下页面最下面的评论数
        //根据书的id算评论数
        String countHql = "select count(*) from TComment c where c.bookId = "+ b.getId();
        String num = commentDao.count(countHql).toString();
        if (num != null){
            article.setCommentCount(num);
        }

        return article;
    }
}
