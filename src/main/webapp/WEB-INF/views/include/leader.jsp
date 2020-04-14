<%@ page import="cn.edu.cuit.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: 35024
  Date: 2019/7/11
  Time: 16:31
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("rootPath", "/");
    Object userObj = request.getSession().getAttribute("user");
    User user = new User();
    if (userObj != null)
        user = (User) userObj;
    pageContext.setAttribute("isLogin", user);
    pageContext.setAttribute("auid", user.getAuid());
    /**
     * 当前页面地址
     */
    String referer = request.getRequestURI();
    String[] urlParts = referer.split("/");
    String uri = "";
    if (urlParts.length > 0) {
        String[] urlSplit = urlParts[urlParts.length - 1].split("\\.");
        if (urlSplit.length > 0)
            uri = urlSplit[0];
    }

%>
<!-- 头部和导航区域（请不要修改） -->
<div class="layui-header">
    <div class="layui-logo">校园活动管理</div>

    <ul class="layui-nav layui-layout-left">
<%--        <li class="layui-nav-item"><a href="${rootPath}index/">个人首页</a></li>--%>
        <c:if test="${auid==1}">
            <li class="layui-nav-item">
                <a href="javascript:void(0);">用户管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="${rootPath}user/add">添加用户</a></dd>
                    <dd><a href="${rootPath}user/list">查询用户列表</a></dd>
                </dl>
            </li>
<%--            <li class="layui-nav-item">--%>
<%--                <a href="javascript:void(0);">家庭情况</a>--%>
<%--                <dl class="layui-nav-child">--%>
<%--                    <dd><a href="">家庭报表</a></dd>--%>
<%--                    <dd><a href="">家庭信息</a></dd>--%>
<%--                </dl>--%>
<%--            </li>--%>
<%--            <li class="layui-nav-item">--%>
<%--                <a href="javascript:void(0);">账单管理</a>--%>
<%--                <dl class="layui-nav-child">--%>
<%--                    <dd><a href="${rootPath}accountType/">添加账目类型</a></dd>--%>
<%--                </dl>--%>
<%--            </li>--%>
<%--            <li class="layui-nav-item"><a href="">家庭财务管理</a></li>--%>
        </c:if>
    </ul>

    <ul class="layui-nav layui-layout-right">
        <c:choose>
            <c:when test="${isLogin == null}">
                <li class="layui-nav-item"><a href="${rootPath}login/log">登录系统</a></li>
            </c:when>
            <c:otherwise>
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <img src="${rootPath}avatar/<%= user.getAvatar()%>.png" class="layui-nav-img">
                        <%= user.getName()%>
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="${rootPath}user/center">个人中心</a></dd>
                        <dd><a href="${rootPath}login/out">注销</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="${rootPath}login/out">注销</a></li>
            </c:otherwise>
        </c:choose>
    </ul>
</div>
<div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <ul class="layui-nav layui-nav-tree">
            <li class="layui-nav-item <%=uri.equals("personalIndex")?"layui-nav-itemed":""%>"><a
                    href="${rootPath}index/">首页</a></li>
            <li class="layui-nav-item <%=uri.equals("accountList")?"layui-nav-itemed":""%> <%=uri.equals("addAccount")?"layui-nav-itemed":""%>">
                <a class="" href="javascript:;">场地管理</a>
                <dl class="layui-nav-child">
                    <dd class="<%=uri.equals("accountList")?"layui-nav-itemed":""%>"><a href="${rootPath}account/list">场地列表</a>
                    </dd>
                    <dd class="<%=uri.equals("addAccount")?"layui-nav-itemed":""%>"><a
                            href="${rootPath}accountInfo/addInfo">增加场地</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item <%=uri.equals("lineoflimit")?"layui-nav-itemed":""%> <%=uri.equals("showgoal")?"layui-nav-itemed":""%>">
                <a href="javascript:;">活动管理</a>
                <dl class="layui-nav-child">
                    <dd class="<%=uri.equals("lineoflimit")?"layui-nav-itemed":""%>">
                        <a href="${rootPath}limit/page">发布活动</a>
                    </dd>
<%--                    <dd class="<%=uri.equals("lineoflimit")?"layui-nav-itemed":""%>">--%>
<%--                        <a href="${rootPath}limit/page">发布活动</a>--%>
<%--                    </dd>--%>
                    <dd class="<%=uri.equals("showgoal")?"layui-nav-itemed":""%>">
                        <a href="${rootPath}savegoal/page">查看活动</a>
                    </dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">系统设置</a></li>
        </ul>
    </div>
</div>
<!-- END:头部和导航区域 -->