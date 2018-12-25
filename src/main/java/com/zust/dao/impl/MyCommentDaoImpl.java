package com.zust.dao.impl;

import com.zust.bean.CommentEntity;
import com.zust.dao.MyCommentDao;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class MyCommentDaoImpl extends BaseDaoImpl<CommentEntity> implements MyCommentDao{
    @Override
    public int sizeOfComment(int id) {
        Query q = getCurrentSession().createQuery("from CommentEntity where commenterId = '" + id +"'" );
        return q.list().size();
    }

    @Override
    public List<CommentEntity> findCommentByUserAndPage(int userId) {
        Query q = getCurrentSession().createQuery("from CommentEntity where commenterId = '" + userId +"' order by publishDate" );
        q.setMaxResults(2);
        List<CommentEntity> commentEntities = q.list();
        return commentEntities;
    }


}
