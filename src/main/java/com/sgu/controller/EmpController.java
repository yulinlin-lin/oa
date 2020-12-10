package com.sgu.controller;

import com.sgu.domain.*;
import com.sgu.service.DepartService;
import com.sgu.service.EmpService;
import com.sgu.service.LoginlogService;
import com.sgu.vo.EmpVo;
import org.apache.http.HttpRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author huang
 * @date 2020/11/30 15:17
 */
@Controller
public class EmpController {

    @Autowired
    private EmpService empService;


    @Autowired
    private LoginlogService loginlogService;


    @Autowired
    private DepartService departService;

//    如果用户是存在的，并且状态是正确的；

    /***
     * 登录处理方法；
     * @param no
     * @param pass
     * @param ip
     * @param city
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping("/emplogin")
    public Message empLogin(@RequestParam("no") String no, @RequestParam("pass") String pass,
                            @RequestParam("ip") String ip, @RequestParam("city") String city, HttpSession session){

        Loginlog loginlog = new Loginlog();
        loginlog.setIp(ip);
        loginlog.setNo(no);
        loginlog.setLocation(city);


        Message message = null;
        Emp emp = empService.queryEmpOne(no,pass);
        if (emp == null){  //
            message = new Message(404,"用户名或者密码错误！");

        }else if(emp.getFlag() == 0){
            message = new Message(404,"账户已被锁定，请求联系管理员！");
        }else{
            message = new Message(200,"登录成功！！！");


//            登录成功后，把emp保存在session域中；
            session.setAttribute("emp",emp);

            //            添加登录日志
            boolean flag = loginlogService.addLoginLog(loginlog);
            if (flag){
                System.out.println("登录日志记录成功； ");
            }
        }
        return message;
    }


    /***
     * 记录登录日志处理
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping("/findLogs")
    public List<Loginlog> findLogs(HttpSession session){
        Emp emp = (Emp)session.getAttribute("emp");
        List<Loginlog> logs = loginlogService.queryLogBylast_no(emp.getNo());
        return logs;
    }

    /***
     * 员工新增
     */
    @ResponseBody
    @RequestMapping("/empadd")
    public Message empadd(Emp emp){
        Message message = null;
        emp.setPass("123");  //默认的密码
        emp.setFlag(1);  // 新增时 默认都是激活的状态；
        emp.setDel(0);   //默认都是没有删除
        boolean flag = empService.insertEmp(emp);

        System.out.println("插入成功：     "+flag);

        if(flag){
            message = new Message(0,"添加成功！");
        }else{
            message = new Message(500,"添加失败！");
        }
        return message;
    }


    /***
     * 退出登录
     * @param session
     * @param request
     * @return
     */
    @RequestMapping("/userloginout")
    public String userloginout(HttpSession session, HttpServletRequest request){
        session.invalidate(); // 释放掉你放在里面的用户对象；
        return "redirect:/login.jsp";
    }


    /***
     * 查询员工列表    带有分页查询 ；
     * @param pageNo
     * @param pageSize
     * @param m
     * @return
     */
    @RequestMapping("/queryEmpPage/{pageNo}/{pageSize}")
    public String queryEmpPage(@PathVariable("pageNo") Integer pageNo,
                                  @PathVariable("pageSize") Integer pageSize,
                                  Model m){

        List<EmpVo> empVos = empService.queryEmps(pageNo,pageSize);
        Integer totalCount = empService.queryCount();
        PageBean<EmpVo> pageBean = new PageBean<>(pageNo,pageSize,totalCount,empVos);
        m.addAttribute("pb2",pageBean);
        return "emplist";
    }


    /***
     * 修改员工的信息；
     * @param id
     * @param m
     * @return
     */
    @RequestMapping("/empUpdate/{id}")
    public String empUpdate(@PathVariable("id") Integer id,Model m){
        System.out.println("尖："+ id);
        Emp emp = empService.queryEmpById(id);
        List<Depart> departs = departService.queryAllDepartalls();
        m.addAttribute("departs",departs);
        m.addAttribute("emp",emp);
        return "empupdate";
    }


    /***
     * 修改员工信息；
     * @param e
     * @return
     */
    @ResponseBody
    @RequestMapping("/empUpdate")
    public Message empUpdate(Emp e){
        Message message = null;
        System.out.println(e);
        boolean flag = empService.updateEmpById(e);
        if(flag){
            message = new Message(0,"修改成功！");
        }else{
            message = new Message(500,"修改失败！");
        }
        return message;
    }


    /***
     * 删除员工，其本质是进行更新；
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping("/delEmpById")
    public Message delEmpById(@RequestParam("id")Integer id){
        System.out.println("要删除的id: "+id);
        Message message = null;
        boolean flag = empService.deleteEmpById(id);
        if(flag){
            message = new Message(0,"删除成功！");
        }else{
            message = new Message(500,"删除失败！");
        }
        return message;
    }



}
