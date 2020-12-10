package com.sgu.domain;

import lombok.Data;
import lombok.ToString;

import java.util.List;

/**
 * @author huang
 * @date 2020/12/1 10:00
 */
@Data
@ToString
public class PageBean<T> {
    private Integer pageNo;
    private Integer pageSize;
    private Integer totalCount;
    private Integer totalPages;


    private int startno;
    private int endno;

    public PageBean(Integer pageNo,Integer pageSize,Integer totalCount,List<T> recodes){
        this.pageNo = pageNo;
        this.pageSize = pageSize;
        this.totalCount = totalCount;
        this.recodes = recodes;

        int x = totalCount % pageSize;   //  如果模出来的结果是没有余数的，那就是整数了；
        int y = totalCount / pageSize;
        this.totalPages = (x == 0? y : y + 1);

        if (this.totalPages <= 10){
            this.startno = 1;
            this.endno = this.totalPages;
        }else{
            this.startno = this.pageNo - 4;
            this.endno = this.pageNo + 5;
            if (startno < 1){
                this.startno = 1;
                this.endno = 10;
            }else if (endno > totalPages){
                this.startno = totalPages - 9;
                this.endno = totalPages;
            }
        }
    }

    private List<T> recodes;

}
