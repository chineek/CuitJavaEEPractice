package cn.edu.cuit.VO;

import java.util.Date;

/**
 * @Author: ty
 * @Date: 2019/7/16 15:31
 */
public class UserAndSpendingVO {
    private Integer sid;

    private Integer uid;

    private String name;

    private Integer auid;

    private Date startDate;

    private Date endDate;

    private Long amount;

    private Integer isAvaliable;

    private Integer fid;

    private Long consumption;

    public Long getConsumption() {
        return consumption;
    }

    public void setConsumption(Long consumption) {
        this.consumption = consumption;
    }

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getAuid() {
        return auid;
    }

    public void setAuid(Integer auid) {
        this.auid = auid;
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

    public Long getAmount() {
        return amount;
    }

    public void setAmount(Long amount) {
        this.amount = amount;
    }

    public Integer getIsAvaliable() {
        return isAvaliable;
    }

    public void setIsAvaliable(Integer isAvaliable) {
        this.isAvaliable = isAvaliable;
    }

    public Integer getFid() {
        return fid;
    }

    public void setFid(Integer fid) {
        this.fid = fid;
    }

    @Override
    public String toString() {
        return "UserAndSpendingVO{" +
                "sid=" + sid +
                ", uid=" + uid +
                ", name='" + name + '\'' +
                ", auid=" + auid +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                ", amount=" + amount +
                ", isAvaliable=" + isAvaliable +
                ", fid=" + fid +
                ", consumption=" + consumption +
                '}';
    }
}
