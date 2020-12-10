package com.sgu.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.sgu.domain.Class;
import com.sgu.domain.Emp;

import java.util.List;

/**
 * @author huang
 * @date 2020/12/3 10:42
 */
public interface ClassMapper extends BaseMapper<Class> {


    List<Class> queryClassAndMajorName();

}
