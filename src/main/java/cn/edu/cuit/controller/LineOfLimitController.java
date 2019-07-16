package cn.edu.cuit.controller;

import cn.edu.cuit.VO.Status;
import cn.edu.cuit.entity.Spending;
import cn.edu.cuit.service.LineOfLimitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * @Author: ty
 * @Date: 2019/7/14 14:45
 */
@Controller
@RequestMapping("/limit")
public class LineOfLimitController {
    @Autowired
    private LineOfLimitService lineOfLimitService;

    @RequestMapping(value = {"/page"})
    public String toLineOfLimit() {
        // 跳转到SaveGoal.jsp页面。
        return "LineOfLimit";
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
}
