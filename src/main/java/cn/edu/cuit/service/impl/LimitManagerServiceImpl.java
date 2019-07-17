package cn.edu.cuit.service.impl;

import cn.edu.cuit.VO.UserAndSpendingVO;
import cn.edu.cuit.dao.AccountMapper;
import cn.edu.cuit.dao.SpendingMapper;
import cn.edu.cuit.dao.UserMapper;
import cn.edu.cuit.entity.*;
import cn.edu.cuit.service.LimitManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author: ty
 * @Date: 2019/7/16 15:44
 */
@Service
public class LimitManagerServiceImpl implements LimitManagerService {
    @Autowired
    UserMapper userMapper;
    @Autowired
    SpendingMapper spendingMapper;
    @Autowired
    AccountMapper accountMapper;

    //额度使用情况
    @Override
    public List getAllLimit(int uid,Integer page,Integer limit) {
        List<UserAndSpendingVO> usList=new ArrayList<UserAndSpendingVO>();
        //获取家庭成员列表
        UserExample ueByUid=new UserExample();
        UserExample.Criteria uebCriteria=ueByUid.createCriteria();
        uebCriteria.andUidEqualTo(uid);
        int fid=userMapper.selectByExample(ueByUid).get(0).getFid();

        UserExample ueByFid=new UserExample();
        UserExample.Criteria uefCriteria=ueByFid.createCriteria();
        uefCriteria.andFidEqualTo(fid);
        uefCriteria.andIsAvaliableEqualTo(1);
        List<User> userList=userMapper.selectByExample(ueByFid);

        //
        SpendingExample se=new SpendingExample();
        SpendingExample.Criteria seCriteria=se.createCriteria();
        AccountExample ae=new AccountExample();
        AccountExample.Criteria aeCriteria=ae.createCriteria();

        for(int i=0;i<userList.size();i++){
            UserAndSpendingVO us=new UserAndSpendingVO();
            seCriteria.andUidEqualTo(userList.get(i).getUid());
            Spending spending=spendingMapper.selectByExample(se).get(0);
            aeCriteria.andUidEqualTo(userList.get(i).getUid());
            aeCriteria.andDateBetween(spending.getStartDate(),spending.getEndDate());





        }



        return null;
    }
}
