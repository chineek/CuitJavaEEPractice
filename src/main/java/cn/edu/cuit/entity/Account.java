package cn.edu.cuit.entity;

import java.util.Date;

public class Account {
    private Integer acid;

    private Integer tid;

    private Integer uid;

    private Integer ietype;

    private Date date;

    private Long amount;

    private String remarks;

    private Integer isExpose;

    private Integer isAvaliable;

    public Integer getAcid() {
        return acid;
    }

    public void setAcid(Integer acid) {
        this.acid = acid;
    }

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getIetype() {
        return ietype;
    }

    public void setIetype(Integer ietype) {
        this.ietype = ietype;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Long getAmount() {
        return amount;
    }

    public void setAmount(Long amount) {
        this.amount = amount;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
    }

    public Integer getIsExpose() {
        return isExpose;
    }

    public void setIsExpose(Integer isExpose) {
        this.isExpose = isExpose;
    }

    public Integer getIsAvaliable() {
        return isAvaliable;
    }

    public void setIsAvaliable(Integer isAvaliable) {
        this.isAvaliable = isAvaliable;
    }
}