package cn.edu.cuit.service.impl;

/**
 * Created by a on 2019/7/14.
 */

import java.util.List;

import cn.edu.cuit.VO.UserListCombination;
import cn.edu.cuit.dao.UserMapper;
import cn.edu.cuit.entity.User;
import cn.edu.cuit.entity.UserExample;
import cn.edu.cuit.service.UserService;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;

    @Override
    public void add(User u) {
        userMapper.insert(u);
    }

    @Override
    public void delete(int uid) {
        userMapper.deleteByPrimaryKey(uid);
    }

    @Override
    public void update(User u) {
        userMapper.updateByPrimaryKeySelective(u);
    }

    @Override
    public User get(int uid) {
        return userMapper.selectByPrimaryKey(uid);
    }

    @Override
    public List<User> list(UserListCombination userListCombination,int fid) {
        UserExample ue = new UserExample();
        RowBounds rowBounds = new RowBounds((userListCombination.getPage() - 1) * userListCombination.getLimit(), userListCombination.getLimit());
        ue.createCriteria().andFidEqualTo(fid);
        ue.setOrderByClause("fid desc");
        List<User> users = userMapper.selectByExampleWithRowbounds(ue, rowBounds);
        // 清空密码后返回前端
        for (User user : users) {
            user.setPassword("");
        }
        return users;
    }

    @Override
    public List<User> list(int uid) {
        UserExample ue = new UserExample();
        ue.createCriteria().andUidEqualTo(uid);
        ue.setOrderByClause("uid desc");
        return userMapper.selectByExample(ue);
    }

    @Override
    public boolean isExists(String name) {
        UserExample example = new UserExample();
        example.createCriteria().andNameEqualTo(name);
        List<User> result = userMapper.selectByExample(example);
        if (!result.isEmpty())
            return true;
        return false;
    }

    @Override
    public User get(String name, String password) {
        UserExample example = new UserExample();
        example.createCriteria().andNameEqualTo(name).andPasswordEqualTo(password);
        List<User> result = userMapper.selectByExample(example);
        if (result.isEmpty())
            return null;
        return result.get(0);
    }

    @Override
    public int getCountByUser(int fid) {
        UserExample ue = new UserExample();
        ue.createCriteria().andFidEqualTo(fid);
        return (int) userMapper.countByExample(ue);
    }
}
