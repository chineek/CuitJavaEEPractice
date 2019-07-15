package cn.edu.cuit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Author: ty
 * @Date: 2019/7/14 14:45
 */
@Controller
@RequestMapping("/limit")
public class LineOfLimitController {
    @RequestMapping(value = {"/lineoflimit"})
    public String toLineOfLimit() {
        // 跳转到SaveGoal.jsp页面。
        return "LineOfLimit";
    }
}
