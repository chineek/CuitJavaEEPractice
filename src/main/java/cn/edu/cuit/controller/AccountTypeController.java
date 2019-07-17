package cn.edu.cuit.controller;

import cn.edu.cuit.VO.status.AccountTypeAddStatus;
import cn.edu.cuit.VO.status.AccountTypeListStatus;
import cn.edu.cuit.entity.AccountType;
import cn.edu.cuit.service.AccountTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequestMapping("/accountType")
public class AccountTypeController {
    @Autowired
    AccountTypeService accountTypeService;

    @RequestMapping(value = {"/"})
    public String LookAccountType() {
        return "accountTypeList";
    }
    //账目类型列表
    @RequestMapping(value = {"/list"})
    @ResponseBody
    public AccountTypeListStatus ListAccountType( @RequestParam Integer page, @RequestParam Integer limit) {
        AccountTypeListStatus atls = new AccountTypeListStatus();
        List<AccountType> accountTypes = (List<AccountType>) accountTypeService.getAccountType(page, limit);
        atls.setData(accountTypes);
        atls.setCount(accountTypeService.getAccountTypeCount());
        return atls;
    }
    //添加账目类型
    @RequestMapping(value = {"/addAccountType"})
    @ResponseBody
    public AccountTypeAddStatus AddAccountType(HttpSession session, @RequestBody AccountType accountType) {
        AccountTypeAddStatus atas = new AccountTypeAddStatus();
        System.out.print(accountType.toString());
        accountTypeService.addAccountType(accountType.getName(), accountType.getDescription());
        atas.setCode(200);
        atas.setInfo("账单类型添加成功");
        return atas;
    }
    //删除指定id的账目类型
    @RequestMapping(value = {"/delete"})
    @ResponseBody
    public AccountTypeAddStatus DeleteAccountType(HttpSession session, @RequestBody AccountType accountType){
        AccountTypeAddStatus deltype = new AccountTypeAddStatus();
        System.out.print(accountType.toString());
        accountTypeService.deleteAccountType(accountType.getTid());
        deltype.setCode(200);
        deltype.setInfo("账单类型删除成功");
        return deltype;
    }

    @RequestMapping(value = {"/edit"})
    @ResponseBody
    public AccountTypeAddStatus EditAccountType(HttpSession session, @RequestBody AccountType accountType){
        AccountTypeAddStatus editType = new AccountTypeAddStatus();
        System.out.print(accountType.toString());
        accountTypeService.updateAccountType(accountType.getTid(),accountType.getName(),accountType.getDescription());
        editType.setCode(200);
        editType.setInfo("修改成功!");
        return editType;
    }


}
