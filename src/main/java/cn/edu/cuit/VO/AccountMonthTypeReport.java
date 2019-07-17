package cn.edu.cuit.VO;

import java.util.List;
import java.util.Map;

/**
 * author: chineek
 * date: 2019/7/17.
 */
public class AccountMonthTypeReport {
    private List<String> dataNameList;
    private List<List<AccountTypeSum>> typeNum;

    public List<String> getDataNameList() {
        return dataNameList;
    }

    public void setDataNameList(List<String> dataNameList) {
        this.dataNameList = dataNameList;
    }

    public List<List<AccountTypeSum>> getTypeNum() {
        return typeNum;
    }

    public void setTypeNum(List<List<AccountTypeSum>> typeNum) {
        this.typeNum = typeNum;
    }

    @Override
    public String toString() {
        return "AccountMonthTypeReport{\n" +
                "dateList=\n" + dataNameList +
                "\n, typeNum=\n" + typeNum +
                '}';
    }
}
