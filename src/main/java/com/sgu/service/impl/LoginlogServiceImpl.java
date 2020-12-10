package com.sgu.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.sgu.domain.Loginlog;
import com.sgu.mapper.LoginlogMapper;
import com.sgu.service.LoginlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @author huang
 * @date 2020/12/1 15:26
 */
@Service
public class LoginlogServiceImpl implements LoginlogService {

    @Autowired
    private LoginlogMapper loginlogMapper;

    @Override
    public boolean addLoginLog(Loginlog loginlog) {
        boolean flag = false;
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        loginlog.setCreatetime(df.format(new Date()));
        Integer insert = loginlogMapper.insert(loginlog);
        if (insert > 0){
            flag = true;
        }
        return flag;
    }


    @Override
    public List<Loginlog> queryLogBylast_no(String no) {
        List<Loginlog> list = loginlogMapper.selectList(new EntityWrapper<Loginlog>()
                .eq("no", no)
                .orderBy("id")
                .last("desc limit 0,10")
        );
        return list;
    }
}
