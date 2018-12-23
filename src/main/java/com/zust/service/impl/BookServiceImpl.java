package com.zust.service.impl;

import com.zust.bean.*;
import com.zust.dao.*;
import com.zust.pageModel.*;
import com.zust.service.BookService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
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
    @Autowired BookRelationDao bookRelationDao;
    @Autowired BookListDao bookListDao;

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
                String publishDate = new SimpleDateFormat("yyyy-MM-dd ").format(t.getPublishDate());
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

    @Override
    public BookList findBookList(Integer type, Integer listId, Integer page) {
        /*根据listId在bookitem查到书单对应所有图书id
        * 查book表获得信息并存入BookItem
        * 返回List*/
        /*,Integer.valueOf(page),8*/
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("type", type);
        params.put("listId",listId);
        String idHql = "from TBookRelation r where r.type = :type and r.listId = :listId";
        /*这里对page的处理是针对我们这个数据的，不是常规操作*/
        if (page > 2) page = 2;
        if (page < 1) page = 1;
        List<TBookRelation> tBookRelations = bookRelationDao.find(idHql,params,page,8);
        List<Book> bookItemList = new ArrayList<>();
        for (TBookRelation relate:tBookRelations) {
            TBook tBook = bookDao.get("from TBook where id = "+relate.getBookId());
            Book bookItem = new Book();
            BeanUtils.copyProperties(tBook,bookItem);
            bookItemList.add(bookItem);
        }
        BookList bookList = new BookList();
        //书单的名字
        bookList.setListName(bookListDao.get("from TBookList where id = "+listId).getName());
        bookList.setBookItem(bookItemList);
        
        /*将当前页面的信息存进PageInfo,再存进bookList*/
        PageInfo pageInfo = new PageInfo();
        pageInfo.setCurrentPage(page);
        pageInfo.setType(type);
        pageInfo.setListId(listId);
        pageInfo.setNextPage(page+1);
        pageInfo.setLastPage(page-1);
        bookList.setPageInfo(pageInfo);
        
        return bookList;
    }


    @Override
    public Book findBookInfo(String title) {
        /*书籍*/
        Book book = new Book();
        String bookHql = "from TBook b where b.title like '%"+ title + "%'";
        TBook b = bookDao.get(bookHql);
        if (b != null){
            BeanUtils.copyProperties(b, book);
        }
        return book;
    }

    @Override
    public CommentList findArticleComment(String title) {
        /*评论*/
        CommentList commentList = new CommentList();
        String bookHql = "from TBook b where b.title like '%"+ title + "%'";
        TBook b = bookDao.get(bookHql);
        String comHql = "from TComment c where c.bookId = "+ b.getId();
        List<TComment> list = commentDao.find(comHql);
        List<Comment> comments = new ArrayList<>();
        if (list != null){
            for (TComment t:list) {
                Comment comment = new Comment();
                BeanUtils.copyProperties(t,comment);
                //根据commenterId查UserName
                String userName = userDao.get("from TUser where id = "+t.getCommenterId()).getUserName();
                comment.setUserName(userName);
                //date也是空的
                String publishDate = new SimpleDateFormat("yyyy-MM-dd").format(t.getPublishDate());
                comment.setPublishDate(publishDate);
                comments.add(comment);
            }
        }

        //最后设置一下页面最下面的评论数
        //根据书的id算评论数
        String countHql = "select count(*) from TComment c where c.bookId = "+ b.getId();
        String num = commentDao.count(countHql).toString();
        if (num != null){
            commentList.setCommentCount(num);
        }

        commentList.setComments(comments);
        return commentList;
    }

}
