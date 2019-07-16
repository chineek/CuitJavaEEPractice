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
    private Date date;
    private Integer auid;

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

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Integer getAuid() {
        return auid;
    }

    public void setAuid(Integer auid) {
        this.auid = auid;
    }
}
