# CuitJavaEEPractice
**成信大JAVAEE实训课程项目**

## 项目简介  
**项目名称**：家庭理财管理系统  
**项目介绍**：一个能够管理家庭内部各种财务信息的家庭理财管理系统，主要包括用户管理、收支管理、财务管理、报表管理等公共模块。  

## 技术选型
**开发技术**：JAVA, JSP, Servlet, JDBC  
**开发环境**：IntelliJ idea 2017.1+, jdk 8u91, mysql 5.5, tomcat 8.5.34  
**开发框架**：Spring、SpringMVC、Mybatis、Jquery、layui

## 启动方法
**导入项目**：使用IDEA导入GIT远端项目，等待项目加载完成。  
**环境配置**：为项目配置tomcat 8.5运行环境，点击运行按钮，可以查看执行情况。    
**启动成功**：在浏览器中输入：http://localhost:8080/ 访问项目首页。  

## 编写标准

### 1、Controller层编写标准  
  
**按照如下规则编写Controller**  
  
&emsp;&emsp;模板中包含各类请求的映射方法，直接复制模板进行修改即可，模板代码如下：  
  
> @Controller  
> @RequestMapping(value = {"/Demo"})  
> public class DemoController {  
> &emsp;&emsp;//自动注入Service层  
> &emsp;&emsp;@Autowired  
> &emsp;&emsp;private DemoService demoService;  

> &emsp;&emsp;/**  
> &emsp;&emsp; * 直接字符串映射样例  
> &emsp;&emsp; * @return  
> &emsp;&emsp; */  
>> &emsp;&emsp;@RequestMapping(value = {"/StrDemo"})  
> &emsp;&emsp;// 使用ResponseBody可以让返回的数据变为字节流  
> &emsp;&emsp;@ResponseBody  
> &emsp;&emsp;public String returnStr() {  
> &emsp;&emsp;&emsp;&emsp;// 直接给前台返回一个字符串，一般用于AJAX交互。  
> &emsp;&emsp;&emsp;&emsp;return "hello,这是第一个映射";  
> &emsp;&emsp;}  

> &emsp;&emsp;/**  
> &emsp;&emsp; * 单对象获取样例  
> &emsp;&emsp; * @return  
> &emsp;&emsp; */  
>> &emsp;&emsp;@RequestMapping(value = {"/BeanDemo"})  
> &emsp;&emsp;@ResponseBody  
> &emsp;&emsp;public DemoBean returnEntify() {  
> &emsp;&emsp;&emsp;&emsp;DemoBean testBean = new DemoBean();  
> &emsp;&emsp;&emsp;&emsp;testBean.setDemostr("测试实体");  
> &emsp;&emsp;&emsp;&emsp;testBean.setDemoint(12);  
> &emsp;&emsp;&emsp;&emsp;// 会自动将Bean封装为JSON格式数据返回给前端  
> &emsp;&emsp;&emsp;&emsp;return testBean;  
> &emsp;&emsp;}  

> &emsp;&emsp;/**  
> &emsp;&emsp; * 多对象获取样例Demo  
> &emsp;&emsp; * @param orderAndRole  
> &emsp;&emsp; * @return Json数据  
> &emsp;&emsp; * @throws Exception  
> &emsp;&emsp; */  
>> &emsp;&emsp;@RequestMapping(value = { "/getMoreObjectDemo" }, method = { RequestMethod.POST }, consumes = {  
> &emsp;&emsp;		"application/json" }, produces = { "application/json" })  
> &emsp;&emsp;@ResponseBody  
> &emsp;&emsp;public Object addEmpGetStu(@RequestBody VODemo orderAndRole) throws Exception {  
> &emsp;&emsp;&emsp;&emsp;// 同时获取两个前端的数据，需要在VO层封装两个对象，并添加get方法，注意参数样式。  
> &emsp;&emsp;&emsp;&emsp;Order order = orderAndRole.getOrder();  
> &emsp;&emsp;&emsp;&emsp;Role role = orderAndRole.getRole();  
> &emsp;&emsp;&emsp;&emsp;order.setInfoAssessmentdate(new Date());  
> &emsp;&emsp;&emsp;&emsp;order.setInfoRemarks("这是生成的");  
> &emsp;&emsp;&emsp;&emsp;// 返回order对象的json数据。  
> &emsp;&emsp;&emsp;&emsp;JSONObject responseObj = (JSONObject) JSONObject.toJSON(order);  
> &emsp;&emsp;&emsp;&emsp;return responseObj;  
> &emsp;&emsp;}  

> &emsp;&emsp;/**  
> &emsp;&emsp; * service调用样例Demo  
> &emsp;&emsp; */  
>> &emsp;&emsp;@RequestMapping(value = {"/ServiceDemo"})  
> &emsp;&emsp;@ResponseBody  
> &emsp;&emsp;public String getUsers() {  
> &emsp;&emsp;&emsp;&emsp;// 调用service中的方法。  
> &emsp;&emsp;&emsp;&emsp;List<User> users = demoService.getUsersByExample();  
> &emsp;&emsp;&emsp;&emsp;System.out.print(users.get(0).getSex());  
> &emsp;&emsp;&emsp;&emsp;return "请在控制台查看输出！";  
> &emsp;&emsp;} 

> }  


### 2、Service层编写标准  
  
**使用Example进行数据库存取操作**  
  
&emsp;&emsp;项目使用Example类进行数据库交互，在Service层直接调用Example类即可，具体查询数据的样例代码如下：
  
> // 这是一个Demo样例的服务层实现  
> @Service  
> public class DemoServiceImpl implements DemoService {  
> &emsp;&emsp;//自动注入userMapper
> &emsp;&emsp;@Autowired  
> &emsp;&emsp;private UserMapper userMapper;  

> &emsp;&emsp;// 根据Example查询用户  
>> &emsp;&emsp;@Override  
> &emsp;&emsp;public List<User> getUsersByExample() {  
> &emsp;&emsp;&emsp;&emsp;// 首先申明一个users对象用于接收查询结果（用户列表）  
> &emsp;&emsp;&emsp;&emsp;List<User> users = null;  
> &emsp;&emsp;&emsp;&emsp;// 新建用户样例  
> &emsp;&emsp;&emsp;&emsp;UserExample example = new UserExample();  
> &emsp;&emsp;&emsp;&emsp;// 获取一个criteria对象，criteria对象用于设置查询条件  
> &emsp;&emsp;&emsp;&emsp;Criteria criteria = example.createCriteria();  
> &emsp;&emsp;&emsp;&emsp;// 这句话等同于 WHERE username LIKE '%a%'  
> &emsp;&emsp;&emsp;&emsp;criteria.andUsernameLike("%a%");   
> &emsp;&emsp;&emsp;&emsp;// 这句话等同于 ORDER BY username ASC   
> &emsp;&emsp;&emsp;&emsp;example.setOrderByClause("username asc");  
> &emsp;&emsp;&emsp;&emsp;// 执行select查询，参数就是example  
> &emsp;&emsp;&emsp;&emsp;users = userMapper.selectByExample(example);  
> &emsp;&emsp;&emsp;&emsp;// 返回查询结果给controller  
> &emsp;&emsp;&emsp;&emsp;return users;  
> &emsp;&emsp;}  

> }  

### 3、Dao层编写标准  
**Mapper文件不需要手动编写**  
&emsp;&emsp;mapper.xml、mapper、entity都已经通过Maven工具Mybatis Generator自动生成， 如果无特殊需要，无须再手动编写。
  
### 4、VO层编写标准
**VO全称Value Object，值对象。主要用于数据交互中，非entity数据的封装。**  
&emsp;&emsp;例：将用户和订单对象组合，成为用户订单对象。
>// 封装用户订单对象  
>public class UserAndOrder {  

>>	&emsp;&emsp;private Order order;  
>>	&emsp;&emsp;private User user;  
>>	&emsp;&emsp;public Order getOrder() {  
>>	&emsp;&emsp;&emsp;&emsp;return order;  
>>	&emsp;&emsp;}  
>>	&emsp;&emsp;public void setOrder(Order order) {  
>>	&emsp;&emsp;&emsp;&emsp;this.order = order;  
>>	&emsp;&emsp;}  
>>	&emsp;&emsp;public User getUser() {  
>>	&emsp;&emsp;&emsp;&emsp;return user;  
>>	&emsp;&emsp;}  
>>	&emsp;&emsp;public void setUser(User user) {  
>>	&emsp;&emsp;&emsp;&emsp;this.user = user;  
>>	&emsp;&emsp;}  

>}  
