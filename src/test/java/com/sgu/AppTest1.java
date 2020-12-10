package com.sgu;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.sgu.domain.*;
import com.sgu.mapper.DepartMapper;
import com.sgu.mapper.StudentMapper;
import com.sgu.service.DepartService;
import com.sgu.service.EmpService;
import com.sgu.service.LoginlogService;
import com.sgu.vo.EmpVo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author huang
 * @date 2020/11/30 10:26
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring-mybatis.xml")
public class AppTest1 {

    /*@Autowired
    private SysUserMapper sysUserMapper;*/


/*    @Autowired
    private EmpMapper empMapper;*/


    @Autowired
    private DepartMapper departMapper;


    @Autowired
    private DepartService departService;


    @Autowired
    private LoginlogService loginlogService;


    @Autowired
    private EmpService empService;


    @Autowired
    private StudentMapper studentMapper;


    @Test
    public void m1(){
//        根据多个条件来进行查询

        List<Depart> departs = departMapper.selectList(
                new EntityWrapper<Depart>()
                        .eq("del",0)
                        .orderBy("id")//直接orderby 是升序，asc
                        //在sql语句后面追加last里面的内容(改为降序，同时分页)
                        .last("desc limit 0,5")
        );
        for (Depart depart : departs) {
            System.out.println(depart);
        }
    }



    @Test
    public void m2(){
        Integer del = departMapper.selectCount(new EntityWrapper<Depart>()
                .eq("del", 0)
        );
        System.out.println("记录数： "+del);
    }



    @Test
    public void m3(){
        List<Depart> departs = departService.queryDeparts(3, 5);
        for (Depart depart : departs) {
            System.out.println(depart);
        }
    }



    @Test
    public void m4(){
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
    }


    @Test
    public void m5(){
        Loginlog loginlog = new Loginlog();
        loginlog.setIp("120.197.197.12");
        loginlog.setNo("admin");
//        loginlog.setLocation("广东省广州市");
        boolean b = loginlogService.addLoginLog(loginlog);
        System.out.println("========="+b);
    }


    @Test
    public void m6(){
        List<Loginlog> admin = loginlogService.queryLogBylast_no("admin");
        for (Loginlog loginlog : admin) {
            System.out.println(loginlog);
        }
    }


    @Test
    public void m7(){
        List<EmpVo> emps = empService.queryEmps(1, 3);
        for (EmpVo emp : emps) {
            System.out.println(emp);
        }
    }

    @Test
    public void m8(){
        Integer integer = empService.queryCount();
        System.out.println(integer);
    }


    @Test
    public void m9(){
        Student student = new Student();
        student.setId(2);
        Student student1 = studentMapper.selectOne(student);
        System.out.println(student1);
    }


    @Test
    public void m10(){
        HashMap<String, Object> map = new HashMap<>();
        map.put("name","");
        map.put("classId",0);
        map.put("pageNo",0);
        map.put("pageSize",2);

        List<Student> students = studentMapper.queryStudentByPageAndCondition(map);
        for (Student student : students) {
            System.out.println(student);
        }
    }



    @Test
    public void m11(){
        HashMap<String, Object> map = new HashMap<>();
        map.put("name","");
        map.put("classId",0);
        int totalCount = studentMapper.getTotalCount(map);
        System.out.println(totalCount);
    }





}
