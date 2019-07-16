package cn.edu.cuit.service.impl;

import cn.edu.cuit.service.IndividualManagerService;
import cn.edu.cuit.service.SaveGoalService;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import static org.junit.Assert.*;

/**
 * @Author: ty
 * @Date: 2019/7/16 22:36
 */
public class IndividualManagerServiceImplTest {
    private ApplicationContext applicationContext;

    @Autowired
    private IndividualManagerService individualManagerService;
    @Before
    public void setUp() throws Exception {
        // 加载spring配置文件
        applicationContext = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        // 导入需要测试的
        individualManagerService = applicationContext.getBean(IndividualManagerService.class);
    }

    @Test
    public void getIndividualState() {
        System.out.println(individualManagerService.getIndividualState(1).getStartDate());
    }
}