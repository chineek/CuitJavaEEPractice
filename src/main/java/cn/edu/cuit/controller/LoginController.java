package cn.edu.cuit.controller;

import cn.edu.cuit.VO.UserAndFamily;
import cn.edu.cuit.VO.status.LoginStatus;
import cn.edu.cuit.VO.status.RegisterStatus;
import cn.edu.cuit.entity.Family;
import cn.edu.cuit.entity.User;
import cn.edu.cuit.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * author: 35024
 * date: 2019/7/12.
 */
@Controller
@RequestMapping("/login")
public class LoginController {
    @Autowired
    private LoginService loginService;

    /**
     * 登录界面
     *
     * @return String
     */
    @RequestMapping(value = {"/log"})
    public String toLogin() {
        // 跳转到login.jsp页面。
        return "login";
    }

    /**
     * 登录界面
     *
     * @return String
     */
    @RequestMapping(value = {"/reg"})
    public String toRegister() {
        // 跳转到login.jsp页面。
        return "register";
    }

    /**
     * 登录功能
     *
     * @return String 登录结果
     */
    @RequestMapping(value = {"/do"})
    @ResponseBody
    public LoginStatus doLogin(HttpSession session, @RequestBody User user) {
        // 用户登录检查
        User loginUser = loginService.getUserByUsernameAndPassword(user);
        LoginStatus ls = new LoginStatus();
        if (loginUser != null) {
            // 登录成功：设置用户登录状态，并返回信息
            loginUser.setPassword(null);
            session.setAttribute("user", loginUser);
            ls.setCode(200);
            ls.setInfo("登录成功!");
            ls.setUser(loginUser);
            return ls;
        } else {
            // 登录失败：返回错误信息
            ls.setCode(502);
            ls.setInfo("姓名或密码有误!");
            return ls;
        }
    }

    @RequestMapping(value = {"/rDo"})
    @ResponseBody
    public RegisterStatus doLogin(HttpSession session, @RequestBody UserAndFamily userAndFamily) {
        RegisterStatus registerStatus = new RegisterStatus();
        // 首先判断用户是否存在
        User existUser = loginService.getUserByUsername(userAndFamily.getUser().getName());
        if (existUser != null) {
            registerStatus.setInfo("姓名已经存在！");
            registerStatus.setCode(400);
            return registerStatus;
        }
        // 新用户注册
        loginService.addUserAndFamily(userAndFamily);
        registerStatus.setInfo("登记家庭成功！");
        registerStatus.setCode(200);
        return registerStatus;
    }
}
