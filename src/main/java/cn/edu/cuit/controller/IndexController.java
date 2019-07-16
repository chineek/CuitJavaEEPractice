package cn.edu.cuit.controller;

import cn.edu.cuit.VO.AccountMonthReport;
import cn.edu.cuit.VO.DateRange;
import cn.edu.cuit.entity.User;
import cn.edu.cuit.service.ReportService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * author: 35024
 * date: 2019/7/14.
 */
@Controller
@RequestMapping("/index")
public class IndexController {
    @Autowired
    ReportService reportService;

    /**
     * @return String
     */
    @RequestMapping(value = {"/"})
    public ModelAndView toPersonalIndex(HttpSession session) throws ParseException, JsonProcessingException {
        // 设置视图名称
        ModelAndView mav = new ModelAndView();
        mav.setViewName("personalIndex");
        // 获得用户信息
        User user = (User) session.getAttribute("user");
        // 设置时间范围
        SimpleDateFormat monthDaySdf = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat monthSdf = new SimpleDateFormat("yyyy-MM");
        DateRange dateRange = new DateRange();
        Date date = new Date();
        dateRange.setEndDate(date);
        String monthStr = monthSdf.format(date);
        dateRange.setStartDate(monthDaySdf.parse(monthStr + "-01"));
        // 获得报表数据
        AccountMonthReport accountMonthReport = reportService.getMonthReportByDateRange(user, dateRange);
        // 封装报表数据
        ObjectMapper objectMapper = new ObjectMapper();
        mav.addObject("accountMonthReport", objectMapper.writeValueAsString(accountMonthReport));
        return mav;
    }

}
