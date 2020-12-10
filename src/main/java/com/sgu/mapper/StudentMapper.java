package com.sgu.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.sgu.domain.Class;
import com.sgu.domain.Student;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * @author huang
 * @date 2020/12/3 10:44
 */
public interface StudentMapper extends BaseMapper<Student> {

    List<Student> queryStudentByPageAndCondition(HashMap<String ,Object> map);

    int getTotalCount(HashMap<String ,Object> map);

    List<Student> dbExportToExcel(HashMap<String ,Object> map);

    boolean insertStudentsList(@Param("list") ArrayList<Student> list);

}
