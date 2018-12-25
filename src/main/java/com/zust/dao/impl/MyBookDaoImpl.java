package com.zust.dao.impl;

import com.zust.bean.BookEntity;
import com.zust.dao.MyBookDao;
import org.springframework.stereotype.Repository;

@Repository
public class MyBookDaoImpl extends BaseDaoImpl<BookEntity> implements MyBookDao {
}
