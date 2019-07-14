package cn.edu.cuit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * author: 35024
 * date: 2019/7/14.
 */
@Controller
@RequestMapping("/index")
public class IndexController {
    /**
     * @return String
     */
    @RequestMapping(value = {"/"})
    public String toPersonalIndex() {
        // 跳转到TEMPLATE.jsp页面。
        return "personalIndex";
    }

}
