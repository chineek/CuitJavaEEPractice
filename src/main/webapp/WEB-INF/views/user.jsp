<%--
  Created by IntelliJ IDEA.
  User: 49510
  Date: 2019/7/14
  Time: 14:31
  To change this template use File | Settings | File Templates.
--%>
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
                    <div class="layui-card-header">个人中心</div>
                    <c:forEach items="${user}" var="user1">
                        <div class="layui-card-body">
                            <form class="layui-form" action="">
                                <div class="layui-form-item layui-col-md4">
                                    <label class="layui-form-label">姓名</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="name" required  lay-verify="required" value="${user1.name}" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">密码</label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="pass" id="pass" required lay-verify="required" value="${user1.password}" autocomplete="off" class="layui-input">
                                    </div>
                                    <div class="layui-form-mid layui-word-aux">6到12位数字或字母</div>
                                </div>
                                <div class="layui-form-item layui-col-md3">
                                    <label class="layui-form-label">性别</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="name" required  lay-verify="required" value="${user1.sex}" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item layui-col-md4">
                                    <label class="layui-form-label">生日</label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" name="birthday" id="birthDate" lay-verify="required" value="${user1.birthday}">
                                    </div>
                                </div>
                                <div class="layui-form-item layui-col-md3">
                                    <label class="layui-form-label">电话</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="phone" required  lay-verify="required|phone|number" value="${user1.phone}" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item layui-col-md5">
                                    <label class="layui-form-label">人生目标</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="motto" required  lay-verify="required" value="${user1.motto}" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item layui-col-md3">
                                    <label class="layui-form-label">月收入</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="salary" required  lay-verify="required|number" value="${user1.salary}" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item layui-col-md3">
                                    <label class="layui-form-label">家庭角色</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="role" required  lay-verify="required" value="${user1.role}" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item layui-col-md3">
                                    <label class="layui-form-label">权限</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="auid" required  lay-verify="required" value="${user1.auid}" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item layui-col-md3">
                                    <label class="layui-form-label">家庭ID</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="fid" required  lay-verify="required" value="${user1.fid}" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <div class="layui-input-block">
                                        <button class="layui-btn" lay-submit lay-filter="user-edit-submit">立即提交</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </c:forEach>
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
    form.on('submit(user-edit-submit)', function(data){
        layer.msg(JSON.stringify(data.field));

        var user = {
            "name": data.field.name,
            "pass": sha256_digest(data.field.pass),
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
            "fid":data.field.fid
        };
        // 上载信息
        util.httpRequest.post("userEdit", user, function (msg) {
            if (msg.code === 200) {
                layer.alert(msg.info, {
                    title: "添加结果"
                },function() {
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
</script>
<!-- ================================END:在这里编写页面的js代码================================ -->
</body>
</html>
