package com.zust.service;


import com.zust.pageModel.BookModel;
import com.zust.pageModel.Page;
import com.zust.pageModel.RelationModel;
import com.zust.pageModel.UserModel;

import java.util.List;

public interface MyService {
    UserModel findUserByName(String name);//根据name查找指定用户
    UserModel findUserById(int id);//根据id查找指定用户
    List<UserModel> findByrelaterId(int type, int id);//查找所有操作对象
    List<UserModel> findByrelatedId(int type, int id);//查找所有被操作对象
    RelationModel findUniqueRelation(int type, int userId, int otherId);//查找指定关系
    List<UserModel> relateUsers(int id);//查找所有关系对象
    void changeIntro(int id, String word);//修改自我介绍
    void changePsw(int id, String oldPsw, String newPsw1, String newPsw2);//修改密码
    void changePic(int id,String url);//修改头像
    Page findByCommenterIdAndPage(int id);//查找所有评论关系
    BookModel findBookById(int id);//通过书本id查找指定书本
    void relate(int userId, int otherId, int type);//做出操作
    void deleteRelate(int userId, int otherId, int type);//取消操作
    void regist(String name, String password, String gender);//注册
}
