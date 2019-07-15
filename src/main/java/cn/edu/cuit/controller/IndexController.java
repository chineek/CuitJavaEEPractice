package cn.edu.cuit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
    public ModelAndView toPersonalIndex() {
        // 跳转到TEMPLATE.jsp页面。
        ModelAndView mav = new ModelAndView();
        mav.setViewName("personalIndex");
        return mav;
    }

}
