package cn.edu.cuit.VO;

import java.util.List;
import java.util.Map;

/**
 * author: 35024
 * date: 2019/7/17.
 */
public class AccountYearSeries {
    private String name;
    private String type;
    private Integer barWidth;
    private List<Double> data;
    private int isMarkLine;
    private String stack;

    public String getStack() {
        return stack;
    }

    public void setStack(String stack) {
        this.stack = stack;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getBarWidth() {
        return barWidth;
    }

    public void setBarWidth(Integer barWidth) {
        this.barWidth = barWidth;
    }

    public List<Double> getData() {
        return data;
    }

    public void setData(List<Double> data) {
        this.data = data;
    }

    public int getIsMarkLine() {
        return isMarkLine;
    }

    public void setIsMarkLine(int isMarkLine) {
        this.isMarkLine = isMarkLine;
    }
}
