package cn.edu.cuit.controller;

import cn.edu.cuit.VO.status.AccountListStatus;
import cn.edu.cuit.entity.Account;
import cn.edu.cuit.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

/**
 * @Author: yzh
 * @Date: 2019/7/14 10:35
 */

@Controller
@RequestMapping("/account")
public class AccountController {
    @Autowired
    AccountService accountService;

    /**
     * @return String
     */
    @RequestMapping(value = {"/list"})
    public String toAccount() {
        // 跳转到account.jsp页面。
        return "account";
    }

    //获取到单个用户账单的全部信息
    @RequestMapping(value = {"/getAccountByUser"})
    @ResponseBody
    public AccountListStatus getAccountByUser(@RequestParam Integer uid,@RequestParam Integer page,@RequestParam Integer limit) {
        AccountListStatus als = new AccountListStatus();
        List<Account> accountList = (List<Account>) accountService.getAccountByUser(uid,page,limit);
        als.setData(accountList);
        als.setCount(accountService.getAccountCountByUid(uid));
        return als;
    }

    //根据时间得到对应的账单信息
    @RequestMapping(value = {"/getAccountByDate"})
    @ResponseBody
    public List<Account> getAccountByDate(@RequestParam Date date1, @RequestParam Date date2) {
        return (List<Account>) accountService.getAccountByDate(date1, date2);
    }

    //根据金额范围得到对应的账单信息
    @RequestMapping(value = {"/getAccountByAmount"})
    @ResponseBody
    public List<Account> getAccountByAmount(@RequestParam Long amount1, @RequestParam Long amount2) {
        return (List<Account>) accountService.getAccountByAmount(amount1, amount2);
    }

    //根据账单类型得到对应的账单信息
    @RequestMapping(value = {"/getAccountByIEType"})
    @ResponseBody
    public List<Account> getAccountByIEType(@RequestParam Integer IEType) {
        return (List<Account>) accountService.getAccountByIEType(IEType);
    }
}
