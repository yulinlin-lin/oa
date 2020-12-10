package com.sgu.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.sgu.domain.Student;
import com.sgu.mapper.StudentMapper;
import com.sgu.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * @author huang
 * @date 2020/12/3 10:45
 */
@Service
public class StudentServiceImpl extends ServiceImpl<StudentMapper,Student> implements StudentService {

    @Autowired
    private StudentMapper studentMapper;

    @Override
    public List<Student> queryStudentByPageAndCondition(HashMap<String, Object> map) {
        return studentMapper.queryStudentByPageAndCondition(map);
    }

    @Override
    public int getTotalPage(HashMap<String, Object> map1) {
        return studentMapper.getTotalCount(map1);
    }

    @Override
    public List<Student> dbExportToExcel(HashMap<String, Object> map) {
        return studentMapper.dbExportToExcel(map);
    }

    @Override
    public boolean excelToDatabase(ArrayList<Student> list) {
//        boolean flag = studentMapper.insertStudentsList(list);
        boolean flag = studentMapper.insertStudentsList(list);

        return flag;
    }
}
