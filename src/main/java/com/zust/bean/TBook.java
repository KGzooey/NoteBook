package com.zust.bean;

import javax.persistence.*;

/**
 * @description:
 * @create: 2018-12-20 09:00
 **/

@Entity
@Table(name = "book")
public class TBook {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column private String title;
    @Column private String author;
    @Column private String publishOrg;
    @Column private String synopsis;
    @Column private String writerInfo;
    @Column private String coverUrl;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPublishOrg() {
        return publishOrg;
    }

    public void setPublishOrg(String publishOrg) {
        this.publishOrg = publishOrg;
    }

    public String getSynopsis() {
        return synopsis;
    }

    public void setSynopsis(String synopsis) {
        this.synopsis = synopsis;
    }

    public String getWriterInfo() {
        return writerInfo;
    }

    public void setWriterInfo(String writerInfo) {
        this.writerInfo = writerInfo;
    }

    public String getCoverUrl() {
        return coverUrl;
    }

    public void setCoverUrl(String coverUrl) {
        this.coverUrl = coverUrl;
    }
}
