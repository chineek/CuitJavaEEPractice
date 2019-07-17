package cn.edu.cuit.service.impl;

import cn.edu.cuit.service.DemoService;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

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
        Calendar calendar=Calendar.getInstance();
        SimpleDateFormat dateSdf = new SimpleDateFormat("yyyy-MM-dd");
        calendar.setTime(dateSdf.parse("2019-07-01"));
        System.out.print(calendar.getTime());
        calendar.add(Calendar.MONTH, 1);
        System.out.print(calendar.getTime());
    }

}