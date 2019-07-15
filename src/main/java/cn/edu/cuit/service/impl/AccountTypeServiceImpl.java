package cn.edu.cuit.service.impl;

import cn.edu.cuit.dao.AccountTypeMapper;
import cn.edu.cuit.entity.AccountType;
import cn.edu.cuit.entity.AccountTypeExample;
import cn.edu.cuit.service.AccountTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AccountTypeServiceImpl implements AccountTypeService {
    @Autowired
    AccountTypeMapper ATMapper;
    @Override
    public void addAccountType(String name,String description){
        AccountType accountType = new AccountType();
        accountType.setName(name);
        accountType.setDescription(description);
        ATMapper.insert(accountType);
    }

    @Override
    public List getAccountType() {
        AccountTypeExample ATE = new AccountTypeExample();
        ATE.setOrderByClause("tid asc");
        System.out.print(ATMapper.selectByExample(ATE));
        return ATMapper.selectByExample(ATE);
    }

    @Override
    public void deleteAccountType(Integer tid) {
        ATMapper.deleteByPrimaryKey(tid);
    }

    @Override
    public void updateAccountType(Integer tid,String name, String description) {
        AccountType accountType = new AccountType();
        accountType.setTid(tid);
        accountType.setName(name);
        accountType.setDescription(description);
        ATMapper.updateByPrimaryKey(accountType);
    }
}
