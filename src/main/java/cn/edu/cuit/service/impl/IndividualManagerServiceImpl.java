package cn.edu.cuit.service.impl;

import cn.edu.cuit.VO.AccountAndDepositVo;
import cn.edu.cuit.dao.AccountMapper;
import cn.edu.cuit.dao.DepositMapper;
import cn.edu.cuit.dao.UserMapper;
import cn.edu.cuit.entity.Account;
import cn.edu.cuit.entity.AccountExample;
import cn.edu.cuit.entity.Deposit;
import cn.edu.cuit.entity.DepositExample;
import cn.edu.cuit.service.IndividualManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: ty
 * @Date: 2019/7/16 21:35
 */
@Service
public class IndividualManagerServiceImpl implements IndividualManagerService {
    @Autowired
    UserMapper userMapper;
    @Autowired
    DepositMapper depositMapper;
    @Autowired
    AccountMapper accountMapper;

    @Override
    public AccountAndDepositVo getIndividualState(int uid) {
        AccountAndDepositVo adv=new AccountAndDepositVo();
        AccountExample ae=new AccountExample();
        AccountExample.Criteria aeCriteria=ae.createCriteria();
        DepositExample de=new DepositExample();
        DepositExample.Criteria deCriteria=de.createCriteria();
        deCriteria.andUidEqualTo(uid);
        deCriteria.andIsCompleteEqualTo(0);
        Deposit deposit=depositMapper.selectByExample(de).get(0);//当前进行的存款目标
        adv.setUid(uid);
        adv.setStartDate(deposit.getStartDate());
        adv.setEndDate(deposit.getEndDate());
        adv.setGoal(deposit.getAmount());
        aeCriteria.andUidEqualTo(uid);
        aeCriteria.andIetypeEqualTo(0);
        aeCriteria.andDateBetween(deposit.getStartDate(),deposit.getEndDate());
        List<Account> accounts=accountMapper.selectByExample(ae);//当前目标时间内的账目
        Integer sum=0;
        for(int i=0;i<accounts.size();i++){
            sum+=accounts.get(i).getAmount().intValue();
        }
        adv.setComplete(sum);

        return adv;
    }
}
