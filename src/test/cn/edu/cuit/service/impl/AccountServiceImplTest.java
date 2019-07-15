package cn.edu.cuit.service.impl;

import cn.edu.cuit.service.AccountService;
import cn.edu.cuit.service.DemoService;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import static org.junit.Assert.*;

/**
 * @Author: yzh
 * @Date: 2019/7/15 11:50
 */
public class AccountServiceImplTest {
    private ApplicationContext applicationContext;

    @Autowired
    private AccountService accountService;

    @Before
    public void setUp() throws Exception {
        // 加载spring配置文件
        applicationContext = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        // 导入需要测试的
        accountService = applicationContext.getBean(AccountService.class);
    }

    @Test
    public void getAccountByUser() {
    }

    @Test
    public void getAccountByDate() {
    }

    @Test
    public void getAccountByAmount() {
    }

    @Test
    public void getAccountByIEType() {
    }
}