package cn.edu.cuit.service.impl;

import cn.edu.cuit.VO.*;
import cn.edu.cuit.dao.AccountMapper;
import cn.edu.cuit.dao.AccountTypeMapper;
import cn.edu.cuit.entity.*;
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
    @Autowired
    private AccountTypeMapper accountTypeMapper;


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

        static void addAccountTypeSumToList(List<AccountTypeSum> list, String name, Double value) {
            AccountTypeSum accountTypeSum = new AccountTypeSum();
            accountTypeSum.setName(name);
            accountTypeSum.setValue(value);
            list.add(accountTypeSum);
        }
    }

    @Override
    public AccountReport getMonthReportByDateRange(User user, DateRange dateRange) {
        // 封装数据对象
        AccountReport accountReport = new AccountReport();
        AccountMonthReport accountMonthReport = new AccountMonthReport();
        AccountMonthTypeReport accountMonthTypeReport = new AccountMonthTypeReport();
        // 获得账单数据
        AccountExample accountExample = new AccountExample();
        AccountExample.Criteria accountCriteria = accountExample.createCriteria();
        accountCriteria.andUidEqualTo(user.getUid());
        if (dateRange != null) {
            accountCriteria.andDateBetween(dateRange.getStartDate(), dateRange.getEndDate());
        }
        List<Account> accountList = accountMapper.selectByExample(accountExample);
        // 获得类型列表
        AccountTypeExample accountTypeExample = new AccountTypeExample();
        List<AccountType> accountTypes = accountTypeMapper.selectByExample(accountTypeExample);
        /* ======封装月度数据====== */
        Map<String, Double> amountMonthIncomeMap = new HashMap<>();
        Map<String, Double> amountMonthExpensesMap = new HashMap<>();
        Map<String, Double> typeMonthIncomeMap = new HashMap<>();
        Map<String, Double> typeMonthExpensesMap = new HashMap<>();
        SimpleDateFormat sdf = new SimpleDateFormat("MM-dd");
        for (Account account : accountList) {
            String monthDate = sdf.format(account.getDate());
            switch (account.getIetype()) {
                case 0:
                    amountMonthIncomeMap = ReportUtil.addAmountToTotal(amountMonthIncomeMap, monthDate, (double) account.getAmount());
                    typeMonthIncomeMap = ReportUtil.addAmountToTotal(typeMonthIncomeMap, account.getTid() + "", (double) account.getAmount());
                    break;
                case 1:
                    amountMonthExpensesMap = ReportUtil.addAmountToTotal(amountMonthExpensesMap, monthDate, (double) account.getAmount());
                    typeMonthExpensesMap = ReportUtil.addAmountToTotal(typeMonthExpensesMap, account.getTid() + "", (double) account.getAmount());
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
        // 将数据降维
        for (calendar.setTime(dateRange.getStartDate());
             calendar.getTime().getTime() <= dateRange.getEndDate().getTime();
             calendar.add(Calendar.DAY_OF_MONTH, 1)) {
            String monthDate = sdf.format(calendar.getTime());
            dateList.add(monthDate);
            if (amountMonthIncomeMap.get(monthDate) == null) amountMonthIncomeMap.put(monthDate, 0.0);
            if (amountMonthExpensesMap.get(monthDate) == null) amountMonthExpensesMap.put(monthDate, 0.0);
            incomeNum.add(amountMonthIncomeMap.get(monthDate));
            expensesNum.add(amountMonthExpensesMap.get(monthDate));
            sum += amountMonthIncomeMap.get(monthDate) - amountMonthExpensesMap.get(monthDate);
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
        accountReport.setAccountMonthReport(accountMonthReport);
        /* ======封装月度数据结束====== */
        /* ======封装月度类型数据====== */
        List<String> dataNameCollections = Arrays.asList("收入类型", "支出类型");
        List<String> dataNameList = new ArrayList<String>();
        dataNameList.addAll(dataNameCollections);
        accountMonthTypeReport.setDataNameList(dataNameList);
        // 映射账单类型
        Map<String, String> accountTypeMap = new HashMap<>();
        for (AccountType accountType : accountTypes) {
            accountTypeMap.put(accountType.getTid() + "", accountType.getName());
        }
        List<AccountTypeSum> typeMonthIncomeData = new ArrayList<>();
        List<AccountTypeSum> typeMonthExpensesData = new ArrayList<>();
        for (String key : typeMonthIncomeMap.keySet()) {
            ReportUtil.addAccountTypeSumToList(typeMonthIncomeData, accountTypeMap.get(key), typeMonthIncomeMap.get(key));
        }
        for (String key : typeMonthExpensesMap.keySet()) {
            ReportUtil.addAccountTypeSumToList(typeMonthExpensesData, accountTypeMap.get(key), typeMonthExpensesMap.get(key));
        }
        List<List<AccountTypeSum>> typeNumList = new ArrayList<>();
        typeNumList.add(typeMonthIncomeData);
        typeNumList.add(typeMonthExpensesData);
        accountMonthTypeReport.setTypeNum(typeNumList);
        accountReport.setAccountMonthTypeReport(accountMonthTypeReport);
        /* ======封装月度类型结束====== */
        return accountReport;
    }

}
