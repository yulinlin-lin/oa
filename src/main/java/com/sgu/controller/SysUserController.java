package com.sgu.controller;

import com.sgu.domain.SysUser;
import com.sgu.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author huang
 * @date 2020/11/30 10:35
 */
@Controller
public class SysUserController {

    @Autowired
    private SysUserService sysUserService;

    @ResponseBody
    @RequestMapping("/login")
    public SysUser methodName(){
        SysUser login = sysUserService.login();
        return login;
    }

    @RequestMapping("/success")
    public String getSusccess(){
        return "success";
    }


}
