package cn.edu.cuit.VO;

import java.util.Date;

/**
 * @Author: ty
 * @Date: 2019/7/16 21:41
 */
public class AccountAndDepositVo {
    private Integer uid;

    private Integer auid;

    private Date startDate;

    private Date endDate;

    private Long goal;

    private Integer complete;

    private String remarks;

    public Long getGoal() {
        return goal;
    }

    public void setGoal(Long goal) {
        this.goal = goal;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public Integer getAuid() {
        return auid;
    }

    public void setAuid(Integer auid) {
        this.auid = auid;
    }

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
                ", auid=" + auid +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                ", goal=" + goal +
                ", complete=" + complete +
                ", remarks='" + remarks + '\'' +
                '}';
    }
}
