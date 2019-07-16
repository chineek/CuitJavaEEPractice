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
         <div class="layui-card-header">账单详情</div>
         <div class="layui-card-body">
             <table class="layui-table" id="accountInfo">
                 <colgroup>
                     <col style="text-align:center;width:200px;">
                     <col>
                 </colgroup>
                 <thead>
                 <tr>
                     <th>选项列表</th>
                     <th>详细信息</th>
                 </tr>
                 </thead>
                 <tbody>
                 </tbody>
                 <input type="hidden" name="acid" value="${acid}" id="acid">
             </table>
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
    $(function(){
        $.ajax({
            url:"/accountInfo/queryAccount",
            type:"GET",
            data:$("#acid").serialize(),
            success:function(result){
                showAccountInfo(result);
            }
        });
    })
    function showAccountInfo(result){
        var account = result;
        var select1 = $("<td></td>").append("账单编号");
        var acid = $("<td></td>").append("NO."+account.acid);
        $("<tr></tr>").append(select1).append(acid).appendTo("#accountInfo tbody");
        var select2 = $("<td></td>").append("账单金额");
        var amount = $("<td></td>").append(account.amount+"￥");
        $("<tr></tr>").append(select2).append(amount).appendTo("#accountInfo tbody");
        var select3 = $("<td></td>").append("收支类型");
        if(account.ietype == 1){
            var ietype = $("<td></td>").append("支出");
        }else{
            var ietype = $("<td></td>").append("收入");
        }
        $("<tr></tr>").append(select3).append(ietype).appendTo("#accountInfo tbody");
        var select4 = $("<td></td>").append("账单分类");
        var typeName = $("<td></td>").append(account.typeName);
        $("<tr></tr>").append(select4).append(typeName).appendTo("#accountInfo tbody");
        var select5 = $("<td></td>").append("是否公开");
        if(account.isExpose == 1){
            var expose = $("<td></td>").append("公开");
        }else{
            var expose = $("<td></td>").append("私密");
        }
        $("<tr></tr>").append(select5).append(expose).appendTo("#accountInfo tbody");
        var select6 = $("<td></td>").append("创建时间");
        var time = new Date(account.date).Format("yyyy-MM-dd hh:mm:ss");
        var date = $("<td></td>").append(time);
        $("<tr></tr>").append(select6).append(date).appendTo("#accountInfo tbody");
        var select7 = $("<td></td>").append("备注信息");
        var remarks = $("<td></td>").append(account.remarks);
        $("<tr></tr>").append(select7).append(remarks).appendTo("#accountInfo tbody");
    }

    //JSON日期转换
    Date.prototype.Format = function (fmt) {
        var o = {
            "M+": this.getMonth() + 1, //月份
            "d+": this.getDate(), //日
            "h+": this.getHours(), //小时
            "m+": this.getMinutes(), //分
            "s+": this.getSeconds(), //秒
        };
        if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    }
</script>
<!-- ================================END:在这里编写页面的js代码================================ -->
</body>
</html>