package cn.edu.cuit.service.impl;

import cn.edu.cuit.VO.*;
import cn.edu.cuit.dao.AccountMapper;
import cn.edu.cuit.dao.AccountTypeMapper;
import cn.edu.cuit.entity.*;
import cn.edu.cuit.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
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

    @Override
    public AccountYearReport getYearReportByDateRange(User user, DateRange dateRange) {
        AccountYearReport accountYearReport = new AccountYearReport();
        // 获得账单数据
        AccountExample accountExample = new AccountExample();
        AccountExample.Criteria accountCriteria = accountExample.createCriteria();
        accountCriteria.andUidEqualTo(user.getUid());
        if (dateRange != null) {
            accountCriteria.andDateBetween(dateRange.getStartDate(), dateRange.getEndDate());
        } else {
            dateRange = new DateRange();
        }
        List<Account> accountList = accountMapper.selectByExample(accountExample);
        // 获得类型列表
        AccountTypeExample accountTypeExample = new AccountTypeExample();
        List<AccountType> accountTypes = accountTypeMapper.selectByExample(accountTypeExample);
        // 首先设置基础列名
        List<String> dataNamesCollections = Arrays.asList("收入", "支出", "顺差", "逆差");
        List<String> dataNamesList = new ArrayList<String>();
        dataNamesList.addAll(dataNamesCollections);
        accountYearReport.setDataNames(dataNamesList);
        // 配置月份列表
        SimpleDateFormat monthSdf = new SimpleDateFormat("yyyy-MM");
        SimpleDateFormat dateSdf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar calendar = Calendar.getInstance();
        List<String> xAxisNamesList = new ArrayList<>();
        for (calendar.setTime(dateRange.getStartDate());
             calendar.getTime().getTime() <= dateRange.getEndDate().getTime();
             calendar.add(Calendar.MONTH, 1)) {
            String monthStr = monthSdf.format(calendar.getTime());
            xAxisNamesList.add(monthStr);
        }
        // 查询年数据
        List<Double> incomeTotalData = new ArrayList<>();
        List<Double> expensesTotalData = new ArrayList<>();
        List<Double> monthTotalData = new ArrayList<>();
        List<Map<String, Double>> typeTotalData = new ArrayList<>();
        for (String aXAxisNamesList : xAxisNamesList) {
            DateRange monthDateRange = new DateRange();
            try {
                calendar.setTime(dateSdf.parse(aXAxisNamesList + "-01"));
                monthDateRange.setStartDate(calendar.getTime());
                calendar.add(Calendar.MONTH, 1);
                monthDateRange.setEndDate(calendar.getTime());
                AccountReport monthReport = getMonthReportByDateRange(user, monthDateRange);
                // 计算月总收入
                AccountMonthReport accountMonthReport = monthReport.getAccountMonthReport();
                List<List<Double>> monthNumList = accountMonthReport.getTypeNum();
                List<Double> incomeDataList = monthNumList.get(0);
                List<Double> expensesDataList = monthNumList.get(1);
                Double incomeTotal = 0.0;
                Double expensesTotal = 0.0;
                Double monthTotal = 0.0;
                for (Double income : incomeDataList) {
                    incomeTotal += income;
                    monthTotal += income;
                }
                for (Double expenses : expensesDataList) {
                    expensesTotal -= expenses;
                    monthTotal -= expenses;
                }
                incomeTotalData.add(incomeTotal);
                expensesTotalData.add(expensesTotal);
                monthTotalData.add(monthTotal);
                // 计算各类型收支
                AccountMonthTypeReport accountMonthTypeReport = monthReport.getAccountMonthTypeReport();
                List<AccountTypeSum> incomeTypeSumList = accountMonthTypeReport.getTypeNum().get(0);
                List<AccountTypeSum> expensesTypeSumList = accountMonthTypeReport.getTypeNum().get(1);
                Map<String, Double> typeMap = new HashMap<>();
                for (AccountTypeSum accountTypeSum : incomeTypeSumList) {
                    typeMap.put(accountTypeSum.getName(), accountTypeSum.getValue());
                }
                for (AccountTypeSum accountTypeSum : expensesTypeSumList) {
                    typeMap = ReportUtil.addAmountToTotal(typeMap, accountTypeSum.getName(), -accountTypeSum.getValue());
                }
                typeTotalData.add(typeMap);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        // 格式化数据
        List<String> aXAxisNamesListData = new ArrayList<>();
        SimpleDateFormat chineseMonthSdf = new SimpleDateFormat("M月");
        SimpleDateFormat chineseYearSdf = new SimpleDateFormat("yyyy年");
        for (String aXAxisNamesList : xAxisNamesList) {
            try {
                String chineseMonthStr = chineseMonthSdf.format(monthSdf.parse(aXAxisNamesList));
                if (chineseMonthStr.equals("1月")) {
                    chineseMonthStr = chineseYearSdf.format(monthSdf.parse(aXAxisNamesList)) + chineseMonthStr;
                }
                aXAxisNamesListData.add(chineseMonthStr);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        accountYearReport.setxAxisNames(aXAxisNamesListData);
        // 封装数据集
        List<AccountYearSeries> seriesData = new ArrayList<>();
        // 封装收入列表
        AccountYearSeries accountYearSeries = new AccountYearSeries();
        accountYearSeries.setName("收入");
        accountYearSeries.setStack("收入");
        accountYearSeries.setBarWidth(-1);
        accountYearSeries.setType("bar");
        accountYearSeries.setIsMarkLine(1);
        accountYearSeries.setData(incomeTotalData);
        seriesData.add(accountYearSeries);
        // 封装支出列表
        accountYearSeries = new AccountYearSeries();
        accountYearSeries.setName("支出");
        accountYearSeries.setStack("支出");
        accountYearSeries.setBarWidth(-1);
        accountYearSeries.setType("bar");
        accountYearSeries.setIsMarkLine(1);
        accountYearSeries.setData(expensesTotalData);
        seriesData.add(accountYearSeries);
        // 封装亏损列表
        accountYearSeries = new AccountYearSeries();
        accountYearSeries.setName("逆差");
        accountYearSeries.setStack("盈亏");
        accountYearSeries.setBarWidth(-1);
        accountYearSeries.setType("bar");
        accountYearSeries.setIsMarkLine(0);
        List<Double> lossTotalData = new ArrayList<>();
        for (Double monthData : monthTotalData) {
            if (monthData > 0)
                lossTotalData.add(0.0);
            else
                lossTotalData.add(monthData);
        }
        accountYearSeries.setData(lossTotalData);
        seriesData.add(accountYearSeries);
        // 封装盈利列表
        accountYearSeries = new AccountYearSeries();
        accountYearSeries.setName("顺差");
        accountYearSeries.setStack("盈亏");
        accountYearSeries.setBarWidth(-1);
        accountYearSeries.setType("bar");
        accountYearSeries.setIsMarkLine(0);
        List<Double> profitTotalData = new ArrayList<>();
        for (Double monthData : monthTotalData) {
            if (monthData < 0)
                profitTotalData.add(0.0);
            else
                profitTotalData.add(monthData);
        }
        accountYearSeries.setData(profitTotalData);
        seriesData.add(accountYearSeries);
        // 封装类型列表
        for (AccountType accountType : accountTypes) {
            String typeName = accountType.getName();
            AccountYearSeries typeSeries = new AccountYearSeries();
            typeSeries.setName(typeName);
            typeSeries.setStack("收支类型比例");
            typeSeries.setType("bar");
            typeSeries.setBarWidth(-1);
            typeSeries.setIsMarkLine(0);
            List<Double> typeData = new ArrayList<>();
            for (Map<String, Double> typeTotal : typeTotalData) {
                if (typeTotal.get(typeName) != null) {
                    typeData.add(typeTotal.get(typeName));
                } else {
                    typeData.add(0.0);
                }
            }
            typeSeries.setData(typeData);
            seriesData.add(typeSeries);
        }
        accountYearReport.setSeriesData(seriesData);
        return accountYearReport;
    }

}
