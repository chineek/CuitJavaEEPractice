<%--
  Created by IntelliJ IDEA.
  User: CTDZ
  Date: 2019/7/14
  Time: 16:07
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("rootPath", "/");
%>

<html>
<head>
    <title>运动场地管理 - 校园活动场地管理系统</title>
    <jsp:include page="include/head.jsp"/>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <!-- 导入导航条 -->
    <jsp:include page="include/leader.jsp"/>
    <!-- END：导航条 -->
    <div class="layui-body layui-bg-gray">
        <!-- ===================================在这里编写HTML代码================================== -->
        <div style="padding: 12px;">
            <form class="layui-form" action="">
                <div class="layui-form-item">
                    <label class="layui-form-label">输入框</label>
                    <div class="layui-input-block">
                        <input type="text" name="title" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">文本域</label>
                    <div class="layui-input-block">
                        <textarea name="desc" placeholder="请输入内容" class="layui-textarea"></textarea>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>
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
    layui.use('form', function(){
        var form = layui.form;

        //监听提交
        form.on('submit(formDemo)', function(data){
            layer.msg(JSON.stringify(data.field));
            return false;
        });
    });
    // 这里我编写了一个简单的操作工具库，接下来是使用示例。
    // 下面内容是为了说明可以做什么，正式页面删掉就行。
    /**----------------------------------------------------------------------------------
     * 1.快速发送请求到服务器
     *    util.httpRequest对象
     ------------------------------------------------------------------------------------*/
    // 发送一条get请求到"请求地址",返回data对象,并输出
    util.httpRequest.get("getUserByNameDemo", {"name": "田"}, function (usersList) {
        console.table(usersList);
    });
    // 发送一条post请求到"请求地址",返回data对象,并输出
    util.httpRequest.post("postAuthorityDemo", {"auid": 1}, function (authority) {
        console.table(authority);
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