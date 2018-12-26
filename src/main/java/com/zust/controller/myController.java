package com.zust.controller;

import com.zust.pageModel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import com.zust.service.MyService;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;


@Controller
@RequestMapping("/ks")
public class myController {

    @Autowired
    private MyService myService;

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

    //显示关系对象
    @RequestMapping("reaalatedUsers")
    @ResponseBody
    public List<UserModel> agetrelatedUsers(HttpSession session){
        UserModel user = (UserModel) session.getAttribute("user");
        List<UserModel> relatedUsers = myService.relateUsers(user.getId());
        return relatedUsers;
    }

    //注册
    @RequestMapping("register")
    @ResponseBody
    public Json register(@RequestParam("loginName")String name,
                         @RequestParam("password")String password,
                         @RequestParam("password2")String password2,
                         @RequestParam("gender")String gender){
        Json json = new Json();
        System.out.println("rseult:"+myService.findUserByName(name));
        if (myService.findUserByName(name).getId()!=0){
            json.setMsg("该用户名已注册！");
            json.setErrorType(1);
        }else if (!password.equals(password2)){
            json.setMsg("两次密码不一致！");
            json.setErrorType(2);
        }else {
            myService.regist(name,password,gender);
            json.setMsg("注册成功！");
        }
        return json;
    }

    //登录验证
    @RequestMapping("login")
    public String login(@RequestParam("username")String name, @RequestParam("password")String password, HttpSession session){
        UserModel user = myService.findUserByName(name);
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
        List<UserModel> fans = myService.findByrelatedId(1,user.getId());
        List<UserModel> likes = myService.findByrelaterId(1,user.getId());
        List<UserModel> dislikes = myService.findByrelaterId(0,user.getId());
        Page page = myService.findByCommenterIdAndPage(user.getId());
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
        RelationModel isLike = myService.findUniqueRelation(1,user.getId(),other.getId());//关注
        RelationModel isDislike1 = myService.findUniqueRelation(0,user.getId(),other.getId());//拉黑
        RelationModel isDislike2 = myService.findUniqueRelation(0,other.getId(),user.getId());//被拉黑
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
        List<UserModel> relatedUsers = myService.relateUsers(user.getId());
        return relatedUsers;
    }

    //修改信息页面
    @RequestMapping("account")
    public String account(){
        return "account";
    }

    //修改基本资料
    @RequestMapping("changeXX")
    public String changeIntro(HttpSession session, @RequestParam("self-intro")String word, MultipartFile filePic){
        UserModel user = (UserModel) session.getAttribute("user");
        myService.changeIntro(user.getId(),word);
        UserModel newUser = myService.findUserById(user.getId());

        System.out.println("准备上传图片");
        String path = session.getServletContext().getRealPath("/images/avatar");
        String filename = filePic.getOriginalFilename();
        myService.changePic(user.getId(),filename);
        System.out.println("图片路径："+path);
        File dir = new File(path,filename);
        dir.mkdirs();
        try {
            filePic.transferTo(dir);
            System.out.println("图片上传成功");
        } catch (IOException e) {
            e.printStackTrace();
        }

        session.setAttribute("user",newUser);
        return "redirect:/ks/myHome";
    }

    //修改密码
    @RequestMapping("changePsw")
    public String changePsw(HttpSession session,
                            @RequestParam("oldPsw")String oldPsw,
                            @RequestParam("newPsw")String password,
                            @RequestParam("newPsw2")String password2){
        UserModel user = (UserModel) session.getAttribute("user");
        myService.changePsw(user.getId(),oldPsw,password,password2);
        return "login";
    }

    //准备进入别人的主页
    @RequestMapping("preOtherHome")
    public String otherHome(HttpSession session, @RequestParam(value = "relatedUserId",required = false )int otherId){
        UserModel other = myService.findUserById(otherId);
        Page page = myService.findByCommenterIdAndPage(other.getId());
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
        RelationModel relationEntity = myService.findUniqueRelation(1,user.getId(),other.getId());
        if (relationEntity.getId() == 0){
            myService.relate(user.getId(),other.getId(),1);
        }else {
            myService.deleteRelate(user.getId(),other.getId(),1);
            session.removeAttribute("isLike");
        }
        return "redirect:/ks/otherHome";
    }

    //拉黑或取消拉黑
    @RequestMapping("operation2")
    public String deleteOperation(HttpSession session){
        UserModel user = (UserModel) session.getAttribute("user");
        UserModel other = (UserModel) session.getAttribute("other");
        RelationModel relationEntity = myService.findUniqueRelation(0,user.getId(),other.getId());
        if (relationEntity.getId() == 0){
            myService.relate(user.getId(),other.getId(),0);
            myService.deleteRelate(user.getId(),other.getId(),1);
            myService.deleteRelate(other.getId(),user.getId(),1);
        }else {
            myService.deleteRelate(user.getId(),other.getId(),0);
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
