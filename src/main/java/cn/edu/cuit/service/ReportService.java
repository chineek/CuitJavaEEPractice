package cn.edu.cuit.service;

import cn.edu.cuit.VO.AccountMonthReport;
import cn.edu.cuit.VO.DateRange;
import cn.edu.cuit.entity.User;

/**
 * author: Chineek
 * date: 2019/7/16.
 */
public interface ReportService {
    public AccountMonthReport getMonthReportByDateRange(User user, DateRange dateRange);
}
