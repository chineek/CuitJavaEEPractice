package cn.edu.cuit.service.impl;

import cn.edu.cuit.dao.DepositMapper;
import cn.edu.cuit.dao.UserMapper;
import cn.edu.cuit.entity.Deposit;
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

    @Override
    public List getAllUser() {
        UserExample ue=new UserExample();
        return userMapper.selectByExample(ue);
    }
}
