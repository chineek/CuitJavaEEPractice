package cn.edu.cuit.VO;

import java.util.List;

/**
 * author: 35024
 * date: 2019/7/16.
 */
public class AccountMonthReport {
    private List<String> dateList;
    private List<String> types;
    private List<List<Double>> typeNum;

    public List<String> getDateList() {
        return dateList;
    }

    public void setDateList(List<String> dateList) {
        this.dateList = dateList;
    }

    public List<String> getTypes() {
        return types;
    }

    public void setTypes(List<String> types) {
        this.types = types;
    }

    public List<List<Double>> getTypeNum() {
        return typeNum;
    }

    public void setTypeNum(List<List<Double>> typeNum) {
        this.typeNum = typeNum;
    }

    @Override
    public String toString() {
        return "AccountMonthReport{" +
                "dateList=" + dateList +
                ", types=" + types +
                ", typeNum=" + typeNum +
                '}';
    }
}
