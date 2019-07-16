package cn.edu.cuit.VO.status;

import cn.edu.cuit.VO.ListStatus;
import cn.edu.cuit.entity.AccountType;

import java.util.List;

public class AccountTypeListStatus extends ListStatus {
    private  List<AccountType> data;

    public List<AccountType> getData() {
        return data;
    }

    public void setData(List<AccountType> data) {
        this.data = data;
    }
}
