package cn.edu.cuit.service.impl;

import cn.edu.cuit.service.DemoService;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import static org.junit.Assert.*;

/**
 * author: 35024
 * date: 2019/7/12.
 */
public class DemoServiceImplTest {

    @Autowired
    private DemoService demoService;
    private ApplicationContext applicationContext;
    @Before
    public void setUp() throws Exception {
        // 加载spring配置文件
        applicationContext = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        // 导入需要测试的
        demoService = applicationContext.getBean(DemoService.class);
    }
    @Test
    public void getUserByName() throws Exception {
        System.out.print(demoService.getUserByName("田"));
    }

}