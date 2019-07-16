package cn.edu.cuit.VO;

import cn.edu.cuit.entity.User;

/**
 * Created by a on 2019/7/15.
 */
public class UserListCombination {
    private int limit;
    private int page;
    private User user;

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
