package cn.edu.cuit.VO;

import cn.edu.cuit.entity.Deposit;

/**
 * @Author: ty
 * @Date: 2019/7/17 9:20
 */
public class SaveGoalCombination {
    private int limit;
    private int page;
    private Deposit deposit;

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

    public Deposit getDeposit() {
        return deposit;
    }

    public void setDeposit(Deposit deposit) {
        this.deposit = deposit;
    }
}

