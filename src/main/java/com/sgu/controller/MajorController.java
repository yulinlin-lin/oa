package com.sgu.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sgu.domain.Class;
import com.sgu.domain.Major;
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
 * @date 2020/12/5 18:17
 */
@Controller
public class MajorController {

    @Autowired
    private MajorService majorService;

    @RequestMapping("/majoradd")
    public String majorAdd(Major m){
        m.setMajorDelete(0);
        System.out.println(m);
        boolean insert = majorService.insert(m);
        System.out.println("添加是否成功！   "+insert);
        return "forward:/queryMajorPage/1/5";
    }




    /***
     *    专业查看列表   分页；
     * @param pageNO
     * @param pageSize
     * @param m
     * @return
     */
    @RequestMapping("/queryMajorPage/{pageNO}/{pageSize}")
    public String queryMajorPage(@PathVariable("pageNO") Integer pageNO,
                                 @PathVariable("pageSize") Integer pageSize,
                                 Model m){
        PageHelper.startPage(pageNO,pageSize);
        List<Major> majors =  majorService.queryAllMajorsAndType();
        PageInfo<Major> pageInfo = new PageInfo<>(majors);
        m.addAttribute("pi1",pageInfo);
        return "courselist";
    }



    @ResponseBody
    @RequestMapping("/queryAllMajor")
    public List<Major> queryAllMajor(){
        List<Major> majors = majorService.selectList(new EntityWrapper<Major>().eq("major_delete", "0"));
        return majors;
    }



}
