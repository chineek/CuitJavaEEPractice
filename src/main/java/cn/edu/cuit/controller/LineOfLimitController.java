package cn.edu.cuit.controller;

import cn.edu.cuit.VO.Status;
import cn.edu.cuit.entity.Spending;
import cn.edu.cuit.entity.User;
import cn.edu.cuit.service.LineOfLimitService;
import cn.edu.cuit.service.SaveGoalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @Author: ty
 * @Date: 2019/7/14 14:45
 */
@Controller
@RequestMapping("/limit")
public class LineOfLimitController {
    @Autowired
    private LineOfLimitService lineOfLimitService;
    @Autowired
    private SaveGoalService saveGoalService;

    @RequestMapping(value = {"/page"})
    public String toLineOfLimit() {
        // 跳转到SaveGoal.jsp页面。
        return "lineoflimit";
    }

    @RequestMapping(value = {"/setlimit"})
    @ResponseBody
    public Status doLimit(HttpSession session, @RequestBody Spending limit){
        Status status=new Status();
        lineOfLimitService.addLimit(limit);
        status.setCode(200);
        status.setInfo("设置额度成功");
        return status;
    }

    @RequestMapping(value={"/getmembers"})
    @ResponseBody
    public List<User> getMembers(HttpSession session, @RequestBody User user){
        return saveGoalService.getAllUser(user.getUid());
    }
}
