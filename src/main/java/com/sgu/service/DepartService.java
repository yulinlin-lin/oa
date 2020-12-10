package com.sgu.service;

import com.sgu.domain.Depart;

import java.util.List;

/**
 * @author huang
 * @date 2020/12/1 8:31
 */
public interface DepartService {
    boolean insertObject(Depart d);


    List<Depart> queryDeparts(Integer pageNo, Integer pageSize);

    Integer queryCount();

    List<Depart> queryAllDepartalls();

}
