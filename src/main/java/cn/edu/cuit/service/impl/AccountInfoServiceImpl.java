package cn.edu.cuit.service.impl;

import cn.edu.cuit.dao.AccountMapper;
import cn.edu.cuit.dao.AccountTypeMapper;
import cn.edu.cuit.entity.Account;
import cn.edu.cuit.entity.AccountType;
import cn.edu.cuit.entity.AccountTypeExample;
import cn.edu.cuit.service.AccountInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * author: llj
 * date: 2019/7/13.
 */
@Service
public class AccountInfoServiceImpl implements AccountInfoService {
    @Autowired
    AccountMapper accountMapper;

    @Autowired
    AccountTypeMapper accountTypeMapper;

    @Override
    public Account queryAccountInfoById(int acid) {
        Account account = accountMapper.selectByPrimaryKey(acid);
        return account;
    }

    @Override
    public int addAccount(Account account) {
        int result = accountMapper.insertSelective(account);
        return result;
    }

    @Override
    public int modifyAccount(Account account) {
        int result = accountMapper.updateByPrimaryKey(account);
        return result;
    }

    @Override
    public String queryAccountTypeById(int type) {
        AccountType at = accountTypeMapper.selectByPrimaryKey(type);
        String name = at.getName();
        return name;
    }

    @Override
    public int deleteAccount(int acid) {
        int result = accountMapper.deleteByPrimaryKey(acid);
        return result;
    }

    @Override
    public List<AccountType> queryAccountType(){
        AccountTypeExample example = new AccountTypeExample();
        List<AccountType> list = accountTypeMapper.selectByExample(example);
        return list;
    }


}
