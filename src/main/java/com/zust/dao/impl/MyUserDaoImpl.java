package com.zust.dao.impl;

import com.zust.bean.UserEntity;
import com.zust.dao.MyUserDao;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

@Repository
public class MyUserDaoImpl extends BaseDaoImpl<UserEntity> implements MyUserDao{
    @Override
    public void changeIntro(int id, String word) {
        Query q = getCurrentSession().createQuery("update UserEntity set biography = '" + word +"' and id = '" + id +"'");
        q.executeUpdate();
    }

    @Override
    public void changePsw(int id, String password) {
        Query q = getCurrentSession().createQuery("update UserEntity set password = '" + password +"' where id = '" + id +"'");
        q.executeUpdate();
    }
}
