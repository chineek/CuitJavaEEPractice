package cn.edu.cuit.service.impl;

import cn.edu.cuit.dao.SpendingMapper;
import cn.edu.cuit.entity.Spending;
import cn.edu.cuit.service.LineOfLimitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Author: ty
 * @Date: 2019/7/15 16:31
 */
@Service
public class LineOfLimitServiceImpl implements LineOfLimitService {
    @Autowired
    SpendingMapper spendingMapper;

    @Override
    public boolean addLimit(Spending limit) {
        int rs=spendingMapper.insert(limit);
        return rs>1;
    }
}
