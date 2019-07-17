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
        <input type="hidden" name="acid" id="acid" value="48">
        <input type="hidden" name="uid" id="uid" value="2">
        <button class="layui-btn" lay-submit lay-filter="formDemo" id="add">&emsp;添加&emsp;</button>
        <button class="layui-btn" lay-submit lay-filter="formDemo" id="query">&emsp;查看&emsp;</button>
        <button class="layui-btn" lay-submit lay-filter="formDemo" id="delete">&emsp;删除&emsp;</button>
        <button class="layui-btn" lay-submit lay-filter="formDemo" id="modify">&emsp;修改&emsp;</button>
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
    $("#add").click(function(){
        var uid = $("#uid").serialize();
        $(window).attr('location','../accountInfo/addInfo?'+uid);
    })
    $("#query").click(function(){
        var acid = $("#acid").serialize();
        $(window).attr('location','../accountInfo/queryInfo?'+acid);
    })
    $("#delete").click(function(){
        $.ajax({
            url:"/accountInfo/deleteAccount",
            type:"POST",
            async:false,
            data:$("#acid").serialize(),
            success:function(result){
                if(result == "success"){
                    window.alert("账单删除成功！");
                }else{
                    window.alert("账单删除失败，请稍后重试！");
                }
            }
        });
    });
    $("#modify").click(function(){
        var acid = $("#acid").serialize();
        var uid = $("#uid").serialize();
        $(window).attr('location','../accountInfo/modifyInfo?'+acid+'&'+uid);
    })

</script>
<!-- ================================END:在这里编写页面的js代码================================ -->
</body>
</html>