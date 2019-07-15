package cn.edu.cuit.controller;

import cn.edu.cuit.VO.status.AccountTypeListStatus;
import cn.edu.cuit.entity.AccountType;
import cn.edu.cuit.service.AccountTypeService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

@Controller
@RequestMapping("/accountType")
public class AccountTypeController {
    @Autowired
    AccountTypeService accountTypeService;

    @RequestMapping(value = {"/"})
    public String addAccountType() {
        return "accountTypeList";
    }

    @RequestMapping(value = {"/list"})
    @ResponseBody
    public AccountTypeListStatus ListAccountType() {
        AccountTypeListStatus atls = new AccountTypeListStatus();
        List<AccountType> accountTypes = (List<AccountType>) accountTypeService.getAccountType();
        atls.setData(accountTypes);
        atls.setCount(accountTypes.size());
        return atls;
    }


}
