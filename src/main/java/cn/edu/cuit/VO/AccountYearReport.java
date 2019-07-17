package cn.edu.cuit.VO;

import java.util.List;

/**
 * author: 35024
 * date: 2019/7/17.
 */
public class AccountYearReport {
    private List<String> dataNames;
    private List<String> xAxisNames;
    private List<AccountYearSeries> seriesData;

    public List<String> getDataNames() {
        return dataNames;
    }

    public void setDataNames(List<String> dataNames) {
        this.dataNames = dataNames;
    }

    public List<String> getxAxisNames() {
        return xAxisNames;
    }

    public void setxAxisNames(List<String> xAxisNames) {
        this.xAxisNames = xAxisNames;
    }

    public List<AccountYearSeries> getSeriesData() {
        return seriesData;
    }

    public void setSeriesData(List<AccountYearSeries> seriesData) {
        this.seriesData = seriesData;
    }

    @Override
    public String toString() {
        return "AccountYearReport{" +
                "dataNames=" + dataNames +
                ", xAxisNames=" + xAxisNames +
                ", seriesData=" + seriesData +
                '}';
    }
}
