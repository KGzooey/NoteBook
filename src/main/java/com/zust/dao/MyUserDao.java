package com.zust.dao;

import com.zust.bean.UserEntity;

public interface MyUserDao extends BaseDao<UserEntity> {
    void changeIntro(int id, String word);//修改自我介绍
    void changePsw(int id, String password);//修改密码
}
