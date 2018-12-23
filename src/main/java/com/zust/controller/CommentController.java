package com.zust.controller;

import com.zust.pageModel.Article;
import com.zust.pageModel.CommentList;
import com.zust.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpSession;

/**
 * @description:
 * @create: 2018-12-22 15:19
 **/

@Controller
@RequestMapping("/comment")
public class CommentController {
    @Autowired CommentService commentService;

    //按标签更新书籍底下评论列表
    /*五条一分页，将更新的数据存在Article中的list属性中*/

    @RequestMapping("/article/hot")
    public String articleHotComment(String title, Integer page, HttpSession httpSession){
        CommentList commentList = commentService.findHotComment(title,page);
        httpSession.setAttribute("articleComment",commentList);
        return "article";
    }

    @RequestMapping("/article/new")
    public String articleNewComment(String title, Integer page, HttpSession httpSession){
        CommentList commentList = commentService.findNewComment(title,page);
        httpSession.setAttribute("articleComment",commentList);
        return "article";
    }

    @RequestMapping("/article/concern")
    public String articleConcernComment(String title, Integer page, HttpSession httpSession){
        Integer userId = 1;
        CommentList commentList = commentService.findConcerComment(title,page,userId);
        httpSession.setAttribute("articleComment",commentList);
        return "article";
    }

    //更多短评
    /*十条一分页，将更新的数据存在Comment中，一个list
     * 书籍的信息还是存在BookItem中
     * 所有的存在CommentList中
     * 这里不同于上面写三个方法，用tag来区分标签。我不知道怎么写才是对的，干脆两种都写一下*/
    @RequestMapping("/page")
    public String findCommentPage(Integer tag,String title, Integer page, Integer userId, HttpSession httpSession){
        userId = 1;
        CommentList commentList = commentService.findCommentList(tag,title,userId,page);
        httpSession.setAttribute("articleComment",commentList);
        return "notelist";
    }
}
