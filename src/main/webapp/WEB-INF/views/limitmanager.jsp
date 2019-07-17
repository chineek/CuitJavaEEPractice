<%--
  Created by IntelliJ IDEA.
  User: MBH
  Date: 2019/7/15
  Time: 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
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
        <div style="padding: 50px;font-size:40px;">成员额度管理
            <button type="button" class="layui-btn"style="float:right"onclick="window.open('/limit/page')">添加新额度限制</button>
        </div>
        <table class="layui-table" lay-data="{width: 1500, height:330, url:'/demo/table/user/', page:true, id:'idTest'}" lay-filter="demo">
            <thead>
            <tr>
                <th lay-data="{field:'uid', width:180, sort: true, fixed: true,align: 'center'}">ID</th>
                <th lay-data="{field:'name', width:180,align: 'center'}">成员名</th>
                <th lay-data="{field:'amounts', width:180, sort: true,align: 'center'}">已使用额度</th>
                <th lay-data="{field:'amount', width:180,align: 'center'}">设定额度</th>
                <th lay-data="{field:'start_date', width:180,align: 'center'}">起始日期</th>
                <th lay-data="{field:'end_date', width:180, sort: true,align: 'center'}">结束日期</th>
                <th lay-data="{fixed: 'right', width:160, align:'center', toolbar: '#barDemo'}">操作</th>
            </tr>
            </thead>
        </table>

        <div style="padding: 50px;font-size:40px;">成员存款目标管理
            <button type="button" class="layui-btn"style="float:right"onclick="window.open('/savegoal/page')">添加新存款目标</button>
        </div>
        <table class="layui-table" lay-data="{width: 1500, height:330, url:'/demo/table/user/', page:true, id:'idTest1'}" lay-filter="demo1">
            <thead>
            <tr>
                <th lay-data="{field:'id', width:180, sort: true, fixed: true,align: 'center'}">ID</th>
                <th lay-data="{field:'name', width:180,align: 'center'}">成员名</th>
                <th lay-data="{field:'sum', width:180, sort: true,align: 'center'}">已完成目标</th>
                <th lay-data="{field:'amount', width:180,align: 'center'}">设定目标</th>
                <th lay-data="{field:'start_date', width:180,align: 'center'}">起始日期</th>
                <th lay-data="{field:'end_date', width:180, sort: true,align: 'center'}">结束日期</th>
                <th lay-data="{fixed: 'right', width:160, align:'center', toolbar: '#barDemo1'}">操作</th>
            </tr>
            </thead>
        </table>
        <script type="text/html" id="barDemo1">
            <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
            <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
        </script>

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
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script>
    layui.use('table', function(){
        var table = layui.table;

        table.on('tool(demo)', function(obj){
            var data = obj.data;

            if(obj.event === 'edit'){
                layer.alert('编辑行：<br>'+ JSON.stringify(data))
            }
        });
    });
</script>
<script>
    layui.use('table', function(){
        var table = layui.table;

        table.on('tool(demo)', function(obj){
            var data = obj.data;

            if(obj.event === 'edit'){
                layer.alert('编辑行：<br>'+ JSON.stringify(data))
            }
        });
    });
</script>
<!-- -------------END:在这里编写页面的js代码------------- -->
</body>
</html>