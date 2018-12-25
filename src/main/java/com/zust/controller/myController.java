package com.zust.controller;

import com.zust.pageModel.CommentModel;
import com.zust.pageModel.Page;
import com.zust.pageModel.RelationModel;
import com.zust.pageModel.UserModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import com.zust.service.MyService;
import java.util.List;


@Controller
@RequestMapping("/ks")
public class myController {

    @Autowired
    private MyService MyService;

    //登录界面
    @RequestMapping("showLogin")
    public String showLogin(){
        return "login";
    }

    //注册界面
    @RequestMapping("showRegister")
    public String showRegister(){
        return "regist";
    }

    //注册
    @RequestMapping("register")
    public String register(@RequestParam("loginName")String name,
                           @RequestParam("password")String password,
                           @RequestParam("gender")String gender){
        MyService.regist(name,password,gender);
        System.out.println("注册完毕");
        return "redirect:/ks/showLogin";
    }

    //登录验证
    @RequestMapping("login")
    public String login(@RequestParam("username")String name, @RequestParam("password")String password, HttpSession session){
        UserModel user = MyService.findUserByName(name);
        if (user.getPassword().equals(password)){
            session.setAttribute("user", user);
            System.out.println("登录成功");
            return "redirect:/ks/myHome";
        }else{
            System.out.println("用户名或密码错误");
            return "login";
        }
    }

    //进入people我的个人主页
    @RequestMapping("myHome")
    public String people(HttpSession session){
        UserModel user = (UserModel) session.getAttribute("user");
        List<UserModel> fans = MyService.findByrelatedId(1,user.getId());
        List<UserModel> likes = MyService.findByrelaterId(1,user.getId());
        List<UserModel> dislikes = MyService.findByrelaterId(0,user.getId());
        Page page = MyService.findByCommenterIdAndPage(user.getId());
        List<CommentModel> commentModels = page.getList();
        int fansNum = fans.size();
        int likesNum = likes.size();
        int dislikesNum = dislikes.size();
        session.setAttribute("fansNum",fansNum);
        session.setAttribute("likesNum",likesNum);
        session.setAttribute("dislikesNum",dislikesNum);
        session.setAttribute("comments",commentModels);
        return "myHome";
    }

    //进入其他人主页
    @RequestMapping("otherHome")
    public String otherHome(HttpSession session){
        UserModel user = (UserModel) session.getAttribute("user");
        UserModel other = (UserModel) session.getAttribute("other");
        RelationModel isLike = MyService.findUniqueRelation(1,user.getId(),other.getId());//关注
        RelationModel isDislike1 = MyService.findUniqueRelation(0,user.getId(),other.getId());//拉黑
        RelationModel isDislike2 = MyService.findUniqueRelation(0,other.getId(),user.getId());//被拉黑
        if (isLike.getId()!=0){
            session.setAttribute("isLike",isLike);
        }
        if (isDislike1.getId()!=0){
            session.setAttribute("isDislike1",isDislike1);
        }
        if (isDislike2.getId()!=0){
            session.setAttribute("isDislike2",isDislike2);
        }
        return "otherHome";
    }

    //显示关系对象
    @RequestMapping("relatedUsers")
    @ResponseBody
    public List<UserModel> getrelatedUsers(HttpSession session){
        UserModel user = (UserModel) session.getAttribute("user");
        List<UserModel> relatedUsers = MyService.relateUsers(user.getId());
        return relatedUsers;
    }

    //修改信息页面
    @RequestMapping("account")
    public String account(){
        return "account";
    }

    //修改基本资料
    @RequestMapping("changeIntro")
    public String changeIntro(HttpSession session, @RequestParam("self-intro")String word){
        UserModel user = (UserModel) session.getAttribute("user");
        MyService.changeIntro(user.getId(),word);
        UserModel newUser = MyService.findUserById(user.getId());
        session.setAttribute("user",newUser);
        return "people";
    }

    //修改密码
    @RequestMapping("changePsw")
    public String changePsw(HttpSession session,
                            @RequestParam("oldPsw")String oldPsw,
                            @RequestParam("newPsw")String password,
                            @RequestParam("newPsw2")String password2){
        UserModel user = (UserModel) session.getAttribute("user");
        MyService.changePsw(user.getId(),oldPsw,password,password2);
        return "login";
    }

    //准备进入别人的主页
    @RequestMapping("preOtherHome")
    public String otherHome(HttpSession session, @RequestParam(value = "relatedUserId",required = false )int otherId){
        UserModel other = MyService.findUserById(otherId);
        Page page = MyService.findByCommenterIdAndPage(other.getId());
        List<CommentModel> commentModels = page.getList();
        session.setAttribute("other",other);
        session.setAttribute("othersComments",commentModels);
        return "redirect:/ks/otherHome";
    }

    //关注或取消关注
    @RequestMapping("operation1")
    public String doOperation(HttpSession session){
        UserModel user = (UserModel) session.getAttribute("user");
        UserModel other = (UserModel) session.getAttribute("other");
        RelationModel relationEntity = MyService.findUniqueRelation(1,user.getId(),other.getId());
        if (relationEntity.getId() == 0){
            MyService.relate(user.getId(),other.getId(),1);
        }else {
            MyService.deleteRelate(user.getId(),other.getId(),1);
            session.removeAttribute("isLike");
        }
        return "redirect:/ks/otherHome";
    }

    //拉黑或取消拉黑
    @RequestMapping("operation2")
    public String deleteOperation(HttpSession session){
        UserModel user = (UserModel) session.getAttribute("user");
        UserModel other = (UserModel) session.getAttribute("other");
        RelationModel relationEntity = MyService.findUniqueRelation(0,user.getId(),other.getId());
        if (relationEntity.getId() == 0){
            MyService.relate(user.getId(),other.getId(),0);
            MyService.deleteRelate(user.getId(),other.getId(),1);
            MyService.deleteRelate(other.getId(),user.getId(),1);
        }else {
            MyService.deleteRelate(user.getId(),other.getId(),0);
            session.removeAttribute("isDislike1");
        }
        return "redirect:/ks/otherHome";
    }

    //返回上一页面
    @RequestMapping("return")
    public String returnToBefero(HttpSession session){
        session.removeAttribute("isLike");
        session.removeAttribute("isDislike1");
        session.removeAttribute("isDislike2");
        session.removeAttribute("fansNum");
        session.removeAttribute("likesNum");
        session.removeAttribute("dislikesNum");
        return "redirect:/ks/myHome";
    }

}
