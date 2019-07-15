package cn.edu.cuit.service.impl;

import cn.edu.cuit.VO.AccountCombination;
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

    /**
     * 封装查询条件的Example
     * @param accountCombination 查询条件
     * @return 查询条件的Example
     */
    private AccountExample getAccountExampleByAccountCombination(
            AccountCombination accountCombination) {
        AccountExample ae = new AccountExample();
        AccountExample.Criteria aeCriteria = ae.createCriteria();
        aeCriteria.andUidEqualTo(accountCombination.getUid());
        ae.setOrderByClause("acid asc");
        return ae;
    }

    /**
     * 根据条件获得账目列表（账单）
     * @param accountCombination 查询条件
     * @return 账目列表
     */
    @Override
    public List getAccountByCombination(
            AccountCombination accountCombination) {
        RowBounds rowBounds =
                new RowBounds((accountCombination.getPage() - 1) * accountCombination.getLimit(),
                        accountCombination.getLimit());
        AccountExample ae = getAccountExampleByAccountCombination(accountCombination);
        return (List<Account>) accountMapper.selectByExampleWithRowbounds(ae, rowBounds);
    }

    /**
     * 获取符合条件的账目列表中的数目
     * @param accountCombination 条件
     * @return 条数
     */
    @Override
    public int getAccountCountByCombination(
            AccountCombination accountCombination) {
        AccountExample ae =
                getAccountExampleByAccountCombination(accountCombination);
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
