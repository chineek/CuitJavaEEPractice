<%@ page import="cn.edu.cuit.entity.User" %><%--
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
    User user = (User)request.getSession().getAttribute("user");
    Integer sex = user.getSex();
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
                        <div class="layui-card-body">
                            <form class="layui-form" action="">
                                <div class="layui-form-item layui-col-md4">
                                    <label class="layui-form-label">姓名</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="name" required  lay-verify="required" value="${userInfo.name}" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item layui-col-md3">
                                    <label class="layui-form-label">性别</label>
                                    <div class="layui-input-block">
                                        <%if(sex == 0){%>
                                        <input type="text" name="sex" required  lay-verify="required" value="男" autocomplete="off" class="layui-input">
                                        <%}%>
                                        <%if(sex == 1){%>
                                        <input type="text" name="sex" required  lay-verify="required" value="女" autocomplete="off" class="layui-input">
                                        <%}%>
                                    </div>
                                </div>
                                <div class="layui-form-item layui-col-md4">
                                    <label class="layui-form-label">生日</label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" name="birthday" id="birthday" lay-verify="date">
                                    </div>
                                </div>
                                <div class="layui-form-item layui-col-md3">
                                    <label class="layui-form-label">电话</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="phone" required  lay-verify="required|phone|number" value="${userInfo.phone}" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item layui-col-md3">
                                    <label class="layui-form-label">职业</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="occupation" required  lay-verify="required" value="${userInfo.occupation}" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item layui-col-md5">
                                    <label class="layui-form-label">人生目标</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="motto" required  lay-verify="required" value="${userInfo.motto}" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item layui-col-md3">
                                    <label class="layui-form-label">月收入</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="salary" required  lay-verify="required|number" value="${userInfo.salary}" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item layui-col-md3">
                                    <label class="layui-form-label">家庭角色</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="role" required  lay-verify="required" value="${userInfo.role}" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item layui-col-md3">
                                    <label class="layui-form-label">权限</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="auid"  id="auid" required  lay-verify="required" value="${userInfo.auid}" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item layui-col-md3">
                                    <label class="layui-form-label">家庭ID</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="fid" required  lay-verify="required" value="${userInfo.fid}" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <div class="layui-input-block">
                                        <button class="layui-btn" lay-submit lay-filter="userEditSubmit">立即提交</button>
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
    //转换日期格式
    var date = "${userInfo.birthday}";
    $("#birthday").val(util.date.format(date, "yyyy-MM-dd"));

    //转换auid格式
    var auid = "${userInfo.auid}";
    if(auid == 1) {
        $("#auid").val("家长");
    }else {
        $("#auid").val("普通成员");
    }

    //日期组件js
    layui.use('laydate', function () {
        var laydate = layui.laydate;
        laydate.render({
            elem: '#birthday' //指定元素
            //,value:'$//{userInfo.birthday}'
            ,format:'yyyy-MM-dd'
        });
    });

    layui.use('form', function(){
        var form = layui.form;

        //监听提交
        form.on('submit(userEditSubmit)', function(data){
            layer.msg(JSON.stringify(data.field));

            var user = {
                "uid":${userInfo.uid},
                "name": data.field.name,
                "birthday": new Date(data.field.birthday),
                "sex": parseInt(data.field.sex),
                "occupation": data.field.occupation,
                "salary": parseFloat(data.field.salary).toFixed(2),
                "phone": data.field.phone,
                "motto": data.field.motto,
                "role": data.field.role,
                "auid": data.field.auid,
                "fid":data.field.fid
            };
            // 上载信息
            util.httpRequest.post("userEdit", user, function (msg) {
                if (msg.code === 200) {
                    window.location.href = "center";
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
