package com.zust.controller;

import com.zust.pageModel.Article;
import com.zust.service.impl.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.jnlp.BasicService;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/")
@SessionAttributes(value = {"article"})
public class BookController {
    @Autowired
    BookService bookService;

    //进入初始页面√
    @RequestMapping("")
    public String enter(){
        return "home";
    }

    //根据title获取书籍页信息,存入session返回

    @RequestMapping("/information")
    public String getInformation(String title, Model model){
        //根据title 查询 book，存入TBook, 然后Book，返回Book 给前端，json 然后获取数据显示 nice
        Article article = bookService.findArticle(title);
        model.addAttribute("article",article);
        return "article";
    }

    //进入article页面
    @GetMapping("/showArticle")
    public String showArticle(){
        return "article";
    }
}
