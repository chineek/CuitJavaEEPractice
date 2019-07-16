package cn.edu.cuit.VO;

import java.util.Date;

/**
 * @Author: ty
 * @Date: 2019/7/16 21:41
 */
public class AccountAndDepositVo {
    private Integer uid;

    private Date startDate;

    private Date endDate;

    private Long Goal;

    private Integer complete;

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public Long getGoal() {
        return Goal;
    }

    public void setGoal(Long goal) {
        Goal = goal;
    }

    public Integer getComplete() {
        return complete;
    }

    public void setComplete(Integer complete) {
        this.complete = complete;
    }

    @Override
    public String toString() {
        return "AccountAndDepositVo{" +
                "uid=" + uid +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                ", Goal=" + Goal +
                ", complete=" + complete +
                '}';
    }
}
