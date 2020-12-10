package com.sgu.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.sgu.domain.Major;
import com.sgu.mapper.MajorMapper;
import com.sgu.service.MajorService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
*
*
* @author huang
* @date 2020/12/5 18:13
*/
@Service
public class MajorServiceImpl extends ServiceImpl<MajorMapper,Major> implements MajorService {

    @Resource
    private MajorMapper majorMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return majorMapper.deleteByPrimaryKey(id);
    }


    @Override
    public int insertSelective(Major record) {
        return majorMapper.insertSelective(record);
    }

    @Override
    public Major selectByPrimaryKey(Integer id) {
        return majorMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(Major record) {
        return majorMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Major record) {
        return majorMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<Major> queryAllMajorsAndType() {
        return majorMapper.queryAllMajorsAndType();
    }

}
