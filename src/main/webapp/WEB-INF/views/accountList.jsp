<%@ page import="cn.edu.cuit.entity.User" %>
<%@ page import="cn.edu.cuit.entity.Account" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("rootPath", "/");
    User user = (User) request.getSession().getAttribute("user");
    Account account=(Account)request.getSession().getAttribute("account");
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
    <div class="layui-body" style="padding:30px 50px;">
        <!-- ===================================在这里编写HTML代码================================== -->
        <fieldset class="layui-elem-field layui-field-title" >
            <legend>账单详情</legend>
        </fieldset>
        <div class="layui-row">
            <form class="layui-form" action="">
                <div class="layui-form-item">
                    <div class="layui-input-inline" >
                        <select name="ietype" lay-filter="type">
                            <option value="2" selected="">全部</option>
                            <option value="0">收入</option>
                            <option value="1">支出</option>
                        </select>
                    </div>
                    <div class="layui-input-inline">
                        <select name="date1">
                            <option value="" selected="">请选择年份</option>
                            <option value="2019">2019年</option>
                            <option value="2018">2018年</option>
                            <option value="2017">2017年</option>
                        </select>
                    </div>
                    <div class="layui-input-inline">
                        <select name="date2">
                            <option value="" selected="">请选择月份</option>
                            <option value="1">1月</option>
                            <option value="2">2月</option>
                            <option value="3">3月</option>
                            <option value="4">4月</option>
                            <option value="5">5月</option>
                            <option value="6">6月</option>
                            <option value="7">7月</option>
                            <option value="8">8月</option>
                            <option value="9">9月</option>
                            <option value="10">10月</option>
                            <option value="11">11月</option>
                            <option value="12">12月</option>
                        </select>
                    </div>
                    <div class="layui-input-inline">
                        <%--<div class="layui-col-md10">--%>
                            <%--<div class="layui-col-md2">--%>
                                <button type="button" class="layui-btn layui-btn-lg" lay-event="add"
                                        style="float:right">添加账目
                                </button>
                                <%--<div style="clear:both;"></div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    </div>
                </div>
            </form>

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
                minHeight: 220,
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

    <script>
        //声明form
        layui.use(['form'],function () {
            var form=layui.form;
        });

        //添加layui选择框的监听事件
        form.on('select(type)', function(data){     //type是那个lay-filter的值
            var val=data.val();   // 获得选中的option的值
            alert(data.value);
            console.log(val);   //打印获取到的值
            // 发送一条post请求到"请求地址",返回data对象,并输出
            util.httpRequest.post("/account/getAccountByIEType", {"ietype":1}, function (accountlist) {
                console.log(accountlist);
            });
            form.render('select');//最后记得渲染
        });

    </script>

    <!-- ================================END:在这里编写页面的js代码================================ -->
</body>
</html>