package com.zust.pageModel;

import com.sun.corba.se.impl.interceptors.PICurrent;

import java.util.List;

/**
 * @description:
 * @create: 2018-12-22 10:41
 **/
public class BookList {
    private String listName;
    private List<Book> bookItem;
    private PageInfo pageInfo;

    public String getListName() {
        return listName;
    }

    public void setListName(String listName) {
        this.listName = listName;
    }

    public List<Book> getBookItem() {
        return bookItem;
    }

    public void setBookItem(List<Book> bookItem) {
        this.bookItem = bookItem;
    }

    public PageInfo getPageInfo() {
        return pageInfo;
    }

    public void setPageInfo(PageInfo pageInfo) {
        this.pageInfo = pageInfo;
    }
}
