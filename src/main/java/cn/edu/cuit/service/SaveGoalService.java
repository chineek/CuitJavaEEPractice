package cn.edu.cuit.service;

import cn.edu.cuit.entity.Deposit;

import java.util.List;

/**
 * @Author: ty
 * @Date: 2019/7/14 14:59
 */
public interface SaveGoalService {

    //判断是否存在进行的目标
    public Integer isRun(int uid);

    //添加存款目标
    public boolean addSaveGoal(Deposit savegoal);

    //获取家庭所有成员
    public List getAllUser(int uid);

}
