<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("rootPath", "/");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>生财有道 - 您的家庭理财好助手</title>
    <jsp:include page="include/head.jsp"/>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <!-- 导入导航条 -->
    <jsp:include page="include/leader.jsp"/>
    <!-- END：导航条 -->
    <div class="layui-body layui-bg-gray">
        <!-- ===================================在这里编写HTML代码================================== -->

        <!-- ================================END：在这里编写HTML代码================================ -->
    </div>
    <!-- 导入底部 -->
    <jsp:include page="include/footer.jsp"/>
    <!-- END：底部 -->
</div>
<!-- 导入代码库文件 -->
<jsp:include page="include/jser.jsp"/>
<!-- END：代码库文件 -->
<!-- ================================在这里编写页面的js代码================================ -->
<script>
    // 这里我编写了一个简单的操作工具库，接下来是使用示例。
    // 下面内容是为了说明可以做什么，正式页面删掉就行。
    /**----------------------------------------------------------------------------------
     * 1.快速发送请求到服务器
     *    util.httpRequest对象
     ------------------------------------------------------------------------------------*/
    // 发送一条get请求到"请求地址",返回data对象,并输出
    util.httpRequest.get("getAuthorityDemo", {"auid": 1}, function (data) {
        console.log(data);
    });
    // 发送一条post请求到"请求地址",返回data对象,并输出
    util.httpRequest.post("postAuthorityDemo", {"auid": 1}, function (data) {
        console.log(data);
    });
    /**----------------------------------------------------------------------------------
     * 2.在浏览器中存储一些数据
     *    util.data对象
     ------------------------------------------------------------------------------------*/
    // 存储一个对象，"内容"可以不是字符串，而是一个对象
    util.data.set("存储名称", "内容");
    // 获取刚刚存储的数据对象
    var dataObject = util.data.get("存储名称");
    // 打印刚刚存储的对象
    console.log(dataObject);
    // 删除存储的内容
    util.data.remove("存储名称");
    /**----------------------------------------------------------------------------------
     * 3.获取浏览器URL参数
     *    util.param对象
     ------------------------------------------------------------------------------------*/
    // 可以获取如"http://www.baidu.com/index?xxx=1"中xxx的值
    // 具体使用方法如下
    console.log(util.param.xxx);
</script>
<!-- ================================END:在这里编写页面的js代码================================ -->
</body>
</html>