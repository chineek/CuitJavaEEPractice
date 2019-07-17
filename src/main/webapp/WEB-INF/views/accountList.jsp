<%@ page import="cn.edu.cuit.entity.User" %>
<%@ page import="cn.edu.cuit.entity.Account" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("rootPath", "/");
    User user = (User) request.getSession().getAttribute("user");
    Account account = (Account) request.getSession().getAttribute("account");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>生财有道 - 您的家庭理财好助手</title>
    <jsp:include page="include/head.jsp"/>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <!-- 导入导航条 -->
    <jsp:include page="include/leader.jsp"/>
    <!-- END：导航条 -->
    <div class="layui-body" style="padding:30px 50px;">
        <!-- ===================================在这里编写HTML代码================================== -->
        <fieldset class="layui-elem-field layui-field-title">
            <legend>账单详情</legend>
        </fieldset>
        <div class="layui-row">
            <div class="layui-col-md10">
                <form class="layui-form" action="">
                    <div class="layui-form-item">
                        <div class="layui-input-inline">
                            <select name="ietype" lay-filter="type">
                                <option value="2" selected="">全部</option>
                                <option value="0">收入</option>
                                <option value="1">支出</option>
                            </select>
                        </div>
                        <div class="layui-input-inline">
                            <input type="text" class="layui-input" id="dateRange" placeholder="请选择日期">
                        </div>
                        <div class="layui-input-inline">
                            <input type="text" name="remarks" required lay-verify="required" id="content"
                                   placeholder="请输入备注内容" autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-input-inline">
                            <button class="layui-btn  layui-btn-normal" lay-event="search"
                                    id="searchBtn" data-type="getContent">
                                搜索
                            </button>

                        </div>
                    </div>
                </form>
            </div>
            <div class="layui-col-md2">
                <div class="layui-input-block" style="float: right;padding-right:20px;">
                    <button class="layui-btn layui-btn-lg" lay-event="add" id="add">添加账目
                    </button>
                </div>
            </div>
            <div class="layui-col-md12">
                <div class="layui-table">
                    <table class="layui-hide" lay-filter="accountList" id="accountList"></table>
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

    <!-- 操作按钮-->
    <script type="text/html" id="accountListToolBarItem">
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>


    <script>
        layui.use(['table', 'form', 'laydate', 'layer'], function () {
            var table = layui.table;
            var form = layui.form;
            var layDate = layui.laydate;
            var layer = layui.layer;

            /* 封装请求参数 */
            var getCombination = function () {
                //取得用户ID
                var combination = {
                    'uid':<%= user.getUid()%>
                };
                //取得当前收支类型
                var ieType = parseInt($("select[name='ietype']").val());
                if (ieType !== 2) {
                    combination.ietype = ieType;
                }
                //取得当前日期范围
                var dateRange = $('#dateRange').val();
                if (!!dateRange) {
                    var dateSplit = dateRange.split(" ~ ");
                    combination.startDate = new Date(dateSplit[0]);
                    combination.endDate = new Date(dateSplit[1]);
                }
                //取得当前输入框的值
                var content = $('#content').val();
                if (content !== null) {
                    combination.remarks = content;
                }
                return combination;
            };
            var getTableConfig = function () {
                return {
                    elem: '#accountList',
                    minHeight: 220,
                    url: '/account/getAccountByCombination',
                    method: 'post',
                    contentType: 'application/json',
                    where: getCombination(),
                    cols: [[ //标题栏
                        {
                            field: 'acid',
                            title: 'acid',
                            hide: true
                        },
                        {
                            field: 'ietype',
                            title: '收支类型',
                            minWidth: 150,
                            templet: function (item) {  //将类型数字转换为对应类型
                                var typeInt = parseInt(item.ietype);
                                if (typeInt === 0) {
                                    return "收入";
                                } else if (typeInt === 1) {
                                    return "支出";
                                }
                            }
                        }
                        , {
                            field: 'amount', title: '金额', minWidth: 150, sort: true,
                            templet: function (item) {  //将金额设置为两位小数显示
                                return parseFloat(item.amount).toFixed(2)
                            }
                        }
                        , {
                            field: 'date', title: '时间', minWidth: 150, sort: true,
                            templet: function (item) {  //时间设置为格式化显示
                                return util.date.format(item.date, "yyyy-MM-dd hh:mm")
                            }
                        }
                        , {field: 'remarks', title: '收支备注', minWidth: 150}
                        , {field: 'option', title: '操作', toolbar: '#accountListToolBarItem', minWidth: 200}  //调用按钮
                    ]]
                    , even: true
                    , page: true //是否显示分页
                    , limits: [5, 8, 10, 20, 30, 50]  //每页显示数量选择
                    , limit: 10 //每页默认显示的数量
                    , first: true//显示首页
                    , last: true //显示尾页
                }
            };

            /**
             * 监听IEtype的改变
             */
            form.on('select(type)', function (data) {     //type是那个lay-filter的值
                table.render(getTableConfig());
                form.render('select');      //最后渲染表单
            });
            /**
             * 监听Date的改变
             */
            layDate.render({
                elem: '#dateRange'
                , range: '~'
                //默认得到最近一个月的账目情况
                , value: util.date.format(new Date() - util.date.getTimestampByDay(30), "yyyy-MM-dd")
                    + " ~ " +
                    util.date.format(new Date(), "yyyy-MM-dd")
                , done: function (value) {
                    table.render(getTableConfig());
                    var dateRange = $('#dateRange').val(value);
                    table.render(getTableConfig());
                }
            });
            /**
             * 监听搜索内容
             * @type {pe}
             */
            //监听鼠标点击
            $('#searchBtn').on('click', function () {
                table.render(getTableConfig());
                return false;
            });

            //监听回车事件,扫描枪一扫描或者按下回车键就直接执行查询
            $("#content").bind("keyup", function (e) {
                if (e.keyCode === 13) {
                    table.render(getTableConfig());
                    return false;
                }
            });
            /**
             * 展示已知数据
             */
            table.render(getTableConfig());
            /*
             增删改查的监听实现
             */
              //监听工具条
            table.on('tool(accountList)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
                var data = obj.data; //获得当前行数据
                var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）

                if (layEvent === 'detail') { //查看
                    $(window).attr('location', '../accountInfo/queryInfo?acid=' + data.acid);
                } else if (layEvent === 'del') { //删除
                    layer.confirm('真的删除行么', function (index) {
                        //向服务端发送删除指令
                        obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                        layer.close(index);
                        util.httpRequest.post("/accountInfo/deleteAccount", {"acid": data.acid}, function (data) {
                            if (data.msg === "success") {
                                layer.msg("账单删除成功！", {
                                    title: "提交信息"
                                });
                            } else {
                                layer.msg("删除失败！", {
                                    title: "提交信息"
                                });
                            }
                        });
                    });
                } else if (layEvent === 'edit') { //编辑
                    //do something
                    var acid = $("#acid").serialize();
                    $(window).attr('location', '../accountInfo/modifyInfo?acid=' + data.acid);

                }
            });
        });
        $("#add").click(function () {
            $(window).attr('location', '../accountInfo/addInfo');
        });
    </script>
    <!-- ================================END:在这里编写页面的js代码================================ -->
</body>
</html>