package com.zust.controller;

import com.zust.pageModel.*;
import com.zust.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@Controller
@RequestMapping("/")
@SessionAttributes(value = {"article","bookItemList","articleComment"})
public class BookController {
    @Autowired
    BookService bookService;

    //进入初始页面√
    @RequestMapping("")
    public String enter(){
        return "home";
    }

    //根据title获取书籍页信息,书籍详情页面 √
    @RequestMapping("/information")
    public String getInformation(String title, Model model){
//        Article article = bookService.findArticle(title);
        Book book = bookService.findBookInfo(title);
        CommentList commentList = bookService.findArticleComment(title);
        /*这里书籍信息和评论应该用两个pageModel/session存储，不然之后不好改*/
        model.addAttribute("article",book);
        model.addAttribute("articleComment",commentList);
        return "article";
    }

    //书籍搜索√
    @ResponseBody
    @RequestMapping("/search")
    public boolean searchBook(String title, Model model){
        //根据title 查询 book，存入TBook, 然后Book，返回Book 给前端，json 然后获取数据显示 nice
        Article article = bookService.findArticle(title);
        if (article != null){
            model.addAttribute("article",article);
            return true;
        }
        return false;
    }

    //进入article页面√
    @GetMapping("/showArticle")
    public String showArticle(){
        return "article";
    }

    //更多...书单列表
    /*将传进来的参数存进session，便于跳转页面,这里存在了BookList*/
    @RequestMapping("/more")
    public String findMore(Integer type,Integer listId, Integer page,Model model){
        BookList bookList = bookService.findBookList(type,listId,page);
        model.addAttribute("bookItemList",bookList);
        return "booklist";
    }

}
