package cn.edu.cuit.VO;

import java.util.Date;

/**
 * @Author: yzh
 * @Date: 2019/7/15 16:17
 */
public class AccountCombination {
    private Integer uid;
    private Integer limit;
    private Integer page;
    private Integer ietype;
    private Date startDate;
    private Date endDate;
    private Integer auid;
    private String remarks;

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getLimit() {
        return limit;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getIetype() {
        return ietype;
    }

    public void setIetype(Integer ietype) {
        this.ietype = ietype;
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

    public Integer getAuid() {
        return auid;
    }

    public void setAuid(Integer auid) {
        this.auid = auid;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }
}
