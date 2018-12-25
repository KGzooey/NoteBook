package com.zust.pageModel;

import java.util.Date;

public class RelationModel {
    private int id;
    private int relater;
    private int relatered;
    private Date operateTime;
    private int type;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRelater() {
        return relater;
    }

    public void setRelater(int relater) {
        this.relater = relater;
    }

    public int getRelatered() {
        return relatered;
    }

    public void setRelatered(int relatered) {
        this.relatered = relatered;
    }

    public Date getOperateTime() {
        return operateTime;
    }

    public void setOperateTime(Date operateTime) {
        this.operateTime = operateTime;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }
}
