package cn.edu.cuit.service.impl;

import cn.edu.cuit.entity.User;
import cn.edu.cuit.service.DemoService;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import sun.misc.Cleaner;

import java.io.FileWriter;
import java.io.Writer;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;

import static org.junit.Assert.*;

/**
 * author: 35024
 * date: 2019/7/12.
 */
public class DemoServiceImplTest {
    //
//    @Autowired
//    private DemoService demoService;
//    private ApplicationContext applicationContext;
//    @Before
//    public void setUp() throws Exception {
//        // 加载spring配置文件
//        applicationContext = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
//        // 导入需要测试的
//        demoService = applicationContext.getBean(DemoService.class);
//    }
    @Test
    public void getUserByName() throws Exception {
//        Calendar calendar=Calendar.getInstance();
//        SimpleDateFormat dateSdf = new SimpleDateFormat("yyyy-MM-dd");
//        calendar.setTime(dateSdf.parse("2019-07-01"));
//        System.out.print(calendar.getTime());
//        calendar.add(Calendar.MONTH, 1);
//        System.out.print(calendar.getTime());
        // sqlGenerator
        User user = new User();
        user.setUid(1563354756);
        user.setFid(1563354755);
        Integer[] typeIds = {1, 2, 3, 4, 9, 10, 11, 22, 26, 8, 25};
        String[] typeStr = {"生活日用", "餐饮美食", "交通出行", "休闲娱乐", "服饰美容", "住房物业", "医疗保健", "文体教育", "闲置交易", "工资", "红包"};
        Random random = new Random();
        random.nextInt(typeIds.length);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new Date());
        calendar.add(Calendar.YEAR, -1);
        int fileNo = 1;
        FileWriter fileWriter = new FileWriter("addExampleData" + fileNo + ".sql");
        for (; calendar.getTime().getTime() < new Date().getTime(); calendar.add(Calendar.HOUR_OF_DAY, random.nextInt(20))) {
            for (int i = 0; i < random.nextInt(3); i++) {
                if (fileNo++ % 2000 == 0) {
                    fileWriter.close();
                    fileWriter = new FileWriter("addExampleData" + (fileNo / 2000 + 1) + ".sql");
                }
                int ieRandom = random.nextInt(5) % 2;
                int typeRandom = random.nextInt(typeIds.length - 2);
                if (ieRandom == 0)
                    typeRandom = random.nextInt(3) + typeIds.length - 3;
                calendar.add(Calendar.MILLISECOND, random.nextInt(100000));
                String insertSql = "insert into account (tid,uid,ietype,date,amount,remarks,is_expose,is_avaliable) values (" +
                        typeIds[typeRandom] + "," +
                        user.getUid() + "," +
                        ieRandom + "," +
                        "'" + sdf.format(calendar.getTime()) + "'" + "," +
                        random.nextInt(1000) + "," +
                        "'" + typeStr[typeRandom] + (ieRandom == 0 ? "收入" : "支出") + "'," +
                        "1,1" +
                        ");";
                System.out.println(insertSql);
                fileWriter.write(insertSql);
                fileWriter.write(System.getProperty("line.separator"));
            }
        }
        fileWriter.close();

    }

}