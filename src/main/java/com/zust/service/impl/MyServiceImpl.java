package com.zust.service.impl;

import com.zust.bean.BookEntity;
import com.zust.bean.CommentEntity;
import com.zust.bean.RelationEntity;
import com.zust.bean.UserEntity;
import com.zust.dao.*;
import com.zust.pageModel.*;
import com.zust.service.MyService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
@Transactional
public class MyServiceImpl implements MyService {
    @Autowired private MyUserDao userDao;
    @Autowired private MyBookDao bookDao;
    @Autowired private MyCommentDao commentDao;
    @Autowired private MyRelationDao relationDao;

    @Override
    public UserModel findUserByName(String name) {
        String hql = "from UserEntity where username = '" + name + "'";
        UserEntity userEntity = userDao.get(hql);
        UserModel user = new UserModel();
        if (userEntity != null){
            BeanUtils.copyProperties(userEntity,user);
        }
        return user;
    }

    @Override
    public UserModel findUserById(int id) {
        String hql = "from UserEntity where id = '" + id + "'";
        UserEntity userEntity = userDao.get(hql);
        UserModel user = new UserModel();
        if (userEntity != null){
            BeanUtils.copyProperties(userEntity,user);
        }
        return user;
    }

    @Override
    public List<UserModel> findByrelaterId(int type, int id) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("type", type);
        params.put("id", id);
        List<RelationEntity> relationEntities = relationDao.find("from RelationEntity r where r.relater = :id and r.type = :type", params);
        if (relationEntities != null) {
            List<UserModel> userModels = new ArrayList<>();
            for (RelationEntity re : relationEntities) {
                UserModel user = new UserModel();
                String hql = "from UserEntity where id = '" + re.getRelatered() + "'";
                UserEntity userEntity = userDao.get(hql);
                if (userEntity != null){
                    BeanUtils.copyProperties(userEntity,user);
                }
                userModels.add(user);
            }
            return userModels;
        }
        return null;
    }

    @Override
    public List<UserModel> findByrelatedId(int type, int id) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("type", type);
        params.put("id", id);
        List<RelationEntity> relationEntities = relationDao.find("from RelationEntity r where r.relatered = :id and r.type = :type", params);
        if (relationEntities != null) {
            List<UserModel> userModels = new ArrayList<>();
            for (RelationEntity re : relationEntities) {
                UserModel user = new UserModel();
                String hql2 = "from UserEntity where id = '" + re.getRelater() + "' ";
                UserEntity userEntity = userDao.get(hql2);
                if (userEntity != null){
                    BeanUtils.copyProperties(userEntity,user);
                }
                userModels.add(user);
            }
            return userModels;
        }
        return null;
    }

    @Override
    public RelationModel findUniqueRelation(int type, int userId, int otherId) {
        RelationEntity relationEntity = relationDao.findUniqueRelation(type,userId,otherId);
        RelationModel relation = new RelationModel();
        if (relationEntity != null){
            BeanUtils.copyProperties(relationEntity,relation);
        }
        return relation;
    }

    @Override
    public List<UserModel> relateUsers(int userId) {
        List<UserModel> relateUsers = new ArrayList<>();//所有对象
        String hql1 = "from RelationEntity where type = 1 and relater = '"+userId+"'";
        String hql2 = "from RelationEntity where type = 0 and relater = '"+userId+"'";
        String hql3 = "from RelationEntity where type = 1 and relatered = '"+userId+"'";
        List<RelationEntity> relateTo1 = relationDao.find(hql1);//关注对象
        List<RelationEntity> relateTo2 = relationDao.find(hql2);//拉黑对象
        List<RelationEntity> relateFrom = relationDao.find(hql3);//粉丝对象
        for (RelationEntity relationEntity:relateTo1){
            String hql4 = "from UserEntity where id = '" + relationEntity.getRelatered() + "'";
            UserEntity userEntity = userDao.get(hql4);
            UserModel userModel = new UserModel();
            if (userEntity != null){
                BeanUtils.copyProperties(userEntity,userModel);
            }
            userModel.setOperateType(1);//关注
            userModel.setRelateType(0);//被操作
            relateUsers.add(userModel);
        }
        for (RelationEntity relationEntity:relateTo2){
            String hql5 = "from UserEntity where id = '" + relationEntity.getRelatered() + "'";
            UserEntity userEntity = userDao.get(hql5);
            UserModel userModel = new UserModel();
            if (userEntity != null){
                BeanUtils.copyProperties(userEntity,userModel);
            }
            userModel.setOperateType(0);//拉黑
            userModel.setRelateType(0);//被操作
            relateUsers.add(userModel);
        }
        for (RelationEntity relationEntity:relateFrom){
            String hql6 = "from UserEntity where id = '"+ relationEntity.getRelater() +"'";
            UserEntity userEntity = userDao.get(hql6);
            UserModel userModel = new UserModel();
            if (userEntity != null){
                BeanUtils.copyProperties(userEntity,userModel);
            }
            userModel.setOperateType(1);//关注
            userModel.setRelateType(1);//操作
            relateUsers.add(userModel);
        }
        return relateUsers;
    }

    @Override
    public void changeIntro(int id, String word) {
        userDao.changeIntro(id,word);
    }

    @Override
    public int changePsw(int id, String oldPsw, String newPsw1, String newPsw2) {
        int flag = 0;
        UserEntity user = userDao.get("from UserEntity where id = '"+id+"'");
        String password = user.getPassword();
        if (password.equals(oldPsw)){
            if (newPsw1.equals(newPsw2)){
                userDao.changePsw(id,newPsw1);
                flag = 1;
            }
        }
        return flag;
    }

    @Override
    public Page findByCommenterIdAndPage(int userid) {
        Page page = new Page();
        int totalRecord = commentDao.sizeOfComment(userid);
        List<CommentEntity> commentEntities = commentDao.findCommentByUserAndPage(userid);
        List<CommentModel> commentModels = new ArrayList<>();
        for (CommentEntity commentEntity:commentEntities){
            CommentModel commentModel = new CommentModel();
            String hql2 = "from BookEntity where id = '"+ commentEntity.getBookId() +"'";
            BookEntity bookEntity = bookDao.get(hql2);
            BookModel bookModel = new BookModel();
            if (bookEntity != null){
                BeanUtils.copyProperties(bookEntity,bookModel);
            }
            commentModel.setBookModel(bookModel);
            if (commentEntity != null){
                BeanUtils.copyProperties(commentEntity,commentModel);
            }
            commentModels.add(commentModel);
        }
        page.setTotalRecord(totalRecord);
        page.setList(commentModels);
        return page;
    }

    @Override
    public BookModel findBookById(int id) {
        String hql = "from BookEntity where id = '"+ id +"'";
        BookEntity bookEntity = bookDao.get(hql);
        BookModel book = new BookModel();
        if (bookEntity != null){
            BeanUtils.copyProperties(bookEntity,book);
        }
        return book;
    }

    @Override
    public void relate(int userId, int otherId, int type) {
        System.out.println("relate_userId:"+userId);
        System.out.println("relate_otherId:"+otherId);
        System.out.println("relate_type:"+type);
        RelationEntity relation = new RelationEntity();
        relation.setRelater(userId);
        relation.setRelatered(otherId);
        relation.setType(type);
        Date date = new Date();
        relation.setOperateTime(date);
        relationDao.save(relation);
    }

    @Override
    public void deleteRelate(int userId, int otherId, int type) {
        RelationEntity relation = relationDao.findUniqueRelation(type,userId,otherId);
        relationDao.delete(relation);
    }

    @Override
    public void regist(String name, String password, String gender) {
        UserEntity user = new UserEntity();
        user.setUsername(name);
        user.setPassword(password);
        user.setGender(gender);
        userDao.save(user);
    }


}
