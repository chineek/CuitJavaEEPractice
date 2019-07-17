<%@ page import="cn.edu.cuit.entity.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("rootPath", "/");
    Object userObj = request.getSession().getAttribute("user");
    User user = new User();
    if (userObj != null)
        user = (User) userObj;
    pageContext.setAttribute("isLogin", user);
    pageContext.setAttribute("auid", user.getAuid());
    pageContext.setAttribute("uid", user.getUid());
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
    <div class="layui-body">
        <!-- ===================================在这里编写HTML代码================================== -->
        <div style="padding: 20px 40px">

        <div style="padding: 50px;font-size:40px;" id="save">个人存款
            <button type="button" class="layui-btn"style="float:right" onclick=window.location.href="/savegoal/savegoal">添加新存款目标</button>
        </div>
            <div id="currentState">
        <div class="layui-form-item" id="currentGoal">
            <label class="layui-form-label"style="font-size: 15px">当前目标</label>
        </div>
        <div class="layui-progress layui-progress-big" id="completeState" style="width: 40%">
            <div class="layui-progress-bar" lay-percent="80%"style="text-align:center"></div>
            <div style="text-align: center">存款金额/目标金额</div>
        </div>
        <div class="layui-form">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <div class="layui-form-label" id="startDate">开始日期</div>
                </div>
            </div>

            <div class="layui-inline">
                <div class="layui-form-label" id="endDate">结束日期</div>
            </div>

        </div>
                <div>
                    <button type="button" class="layui-btn layui-btn-normal">提前完成</button>
                    <button type="button" class="layui-btn layui-btn-danger">取消目标</button>
                </div>
            </div>

        <div style="padding: 15px;font-size:20px;">历史存款目标</div>
        <table class="layui-hide" id="depositList"></table>
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

    layui.use(['element','table','layer'], function(){
        var table = layui.table;
        var element=layui.element;
        var layer=layui.layer;
        var uid=${uid};
        var state = $("#currentState");
        var initSelect = (function () {
            var uid =${uid};
            util.httpRequest.post("/savegoal/getCurrentGoal", {
                "uid": uid
            }, function getCurrentGoal(result) {
                $(state).empty();
                var currentState = result;
                var appendHtml = '';
                if(currentState.goal!=null) {
                    appendHtml += '<div class="layui-form-item" id="currentGoal">\n' +
                        '            <label class="layui-form"style="font-size: 15px">当前目标：' + currentState.remarks + '</label>\n' +
                        '        </div>\n' +
                        '        <div class="layui-progress layui-progress-big" lay-showPercent="yes" id="completeState" style="width: 40%">\n' +
                        '            <div class="layui-progress-bar" lay-percent="' + ((currentState.complete) + '/' + (currentState.goal)) + '" style="text-align:center"></div>\n' +
                        '        </div>\n' +
                        '        <div class="layui-form">\n' +
                        '            <div class="layui-form-item" style="padding-top: 10px;">\n' +
                        '                <div class="layui-inline">\n' +
                        '                    <div  id="startDate">开始日期：' + util.date.format(currentState.startDate, 'yyyy-MM-dd') + '</div>\n' +
                        '                </div>\n' +
                        '            </div>\n' +
                        '\n' +
                        '            <div class="layui-inline"style="padding-bottom: 20px">\n' +
                        '                <div  id="endDate">结束日期：' + util.date.format(currentState.endDate, 'yyyy-MM-dd') + '</div>\n' +
                        '            </div>\n' +
                        '</div>'+
                        '<div>';
                        if(currentState.complete>=currentState.goal) {
                            appendHtml += '  <button type="button" id="finish" class="layui-btn layui-btn-normal" onclick="">提前完成</button>\n' +
                                '  <button type="button" id="cancel" class="layui-btn layui-btn-danger" data-method="concel">取消目标</button>\n';
                        }else {
                            appendHtml += '<button type="button" id="cancel" class="layui-btn layui-btn-danger">取消目标</button>\n';
                        }
                    appendHtml +='  </div>';
                    $(state).append(appendHtml);
                    element.render();
                }else {
                    appendHtml += '<div class="layui-form-item" id="currentGoal">\n' +
                        '            <label class="layui-form"style="font-size: 20px">当前目标：当前没有需要完成的目标，请添加新的目标哦！</label>\n' +
                        '        </div>\n' ;
                    $(state).append(appendHtml);
                    element.render();
                }


            });
            return "initSuccess";
        })();
        table.render({
            elem: '#depositList'
            ,url:'/savegoal/getAllGoal'
            ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增,
            ,contentType: 'application/json'
            , method: 'post'
            ,where:{
                    "uid":uid
            }
            ,cols: [[
                {field:'amount', title: '目标', sort: true, align: 'center',
                    templet: function (item) {  //将金额设置为两位小数显示
                        return parseFloat(item.amount).toFixed(2)
                    }
                }
                ,{field:'startDate', title: '起始时间', align: 'center',
                    templet: function (item) {  //时间设置为格式化显示
                        return util.date.format(item.startDate, "yyyy-MM-dd")}}
                ,{field:'endDate', title: '结束时间', sort: true, align: 'center',
                    templet: function (item) {
                        return util.date.format(item.endDate, "yyyy-MM-dd")
                    }}
                ,{field:'remarks', title: '目标内容', align: 'center',
                    templet: function (item) {
                        return item.remarks;
                    }}
                ,{field:'is_complete', title: '是否完成', align: 'center',
                    templet: function (item) {  //将类型数字转换为对应类型
                        var typeInt = parseInt(item.isComplete);
                        if (typeInt === 1) {
                            return "完成";
                        } else if (typeInt === 2) {
                            return "未完成";
                        }
                    }}
            ]]
            , even: true
            , page: true //是否显示分页
            , limits: [5, 8, 10, 20, 30, 50]  //每页显示数量选择
            , limit: 5 //每页默认显示的数量
            , first: true//显示首页
            , last: true //显示尾页
        });
        /**
         * 监听事件
         */
        //监听鼠标点击
       function cancel() {
            layer.open({
                title: '在线调试'
                ,content: '可以填写任意的layer代码'
            });
        }
        $(state).on("click","#cancel",function () {
            cancel();
        });
    });
</script>

<!-- ================================END:在这里编写页面的js代码================================ -->
</body>
</html>