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
    <link rel="stylesheet" href="${rootPath}css/saveGoal.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <!-- 导入导航条 -->
    <jsp:include page="include/leader.jsp"/>
    <!-- END：导航条 -->
    <div class="layui-body layui-bg-gray">
        <!-- ===================================在这里编写HTML代码================================== -->
        <div style="padding: 13px; background-color: #F2F2F2;">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md6">
                    <div class="layui-card" style="padding-top: 1%;padding-right: 3%;padding-bottom: 3%">
                        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 1%;padding-bottom: 1%">
                            <legend>添加额度限制</legend>
                        </fieldset>
                        <form class="layui-form" action="">
                            <div class="layui-form-item">
                                <label class="layui-form-label">成员选择</label>
                                <div class="layui-input-block">
                                    <select name="interest" lay-filter="member">

                                        <option value="0" selected="">自己</option>
                                        <option value="1">儿子</option>
                                        <option value="2">女儿</option>
                                    </select>
                                </div>
                            </div>

                            <!--<div class="layui-form-item">
                                <label class="layui-form-label">单行输入框</label>
                                <div class="layui-input-block">
                                    <input name="title" class="layui-input" type="text" placeholder="请输入标题" autocomplete="off" lay-verify="title">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">验证必填项</label>
                                <div class="layui-input-block">
                                    <input name="username" class="layui-input" type="text" placeholder="请输入" autocomplete="off" lay-verify="required" lay-reqtext="用户名是必填项，岂能为空？">
                                </div>
                            </div>
                            -->

                            <div class="layui-form-item">
                                <label class="layui-form-label">额度设定</label>
                                <div class="layui-input-block">
                                    <input name="limit" class="layui-input" type="text" placeholder="￥"
                                           autocomplete="off"
                                           lay-verify="limit">
                                </div>
                            </div>

                            <div class="layui-form-item">
                                <div class="layui-inline" style="width: 60%">
                                    <label class="layui-form-label">起始时间</label>
                                    <div class="layui-input-block">
                                        <input name="date" class="layui-input" id="date" type="text" autocomplete="off"
                                               lay-verify="time1">
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-inline" style="width: 60%">
                                    <label class="layui-form-label">结束时间</label>
                                    <div class="layui-input-block">
                                        <input name="date1" class="layui-input" id="date1" type="text"
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
    // 这里我编写了一个简单的操作工具库，接下来是使用示例。
    // 下面内容是为了说明可以做什么，正式页面删掉就行。
    /**----------------------------------------------------------------------------------
     * 1.快速发送请求到服务器
     *    util.httpRequest对象
     ------------------------------------------------------------------------------------*/
    // 发送一条get请求到"请求地址",返回data对象,并输出
    util.httpRequest.get("getUserByNameDemo", {"name": "田"}, function (usersList) {
        console.log(usersList);
    });
    // 发送一条post请求到"请求地址",返回data对象,并输出
    util.httpRequest.post("postAuthorityDemo", {"auid": 1}, function (authority) {
        console.log(authority);
    });
    /**----------------------------------------------------------------------------------
     * 2.在浏览器中存储一些数据
     *    util.data对象
     ------------------------------------------------------------------------------------*/
    // 存储一个对象，"内容"可以不是字符串，而是一个对象
    util.data.set("存储名称", "内容");
    // 获取刚刚存储的数据对象
    var dataObject = util.data.get("存储名称");
    // 打印刚刚存储的对象
    console.log(dataObject);
    // 删除存储的内容
    util.data.remove("存储名称");
    /**----------------------------------------------------------------------------------
     * 3.获取浏览器URL参数
     *    util.param对象
     ------------------------------------------------------------------------------------*/
    // 可以获取如"http://www.baidu.com/index?xxx=1"中xxx的值
    // 具体使用方法如下
    console.log(util.param.xxx);
</script>
<script>
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form
            , layer = layui.layer
            , layedit = layui.layedit
            , laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#date'
        });
        laydate.render({
            elem: '#date1'
        });

        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');

        //自定义验证规则
        form.verify({
            title: function (value) {
                if (value.length < 5) {
                    return '标题至少得5个字符啊';
                }
            }
            , pass: [
                /^[\S]{6,12}$/
                , '密码必须6到12位，且不能出现空格'
            ]
            , content: function (value) {
                layedit.sync(editIndex);
            }
            , limit: function (value) {
                if (value == "") {
                    return '孩子也要零花钱啊，额度可不能为空啊';
                } else if (isNaN(value)) {
                    return '额度必须是数字';
                }
            }
            , time1: function (value) {
                var date =new Date ($("#date").val());
                var date1 = new Date($("#date1").val());

                console.log(date);
                console.log(date1);
                if(value==""){
                    return '请选择起始日期';
                }else if(date>date1){
                    return '起始日期不能大于结束日期！';
                }
            }
            ,time2:function(value){
                if(value==""){
                    return '请选择结束时间';
                }
            }

        });

        //监听提交
        form.on('submit(add)', function (data) {
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            })
            return false;
        });

    });
</script>

<!-- ================================END:在这里编写页面的js代码================================ -->
</body>
</html>