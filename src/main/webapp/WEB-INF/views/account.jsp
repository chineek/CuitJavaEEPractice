<%@ page import="cn.edu.cuit.entity.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("rootPath", "/");
    User user = (User) request.getSession().getAttribute("user");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>生财有道 - 您的家庭理财好助手</title>
    <jsp:include page="include/head.jsp"/>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <!-- 导入导航条 -->
    <jsp:include page="include/leader.jsp"/>
    <!-- END：导航条 -->
    <div class="layui-body" style="padding:40px 60px;">
        <!-- ===================================在这里编写HTML代码================================== -->
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 1%;padding-bottom: 1%">
            <legend>账单详情</legend>
        </fieldset>
        <div class="layui-row">
            <div class="layui-col-md10">
傻大姐
            </div>
            <div class="layui-col-md2">
                <button type="button" class="layui-btn layui-btn-lg" lay-event="add"
                        style="align-self: center;float: right;">添加账目
                </button>
                <div style="clear:both;"></div>
            </div>
        </div>
        <div class="layui-table">
            <table class="layui-hide" id="accountList"></table>
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

<!-- 操作按钮-->
<script type="text/html" id="accountListToolBarItem">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script>
    layui.use('table', function () {
        var table = layui.table;
        //展示已知数据
        table.render({
            elem: '#accountList',
            title: '账单详情',
            url: '/account/getAccountByCombination',
            method: 'post',
            contentType: 'application/json',
            where: {
                'uid':<%= user.getUid()%>
            },
            cols: [[ //标题栏
                {
                    field: 'ietype',
                    title: '类型',
                    minWidth: 150,
                    templet: function (item) {  //将类型数字转换为对应类型
                        var typeInt = parseInt(item.ietype);
                        if (typeInt === 0) {
                            return "收入";
                        } else if (typeInt === 1) {
                            return "支出";
                        }
                    }
                }
                , {field: 'amount', title: '金额', minWidth: 150, sort: true}
                , {
                    field: 'date', title: '时间', minWidth: 150, sort: true,
                    templet: function (item) {  //将类型数字转换为对应类型
                        return util.date.format(item.date, "yyyy-MM-dd hh:mm")
                    }
                }
                , {field: 'remarks', title: '备注', minWidth: 150}
                , {field: 'option', title: '操作', toolbar: '#accountListToolBarItem', minWidth: 200}
            ]]
            , even: true
            , page: true //是否显示分页
            , limits: [5, 8, 10, 20]  //每页显示数量选择
            , limit: 8 //每页默认显示的数量
            , first: true//显示首页
            , last: true //显示尾页
        });
    });
</script>

<!-- ================================END:在这里编写页面的js代码================================ -->
</body>
</html>