package cn.edu.cuit.service;

import cn.edu.cuit.entity.Account;
import cn.edu.cuit.entity.AccountType;

import java.util.List;

/**
 * author: llj
 * date: 2019/7/13.
 */
public interface AccountInfoService {
    //查询账单详情
    public Account queryAccountInfoById(int acid);
    //添加账单
    public int addAccount(Account account);
    //修改账单
    public int modifyAccount(Account account);
    //删除账单
    public int deleteAccount(int acid);
    //查询账单类型
    public List<AccountType> queryAccountType();
    //查询对应账单Id的账单类型
    public String queryAccountTypeById(int type);
}
