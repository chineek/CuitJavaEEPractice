package cn.edu.cuit.dao;

import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import sun.plugin2.message.Message;

import java.util.Date;

import static org.junit.Assert.*;

/**
 * Created by 35024 on 2019/7/9.
 */
public class DemoMapperTest {
    private ApplicationContext applicationContext;

  @Autowired
  private UserMapper mapper;

   @Before
    public void setUp() throws Exception {
       // 加载spring配置文件
       applicationContext = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
       // 导入需要测试的
       mapper = applicationContext.getBean(UserMapper.class);
   }

   @Test
    public void deleteByPrimaryKey() throws Exception {
       mapper.deleteByPrimaryKey(2);
    }

}