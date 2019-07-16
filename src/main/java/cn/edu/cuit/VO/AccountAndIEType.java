package cn.edu.cuit.VO;

import java.util.Date;

public class AccountAndIEType {
    private Integer acid;
    private Integer ietype;
    private Date date;
    private Long amount;
    private String remarks;
    private Integer isExpose;
    private String typeName;

    public Integer getAcid() {
        return acid;
    }

    public void setAcid(Integer acid) {
        this.acid = acid;
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
        this.remarks = remarks;
    }

    public Integer getIsExpose() {
        return isExpose;
    }

    public void setIsExpose(Integer isExpose) {
        this.isExpose = isExpose;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }
}
