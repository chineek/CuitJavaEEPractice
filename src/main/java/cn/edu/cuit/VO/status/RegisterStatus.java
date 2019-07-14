package cn.edu.cuit.VO.status;

import cn.edu.cuit.VO.Status;
import cn.edu.cuit.entity.Family;
import cn.edu.cuit.entity.User;

/**
 * author: 35024
 * date: 2019/7/12.
 */
public class RegisterStatus extends Status {
    private Family family;
    private User user;

    public Family getFamily() {
        return family;
    }

    public void setFamily(Family family) {
        this.family = family;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "RegisterStatus{" +
                "info='" + info + '\'' +
                ", code=" + code +
                ", family=" + family +
                ", user=" + user +
                '}';
    }
}
