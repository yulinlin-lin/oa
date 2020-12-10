package com.sgu.controller;

import com.sgu.domain.Depart;
import com.sgu.domain.Message;
import com.sgu.domain.PageBean;
import com.sgu.service.DepartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author huang
 * @date 2020/12/1 8:32
 */
@Controller
public class DepartController {

    @Autowired
    private DepartService departService;


//    页面同步提交
    @RequestMapping("/addDepart")
    public String addDepart(Depart d){
        System.out.println(d);
        boolean flag = departService.insertObject(d);
        return "success";
    }


//    异步提交请求处理；
    @ResponseBody
    @RequestMapping("/addDepartAjax")
    public Message addDepartAjax(Depart d){
        Message message = null;
        System.out.println(d);
        boolean flag = departService.insertObject(d);
        if(flag){
            message = new Message(0,"新增成功！");
        }else{
            message = new Message(500,"新增失败！");
        }
        return message;
    }



    @RequestMapping("/queryDepartPage/{pageNo}/{pageSize}")
    public String queryDepartPage(@PathVariable("pageNo") Integer pageNo,
                                  @PathVariable("pageSize") Integer pageSize,
                                  Model m){

        List<Depart> departs = departService.queryDeparts(pageNo,pageSize);
        Integer totalCount = departService.queryCount();
        PageBean<Depart> pageBean = new PageBean<>(pageNo,pageSize,totalCount,departs);
        m.addAttribute("pb",pageBean);
        return "departlist";
    }


    /***
     * 提供到员工新增的页面的下拉框中；
     * 查询所有的部门信息；
     * @return
     */
    @ResponseBody
    @RequestMapping("/departall")
    public List<Depart> queryDepartall(){
        List<Depart> departs = departService.queryAllDepartalls();
        for (Depart depart : departs) {
            System.out.println(depart);
        }
        return departs;
    }
    
}
