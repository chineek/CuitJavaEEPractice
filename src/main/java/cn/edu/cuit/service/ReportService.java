package cn.edu.cuit.service;

import cn.edu.cuit.VO.AccountReport;
import cn.edu.cuit.VO.AccountYearReport;
import cn.edu.cuit.VO.DateRange;
import cn.edu.cuit.entity.User;

/**
 * author: Chineek
 * date: 2019/7/16.
 */
public interface ReportService {
    public AccountReport getMonthReportByDateRange(User user, DateRange dateRange);
    public AccountYearReport getYearReportByDateRange(User user, DateRange dateRange);
}
