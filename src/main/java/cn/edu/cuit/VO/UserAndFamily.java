package cn.edu.cuit.VO;

import cn.edu.cuit.entity.Family;
import cn.edu.cuit.entity.User;

/**
 * author: 35024
 * date: 2019/7/12.
 */
public class UserAndFamily {
    private User user;
    private Family family;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Family getFamily() {
        return family;
    }

    public void setFamily(Family family) {
        this.family = family;
    }

    @Override
    public String toString() {
        return "UserAndFamily{" +
                "user=" + user +
                ", family=" + family +
                '}';
    }
}
