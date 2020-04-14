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
    <title>运动场地管理 - 校园活动场地管理系统</title>
    <jsp:include page="include/head.jsp"/>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <!-- 导入导航条 -->
    <jsp:include page="include/leader.jsp"/>
    <!-- END：导航条 -->
    <div class="layui-body layui-bg-gray">
        <!-- ===================================在这里编写HTML代码================================== -->
        <div class="layui-card" style="margin-left:30px;margin-right:30px;margin-top:30px;">
            <div class="layui-card-header">添加租单</div>
            <div class="layui-card-body">
                <form class="layui-form layui-form-pane" id="accountInfo" method="post">
                    <div class="layui-form-item" pane>
                        <label class="layui-form-label">人数</label>
                        <div class="layui-input-block">
                            <input type="text" lay-verify="required|number" id="amount" name="amount" placeholder=""
                                   autocomplete="off" class="layui-input" value="">
                        </div>
                    </div>
                    <div class="layui-form-item" pane>
                        <label class="layui-form-label">场地状态</label>
                        <div class="layui-input-block">
                            <input type="radio" name="ietype" value="0" title="已结束">
                            <input type="radio" name="ietype" value="1" title="使用中" checked>
                        </div>
                    </div>
                    <div class="layui-form-item" pane>
                        <label class="layui-form-label">是否公开</label>
                        <div class="layui-input-block">
                            <input type="radio" name="isExpose" value="1" title="公开">
                            <input type="radio" name="isExpose" value="0" title="私密" checked>
                        </div>
                    </div>
                    <div class="layui-form-item" pane>
                        <label class="layui-form-label">场地位置</label>
                        <div class="layui-input-block">
                            <select lay-verify="required" name="tid" id="select_id">
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item" pane>
                        <label class="layui-form-label">备注</label>
                        <div class="layui-input-block">
                            <textarea name="remarks" placeholder="请输入备注信息" class="layui-textarea" value=""></textarea>
                        </div>
                    </div>
                    <input type="hidden" name="uid" value="${uid}" id="uid">
                    <div class="layui-form-item">
                        <div class="layui-input-block" style="text-align:center">
                            <button class="layui-btn" lay-submit lay-filter="accountCommit" id="commit">&emsp;提交&emsp;
                            </button>
                            <button type="reset" class="layui-btn layui-btn-primary">&emsp;重置&emsp;</button>
                        </div>
                    </div>
                </form>
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
    function renderform() {
        layui.use('form', function () {
            var form = layui.form;
            form.render();
            form.on('submit(accountCommit)', function (data) {
                $.ajax({
                    url: "/accountInfo/saveAccount",
                    type: "POST",
                    data: $("#accountInfo").serialize(),
                    success: function (result) {
                        if (result === "success") {
                            $(window).attr("location", "${rootPath}account/list");
                        } else {
                            layer.msg("添加失败，请稍后重试！", {
                                offset: '50px'
                                , icon: 2
                                , time: 1000
                            });
                        }
                    }
                });
                return false;
            });
        });
    }

    //页面加载时响应
    $(function () {
        $.ajax({
            url: "/accountInfo/queryAccountType",
            type: "GET",
            success: function (result) {
                renderform();
                showAccountType(result);
            }
        })
    });

    //显示账单类型
    function showAccountType(result) {
        var list = result;
        $("<option value=" + "''" + ">请选择</option>").appendTo("#select_id");
        $.each(list, function (index, item) {
            $("<option></option>").val(item.tid).text(item.name).appendTo("#select_id");
        });
    }

    //表单提交验证
    function check() {
        if ($("#amount").val() === "") {
            window.alert("请输入人数！");
            $("#amount").focus();
            return false;
        }
        if ($("#select_id").val() === "") {
            window.alert("请选择地址！");
            $("#select_id").focus();
            return false;
        }
        return true;
    }
</script>
<!-- ================================END:在这里编写页面的js代码================================ -->
</body>
</html>