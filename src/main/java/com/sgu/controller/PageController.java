package com.sgu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *  完成页面跳转的工作的类；
 * @author huang
 * @date 2020/11/30 15:35
 */
@Controller
public class PageController {

//    编写通用跳转页面的方法；

    @RequestMapping("/topage/{page}")
    public String methodName(@PathVariable("page") String page){
        return page;
    }




}
