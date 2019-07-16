<%--
  Created by IntelliJ IDEA.
  User: LEGEND
  Date: 2019/7/16
  Time: 18:09
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: 49510
  Date: 2019/7/16
  Time: 14:28
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
<!-- ===================================在这里编写HTML代码================================== -->
<div class="layui-card">
    <div class="layui-card-header">个人信息</div>
    <div class="layui-card-body">
        <form class="layui-form" action="">
            <div class="layui-form-item ">
                <label class="layui-form-label">姓名</label>
                <div class="layui-input-block">
                    <input type="text" name="name" id="name" required  lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item layui-col-md3">
                <label class="layui-form-label">性别</label>
                <div class="layui-input-block">
                    <input type="text" name="sex" id="sex" required  lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item layui-col-md4">
                <label class="layui-form-label">生日</label>
                <div class="layui-input-block">
                    <input type="text" class="layui-input" name="birthday" id="birthday" lay-verify="required">
                </div>
            </div>
            <div class="layui-form-item layui-col-md3">
                <label class="layui-form-label">电话</label>
                <div class="layui-input-block">
                    <input type="text" name="phone" id="phone" required  lay-verify="required|phone|number" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item layui-col-md5">
                <label class="layui-form-label">职业</label>
                <div class="layui-input-block">
                    <input type="text" name="occupation" id="occupation" required  lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item layui-col-md3">
                <label class="layui-form-label">月收入</label>
                <div class="layui-input-block">
                    <input type="text" name="salary" id="salary" required  lay-verify="required|number" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item layui-col-md3">
                <label class="layui-form-label">家庭角色</label>
                <div class="layui-input-block">
                    <input type="text" name="role" id="role" required  lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item layui-col-md3">
                <label class="layui-form-label">权限</label>
                <div class="layui-input-block">
                    <input type="text" name="auid" id="auid" required  lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="EditSubmit">确认修改</button>
                </div>
            </div>
        </form>
    </div>
</div>
<!-- ================================END：在这里编写HTML代码================================ -->
<!-- 导入代码库文件 -->
<jsp:include page="include/jser.jsp"/>
<!-- END：代码库文件 -->
<!-- ================================在这里编写页面的js代码================================ -->
<script>
    var info = eval('('+parent.info+')');

    $("#name").val(info.name);
    $("#age").val(parent.info);
    $("#birthday").val(util.date.format(info.birthday, "yyyy-MM-dd"));
    $("#phone").val(info.phone);
    $("#occupation").val(info.occupation);
    $("#salary").val(info.salary);
    $("#role").val(info.role);
    var sex = info.sex;
    if(sex == 0) {
        $("#sex").val("男");
    }else {
        $("#sex").val("女");
    }
    var auid = info.auid;
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
            ,type:'date'
        });
    });


    layui.use('form', function(){
        var form = layui.form;

        //监听提交
        form.on('submit(EditSubmit)', function(data){
            layer.msg(JSON.stringify(data.field));

            var sex = data.field.sex;
            if(sex == "男") {
                var sexx = 0;
            }else {
                var sexx = 1;
            }

            var auid = data.field.auid;
            if(auid == "家长") {
                var a = 1;
            }else {
                var a = 2;
            }

            var user = {
                "uid":info.uid,
                "name": data.field.name,
                "birthday": new Date(data.field.birthday),
                "sex": parseInt(sexx),
                "occupation": data.field.occupation,
                "salary": parseFloat(data.field.salary).toFixed(2),
                "phone": data.field.phone,
                "motto": data.field.motto,
                "role": data.field.role,
                "auid": a,
                "fid":data.field.fid
            };
            // 上载信息
            util.httpRequest.post("userEdit", user, function (msg) {
                if (msg.code === 200) {
                    layer.msg("修改成功");
                    //window.location.href = "list";
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
    });//--%>
</script>
<!-- ================================END:在这里编写页面的js代码================================ -->
</body>
</html>

