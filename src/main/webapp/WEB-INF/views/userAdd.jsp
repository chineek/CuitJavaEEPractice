<%@ page import="cn.edu.cuit.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: 49510
  Date: 2019/7/15
  Time: 15:04
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("rootPath", "/");
    pageContext.setAttribute("user", (User) request.getSession().getAttribute("user"));
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>运动场地管理 - 校园活动场地管理系统</title>
    <jsp:include page="include/head.jsp"/>
    <script src="${rootPath}js/sha256.js"></script>
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
                <div class="layui-card" pad15>
                    <div class="layui-card-header">添加家庭成员</div>
                    <div class="layui-card-body">
                        <form class="layui-form" action="">
                            <div class="layui-form-item layui-col-md4">
                                <label class="layui-form-label">姓名</label>
                                <div class="layui-input-block">
                                    <input type="text" name="name" required lay-verify="required" placeholder="请输入姓名"
                                           autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">性别</label>
                                <div class="layui-input-block">
                                    <input type="radio" name="sex" value="0" title="男">
                                    <input type="radio" name="sex" value="1" title="女" checked>
                                </div>
                            </div>
                            <div class="layui-form-item layui-col-md3">
                                <label class="layui-form-label">生日</label>
                                <div class="layui-input-block">
                                    <input type="text" class="layui-input" name="birthday"
                                           id="LAY-user-reg-birthday" lay-verify="date" placeholder="点击选择生日">
                                </div>
                            </div>
                            <div class="layui-form-item layui-col-md4">
                                <label class="layui-form-label">职业</label>
                                <div class="layui-input-block">
                                    <input type="text" name="occupation" required lay-verify="required"
                                           placeholder="请输入职业" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item layui-col-md4">
                                <label class="layui-form-label">电话</label>
                                <div class="layui-input-block">
                                    <input type="text" name="phone" required lay-verify="required|phone|number"
                                           placeholder="请输入电话" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item layui-col-md5">
                                <label class="layui-form-label">人生目标</label>
                                <div class="layui-input-block">
                                    <input type="text" name="motto" required lay-verify="required" placeholder="请输入人生目标"
                                           autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item layui-col-md3">
                                <label class="layui-form-label">月收入</label>
                                <div class="layui-input-block">
                                    <input type="text" name="salary" required lay-verify="required|number"
                                           placeholder="请输入月收入" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item layui-col-md3">
                                <label class="layui-form-label">家庭角色</label>
                                <div class="layui-input-block">
                                    <input type="text" name="role" required lay-verify="required" placeholder="请输入家庭角色"
                                           autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">权限</label>
                                <div class="layui-input-block">
                                    <input type="radio" name="auid" value="1" title="家长">
                                    <input type="radio" name="auid" value="2" title="成员" checked>
                                </div>
                            </div>
                            <div class="layui-form-item layui-col-md3 layui-hide">
                                <label class="layui-form-label">家庭ID</label>
                                <div class="layui-input-block">
                                    <input type="hidden" name="fid" value="${user.fid}" autocomplete="off"
                                           class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">密码设置</label>
                                <div class="layui-input-inline">
                                    <input type="password" name="pass" id="pass" required lay-verify="required"
                                           placeholder="请输入密码" autocomplete="off" class="layui-input">
                                </div>
                                <div class="layui-form-mid layui-word-aux">6到12位数字或字母</div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">重复密码</label>
                                <div class="layui-input-inline">
                                    <input type="password" name="repass" id="repass" required
                                           lay-verify="required|repass" placeholder="请再次输入密码" autocomplete="off"
                                           class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-input-block">
                                    <button class="layui-btn" lay-submit lay-filter="user-add-submit">添加用户</button>
                                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
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
<!-- ================================在这里编写页面的js代码================================ -->
<script>
    //日期组件js
    layui.use('laydate', function () {
        var laydate = layui.laydate;
        laydate.render({
            elem: '#LAY-user-reg-birthday' //指定元素
            , type: 'date'
        });
    });

    layui.use('form', function () {
        var form = layui.form;

        //重复密码判断
        form.verify({
            repass: function (value) {
                var pass = $("#pass").val();
                if (!new RegExp(pass).test(value)) {
                    return '两次输入的密码不一致';
                }
            }
        });

        //监听提交
        form.on('submit(user-add-submit)', function (data) {
            layer.msg(JSON.stringify(data.field));

            var user = {
                "name": data.field.name,
                "password": sha256_digest(data.field.pass),
                "birthday": new Date(data.field.birthday),
                "sex": parseInt(data.field.sex),
                "occupation": data.field.occupation,
                "salary": parseFloat(data.field.salary).toFixed(2),
                "phone": data.field.phone,
                "motto": data.field.motto,
                "role": data.field.role,
                "avatar": "default",
                "auid": data.field.auid,
                "isAvaliable": 1,
                "createDate": new Date(),
                "fid": data.field.fid
            };
            // 上载信息
            util.httpRequest.post("userAdd", user, function (msg) {
                if (msg.code === 200) {
                    layer.alert(msg.info, {
                        title: "添加结果"
                    }, function () {
                        window.location.href = "list";
                    });
                } else {
                    layer.msg(msg.info, {
                        offset: '50px'
                        , icon: 2
                        , time: 1000
                    });
                }
            });
            return false;
        });
    });
</script>
<!-- ================================END:在这里编写页面的js代码================================ -->
</body>
</html>

