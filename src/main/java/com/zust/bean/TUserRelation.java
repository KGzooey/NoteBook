package com.zust.bean;

import javax.persistence.*;
import java.util.Date;

/**
 * @description: 用户关注，用户黑名单
 * @create: 2018-12-22 15:57
 **/
@Entity
@Table(name = "user_relation")
public class TUserRelation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column private Integer type;
    @Column private Integer relater;
    @Column private Integer relatered;
    @Column private Date operateTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getRelater() {
        return relater;
    }

    public void setRelater(Integer relater) {
        this.relater = relater;
    }

    public Integer getRelatered() {
        return relatered;
    }

    public void setRelatered(Integer relatered) {
        this.relatered = relatered;
    }

    public Date getOperateTime() {
        return operateTime;
    }

    public void setOperateTime(Date operateTime) {
        this.operateTime = operateTime;
    }
}
