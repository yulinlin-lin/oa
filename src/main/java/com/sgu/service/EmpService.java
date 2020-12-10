package com.sgu.service;

import com.sgu.domain.Emp;
import com.sgu.vo.EmpVo;

import java.util.List;

/**
 * @author huang
 * @date 2020/11/30 15:14
 */
public interface EmpService {

    Emp queryEmpOne(String no, String pass);

    boolean insertEmp(Emp emp);

    List<EmpVo> queryEmps(Integer pageNo, Integer pageSize);

    Integer queryCount();

    Emp queryEmpById(Integer id);

    boolean updateEmpById(Emp e);

    boolean deleteEmpById(Integer id);

}
