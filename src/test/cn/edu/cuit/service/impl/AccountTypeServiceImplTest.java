package cn.edu.cuit.service.impl;

import cn.edu.cuit.service.AccountTypeService;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


public class AccountTypeServiceImplTest {
    private ApplicationContext applicationContext;
    @Autowired
    private AccountTypeService accountTypeService;
    @Before
    public void setUp() throws Exception {
        // 加载spring配置文件
        applicationContext = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        // 导入需要测试的
        accountTypeService = applicationContext.getBean(AccountTypeService.class);
    }
    @Test
    public void addAccountType() {
    }

    @Test
    public void getAccountType() {
    }

    @Test
    public void deleteAccountType() {
    }

    @Test
    public void updateAccountType() {
    }
}
