package com.sgu.service;

import com.baomidou.mybatisplus.service.IService;
import com.sgu.domain.Student;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * @author huang
 * @date 2020/12/3 10:45
 */
public interface StudentService extends IService<Student> {
    List<Student> queryStudentByPageAndCondition(HashMap<String, Object> map);

    int getTotalPage(HashMap<String, Object> map1);

    List<Student> dbExportToExcel(HashMap<String ,Object> map);

    boolean excelToDatabase(ArrayList<Student> list);

}
