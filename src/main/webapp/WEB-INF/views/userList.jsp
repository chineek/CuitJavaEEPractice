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
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <!-- 导入导航条 -->
    <jsp:include page="include/leader.jsp"/>
    <!-- END：导航条 -->
    <div class="layui-body layui-bg-gray">
        <!-- ===================================在这里编写HTML代码================================== -->
        <div class="layui-fluid">
            <div class="layui-row layui-col-space15">
                <div class="layui-card">
                    <div class="layui-card-header">家庭成员列表</div>
                    <div class="layui-card-body" pad15>
                        <form class="layui-form" action="">
                            <div class="layui-form-item">
                                <a href="${rootPath}user/add" class="layui-btn">添加成员</a>
                            </div>
                            <div class="layui-table">
                                <table class="layui-hide" id="userList" lay-filter="test"></table>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%--
        <title>用户列表</title>
        <c:forEach items="${user}" var="user">
            <tr><td>用户id</td><td>${user.uid}</td></tr>
            <tr><td>姓名</td><td>${user.name}</td></tr>
            <tr><td>密码</td><td>${user.password}</td></tr>
            <a href="UserEdit?uid=${user.uid}"><button class="UserEdit">编辑</button></a>
            <a href="UserDelete?uid=${user.uid}"><button class="UserDelete">删除</button></a>
        </c:forEach>
        --%>
        <!-- ================================END：在这里编写HTML代码================================ -->
    </div>
    <!-- 导入底部 -->
    <jsp:include page="include/footer.jsp"/>
    <!-- END：底部 -->
</div>
<!-- 导入代码库文件 -->
<jsp:include page="include/jser.jsp"/>
<!-- END：代码库文件 -->
<!-- 操作按钮-->
<script type="text/html" id="userEditBar">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<!-- ================================在这里编写页面的js代码================================ -->
<script>
    //表格js
    layui.use('table', function () {
        var table = layui.table;

        table.render({
            elem: '#userList'
            , minHeight: 220
            , url: '/user/getUserList' //数据接口
            , method: 'post'
            , where: {
                "user": {
                    "uid":<%=user.getUid()%>
                }
            }
            , contentType: 'application/json'
            , even: true
            , page: true //是否显示分页
            , limits: [3, 5, 8, 10, 20]  //每页显示数量选择
            , limit: 8 //每页默认显示的数量
            , first: true//显示首页
            , last: true //显示尾页
            , cols: [[ //表头
                {field: 'name', title: '姓名'}
                , {
                    field: 'age', title: '年龄', width: 80,
                    templet: function (item) {
                        return parseInt(util.date.getAge(item.birthday)) + "岁";
                    }
                }
                , {
                    field: 'sex', title: '性别', width: 80, sort: true,
                    templet: function (item) {
                        if (parseInt(item.sex) === 0) {
                            return "男";
                        } else {
                            return "女";
                        }
                    }
                }
                , {
                    field: 'birthday', title: '生日', width: 110, sort: true,
                    templet: function (item) {
                        return util.date.format(item.birthday, "yyyy-MM-dd");
                    }
                }
                , {field: 'occupation', title: '职业', sort: true}
                , {field: 'phone', title: '电话', sort: true}
                , {field: 'role', title: '家庭角色', sort: true}
                , {
                    field: 'auid', title: '成员权限', sort: true,
                    templet: function (item) {
                        if (parseInt(item.sex) === 0) {
                            return "家长";
                        } else {
                            return "普通成员";
                        }
                    }
                }
                , {
                    field: 'salary', title: '薪资', sort: true,
                    templet: function (item) {
                        return parseFloat(item.salary).toFixed(2);
                    }
                }
                , {fixed: 'right', title: '操作', width: 150, toolbar: '#userEditBar'}
            ]]
        })
    })
</script>
<script>
    table.on('tool(test)',function(user){
        var data=user.data,
            layEvent=user.event;
        if(layEvent==='detail'){
            lay.msg("查看操作");
        }
        else if(layEvent==='del'){
            layer.confirm('是否删除',function(index){
                user.del();
                layer.close(index);
            });
        }
        else if(layEvent==='edit'){
            layer.msg('编辑操作')
        }
    });
</script>
<!-- ================================END:在这里编写页面的js代码================================ -->
</body>
</html>