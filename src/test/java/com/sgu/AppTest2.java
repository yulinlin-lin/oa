package com.sgu;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sgu.domain.Class;
import com.sgu.domain.Major;
import com.sgu.domain.Student;
import com.sgu.mapper.ClassMapper;
import com.sgu.mapper.StudentMapper;
import com.sgu.service.ClassService;
import com.sgu.service.MajorService;
import com.sgu.service.StudentService;
import com.sgu.utils.ExcelUtil;
import org.apache.poi.ss.usermodel.Workbook;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.List;

/**
 * @author huang
 * @date 2020/12/3 10:58
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring-mybatis.xml")
public class AppTest2 {

    @Autowired
    private StudentService studentService;

    @Autowired
    private ClassService classService;

    @Autowired
    private StudentMapper studentMapper;


    @Autowired
    private ClassMapper classMapper;

    @Autowired
    private MajorService majorService;

    @Test
    public void k9(){
        List<Major> majors = majorService.queryAllMajorsAndType();
        for (Major major : majors) {
            System.out.println(major);
        }
    }



    @Test
    public void k8(){
        List<Class> classList = classMapper.queryClassAndMajorName();
        for (Class aClass : classList) {
            System.out.println(aClass);
        }
    }

    @Test
    public void k7(){

        PageHelper.startPage(1,2);
        List<Class> classList = classMapper.selectList(new EntityWrapper<Class>().eq("class_delete", "0"));
        System.out.println("=================");
        System.out.println(classList.size());

//        List<Class> classList = classService.queryClassPages(1, 3);
//
//        PageInfo<Class> pageInfo = new PageInfo<>(classList);
//        System.out.println(pageInfo);

//        System.out.println("===============================================");
//        for (Class aClass : classList) {
//            System.out.println(aClass);
//        }

        /*int count = classService.selectCount(new EntityWrapper<Class>().eq("class_delete", "0"));
        System.out.println("$$$$$$$$$$$$$$$$$-----------------   "+count);*/
    }

    @Test
    public void k6(){
        Student student = new Student();
        student.setId(91);
        student.setNo("17115073053");
        student.setName("欧阳娜娜");
        student.setSex("女");
        student.setBirthday("2020-12-30");
        student.setCardno("440982199603159999");
        student.setEducation("硕士");
        student.setClassId(1);
        student.setFlag(1);
        student.setEmail("wlf666666@qq.com");
        student.setQq("1009727380");
        student.setPhone("13423578943");
        student.setSchool("广州大学");
        student.setDel(0);
        boolean b = studentService.insertOrUpdate(student);
//        boolean b = studentService.insertOrUpdate(student);
        System.out.println(b);
    }


    @Test
    public void m1(){
        HashMap<String, Object> map = new HashMap<>();
        map.put("name","");
        map.put("classId",0);
        int totalPage = studentService.getTotalPage(map);
        System.out.println(totalPage);
    }


    @Test
    public void k2(){
        List<Class> classList = classService.queryAllClass();
        for (Class aClass : classList) {
            System.out.println(aClass);
        }
    }


    @Test
    public void k3(){
        String string = "huang";
        char c = string.charAt(2);
        System.out.println(c);
    }



    @Test
    public void k4(){
        HashMap<String, Object> map = new HashMap<>();
        map.put("name","明");
        map.put("classId",0);
        List<Student> students = studentMapper.dbExportToExcel(map);
        for (Student student : students) {
            System.out.println(student);
        }
    }


    @Test
    public void k5() throws Exception {

        String[][] values = {{"111","3799","24"},{"222","3899","25"},{"333","3999","26"}};
        String[] str  ={"工号","工资","年龄"};
        Workbook wb = ExcelUtil.getWorkbook("我是一个选项卡", str, values);
        FileOutputStream fos = new FileOutputStream("D:\\upload\\abc.xlsx");
        wb.write(fos);
        fos.close();

    }

}
