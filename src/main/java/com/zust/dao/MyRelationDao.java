package com.zust.dao;

import com.zust.bean.RelationEntity;

public interface MyRelationDao extends BaseDao<RelationEntity> {
    RelationEntity findUniqueRelation(int type, int userId, int otherId);//查找指定关系
}
