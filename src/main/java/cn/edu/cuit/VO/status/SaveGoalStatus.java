package cn.edu.cuit.VO.status;

import cn.edu.cuit.VO.Status;
import cn.edu.cuit.entity.Deposit;

/**
 * @Author: ty
 * @Date: 2019/7/15 9:33
 */
public class SaveGoalStatus extends Status {
    private Deposit deposit;

    public Deposit getDeposit() {
        return deposit;
    }

    public void setDeposit(Deposit deposit) {
        this.deposit = deposit;
    }

    @Override
    public String toString() {
        return "SaveGoalStatus{" +
                "deposit=" + deposit +
                ", info='" + info + '\'' +
                ", code=" + code +
                '}';
    }
}
