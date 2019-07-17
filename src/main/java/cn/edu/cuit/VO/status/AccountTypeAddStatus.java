package cn.edu.cuit.VO.status;

import cn.edu.cuit.VO.Status;
import cn.edu.cuit.entity.AccountType;

public class AccountTypeAddStatus extends Status {
    private Integer tid;
    private String name;
    private String description;
    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    @Override
    public String toString() {
        return "AccountTypeAddStatus{" +
                "info='" + info + '\'' +
                ", code=" + code +
                ", tid=" + tid +
                ", name=" + name +
                ", description=" + description +
                '}';
    }


}
