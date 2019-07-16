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
        <div class="layui-card" style="margin-left:30px;margin-right:30px;margin-top:30px;">
            <div class="layui-card-header">修改账单信息</div>
            <div class="layui-card-body">
                <form class="layui-form layui-form-pane" id="accountInfo" method="post">
                    <div class="layui-form-item" pane>
                        <label class="layui-form-label">账目金额</label>
                        <div class="layui-input-block">
                            <input type="text" name="amount" placeholder="￥" autocomplete="off" class="layui-input" value="${account.amount}">
                        </div>
                    </div>
                    <div class="layui-form-item" pane>
                    <label class="layui-form-label">收支类型</label>
                        <div class="layui-input-block">
                            <c:if test="${account.ietype == 1}">
                                <input type="radio" name="ietype" value="0" title="收入">
                                <input type="radio" name="ietype" value="1" title="支出" checked>
                            </c:if>
                            <c:if test="${account.ietype == 0}">
                                <input type="radio" name="ietype" value="0" title="收入" checked>
                                <input type="radio" name="ietype" value="1" title="支出">
                            </c:if>
                        </div>
                    </div>
                    <div class="layui-form-item" pane>
                        <label class="layui-form-label">是否公开</label>
                        <div class="layui-input-block">
                            <c:if test="${account.isExpose == 1}">
                                <input type="radio" name="isExpose" value="1" title="公开" checked>
                                <input type="radio" name="isExpose" value="0" title="私密">
                            </c:if>
                            <c:if test="${account.isExpose == 0}">
                                <input type="radio" name="isExpose" value="1" title="公开">
                                <input type="radio" name="isExpose" value="0" title="私密" checked>
                            </c:if>
                        </div>
                    </div>
                    <div class="layui-form-item" pane>
                        <label class="layui-form-label">账单分类</label>
                        <div class="layui-input-block">
                            <select name="tid" lay-verify="required" id="select_id">
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item" pane>
                        <label class="layui-form-label">账单备注</label>
                        <div class="layui-input-block">
                            <textarea name="remarks" placeholder="请输入账单备注信息" class="layui-textarea">${account.remarks}</textarea>
                        </div>
                    </div>
                    <input type="hidden" name="tid" id="tid" value="${account.tid}">
                    <input type="hidden" name="acid" id="acid" value="${account.acid}">
                    <input type="hidden" name="uid" id="uid" value="${account.uid}">
                    <input type="hidden" name="date" id="date" value="${account.date}">
                    <input type="hidden" name="isAvaliable" id="isAvaliable" value="${account.isAvaliable}">
                    <div class="layui-form-item">
                        <div class="layui-input-block" style="text-align:center">
                            <button class="layui-btn" lay-submit lay-filter="formDemo" id="commit">确认修改</button>
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
    renderform();
    function renderform(){
        layui.use('form', function(){
            var form = layui.form;
            form.render();
        });
    }
    //加载页面时响应
    $(function(){
        $.ajax({
            url:"/accountInfo/queryAccountType",
            type:"POST",
            data:$("#acid").serialize(),
            success:function(result){
                showAccountType(result);
                renderform();
            }
        });
    })
    //显示账单分类
    function showAccountType(result){
        var list = result;
        $.each(list,function(index, item){
            if($("#tid").val() == item.tid){
                $("<option></option>").attr("selected",true).val(item.tid).text(item.name).appendTo("#select_id");
            }else{
                $("<option></option>").val(item.tid).text(item.name).appendTo("#select_id");
            }
        });
    }
    //提交修改时响应
    $("#commit").click(function(){
        var acid = $("#acid").serialize();
        $.ajax({
            url:"/accountInfo/modifyAccount",
            type:"POST",
            data:$("#accountInfo").serialize(),
            success:function(result){
                if(result == "success"){
                    window.alert("账单修改成功！");
                    $(window).attr("location","../accountInfo/queryInfo?"+acid);
                }else{
                    window.alert("账单修改失败，请稍后重试！");
                }
            }
        });
    })
</script>
<!-- ================================END:在这里编写页面的js代码================================ -->
</body>
</html>