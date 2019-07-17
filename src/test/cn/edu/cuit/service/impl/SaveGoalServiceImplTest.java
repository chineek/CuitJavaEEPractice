package cn.edu.cuit.service.impl;


import cn.edu.cuit.entity.User;
import cn.edu.cuit.service.SaveGoalService;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

import static org.junit.Assert.*;

/**
 * @Author: ty
 * @Date: 2019/7/16 11:19
 */
public class SaveGoalServiceImplTest {
    private ApplicationContext applicationContext;

    @Autowired
    private SaveGoalService saveGoalService;
    @Before
    public void setUp() throws Exception {
        // 加载spring配置文件
        applicationContext = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        // 导入需要测试的
        saveGoalService = applicationContext.getBean(SaveGoalService.class);
    }

    @Test
    public void addSaveGoal() {
    }

    @Test
    public void getAllUser() {
        List<User> list=saveGoalService.getAllUser(1);
        for (int i=0;i<list.size();i++){
            System.out.println(list.get(i).getName());
        }
    }
}