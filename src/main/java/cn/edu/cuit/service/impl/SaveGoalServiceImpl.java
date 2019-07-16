package cn.edu.cuit.service.impl;

import cn.edu.cuit.dao.DepositMapper;
import cn.edu.cuit.dao.FamilyMapper;
import cn.edu.cuit.dao.UserMapper;
import cn.edu.cuit.entity.Deposit;
import cn.edu.cuit.entity.FamilyExample;
import cn.edu.cuit.entity.User;
import cn.edu.cuit.entity.UserExample;
import cn.edu.cuit.service.SaveGoalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: ty
 * @Date: 2019/7/14 14:59
 */
@Service
public class SaveGoalServiceImpl implements SaveGoalService {
    @Autowired
    DepositMapper depositMapper;
    @Autowired
    FamilyMapper familyMapper;
    @Autowired
    UserMapper userMapper;
    @Override
    //设置存款目标
    public boolean addSaveGoal(Deposit savegoal) {
        if(savegoal.getRemarks()==""||savegoal.getRemarks()==null){
            savegoal.setRemarks("无");
        }
        int rs=depositMapper.insert(savegoal);
        return rs>1;
    }

   //查询家庭成员
    @Override
    public List getAllUser(int uid) {
        UserExample ueByUid=new UserExample();
        UserExample.Criteria uebCriteria=ueByUid.createCriteria();
        uebCriteria.andUidEqualTo(uid);
        int fid=userMapper.selectByExample(ueByUid).get(0).getFid();

        UserExample ueByFid=new UserExample();
        UserExample.Criteria uefCriteria=ueByFid.createCriteria();
        uefCriteria.andFidEqualTo(fid);
        uefCriteria.andIsAvaliableEqualTo(1);
        List<User> userList=userMapper.selectByExample(ueByFid);
        return userList;
    }
}
