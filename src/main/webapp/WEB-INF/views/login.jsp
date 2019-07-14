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
    <!-- 登录界面样式 -->
    <link rel="stylesheet" href="${rootPath}css/login.css">
    <link rel="stylesheet" href="${rootPath}css/admin.css">
    <link rel="stylesheet" href="${rootPath}css/layer.css">
    <script src="${rootPath}js/sha256.js"></script>
    <!-- END：登录界面样式 -->
</head>
<body class="layui-layout-body" layadmin-themealias="default">
<div class="layui-layout layui-layout-admin">
    <div class="layadmin-user-login layadmin-user-display-show" id="LAY-user-login" style="display: none;">
        <div class="layadmin-user-login-main">
            <div class="layadmin-user-login-box layadmin-user-login-header">
                <h2>生财有道 - 登录</h2>
                <p>您家庭的理财好助手。</p>
            </div>
            <div class="layadmin-user-login-box layadmin-user-login-body layui-form" lay-filter="user-login-form">
                <div class="layui-form-item">
                    <label class="layadmin-user-login-icon layui-icon layui-icon-username"
                           for="LAY-user-login-username"></label>
                    <input autocomplete="off" type="text" name="name" id="LAY-user-login-username" lay-verify="required"
                           placeholder="姓名" class="layui-input">
                </div>
                <div class="layui-form-item">
                    <label class="layadmin-user-login-icon layui-icon layui-icon-password"
                           for="LAY-user-login-password"></label>
                    <input autocomplete="off" type="password" name="password" id="LAY-user-login-password" lay-verify="required"
                           placeholder="密码" class="layui-input">
                </div>
                <div class="layui-form-item" style="margin-bottom: 20px;">
                    <input type="checkbox" name="remember" lay-skin="primary" title="记住密码">
                    <div class="layui-unselect layui-form-checkbox" lay-skin="primary"><span>记住密码</span><i
                            class="layui-icon layui-icon-ok"></i></div>
                    <a href="forget" class="layadmin-user-jump-change layadmin-link"
                       style="margin-top: 7px;">忘记密码？</a>
                </div>
                <div class="layui-form-item">
                    <button class="layui-btn layui-btn-fluid" lay-submit="" lay-filter="user-login-submit">登 入
                    </button>
                </div>
                <div class="layui-trans layui-form-item layadmin-user-login-other">
                    <label>社交账号登入</label>
                    <a href="javascript:;"><i class="layui-icon layui-icon-login-qq"></i></a>
                    <a href="reg" class="layadmin-user-jump-change layadmin-link">注册新家庭</a>
                </div>
            </div>
        </div>

        <div class="layui-trans layadmin-user-login-footer">
            <p>© 生财有道开发部 - 成都东软软件股份有限公司</p>
        </div>
    </div>
</div>
<!-- 导入代码库文件 -->
<jsp:include page="include/jser.jsp"/>
<!-- END：代码库文件 -->
<!-- ================================在这里编写页面的js代码================================ -->
<script>
    layui.use(['form', 'element', 'layer'], function () {
        var form = layui.form,
            element = layui.element,
            layer = layui.layer;

        //初始值赋值
        var user = util.data.get("userInfo");
        console.log(user);
        if (user !== null && user !== undefined) {
            form.val("user-login-form", {
                "name": user.name,
                "password": user.password,
                "remember": true
            });
        }
        //监听提交
        form.on('submit(user-login-submit)', function (data) {
            // 首先配置记住密码
            var userInfo = {
                "name": data.field.name,
                "password": data.field.password
            };
            var isRemember = !!data.field.remember;
            if (isRemember) {
                util.data.set("userInfo", userInfo);
            } else {
                util.data.remove("userInfo");
            }
            // 上载信息
            userInfo.password = sha256_digest(data.field.password);
            util.httpRequest.post("do", userInfo, function (msg) {
                if (msg.code === 200) {
                    window.location.href = "/index";
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