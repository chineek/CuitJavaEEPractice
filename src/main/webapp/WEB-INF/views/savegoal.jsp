<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="cn.edu.cuit.entity.User" %>
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
    <link rel="stylesheet" href="${rootPath}css/saveGoal.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <!-- 导入导航条 -->
    <jsp:include page="include/leader.jsp"/>
    <!-- END：导航条 -->
    <div class="layui-body layui-bg-gray">
        <!-- ===================================在这里编写HTML代码================================== -->
        <div style="padding: 15px; background-color: #F2F2F2;">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md6">
                    <div class="layui-card" style="padding-top: 1%;padding-right: 3%;padding-bottom: 1%">
                        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 2%;padding-bottom: 1%">
                            <legend>设定存款目标</legend>
                        </fieldset>
                        <form class="layui-form" action="">
                            <c:if test="${auid==1}">
                                <div class="layui-form-item">
                                    <label class="layui-form-label">成员选择</label>
                                    <div class="layui-input-block" name="select">
                                        <select name="members" id="LAYMembersSelect" lay-filter="member">

                                            <option value="0" selected="">自己</option>
                                            <option value="1">儿子</option>
                                            <option value="2">女儿</option>
                                        </select>
                                    </div>
                                </div>
                            </c:if>

                            <div class="layui-form-item">
                                <label class="layui-form-label">目标设定</label>
                                <div class="layui-input-block">
                                    <input name="goal" class="layui-input" type="text" placeholder="￥"
                                           autocomplete="off"
                                           lay-verify="goal">
                                </div>
                            </div>


                            <div class="layui-form-item layui-form-text">
                                <label class="layui-form-label">目标内容</label>
                                <div class="layui-input-block">
                                    <input name="content" class="layui-input" type="text" placeholder="请输入内容"
                                           autocomplete="off">
                                </div>
                            </div>

                            <div class="layui-form-item">
                                <div class="layui-inline" style="width: 60%">
                                    <label class="layui-form-label">起始时间</label>
                                    <div class="layui-input-block">
                                        <input name="startDate" class="layui-input" id="startDate" type="text"
                                               autocomplete="off"
                                               lay-verify="time1">
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-inline" style="width: 60%">
                                    <label class="layui-form-label">结束时间</label>
                                    <div class="layui-input-block">
                                        <input name="endDate" class="layui-input" id="endDate" type="text"
                                               autocomplete="off" lay-verify="time2">
                                    </div>
                                </div>
                            </div>

                            <div class="layui-form-item">
                                <div class="layui-input-block">
                                    <button class="layui-btn" lay-filter="add" lay-submit="">确认添加</button>
                                    <button class="layui-btn layui-btn-primary" type="reset">重置</button>
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
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form
            , layer = layui.layer
            , layedit = layui.layedit
            , laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#startDate'
        });
        laydate.render({
            elem: '#endDate'
        });


        //自定义验证规则
        form.verify({
            title: function (value) {
                if (value.length < 5) {
                    return '标题至少得5个字符啊';
                }
            }

            , goal: function (value) {
                if (value === "") {
                    return '要有梦想啊，目标不能为空啊';
                } else if (isNaN(value)) {
                    return '目标金额必须是数字';
                }
            }
            , time1: function (value) {
                var startDate = new Date($("#startDate").val());
                var endDate = new Date($("#endDate").val());


                if (value === "") {
                    return '请选择起始日期';
                } else if (startDate > endDate) {
                    return '起始日期不能大于结束日期！';
                }
            }
            , time2: function (value) {
                if (value === "") {
                    return '请选择结束时间';
                }
            }

        });

        //监听提交
        form.on('submit(add)', function (data) {
            //判断是否为管理员
            var temp;
            var auid = ${auid};
            var uid =${uid};
            if (auid === 1) {
                temp = parseInt(data.field.members);
            } else {
                temp = parseInt(uid);
            }
            /*封装数据对象*/
            var goal = {
                "uid": temp,
                "amount": parseInt(data.field.goal),
                "remarks": data.field.content,
                "startDate": new Date(data.field.startDate),
                "endDate": new Date(data.field.endDate),
                "isComplete": 0
            };
            util.httpRequest.post("setgoal", goal, function (msg) {
                if (msg.code === 200) {
                    layer.alert(msg.info, {
                        title: "提交结果"
                    }, function () {
                        window.location.href = "/savegoal/page";
                    })
                } else {
                    layer.msg(msg.info, {
                        offset: '50%'
                        , icon: 2
                        , time: 3000
                    });
                }
            });


            /*layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            });*/
            return false;
        });

        // 初始化Select
        var initSelect = (function () {
            var uid =${uid};
            util.httpRequest.post("getmembers", {
                "uid": uid
            }, function getMembers(result) {

                var members = $("#LAYMembersSelect");
                $(members).empty();
                var memberList = result;
                var appendHtml = '';
                for (var i = 0; i < memberList.length; i++) {
                    appendHtml = $('<option value="' + memberList[i].uid + '">' + memberList[i].name + '</option>');
                    if (i === 0) {
                        $(appendHtml).attr("selected", "");
                    }
                    $(members).append(appendHtml);
                }
                form.render('select');
            });
            return "initSuccess";
        })();
    });
</script>

<!-- ================================END:在这里编写页面的js代码================================ -->
</body>
</html>