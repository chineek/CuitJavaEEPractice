package cn.edu.cuit.controller;

import cn.edu.cuit.VO.UserAndAccountVO;
import cn.edu.cuit.entity.Authority;
import cn.edu.cuit.entity.User;
import cn.edu.cuit.service.DemoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 控制器样例
 * author: 陈奕铠
 * date: 2019/7/11.
 */
@Controller
@RequestMapping("/demo")
public class DemoController {
    @Autowired
    DemoService demoService;

    /**
     * @return String
     */
    @RequestMapping(value = {"/template"})
    public String toTemplate() {
        // 跳转到TEMPLATE.jsp页面。
        return "TEMPLATE";
    }

    /**
     * 使用权限ID获取权限信息的示范
     *
     * @return Authority
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
     * 使用用户名字获取用户信息的示范
     *
     * @return List<User>
     */
    @RequestMapping(value = {"/getUserByNameDemo"})
    // 使用ResponseBody可以让返回的数据变为字节流
    @ResponseBody
    public List<User> getAuth(@RequestParam String name) {
        /* 直接给前台返回一个字符串，一般用于AJAX交互。 */
        return (List<User>) demoService.getUserByName(name);
    }

    /**
     * 调用VO示范样例
     *
     * @return String
     */
    @RequestMapping(value = {"/addUserAndAccount"})
    @ResponseBody
    public String userAndAccountVO(@RequestBody UserAndAccountVO userAndAccountVO) {
        // 可以看到获得了前端传递的VO对象（注意：前端传递的数据格式需要和VO层一致）
        System.out.print(userAndAccountVO.toString());
        return "success";
    }
}
