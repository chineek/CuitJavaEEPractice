<%--
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
%>
<!-- 头部和导航区域（请不要修改） -->
<div class="layui-header">
    <div class="layui-logo">生财有道</div>
    <ul class="layui-nav layui-layout-left">
        <li class="layui-nav-item"><a href="">首页</a></li>
        <li class="layui-nav-item">
            <a href="javascript:void(0);">成员管理</a>
            <dl class="layui-nav-child">
                <dd><a href="">添加成员</a></dd>
                <dd><a href="">查询成员列表</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item">
            <a href="javascript:void(0);">家庭情况</a>
            <dl class="layui-nav-child">
                <dd><a href="">家庭报表</a></dd>
                <dd><a href="">家庭信息</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item"><a href="">家庭财务管理</a></li>
    </ul>
    <ul class="layui-nav layui-layout-right">
        <li class="layui-nav-item"><a href="">登录系统</a></li>
        <li class="layui-nav-item">
            <a href="javascript:;">
                <img src="${rootPath}avatar/default.png" class="layui-nav-img">
                田洋
            </a>
            <dl class="layui-nav-child">
                <dd><a href="">个人中心</a></dd>
                <dd><a href="">注销</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item"><a href="">注销</a></li>
    </ul>
</div>
<div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <ul class="layui-nav layui-nav-tree">
            <li class="layui-nav-item layui-nav-itemed"><a href="">首页</a></li>
            <li class="layui-nav-item">
                <a class="" href="javascript:;">收支管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="">账目列表</a></dd>
                    <dd><a href="">添加账目</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">财务管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="">额度查询</a></dd>
                    <dd><a href="">存款目标管理</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">系统设置</a></li>
        </ul>
    </div>
</div>
<!-- END:头部和导航区域 -->