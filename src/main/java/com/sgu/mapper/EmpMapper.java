package com.sgu.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.sgu.domain.Emp;
import com.sgu.vo.EmpVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author huang
 * @date 2020/11/30 15:12
 */
public interface EmpMapper extends BaseMapper<Emp> {

    List<EmpVo> queryEmpByPage(@Param("page") Integer page, @Param("pageSize")  Integer pageSize);

    Integer queryCount();

}
