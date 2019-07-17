<%--
  Created by IntelliJ IDEA.
  User: MBH
  Date: 2019/7/15
  Time: 10:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>生财有道 - 您的家庭理财好助手</title>
    <link rel="stylesheet" href="asset/lib/layui/css/layui.css">

</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <!-- 头部和导航区域（请不要修改） -->
    <div class="layui-header">
        <div class="layui-logo">生财有道</div>
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">首页</a></li>
            <li class="layui-nav-item">
                <a href="javascript:void(0);">成员管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="">添加成员</a></dd>
                    <dd><a href="">查询成员列表</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:void(0);">家庭情况</a>
                <dl class="layui-nav-child">
                    <dd><a href="">家庭报表</a></dd>
                    <dd><a href="">家庭信息</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">家庭财务管理</a></li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item"><a href="">登录系统</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    田洋
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">个人中心</a></dd>
                    <dd><a href="">注销</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">注销</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree">
                <li class="layui-nav-item layui-nav-itemed"><a href="">首页</a></li>
                <li class="layui-nav-item">
                    <a class="" href="javascript:;">收支管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="">账目列表</a></dd>
                        <dd><a href="">添加账目</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">财务管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="">额度查询</a></dd>
                        <dd><a href="">存款目标管理</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="">系统设置</a></li>
            </ul>
        </div>
    </div>
    <!-- END:头部和导航区域 -->
    <!-- 内容主体区域 -->
    <div class="layui-body">
        <!-- -------------编写的HTML代码从这里开始------------- -->
        <div style="padding: 50px;font-size:40px;">个人存款
            <button onclick="window.open('/savagoal/page')" type="submit" class="layui-btn"style="float:right">添加新存款目标</button>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label"style="font-size: 20px">当前目标</label>
            <div class="layui-input-block">
                <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入目标" class="layui-input">
            </div>
        </div>
        <div class="layui-progress layui-progress-big">
            <div class="layui-progress-bar" lay-percent="20%"style="text-align:center"></div>
            <div style="text-align: center">存款金额/目标金额</div>
        </div>
        <div class="layui-form">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">开启公历节日</label>
                    <div class="layui-input-inline">
                        <input type="text" class="layui-input" id="test17" placeholder="yyyy-MM-dd">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">自定义重要日</label>
                    <div class="layui-input-inline">
                        <input type="text" class="layui-input" id="test18" placeholder="yyyy-MM-dd">
                    </div>
                </div>
            </div>
        </div>
        <div>
            <button type="button" class="layui-btn layui-btn-normal">提前完成</button>
            <button type="button" class="layui-btn layui-btn-danger">取消目标</button>
        </div>

        <table class="layui-hide" id="test"></table>
        <!-- -------------END：编写的HTML代码不超过这-------------- -->
    </div>
    <!-- 内容主体区域结束 -->
    <!-- 底部固定区域 -->
    <div class="layui-footer">
        © 生财有道开发部 - 成都东软软件股份有限公司
    </div>
    <!-- END:底部固定区域 -->
</div>
<!-- 代码库导入 -->
<script src="asset/lib/layui/layui.js"></script>
<script src="asset/js/layui-elem.js"></script>
<!-- END:代码库导入 -->
<!-- -------------在这里编写页面的js代码------------- -->
<script>


    layui.use('laydate', function(){
        var laydate = layui.laydate;
//开启公历节日
        laydate.render({
            elem: '#test17'
            ,calendar: true
        });


    });
    layui.use('table', function(){
        var table = layui.table;

        table.render({
            elem: '#test'
            ,url:'/demo/table/user/'
            ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            ,cols: [[
                {field:'id', title: '目标', sort: true, align: 'center'}
                ,{field:'username', title: '起始时间', align: 'center'} //width 支持：数字、百分比和不填写。你还可以通过 minWidth 参数局部定义当前单元格的最小宽度，layui 2.2.1 新增
                ,{field:'sex', title: '结束时间', sort: true, align: 'center'}
                ,{field:'city', title: '目标内容', align: 'center'}
                ,{field:'sign', title: '是否完成', align: 'center'}

            ]]
        });
    });
</script>
<!-- -------------END:在这里编写页面的js代码------------- -->
</body>
</html>
