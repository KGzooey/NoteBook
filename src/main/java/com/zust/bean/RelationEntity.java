package com.zust.bean;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "user_relation")
public class RelationEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    @Column private Integer relater;
    @Column private Integer relatered;
    @Column private Date operateTime;
    @Column private Integer type;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }
}
