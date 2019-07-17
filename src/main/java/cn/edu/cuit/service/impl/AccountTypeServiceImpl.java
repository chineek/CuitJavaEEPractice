package cn.edu.cuit.service.impl;

import cn.edu.cuit.dao.AccountTypeMapper;
import cn.edu.cuit.entity.AccountType;
import cn.edu.cuit.entity.AccountTypeExample;
import cn.edu.cuit.service.AccountTypeService;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AccountTypeServiceImpl implements AccountTypeService {
    @Autowired
    AccountTypeMapper ATMapper;

    @Override
    public void addAccountType(String name, String description) {
        AccountType accountType = new AccountType();
        accountType.setName(name);
        accountType.setDescription(description);
        ATMapper.insert(accountType);
    }

    @Override
    public List getAccountType(Integer page, Integer limit) {
        AccountTypeExample ATE = new AccountTypeExample();
        ATE.setOrderByClause("tid asc");
        System.out.print(ATMapper.selectByExample(ATE));
        RowBounds rowBounds = new RowBounds((page - 1) * limit, limit);
        return ATMapper.selectByExampleWithRowbounds(ATE, rowBounds);
    }

    @Override
    public int getAccountTypeCount() {
        AccountTypeExample ATE = new AccountTypeExample();
        return (int) ATMapper.countByExample(ATE);
    }

    @Override
    public void deleteAccountType(Integer tid) {
        ATMapper.deleteByPrimaryKey(tid);
    }

    @Override
    public void updateAccountType(Integer tid, String name, String description) {
        AccountType accountType = new AccountType();
        accountType.setTid(tid);
        accountType.setName(name);
        accountType.setDescription(description);
        ATMapper.updateByPrimaryKey(accountType);
    }
}
