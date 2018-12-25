package com.zust.pageModel;

import java.util.List;

public class Page<T> {
    private int currentPage;//当前页数
    private int totalRecord;//总记录数
    private int totalPage;//总页数
    private List<T> list;//每页显示数据集合
    private int prePage;//上一页
    private int nextPage;//下一页

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getTotalRecord() {
        return totalRecord;
    }

    public void setTotalRecord(int totalRecord) {
        this.totalRecord = totalRecord;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    //上一页
    public int getPrePage(){
        if (currentPage <= 1){
            return 1;
        }else{
            return currentPage-1;
        }
    }

    public void setPrePage(int prePage) {
        this.prePage = prePage;
    }

    //下一页
    public int getNextPage(){
        if (currentPage == totalPage){
            return getCurrentPage();
        }else{
            return currentPage+1;
        }
    }

    public void setNextPage(int nextPage) {
        this.nextPage = nextPage;
    }
}
