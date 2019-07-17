package cn.edu.cuit.controller;

import cn.edu.cuit.VO.AccountAndDepositVo;
import cn.edu.cuit.VO.SaveGoalCombination;
import cn.edu.cuit.VO.status.GoalListStatus;
import cn.edu.cuit.VO.status.SaveGoalStatus;
import cn.edu.cuit.entity.Deposit;
import cn.edu.cuit.entity.User;
import cn.edu.cuit.service.IndividualManagerService;
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
 * @Date: 2019/7/12 16:00
 */
@Controller
@RequestMapping("/savegoal")
public class SaveGoalController {
    @Autowired
    private SaveGoalService saveGoalService;
    @Autowired
    private IndividualManagerService individualManagerService;

    @RequestMapping(value = {"/page"})
    public String toSaveGoal() {
        return "showgoal";

    }
    @RequestMapping(value = {"/addGoal"})
    public String SaveGoal() {
        return "savegoal";
    }


    //添加存款目标
    @RequestMapping(value = {"/setgoal"})
    @ResponseBody
    public SaveGoalStatus doSave(HttpSession session, @RequestBody Deposit goal){
        int flag=saveGoalService.isRun(goal.getUid());
        SaveGoalStatus sgs=new SaveGoalStatus();
        if(flag==0){
            //添加存款目标
            saveGoalService.addSaveGoal(goal);
            sgs.setInfo("添加目标成功");
            sgs.setCode(200);
            return sgs;

        }else {
            sgs.setInfo("存在正在进行的目标，请先完成当前目标");
            sgs.setCode(0);
            return sgs;
        }

    }
    //获取家庭成员
    @RequestMapping(value={"/getmembers"})
    @ResponseBody
    public List<User> getMembers(HttpSession session,@RequestBody User user){
        return saveGoalService.getAllUser(user.getUid());
    }

    //获取个人历史存款目标
    @RequestMapping(value ={"/getAllGoal"})
    @ResponseBody
    public GoalListStatus getAllGoal(HttpSession session,@RequestBody SaveGoalCombination saveGoalCombination){
        GoalListStatus gls=new GoalListStatus();
        List<Deposit> depositList=individualManagerService.getHistoryGoal(saveGoalCombination);
        gls.setData(depositList);
        gls.setCount(individualManagerService.getCountHistoryGoal(saveGoalCombination));
        return gls;
    }

    //获取个人当前存款目标
    @RequestMapping(value = {"/getCurrentGoal"})
    @ResponseBody
    public AccountAndDepositVo getCurrentGoal(HttpSession session,@RequestBody User user){
        return individualManagerService.getIndividualState(user.getUid());
    }

    //取消存款目标
    @RequestMapping(value = {"/cancelGoal"})
    @ResponseBody
    public SaveGoalStatus ConcelGoal(HttpSession session,@RequestBody User user){
        SaveGoalStatus sgs=new SaveGoalStatus();
        individualManagerService.cancelGoal(user.getUid());
        sgs.setInfo("取消目标成功");
        sgs.setCode(200);
        return sgs;
    }
    //提前完成存款目标
    @RequestMapping(value = {"/finishGoal"})
    @ResponseBody
    public SaveGoalStatus finishGoal(HttpSession session,@RequestBody User user){
        SaveGoalStatus sgs=new SaveGoalStatus();
        individualManagerService.finishGoal(user.getUid());
        sgs.setInfo("恭喜提前完成目标");
        sgs.setCode(200);
        return sgs;
    }


}
