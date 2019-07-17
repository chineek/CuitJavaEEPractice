package cn.edu.cuit.service;


import cn.edu.cuit.VO.AccountAndDepositVo;
import cn.edu.cuit.VO.SaveGoalCombination;

import java.util.List;

/**
 * @Author: ty
 * @Date: 2019/7/16 21:25
 */
public interface IndividualManagerService {
  //个人当前存款情况
  public AccountAndDepositVo getIndividualState(int uid);
  //个人历史存款目标
  public List getHistoryGoal(SaveGoalCombination saveGoalCombination);
  //历史存款目标数量
  public int getCountHistoryGoal(SaveGoalCombination saveGoalCombination);
  //取消当前目标
  public boolean cancelGoal(int uid);
  //提前完成目标
  public boolean finishGoal(int uid);


}
