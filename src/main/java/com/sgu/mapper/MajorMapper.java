package com.sgu.mapper;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.sgu.domain.Major;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
*
*
* @author huang
* @date 2020/12/5 18:13
*/
public interface MajorMapper extends BaseMapper<Major> {
    int deleteByPrimaryKey(Integer id);

    int insertSelective(Major record);

    Major selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Major record);

    int updateByPrimaryKey(Major record);

    Major queryById(@Param("id")Integer id);


    List<Major> queryAllMajorsAndType();

}