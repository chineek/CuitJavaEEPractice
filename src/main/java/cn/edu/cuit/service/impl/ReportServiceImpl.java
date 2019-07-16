package cn.edu.cuit.service.impl;

import cn.edu.cuit.VO.AccountMonthReport;
import cn.edu.cuit.VO.DateRange;
import cn.edu.cuit.dao.AccountMapper;
import cn.edu.cuit.entity.Account;
import cn.edu.cuit.entity.AccountExample;
import cn.edu.cuit.entity.User;
import cn.edu.cuit.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * author: 35024
 * date: 2019/7/16.
 */
@Service
public class ReportServiceImpl implements ReportService {
    @Autowired
    private AccountMapper accountMapper;


    private static class ReportUtil {
        static Map<String, Double> addAmountToTotal(Map<String, Double> amountMouthMap, String name, Double value) {
            Double total = 0.0;
            if (amountMouthMap.get(name) != null) {
                total = amountMouthMap.get(name);
            }
            total += value;
            amountMouthMap.put(name, total);
            return amountMouthMap;
        }
    }

    @Override
    public AccountMonthReport getMonthReportByDateRange(User user, DateRange dateRange) {
        // 获得账单数据
        AccountMonthReport accountMonthReport = new AccountMonthReport();
        AccountExample accountExample = new AccountExample();
        AccountExample.Criteria accountCriteria = accountExample.createCriteria();
        accountCriteria.andUidEqualTo(user.getUid());
        if (dateRange != null) {
            accountCriteria.andDateBetween(dateRange.getStartDate(), dateRange.getEndDate());
        }
        List<Account> accountList = accountMapper.selectByExample(accountExample);
        // 封装月度数据集合
        Map<String, Double> amountMouthIncomeMap = new HashMap<>();
        Map<String, Double> amountMouthExpensesMap = new HashMap<>();
        SimpleDateFormat sdf = new SimpleDateFormat("MM-dd");
        for (Account account : accountList) {
            String monthDate = sdf.format(account.getDate());
            switch (account.getIetype()) {
                case 0:
                    amountMouthIncomeMap = ReportUtil.addAmountToTotal(amountMouthIncomeMap, monthDate, (double) account.getAmount());
                    break;
                case 1:
                    amountMouthExpensesMap = ReportUtil.addAmountToTotal(amountMouthExpensesMap, monthDate, (double) account.getAmount());
                    break;
            }
        }
        // 封装返回参数
        if (dateRange == null) {
            dateRange = new DateRange();
        }
        List<String> dateList = new ArrayList<>();
        List<Double> incomeNum = new ArrayList<>();
        List<Double> expensesNum = new ArrayList<>();
        List<Double> totalNum = new ArrayList<>();
        Calendar calendar = Calendar.getInstance();
        Double sum = 0.0;
        for (calendar.setTime(dateRange.getStartDate());
             calendar.getTime().getTime() <= dateRange.getEndDate().getTime();
             calendar.add(Calendar.DAY_OF_MONTH, 1)) {
            String monthDate = sdf.format(calendar.getTime());
            dateList.add(monthDate);
            if (amountMouthIncomeMap.get(monthDate) == null) amountMouthIncomeMap.put(monthDate, 0.0);
            if (amountMouthExpensesMap.get(monthDate) == null) amountMouthExpensesMap.put(monthDate, 0.0);
            incomeNum.add(amountMouthIncomeMap.get(monthDate));
            expensesNum.add(amountMouthExpensesMap.get(monthDate));
            sum += amountMouthIncomeMap.get(monthDate) - amountMouthExpensesMap.get(monthDate);
            totalNum.add(sum);
        }
        // 设置日期列表
        accountMonthReport.setDateList(dateList);
        // 设置展示类型列表
        List<String> typesCollection = Arrays.asList("收入", "支出", "合计");
        List<String> types = new ArrayList<>();
        types.addAll(typesCollection);
        accountMonthReport.setTypes(types);
        // 设置展示类型数据
        accountMonthReport.setTypeNum(new ArrayList<List<Double>>());
        accountMonthReport.getTypeNum().add(incomeNum);
        accountMonthReport.getTypeNum().add(expensesNum);
        accountMonthReport.getTypeNum().add(totalNum);
        return accountMonthReport;
    }
}
