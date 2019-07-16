package cn.edu.cuit.controller;

import cn.edu.cuit.VO.UserListCombination;
import cn.edu.cuit.VO.status.AccountListStatus;
import cn.edu.cuit.VO.status.RegisterStatus;
import cn.edu.cuit.VO.status.UserListStatus;
import cn.edu.cuit.entity.Account;
import org.springframework.beans.factory.annotation.Autowired;
import cn.edu.cuit.service.UserService;
import cn.edu.cuit.entity.User;

import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by a on 2019/7/14.
 */

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    UserService userService;

    @RequestMapping(value = {"/list"})
    public String toUserList() {
        return "userList";
    }

    @RequestMapping(value = {"/add"})
    public ModelAndView toUserAdd() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("userAdd");
        return mav;
    }
    @RequestMapping(value = {"/edit"})
    public ModelAndView toUserEdit() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("userEdit");
        return mav;
    }

    @RequestMapping(value = {"/getUserList"})
    @ResponseBody
    public UserListStatus getUserList(@RequestBody UserListCombination userListCombination) {
        UserListStatus uls = new UserListStatus();
        List<User> userList = (List<User>) userService.list(userListCombination);
        uls.setData(userList);
        uls.setCount(userService.getCountByUser());
        return uls;
    }

    @RequestMapping(value = {"/center"})
    public String toUser(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        List<User> us = userService.list(1);
        model.addAttribute("user", us);
        return "user";
    }

    @RequestMapping(value = {"/userDelete"})
    public String deleteUser(Model model, HttpSession session, int uid) {
        User user = (User) session.getAttribute("user");
        userService.delete(uid);
        return "success";
    }

    @RequestMapping(value = {"/userEdit"})
    public UserListStatus editUser(@RequestBody User user) {
        UserListStatus us=new UserListStatus();
        if(userService.isExists(user.getName())){
            us.setCount(405);
        }else{
            userService.update(user);
            us.setCode(200);
        }
        return us;
    }

    @RequestMapping(value = {"/userAdd"})
    @ResponseBody
    public RegisterStatus addUser(@RequestBody User user) {
        // 封装返回的JSON数据
        RegisterStatus rs = new RegisterStatus();
        if (userService.isExists(user.getName())) {
            rs.setCode(405);
            rs.setInfo("用户名已经存在！");
        } else {
            userService.add(user);
            rs.setCode(200);
            rs.setInfo("添加成功！");
        }
        return rs;
    }

    /*.@RequestMapping(value={"/UserUpload"})
    public String upload(User user, HttpServletRequest request,Model model)throws Exception{
        System.out.println(request.getParameter("name"));
        String sqlPath=null;
        String localPath="D:\\CuitJavaEEPractice\\CuitJavaEEPractice\\src\\main\\webapp\\asset\\avatar\\";
        String filename=null;
        if(!user.getAvatar().isEmpty()){
            String uuid= UUID.randomUUID().toString().replaceAll("-","");
            String contentType=user.getAvatar().getContentType();
            String suffixName=contentType.substring(contentType.indexOf("/"+1));
            filename=uuid+"."+suffixName;
            System.out.println(filename);
            user.getAvatar().transferTo(newFile(localPath+filename));
        }
        sqlPath="/image/"+filename;
        user.setAvatar(sqlPath);
        userService.add(user);
        model.addAttribute("user",user);
        return "User";
    }*/
}
