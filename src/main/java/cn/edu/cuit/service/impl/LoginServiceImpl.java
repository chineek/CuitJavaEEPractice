package cn.edu.cuit.service.impl;

import cn.edu.cuit.VO.UserAndFamily;
import cn.edu.cuit.dao.FamilyMapper;
import cn.edu.cuit.dao.UserMapper;
import cn.edu.cuit.entity.Family;
import cn.edu.cuit.entity.User;
import cn.edu.cuit.entity.UserExample;
import cn.edu.cuit.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * author: 35024
 * date: 2019/7/12.
 */
@Service
public class LoginServiceImpl implements LoginService {
    @Autowired
    UserMapper userMapper;
    @Autowired
    FamilyMapper familyMapper;

    @Override
    public User getUserByUsernameAndPassword(User user) {
        UserExample ue = new UserExample();
        UserExample.Criteria ueCriteria = ue.createCriteria();
        // 判断输入的是手机号还是用户名
        if (user.getName() != null || !"".equals(user.getName()))
            ueCriteria.andNameEqualTo(user.getName());
        else
            ueCriteria.andPhoneEqualTo(user.getName());
        ueCriteria.andPasswordEqualTo(user.getPassword());
        List<User> users = userMapper.selectByExample(ue);
        return (users.size() >= 1) ? users.get(0) : null;
    }

    @Override
    public User getUserByUsername(String name) {
        UserExample ue = new UserExample();
        UserExample.Criteria ueCriteria = ue.createCriteria();
        ueCriteria.andNameEqualTo(name);
        List<User> users = userMapper.selectByExample(ue);
        return (users.size() >= 1) ? users.get(0) : null;
    }

    public boolean addUserAndFamily(UserAndFamily userAndFamily) {
        int res = userMapper.insert(userAndFamily.getUser());
        // 获取刚刚插入的用户的UID
        User user = getUserByUsernameAndPassword(userAndFamily.getUser());
        Family family = userAndFamily.getFamily();
        family.setUid(user.getUid());
        res += familyMapper.insert(family);
        return res > 1;
    }
}
