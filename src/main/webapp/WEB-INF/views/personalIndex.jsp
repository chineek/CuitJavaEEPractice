<%@ page import="cn.edu.cuit.entity.User" %>
<%@ page import="java.util.Calendar" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("rootPath", "/");
    User user = (User) request.getSession().getAttribute("user");
    request.setAttribute("user", user);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>生财有道 - 您的家庭理财好助手</title>
    <jsp:include page="include/head.jsp"/>
    <script src="${rootPath}lib/echarts.js"></script>
    <script src="${rootPath}js/echarts-helper.js"></script>
    <!-- 封装需要用到的数据 -->
    <script>
        var chartsDatas = {
            lineChart: ${accountMonthReport},
            pieChart: {},
            multiplexBarChart: {}
        }
    </script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <!-- 导入导航条 -->
    <jsp:include page="include/leader.jsp"/>
    <!-- END：导航条 -->
    <div class="layui-body layui-bg-gray" style="padding: 30px 40px;">
        <!-- -------------编写的HTML代码从这里开始------------- -->
        <div class="layui-row layui-col-space20">
            <div class="layui-col-md6">
                <div class="layui-card">
                    <div class="layui-card-header">个人信息</div>
                    <div class="layui-card-body" style="padding: 5px 10px 20px 20px;">
                        <!-- 欢迎信息 -->
                        <h1 style="line-height: 30px;">${user.name}，<span id="greeting"></span>。</h1>
                        <div class="layui-text" style="line-height: 30px;padding-bottom: 15px;">
                            <i class="layui-icon layui-icon-notice" style="color: #FFB800;"></i>
                            今天是<span id="nowDatetime"></span> 欢迎您使用生财有道家庭理财系统！
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
                    <div class="layui-card-body" style="padding: 0 10px 0 20px;">
                        <div class="layui-row">
                            <!-- 本月收支情况 -->
                            <div class="layui-col-lg12" style="height: 160px;">
                                <div id="echartsMonthLine" style="width: 100%;height: 160px;"></div>
                            </div>
                            <!-- END：本月收支情况 -->
                            <!-- 本月收支占比 -->
                            <div class="layui-col-lg12" style="height: 130px;">
                                <div id="echartsMonthPie" style="width: 100%;height: 130px;"></div>
                            </div>
                            <!-- END：本月收支占比 -->
                        </div>
                    </div>
                </div>
            </div>
            <div class="layui-col-md6">
                <div class="layui-card">
                    <div class="layui-card-header">近月收支情况</div>
                    <div class="layui-card-body" style="padding: 0 10px 5px 20px;">
                        <div id="echartsRecentMonthBar" style="width: 100%;height: 280px;"></div>
                    </div>
                </div>
                <div class="layui-card">
                    <div class="layui-card-header">
                        <div class="layui-row">
                            <div class="layui-col-md6">近期账单</div>
                            <div class="layui-col-md6" style="text-align: right;padding-right: 20px;">
                                <a href="#" style="color:#01AAED;">
                                    <small>查看更多</small>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="layui-card-body" style="padding: 0 20px 1px 20px;">
                        <table class="layui-table"
                               lay-data="{page:false}" lay-filter="recentAccount">
                            <thead>
                            <tr>
                                <th lay-data="{field:'id', width:'12%'}">收支</th>
                                <th lay-data="{field:'username', width:'20%'}">金额</th>
                                <th lay-data="{field:'sex', width:'30%'}">时间</th>
                                <th lay-data="{field:'city',width:'38%'}">类型</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>收入</td>
                                <td>1000.00</td>
                                <td>2019-07-16 12:44</td>
                                <td>奶粉</td>
                            </tr>
                            <tr>
                                <td>收入</td>
                                <td>1000.00</td>
                                <td>2019-07-16 12:44</td>
                                <td>奶粉</td>
                            </tr>
                            <tr>
                                <td>收入</td>
                                <td>1000.00</td>
                                <td>2019-07-16 12:44</td>
                                <td>奶粉</td>
                            </tr>
                            <tr>
                                <td>收入</td>
                                <td>1000.00</td>
                                <td>2019-07-16 12:44</td>
                                <td>奶粉</td>
                            </tr>
                            <tr>
                                <td>收入</td>
                                <td>1000.00</td>
                                <td>2019-07-16 12:44</td>
                                <td>奶粉</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- -------------END：编写的HTML代码不超过这-------------- -->
    </div>
    <!-- 导入底部 -->
    <jsp:include page="include/footer.jsp"/>
    <!-- END：底部 -->
</div>
<!-- 导入代码库文件 -->
<jsp:include page="include/jser.jsp"/>
<script src="${rootPath}js/personal-index-echarts.js"></script>
<!-- END：代码库文件 -->
<!-- ================================在这里编写页面的js代码================================ -->
<script>
    layui.use('table', function () {
        var table = layui.table;

        table.init('recentAccount', {
            limit: 10,
            height: 150
        });
        var init = (function () {
            var greetingStr = util.date.getGreeting();
            var nowDatetime = util.date.format(new Date(), "yyyy年M月d日");
            $("#greeting").html(greetingStr);
            $("#nowDatetime").html(nowDatetime);
        })();
    });
</script>
<!-- ================================END:在这里编写页面的js代码================================ -->
</body>
</html>