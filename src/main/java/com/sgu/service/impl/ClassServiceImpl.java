package com.sgu.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.sgu.domain.Class;
import com.sgu.mapper.ClassMapper;
import com.sgu.service.ClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author huang
 * @date 2020/12/3 22:28
 */
@Service
public class ClassServiceImpl extends ServiceImpl<ClassMapper,Class> implements ClassService {

    @Autowired
    private ClassMapper classMapper;

    @Override
    public List<Class> queryAllClass() {
        List<Class> classList = classMapper.selectList(new EntityWrapper<Class>()
            .eq("class_delete",0)
        );
        return classList;
    }


    @Override
    public List<Class> queryClassPages(int pageNo, Integer pageSize) {
        List<Class> classList = classMapper.selectPage(new Page<Class>(pageNo, pageSize),
                new EntityWrapper<Class>().eq("class_delete", "0"));
        return classList;
    }

    @Override
    public List<Class> queryClassAndMajorName() {

        return classMapper.queryClassAndMajorName();
    }


}
