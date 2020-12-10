package com.sgu.service.impl;

import com.sgu.domain.Emp;
import com.sgu.mapper.EmpMapper;
import com.sgu.service.EmpService;
import com.sgu.vo.EmpVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author huang
 * @date 2020/11/30 15:14
 */
@Service
public class EmpServiceImpl implements EmpService {


    @Autowired
    private EmpMapper empMapper;

    @Override
    public Emp queryEmpOne(String no, String pass) {
        Emp emp = new Emp();
        emp.setDel(0);
        emp.setNo(no);
        emp.setPass(pass);
        Emp emp1 = empMapper.selectOne(emp);
        return emp1;
    }

    @Override
    public boolean insertEmp(Emp emp) {
        boolean flag = false;
        Integer insert = empMapper.insert(emp);
        if (insert > 0){
            flag = true;
        }
        return flag;
    }


    @Override
    public List<EmpVo> queryEmps(Integer pageNo, Integer pageSize) {
        return empMapper.queryEmpByPage((pageNo - 1)*pageSize,pageSize);
    }

    @Override
    public Integer queryCount() {
        return empMapper.queryCount();
    }


    @Override
    public Emp queryEmpById(Integer id) {
        Emp emp = new Emp();
        emp.setId(id);
        Emp one = empMapper.selectOne(emp);
        return one;
    }

    @Override
    public boolean updateEmpById(Emp e) {
        boolean flag = false;
        Integer integer = empMapper.updateById(e);
        if (integer > 0){
            flag = true;
        }
        return flag;
    }

    @Override
    public boolean deleteEmpById(Integer id) {
        boolean flag = false;
        Emp emp = new Emp();
        emp.setId(id);
        emp.setDel(1);
        Integer integer = empMapper.updateById(emp);
        if (integer > 0){
            flag = true;
        }
        return flag;
    }


}
