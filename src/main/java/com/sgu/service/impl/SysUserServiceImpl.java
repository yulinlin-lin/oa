package com.sgu.service.impl;

import com.sgu.domain.SysUser;
import com.sgu.mapper.SysUserMapper;
import com.sgu.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author huang
 * @date 2020/11/30 10:31
 */
@Service
public class SysUserServiceImpl implements SysUserService {

    @Autowired
    private SysUserMapper sysUserMapper;


    @Override
    public SysUser login() {
        SysUser sysUser = sysUserMapper.selectById(65);
        return sysUser;

    }
}
