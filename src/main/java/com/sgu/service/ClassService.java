package com.sgu.service;

import com.baomidou.mybatisplus.service.IService;
import com.sgu.domain.Class;
import com.sgu.domain.Student;

import java.util.List;

/**
 * @author huang
 * @date 2020/12/3 22:28
 */
public interface ClassService extends IService<Class> {
    List<Class> queryAllClass();

    List<Class> queryClassPages(int i, Integer pageSize);

    List<Class> queryClassAndMajorName();

}
