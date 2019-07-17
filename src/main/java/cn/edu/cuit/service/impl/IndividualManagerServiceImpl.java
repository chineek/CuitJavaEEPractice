package cn.edu.cuit.service.impl;

import cn.edu.cuit.VO.AccountAndDepositVo;
import cn.edu.cuit.VO.SaveGoalCombination;
import cn.edu.cuit.dao.AccountMapper;
import cn.edu.cuit.dao.DepositMapper;
import cn.edu.cuit.dao.SpendingMapper;
import cn.edu.cuit.dao.UserMapper;
import cn.edu.cuit.entity.*;
import cn.edu.cuit.service.IndividualManagerService;
import cn.edu.cuit.service.SaveGoalService;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
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
    @Autowired
    SpendingMapper spendingMapper;

    //个人当前存款目标情况
    @Override
    public AccountAndDepositVo getIndividualState(int uid) {
        AccountAndDepositVo adv=new AccountAndDepositVo();

        AccountExample ae=new AccountExample();//收入查询
        AccountExample.Criteria aeCriteria=ae.createCriteria();

        AccountExample outae=new AccountExample();//支出查询
        AccountExample.Criteria outaeCriteria=outae.createCriteria();
        SpendingExample se=new SpendingExample();//额度查询
        SpendingExample.Criteria seCriteria=se.createCriteria();
        DepositExample de=new DepositExample();//目标查询
        DepositExample.Criteria deCriteria=de.createCriteria();
        deCriteria.andUidEqualTo(uid);
        deCriteria.andIsCompleteEqualTo(0);
        int count=(int)depositMapper.countByExample(de);
        if(count!=0){
        Deposit deposit=depositMapper.selectByExample(de).get(0);//当前进行的存款目标

            adv.setUid(uid);
            adv.setStartDate(deposit.getStartDate());
            adv.setEndDate(deposit.getEndDate());
            adv.setGoal(deposit.getAmount());
            adv.setRemarks(deposit.getRemarks());
            seCriteria.andUidEqualTo(uid);
            seCriteria.andEndDateGreaterThan(new Date());
            Spending spending=spendingMapper.selectByExample(se).get(0);//当前额度

            aeCriteria.andUidEqualTo(uid);
            aeCriteria.andIetypeEqualTo(0);
            aeCriteria.andDateBetween(deposit.getStartDate(),deposit.getEndDate());

            outaeCriteria.andUidEqualTo(uid);
            outaeCriteria.andIetypeEqualTo(1);
            outaeCriteria.andDateBetween(spending.getStartDate(),spending.getEndDate());

            List<Account> accounts=accountMapper.selectByExample(ae);//当前目标时间内的账目
            List<Account> outaccounts=accountMapper.selectByExample(outae);//当前额度时间内的账目
            Integer sum=0;
            Integer out=0;
            for(int i=0;i<accounts.size();i++){
                sum+=accounts.get(i).getAmount().intValue();
            }
            for(int i=0;i<outaccounts.size();i++){
                out+=outaccounts.get(i).getAmount().intValue();
            }
            Integer rs=sum+spending.getAmount().intValue()-out;
            adv.setComplete(rs);
            return adv;

        }else {
            return adv;
        }


    }

   //个人历史存款目标
    @Override
    public List getHistoryGoal(SaveGoalCombination saveGoalCombination) {
        DepositExample depositExample=new DepositExample();
        RowBounds rowBounds = new RowBounds((saveGoalCombination.getPage() - 1) * saveGoalCombination.getLimit(), saveGoalCombination.getLimit());
        DepositExample.Criteria deCriteria=depositExample.createCriteria();
        deCriteria.andUidEqualTo(saveGoalCombination.getUid());
        deCriteria.andIsCompleteNotEqualTo(0);
        List<Deposit> depositList=depositMapper.selectByExampleWithRowbounds(depositExample,rowBounds);
        return depositList;
    }
    //个人历史存款条数
    @Override
    public int getCountHistoryGoal(SaveGoalCombination saveGoalCombination) {
        DepositExample depositExample=new DepositExample();
        DepositExample.Criteria deCriteria=depositExample.createCriteria();
        deCriteria.andUidEqualTo(saveGoalCombination.getUid());
        deCriteria.andIsCompleteNotEqualTo(0);
       return (int)depositMapper.countByExample(depositExample);

    }
    //取消当前目标
    @Override
    public boolean cancelGoal(int uid) {
        AccountAndDepositVo adv=new AccountAndDepositVo();
        AccountExample ae=new AccountExample();
        AccountExample.Criteria aeCriteria=ae.createCriteria();
        DepositExample de=new DepositExample();
        DepositExample.Criteria deCriteria=de.createCriteria();
        deCriteria.andUidEqualTo(uid);
        deCriteria.andIsCompleteEqualTo(0);
        Deposit deposit=depositMapper.selectByExample(de).get(0);//当前进行的存款目标
        deposit.setIsComplete(2);
        int rs=depositMapper.insert(deposit);
        return rs>0;
    }
    //提前完成目标
    @Override
    public boolean finishGoal(int uid) {
        AccountAndDepositVo adv=new AccountAndDepositVo();
        AccountExample ae=new AccountExample();
        AccountExample.Criteria aeCriteria=ae.createCriteria();
        DepositExample de=new DepositExample();
        DepositExample.Criteria deCriteria=de.createCriteria();
        deCriteria.andUidEqualTo(uid);
        deCriteria.andIsCompleteEqualTo(0);
        Deposit deposit=depositMapper.selectByExample(de).get(0);//当前进行的存款目标
        deposit.setIsComplete(1);
        int rs=depositMapper.insert(deposit);
        return rs>0;
    }
}
