# CuitJavaEEPractice
**JAVAEE实训课程项目工程文件**

## 技术选型
**开发技术**：JAVA, JSP, Servlet, JDBC  
**开发环境**：IntelliJ idea 2017.1+, jdk 8u91, mysql 5.5, tomcat 8.5.34

## 启动方法
  使用IDEA导入GIT远端项目，等待项目加载完成。
  为项目配置tomcat 8.5运行环境，点击运行按钮，可以查看执行情况。  
  在浏览器中输入：http://localhost:8080/ 访问项目首页。

## 使用指南

### 1、Controller层编写指南

### 2、Service层编写指南

### 3、Dao层编写指南
#### (1)Mapper文件不需要手动编写
mapper.xml、mapper、entity都已经通过Mybatis Maven工具自动生成，**不需要再手动编写**。
#### (2)使用Example进行数据库操作

### 4、VO层编写指南