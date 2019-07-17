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
    <div class="layui-body layui-bg-gray" style="padding: 12px;">
        <!-- ===================================在这里编写HTML代码================================== -->
        <%--<h1 align=center></h1>--%>
        <div class="layui-row layui-col-space20" >
            <h1 align=center></h1>
            <div class="layui-col-lg8">
                <h1 align=center>类型管理</h1>
                <table class="layui-table" id="ATlist" lay-filter="test"></table></div>
            <div class="layui-col-lg4">
                <h1 align=center></h1>
                <div class="layui-card">
                    <div class="layui-card-header">账单类型添加</div>
                    <div class="layui-card-body">
                        <form class="layui-form" action="">
                        <div class="layui-form-item">
                            <label class="layui-form-label">账目类型</label>
                            <div class="layui-input-block">
                                <input type="text" name="name" lay-verify="name" id= "name" autocomplete="off" placeholder="请输入类型" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item layui-form-text">
                            <label class="layui-form-label">类型描述</label>
                            <div class="layui-input-block">
                                <textarea name="description" placeholder="请输入该类型描述" class="layui-textarea"></textarea>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button class="layui-btn" lay-submit="addtype" lay-filter="addtype">提交</button>
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
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script>
    layui.use(['form','table','layer'], function() {
        var table = layui.table,
            layer = layui.layer,
            form = layui.form;
        table.render({
            elem: '#ATlist'
            , url: '/accountType/list'
            , even: true
            , page: true //是否显示分页
            , limits: [3, 5, 8,10, 20]  //每页显示数量选择
            , limit: 5 //每页默认显示的数量
            , first: true//显示首页
            , last: true //显示尾页
            , cols: [[
                {type: 'checkbox',align:'center'}
                ,{field: 'tid', title: '编号',width:70,align:'center'}
                , {field: 'name', title: '类型名称',align:'center',width:90, edit: 'text'}
                , {field: 'description', title: '类型描述',align:'center',edit: 'text'}
                ,{field:'option', width:130,title: '操作',align:'center',toolbar:"#barDemo"}
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
        table.on('checkbox(test)', function(obj){
            console.log(obj)
        });
        table.on('tool(test)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的DOM对象
            if(layEvent === 'del'){ //删除
                layer.confirm('真的删除行么', function(index){
                    util.httpRequest.post("delete", {
                        "tid": data.tid,
                        "name": data.name,
                        "description": data.description
                    }, function (msg) {//向服务端发送删除指令
                      if (msg.code === 200) {
                          layer.msg(msg.info, {
                              offset: '100px'
                              , icon: 1
                              , time: 2000
                           });
                              // function () {
                          //     location.reload();
                          // });
                          obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                          layer.close(index);
                      }
                  });
                });
            } else if(layEvent === 'edit'){ //编辑
                layer.confirm('真的修改么', function(index){
                    util.httpRequest.post("edit", {
                        "tid": data.tid,
                        "name": data.name,
                        "description": data.description
                    }, function (msg) {//向服务端发送修改指令
                        if (msg.code === 200) {
                            layer.msg(msg.info, {
                                offset: '100px'
                                , icon: 1
                                , time: 2000
                            });
                        }
                    });
                });

                // //同步更新缓存对应的值
                // obj.update({
                //     username: '123'
                //     ,title: 'xxx'
                // });
            }
        });
        //账目类型判空验证
        form.verify({
            "name": function (value, item) {
                if (value == "") {
                    return "类型不能为空！";
                }
            },
        });
        //添加账目类型
        form.on('submit(addtype)', function (data) {
            console.log(data);
            util.httpRequest.post("addAccountType", {
                "name": data.field.name,
                "description": data.field.description
            }, function (msg) {
                if (msg.code === 200) {
                    layer.msg(msg.info, {
                        offset: '100px'
                        , icon: 1
                        , time: 2000
                    },function () {
                        location.reload();
                    });

                    // window.location.href = "log";
                }
            });
            return false;
        });
    });


</script>
<!-- ================================END:在这里编写页面的js代码================================ -->
</body>
</html>
