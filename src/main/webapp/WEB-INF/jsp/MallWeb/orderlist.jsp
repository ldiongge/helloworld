<%--
  Created by IntelliJ IDEA.
  User: lidongge
  Date: 2021/4/7
  Time: 12:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/style/admin.css" media="all">
</head>
<body>
<table class="layui-table" id="LAY-shopcar-manage">
    <thead>
    <tr>
        <th>
            <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><input type="checkbox"></div>
        </th>
        <!-- <th>ID</th> -->
        <th>id</th>
        <th>名称</th>
        <th>价格</th>
        <th>数量</th>
        <th>加入日期</th>
        <th>总额</th>

        <th>操作</th>

    </thead>
    <tbody>
    <c:forEach items="${list}" var="order" varStatus="stat">
        <tr>
            <td>
                <div class=" layui-form-checkbox" lay-skin="primary">
                    <input type="checkbox">
                </div>
            </td>

                <%-- <td>${user.id}</td> --%>
            <td>${order.id }</td>
            <td>${order.goodsname}</td>
            <td><input value=" ${order.payPrice}" readonly class="layui-input" id="price">

            </td>
            <td><fmt:formatDate value="${order.createtime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>

            <td>
                <input class="layui-input" readonly name="sum" id="sum" value="${order.payPrice}">
            </td>
            <td>
                <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"
                   href="/order/del?id=${order.id}&uid=${order.uid}"><i class="layui-icon layui-icon-delete"></i>删除</a>
                <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="jie"
                   href=""><i class="layui-icon layui-icon-delete"></i>结算</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
