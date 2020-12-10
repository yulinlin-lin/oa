package com.sgu.service;

import com.baomidou.mybatisplus.service.IService;
import com.sgu.domain.Major;

import java.util.List;

/**
 * @author huang
 * @date 2020/12/5 18:13
 */
public interface MajorService extends IService<Major> {


    int deleteByPrimaryKey(Integer id);


    int insertSelective(Major record);

    Major selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Major record);

    int updateByPrimaryKey(Major record);

    List<Major> queryAllMajorsAndType();

}
