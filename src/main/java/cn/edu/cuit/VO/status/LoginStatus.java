package cn.edu.cuit.VO.status;

import cn.edu.cuit.VO.Status;
import cn.edu.cuit.entity.User;

/**
 * author: 35024
 * date: 2019/7/12.
 */
public class LoginStatus extends Status {
    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "LoginStatus{" +
                "info='" + info + '\'' +
                ", code=" + code +
                ", user=" + user +
                '}';
    }
}
