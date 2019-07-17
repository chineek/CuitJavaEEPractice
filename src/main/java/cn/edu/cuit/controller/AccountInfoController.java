package cn.edu.cuit.controller;

import cn.edu.cuit.VO.AccountAndIEType;
import cn.edu.cuit.entity.Account;
import cn.edu.cuit.entity.AccountType;
import cn.edu.cuit.entity.User;
import cn.edu.cuit.service.AccountInfoService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * author: llj
 * date: 2019/7/13.
 */
@Controller
@RequestMapping("/accountInfo")
public class AccountInfoController {
    @Autowired
    AccountInfoService accountInfoService;

    /**
     * 跳转到添加账单页面
     */
    @RequestMapping(value = {"/addInfo"})
    public String toAddAccount(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        model.addAttribute("uid", user.getUid());
        return "addAccount";
    }

    /**
     * 跳转到账单详情
     */
    @RequestMapping(value = {"/queryInfo"})
    public String toAccountInfo(int acid, Model model) {
        model.addAttribute("acid", acid);
        return "accountInfo";
    }

    /**
     * 跳转到账单修改页面
     */
    @RequestMapping(value = {"/modifyInfo"})
    public String toModifyInfo(int acid, Model model) {
        Account account = accountInfoService.queryAccountInfoById(acid);
        model.addAttribute("account", account);
        return "modifyInfo";
    }

    /**
     * 查询账单分类
     */
    @RequestMapping(value = {"/queryAccountType"})
    @ResponseBody
    public List<AccountType> queryAccountType() {
        List<AccountType> list = accountInfoService.queryAccountType();
        return list;
    }

    /**
     * 查询账单
     */
    @RequestMapping(value = {"/queryAccount"})
    @ResponseBody
    public AccountAndIEType queryInfo(int acid) {
        Account account = accountInfoService.queryAccountInfoById(acid);
        int type = account.getTid();
        String name = accountInfoService.queryAccountTypeById(type);
        AccountAndIEType at = new AccountAndIEType();
        at.setAcid(account.getAcid());
        at.setAmount(account.getAmount());
        at.setDate(account.getDate());
        at.setIsExpose(account.getIsExpose());
        at.setRemarks(account.getRemarks());
        at.setIetype(account.getIetype());
        at.setTypeName(name);
        return at;
    }

    /**
     * 保存账单信息
     */
    @RequestMapping(value = {"/saveAccount"})
    @ResponseBody
    public String addAccount(Account account) {
        account.setIsAvaliable(1);
        int count = accountInfoService.addAccount(account);
        if (count >= 1) {
            return "success";
        } else {
            return "error";
        }
    }

    /**
     * 修改账单信息
     */
    @RequestMapping(value = {"/modifyAccount"})
    @ResponseBody
    public String modifyInfo(Account account) {
        int count = accountInfoService.modifyAccount(account);
        if (count == 1) {
            return "success";
        } else {
            return "error";
        }
    }

    /**
     * 删除账单
     */
    @RequestMapping(value = {"/deleteAccount"})
    @ResponseBody
    public String deleteInfo(@RequestBody Account account) throws JsonProcessingException {
        int count = accountInfoService.deleteAccount(account.getAcid());
        ObjectMapper objectMapper = new ObjectMapper();
        if (count == 1) {
            Map<String, String> msg = new HashMap<>();
            msg.put("code", "200");
            msg.put("msg", "success");
            return objectMapper.writeValueAsString(msg);
        } else {
            Map<String, String> msg = new HashMap<>();
            msg.put("code", "500");
            msg.put("msg", "error");
            return objectMapper.writeValueAsString(msg);
        }
    }
}
