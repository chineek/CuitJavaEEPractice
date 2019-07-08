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
**2.1、使用Example进行数据库存取操作**  
&emsp;&emsp;项目使用Example类进行数据库交互，在Service层直接调用Example类即可，具体查询数据的样例代码如下：
> @Service  
> // 这是一个Demo样例的服务层实现  
> public class DemoServiceImpl implements DemoService {  
> 　//自动注入userMapper
> 　@Autowired  
> 　private UserMapper userMapper;  
>  
> 　// 根据Example查询用户  
> 　@Override  
> 　public List<User> getUsersByExample() {  
> 　　// 首先申明一个users对象用于接收查询结果（用户列表）  
> 　　List<User> users = null;  
> 　　// 新建用户样例  
> 　　UserExample example = new UserExample();  
> 　　// 获取一个criteria对象，criteria对象用于设置查询条件  
> 　　Criteria criteria = example.createCriteria();  
> 　　// 这句话等同于 WHERE username LIKE '%a%'  
> 　　criteria.andUsernameLike("%a%");   
> 　　// 这句话等同于 ORDER BY username ASC   
> 　　example.setOrderByClause("username asc");  
> 　　// 执行select查询，参数就是example  
> 　　users = userMapper.selectByExample(example);  
> 　　// 返回查询结果给controller  
> 　　return users;  
> 　}  
> }  

### 3、Dao层编写指南  
**3.1、Mapper文件不需要手动编写**  
&emsp;&emsp;mapper.xml、mapper、entity都已经通过Maven工具Mybatis Generator自动生成， 如果无特殊需要，无需再手动编写。


### 4、VO层编写指南