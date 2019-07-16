package cn.edu.cuit.service;

import cn.edu.cuit.entity.Spending;

/**
 * @Author: ty
 * @Date: 2019/7/15 16:29
 */
public interface LineOfLimitService {
    public boolean addLimit(Spending limit);
}
