package cn.edu.cuit.VO.status;

import cn.edu.cuit.VO.ListStatus;
import cn.edu.cuit.entity.Account;

import java.util.List;

/**
 * @Author: yzh
 * @Date: 2019/7/15 10:45
 */
public class AccountListStatus extends ListStatus {
    private List<Account> data;

    public List<Account> getData() {
        return data;
    }

    public void setData(List<Account> data) {
        this.data = data;
    }
}
