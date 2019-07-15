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
    <script src="${rootPath}lib/echarts.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <!-- 导入导航条 -->
    <jsp:include page="include/leader.jsp"/>
    <!-- END：导航条 -->
    <div class="layui-body layui-bg-gray" style="padding: 30px 40px;">
        <!-- ===================================在这里编写HTML代码================================== -->
        <div class="layui-row layui-col-space20">
            <div class="layui-col-md6">
                <div class="layui-card">
                    <div class="layui-card-header">个人信息</div>
                    <div class="layui-card-body" style="padding: 10px 10px 40px 20px;">
                        <!-- 欢迎信息 -->
                        <h1 style="line-height: 40px;">系统管理员，晚上好！</h1>
                        <div class="layui-text" style="line-height: 40px;padding-bottom: 15px;">
                            <i class="layui-icon layui-icon-notice" style="color: #FFB800;"></i>
                            今天是2019年7月15日 欢迎您使用生财有道家庭理财系统！
                        </div>
                        <!-- END:欢迎信息 -->
                        <!-- 个人情况 -->
                        <div class="layui-row layui-col-space30">
                            <div class="layui-col-md2">
                                <div style="line-height: 18px;">存款目标</div>
                            </div>
                            <div class="layui-col-md7">
                                <div class="layui-progress layui-progress-big" lay-showPercent="yes">
                                    <div class="layui-progress-bar layui-bg-green" lay-percent="9996/12456"></div>
                                </div>
                            </div>
                            <div class="layui-col-space3">
                                <div style="line-height: 18px;">还有8天</div>
                            </div>
                        </div>
                        <div class="layui-row layui-col-space30">
                            <div class="layui-col-md2">
                                <div style="line-height: 18px;">消费额度</div>
                            </div>
                            <div class="layui-col-md7">
                                <div class="layui-progress layui-progress-big" lay-showPercent="yes">
                                    <div class="layui-progress-bar layui-bg-orange" lay-percent="1400/5000"></div>
                                </div>
                            </div>
                            <div class="layui-col-space3">
                                <div style="line-height: 18px;">剩余3600元</div>
                            </div>
                        </div>
                        <!-- END:个人情况 -->
                    </div>
                </div>
                <div class="layui-card">
                    <div class="layui-card-header">本月收支情况（收入100.0元，支出3000.0元）</div>
                    <div class="layui-card-body" style="padding: 10px 10px 40px 20px;">
                        <div class="layui-row">
                            <!-- 本月收支情况 -->
                            <div class="layui-col-lg12" style="height: 140px;">
                                <div id="echartTest" style="width: 100%;height: 140px;"></div>
                            </div>
                            <!-- END：本月收支情况 -->
                            <!-- 本月收支占比 -->
                            <div class="layui-col-lg12">
                                <div class="layui-row">
                                    <div class="layui-col-lg6"></div>
                                    <div class="layui-col-lg6"></div>
                                </div>
                            </div>
                            <!-- END：本月收支占比 -->
                        </div>
                    </div>
                </div>
            </div>
            <div class="layui-col-md6">

            </div>
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
<script src="${rootPath}js/personal-index-echarts.js"></script>
<!-- ================================在这里编写页面的js代码================================ -->
<script>
    // 这里我编写了一个简单的操作工具库，接下来是使用示例。
    // 下面内容是为了说明可以做什么，正式页面删掉就行。
    /**----------------------------------------------------------------------------------
     * 1.快速发送请求到服务器
     *    util.httpRequest对象
     ------------------------------------------------------------------------------------*/
    // 发送一条get请求到"请求地址",返回data对象,并输出
    util.httpRequest.get("getUserByNameDemo", {"name": "田"}, function (usersList) {
        console.log(usersList);
    });
    // 发送一条post请求到"请求地址",返回data对象,并输出
    util.httpRequest.post("postAuthorityDemo", {"auid": 1}, function (authority) {
        console.log(authority);
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