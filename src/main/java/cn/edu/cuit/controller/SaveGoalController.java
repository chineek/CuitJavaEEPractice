package cn.edu.cuit.controller;

import cn.edu.cuit.VO.status.SaveGoalStatus;
import cn.edu.cuit.entity.Deposit;
import cn.edu.cuit.service.SaveGoalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * @Author: ty
 * @Date: 2019/7/12 16:00
 */
@Controller
@RequestMapping("/savegoal")
public class SaveGoalController {
    @Autowired
    private SaveGoalService saveGoalService;
    @RequestMapping(value = {"/page"})
    public String toSaveGoal() {
        // 跳转到SaveGoal.jsp页面。
        return "SaveGoal";
    }
    @RequestMapping(value = {"/setgoal"})
    @ResponseBody
    public SaveGoalStatus doSave(HttpSession session, @RequestBody Deposit goal){
        SaveGoalStatus sgs=new SaveGoalStatus();
        //添加存款目标
        saveGoalService.addSaveGoal(goal);
        sgs.setInfo("添加目标成功");
        sgs.setCode(200);
        return sgs;
    }

}
