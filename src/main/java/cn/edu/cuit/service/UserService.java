package cn.edu.cuit.service;

/**
 * Created by a on 2019/7/14.
 */
import cn.edu.cuit.VO.UserListCombination;
import cn.edu.cuit.entity.User;
import org.springframework.stereotype.Service;

import java.util.List;

public interface UserService {
    public int getCountByUser(int fid);
    User get(int uid);
    void add(User u);
    void delete(int uid);
    void update(User u);
    List<User> list(UserListCombination userListCombination,int fid);
    List<User> list(int uid);
    boolean isExists(String name);
    User get(String name,String password);
}
