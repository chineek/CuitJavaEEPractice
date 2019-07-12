package cn.edu.cuit.VO;

import cn.edu.cuit.entity.Account;
import cn.edu.cuit.entity.User;

/**
 * author: 35024
 * date: 2019/7/12.
 */
public class UserAndAccountVO {
    private User user;

    private Account account;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    @Override
    public String toString() {
        return "userAndAccountVO{" +
                "user={" + user.toString() +
                "}, account={" + account.toString() + '}' +
                '}';
    }
}
