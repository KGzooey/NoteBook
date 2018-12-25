package com.zust.dao.impl;

import com.zust.bean.RelationEntity;
import com.zust.dao.MyRelationDao;
import com.zust.pageModel.RelationModel;
import org.hibernate.Query;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.Map;

@Repository
public class MyRelationDaoImpl extends BaseDaoImpl<RelationEntity> implements MyRelationDao{

    @Override
    public RelationEntity findUniqueRelation(int type, int userId, int otherId) {
        Query q = getCurrentSession().createQuery("from RelationEntity where type = '"+type+"' and relater = '"+userId+"' and relatered = '"+otherId+"'");
        RelationEntity relation = (RelationEntity) q.uniqueResult();
        return relation;
    }
}
