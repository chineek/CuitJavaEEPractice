package cn.edu.cuit.service;

import cn.edu.cuit.VO.AccountCombination;

import java.util.Date;
import java.util.List;

/**
 * @Author: yzh
 * @Date: 2019/7/14 10:38
 */
public interface AccountService {

    //根据用户ID得到用户的全部账单信息
    public List getAccountByCombination(AccountCombination accountCombination);

    // 得到用户账户列表的数量
    public int getAccountCountByCombination(AccountCombination accountCombination);


}
