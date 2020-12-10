package com.sgu.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.sgu.domain.Depart;
import com.sgu.mapper.DepartMapper;
import com.sgu.service.DepartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author huang
 * @date 2020/12/1 8:31
 */
@Service
public class DepartServiceImpl implements DepartService {

    @Autowired
    private DepartMapper departMapper;


    @Override
    public boolean insertObject(Depart d) {
        boolean flag = false;
        d.setDel(0);
        Integer insert = departMapper.insert(d);
        if (insert > 0){
            flag = true;
        }
        return flag;
    }

    @Override
    public List<Depart> queryDeparts(Integer pageNo, Integer pageSize) {
        String str = "desc limit "+(pageNo-1)*pageSize+","+pageSize;

        List<Depart> departs = departMapper.selectList(
                new EntityWrapper<Depart>()
                        .eq("del",0) //查询的是没有被删除的人；
                        .orderBy("id")//直接orderby 是升序，asc
                        .last(str)//在sql语句后面追加last里面的内容(改为降序，同时分页)
        );
        return departs;
    }

    @Override
    public Integer queryCount() {
        Integer totalCount = departMapper.selectCount(new EntityWrapper<Depart>()
                .eq("del", 0)
        );
        return totalCount;
    }

    @Override
    public List<Depart> queryAllDepartalls() {
        List<Depart> departs = departMapper.selectList(
                new EntityWrapper<Depart>()
                        .eq("del",0) //查询的是没有被删除的人；
        );
        return departs;
    }
}
