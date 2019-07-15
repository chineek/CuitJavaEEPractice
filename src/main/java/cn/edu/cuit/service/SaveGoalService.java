package cn.edu.cuit.service;

import cn.edu.cuit.entity.Deposit;

import java.util.List;

/**
 * @Author: ty
 * @Date: 2019/7/14 14:59
 */
public interface SaveGoalService {
    public boolean addSaveGoal(Deposit savegoal);

    public List getAllUser();

}
