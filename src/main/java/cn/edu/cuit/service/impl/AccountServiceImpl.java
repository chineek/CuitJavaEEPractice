package cn.edu.cuit.service.impl;

import cn.edu.cuit.dao.AccountMapper;
import cn.edu.cuit.entity.Account;
import cn.edu.cuit.entity.AccountExample;
import cn.edu.cuit.service.AccountService;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @Author: yzh
 * @Date: 2019/7/14 10:39
 */
@Service
public class AccountServiceImpl implements AccountService {
    @Autowired
    AccountMapper accountMapper;

    //获取该用户所有账单信息
    public List getAccountByUser(Integer uid, Integer page, Integer limit) {
        AccountExample ae = new AccountExample();
        AccountExample.Criteria aeCriteria = ae.createCriteria();
        RowBounds rowBounds = new RowBounds((page - 1) * limit, limit);
        aeCriteria.andUidEqualTo(uid);
        ae.setOrderByClause("acid asc");
        return (List<Account>) accountMapper.selectByExampleWithRowbounds(ae, rowBounds);

    }

    @Override
    public int getAccountCountByUid(Integer uid) {
        AccountExample ae = new AccountExample();
        AccountExample.Criteria aeCriteria = ae.createCriteria();
        aeCriteria.andUidEqualTo(uid);
        return (int) accountMapper.countByExample(ae);
    }

    //根据时间得到对应的账单信息
    public List getAccountByDate(Date date1, Date date2) {
        AccountExample ae = new AccountExample();
        AccountExample.Criteria aeCriteria = ae.createCriteria();
        aeCriteria.andDateBetween(date1, date2);
        ae.setOrderByClause("date asc");
        return accountMapper.selectByExample(ae);
    }

    //根据金额范围得到对应的账单信息
    public List getAccountByAmount(Long amount1, Long amount2) {
        AccountExample ae = new AccountExample();
        AccountExample.Criteria aeCriteria = ae.createCriteria();
        aeCriteria.andAmountBetween(amount1, amount2);
        ae.setOrderByClause("amount asc");
        return accountMapper.selectByExample(ae);
    }

    //根据账单类型得到对应的账单信息
    public List getAccountByIEType(Integer IEType) {
        AccountExample ae = new AccountExample();
        AccountExample.Criteria aeCriteria = ae.createCriteria();
        aeCriteria.andIetypeEqualTo(IEType);
        ae.setOrderByClause("amount asc");
        return accountMapper.selectByExample(ae);
    }
}
