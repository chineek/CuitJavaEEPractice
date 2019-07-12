package cn.edu.cuit.service.impl;

import cn.edu.cuit.dao.UserMapper;
import cn.edu.cuit.entity.UserExample;
import cn.edu.cuit.service.DemoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * author: 35024
 * date: 2019/7/12.
 */
@Service
public class DemoServiceImpl implements DemoService {
    @Autowired
    UserMapper userMapper;

    @Override
    public List getUserByName(String name) {
        UserExample ue = new UserExample();
        UserExample.Criteria ueCriteria = ue.createCriteria();
        ueCriteria.andNameLike("%" + name + "%");
        ue.setOrderByClause("name asc");
        return userMapper.selectByExample(ue);
    }
}
