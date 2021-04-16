<%--
  Created by IntelliJ IDEA.
  User: lidongge
  Date: 2021/4/7
  Time: 10:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>通讯录</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/layuiadmin/style/admin.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/layuiadmin/style/template.css" media="all">
</head>
<body>

<table class="layui-table" id="LAY-shopcar-manage">
    <thead>
    <tr>

        <th>id</th>
        <th>收货人</th>
        <th>电话</th>
        <th>地址</th>
        <th>操作</th>

    </thead>
    <tbody>
    <c:forEach items="${address}" var="address" varStatus="stat">
        <tr>

                <%-- <td>${user.id}</td> --%>
            <td>${address.id }</td>
            <td>${address.name }</td>
            <td>
                ${address.telephone}
            </td>
            <td>
                ${address.address}

            </td>
            <td>
                <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"
                   href="/address/del?id=${address.id}"><i class="layui-icon layui-icon-delete"></i>删除</a>
                <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="jie"
                   href="/address/upd?id=${address.id}"><i class="layui-icon layui-icon-edit"></i>修改</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>


<script src="${pageContext.request.contextPath }/layuiadmin/layui/layui.js"></script>
<script>
    layui.config({
        base: '${pageContext.request.contextPath }/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index']);
</script>
</body>
</html>