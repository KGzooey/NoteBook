package com.zust.bean;

import javax.persistence.*;

/**
 * @description: 对应booklist表
 * @create: 2018-12-22 10:44
 **/
@Entity
@Table(name = "booklist")
public class TBookList {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column private String name;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
