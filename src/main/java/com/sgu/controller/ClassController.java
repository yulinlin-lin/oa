package com.sgu.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sgu.domain.Class;
import com.sgu.domain.Major;
import com.sgu.service.ClassService;
import com.sgu.service.MajorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author huang
 * @date 2020/12/3 22:38
 */
@Controller
public class ClassController {
    @Autowired
    private ClassService classService;

    @Autowired
    private MajorService majorService;


    /***
     *                  添加班级信息
     * @param c
     * @return
     */
    @RequestMapping("/classAdd")
    public String classAdd(Class c){
        System.out.println(c);
        c.setClassDelete(0);
        boolean insert = classService.insert(c);
        System.out.println("新增是否成功！   "+insert);
        return "forward:/queryClassPage/1/5";
    }


    /***
     *      查询所有的班级类型并且跳转到新增页面中去；
     * @param m
     * @return
     */
    @RequestMapping("/toClassAddPage")
    public String toClassAddPage(Model m){
        List<Major> majors = majorService.selectList(new EntityWrapper<Major>().eq("major_delete", "0"));
        m.addAttribute("majors",majors);
        return "gradeadd";
    }
    
    
    
    



    /***
     * 查询 所有的班级信息；
     * @return
     */
    @ResponseBody
    @RequestMapping("/getAllClass")
    public List<Class> getAllClass(){
        List<Class> classList =  classService.queryAllClass();
        return classList;
    }


    /***
     * 分页查询班级信息；
     * @param pageNO
     * @param pageSize
     * @param m
     * @return
     */
    @RequestMapping("/queryClassPage/{pageNO}/{pageSize}")
    public String queryClassPage(@PathVariable("pageNO") Integer pageNO,
                                 @PathVariable("pageSize") Integer pageSize,
                                 Model m){
        PageHelper.startPage(pageNO,pageSize);

//        第一种直接在数据库里面进行分页的查找；  后来有pagHelpe就不使用下面的方法了；
//        List<Class> classList =  classService.queryClassPages((pageNO - 1) *pageSize,pageSize);


//        第二种： 使用Mybatisplus中的Iservice里面的方法，直接对单表进行操作；  就是不想自己写sql语句；
//        List<Class> classList = classService.selectList(new EntityWrapper<Class>().eq("class_delete", "0"));

//        第三： 既要使用pageHelper也要自己写sql语句，因为涉及到了两个表；
        List<Class> classList = classService.queryClassAndMajorName();

//        int totalCount = classService.selectCount(new EntityWrapper<Class>().eq("class_delete", "0"));

        PageInfo<Class> pageInfo = new PageInfo<>(classList);
        m.addAttribute("pi",pageInfo);

        return "gradelist";
    }


}
