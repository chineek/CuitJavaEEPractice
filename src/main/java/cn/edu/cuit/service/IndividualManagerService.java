package cn.edu.cuit.service;


import cn.edu.cuit.VO.AccountAndDepositVo;

/**
 * @Author: ty
 * @Date: 2019/7/16 21:25
 */
public interface IndividualManagerService {
  public AccountAndDepositVo getIndividualState(int uid);
}
