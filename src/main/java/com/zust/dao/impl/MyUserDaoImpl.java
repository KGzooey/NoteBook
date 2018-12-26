package com.zust.dao.impl;

import com.zust.bean.UserEntity;
import com.zust.dao.MyUserDao;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

@Repository
public class MyUserDaoImpl extends BaseDaoImpl<UserEntity> implements MyUserDao{
    @Override
    public void changeIntro(int id, String word) {
        Query q = getCurrentSession().createQuery("update UserEntity u set u.biography = '" + word +"' where u.id = '" + id +"'");
        q.executeUpdate();
    }

    @Override
    public void changePsw(int id, String password) {
        Query q = getCurrentSession().createQuery("update UserEntity u set u.password = '" + password +"' where u.id = '" + id +"'");
        q.executeUpdate();
    }

    @Override
    public void changePic(int id, String url) {
        Query q = getCurrentSession().createQuery("update UserEntity u set u.avatarUrl = '" + url +"' where u.id = '" + id +"'");
        q.executeUpdate();
    }
}
