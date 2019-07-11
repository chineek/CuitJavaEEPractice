package cn.edu.cuit.controller;

import cn.edu.cuit.entity.Authority;
import cn.edu.cuit.entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

/**
 * 控制器样例
 * author: 陈奕铠
 * date: 2019/7/11.
 */
@Controller
@RequestMapping("/demo")
public class DemoController {
    /**
     * @return String
     */
    @RequestMapping(value = {"/template"})
    public String toTemplate() {
        // 跳转到TEMPLATE.jsp页面。
        return "TEMPLATE";
    }

    /**
     * @return User
     */
    @RequestMapping(value = {"/postAuthorityDemo"})
    // 使用ResponseBody可以让返回的数据变为字节流
    @ResponseBody
    public Authority postAuth(@RequestBody Authority authority) {
        // 直接给前台返回一个字符串，一般用于AJAX交互。
        System.out.print(authority.toString());
        return authority;
    }
    /**
     * @return User
     */
    @RequestMapping(value = {"/getAuthorityDemo"})
    // 使用ResponseBody可以让返回的数据变为字节流
    @ResponseBody
    public Authority getAuth(@RequestParam Integer auid) {
        // 直接给前台返回一个字符串，一般用于AJAX交互。
        Authority authority = new Authority();
        authority.setAuid(auid);
        System.out.print(authority.toString());
        return authority;
    }
}
