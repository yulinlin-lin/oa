package com.sgu.service;

import com.sgu.domain.Loginlog;

import java.util.List;

/**
 * @author huang
 * @date 2020/12/1 15:26
 */
public interface LoginlogService {
    boolean addLoginLog(Loginlog loginlog);

//    根据用户名，来查询登录日志的信息；
    List<Loginlog> queryLogBylast_no(String no);
}
