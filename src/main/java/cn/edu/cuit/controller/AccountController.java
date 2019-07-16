package cn.edu.cuit.controller;

import cn.edu.cuit.VO.AccountCombination;
import cn.edu.cuit.VO.status.AccountListStatus;
import cn.edu.cuit.entity.Account;
import cn.edu.cuit.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
        return "accountList";
    }

    /**
     * 获取到单个用户账单的全部信息
     * @param accountCombination
     * @return
     */
    @RequestMapping(value = {"/getAccountByCombination"})
    @ResponseBody
    public AccountListStatus getAccountByUser(@RequestBody AccountCombination accountCombination) {
        AccountListStatus als = new AccountListStatus();
        List<Account> accountList =
                (List<Account>) accountService.getAccountByCombination(accountCombination);
        als.setData(accountList);
        als.setCount(accountService.getAccountCountByCombination(accountCombination));
        return als;
    }

}
