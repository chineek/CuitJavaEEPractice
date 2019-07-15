<%--
  Created by IntelliJ IDEA.
  User: CTDZ
  Date: 2019/7/15
  Time: 9:30
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("rootPath", "/");
%>

<html>
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
        <div style="padding: 12px;">
        <table class="layui-table" id="ATlist" lay-filter="demo"></table>
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
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script>
    layui.use('table', function() {
        var table = layui.table;
        table.render({
            elem: '#ATlist'
            , height: 315
            , url: '/accountType/list'
            , page:false
            , cols: [[
                {type: 'checkbox'}
                , {field: 'tid', title: '编号',width: 80}
                , {field: 'name', title: '类型名称',width: 120}
                , {field: 'description', title: '类型描述',width: 300}
            ]]
            ,parseData: function(res) { //res 即为原始返回的数据
                console.log(res);
                return {
                    "code": 0, //解析接口状态
                    "msg": res.msg, //解析提示文本
                    "count": res.count,
                    "data": res.data//解析数据列表
                };
            }
        });
    });
        // //监听表格复选框选择
        // table.on('checkbox(demo)', function(obj){
        //     console.log(obj)
        // });
        // //监听工具条
        // table.on('tool(demo)', function(obj){
        //     var data = obj.data;
        //     if(obj.event === 'detail'){
        //         layer.msg('ID：'+ data.id + ' 的查看操作');
        //     } else if(obj.event === 'del'){
        //         layer.confirm('真的删除行么', function(index){
        //             obj.del();
        //             layer.close(index);
        //         });
        //     } else if(obj.event === 'edit'){
        //         layer.alert('编辑行：<br>'+ JSON.stringify(data))
        //     }
        // });
        //
        // var $ = layui.$, active = {
        //     getCheckData: function(){ //获取选中数据
        //         var checkStatus = table.checkStatus('idTest')
        //             ,data = checkStatus.data;
        //         layer.alert(JSON.stringify(data));
        //     }
        //     ,getCheckLength: function(){ //获取选中数目
        //         var checkStatus = table.checkStatus('idTest')
        //             ,data = checkStatus.data;
        //         layer.msg('选中了：'+ data.length + ' 个');
        //     }
        //     ,isAll: function(){ //验证是否全选
        //         var checkStatus = table.checkStatus('idTest');
        //         layer.msg(checkStatus.isAll ? '全选': '未全选')
        //     }
        // };
        //
        // $('.demoTable .layui-btn').on('click', function(){
        //     var type = $(this).data('type');
        //     active[type] ? active[type].call(this) : '';
        // });

</script>
<!-- ================================END:在这里编写页面的js代码================================ -->
</body>
</html>
