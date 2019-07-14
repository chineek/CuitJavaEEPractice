package cn.edu.cuit.service;

import cn.edu.cuit.VO.UserAndFamily;
import cn.edu.cuit.entity.User;

/**
 * author: 35024
 * date: 2019/7/12.
 */
public interface LoginService {
    public User getUserByUsernameAndPassword(User user);

    public User getUserByUsername(String name);

    public boolean addUserAndFamily(UserAndFamily uaf);
}
