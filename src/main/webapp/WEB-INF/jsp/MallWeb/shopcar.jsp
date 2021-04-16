<%--
  Created by IntelliJ IDEA.
  User: lidongge
  Date: 2021/4/6
  Time: 17:05
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
    <c:forEach items="${shopcar}" var="shopcar" varStatus="stat">
        <tr>
            <td>
                <div class=" layui-form-checkbox" lay-skin="primary">
                    <input type="checkbox">
                </div>
            </td>

                <%-- <td>${user.id}</td> --%>
            <td>${shopcar.id }</td>
            <td>${shopcar.goodsname }</td>
            <td><input value=" ${shopcar.price}" readonly class="layui-input" id="price">

            </td>
            <td>

                <input type="text" name="num" id="num" value=" ${shopcar.num}" class="layui-input" style="width: 30px">
                <a class="layui-icon layui-icon-addition " onclick="add()"></a>
                <a class="layui-icon layui-icon-subtraction " onclick="sub()"></a>

            </td>
            <td><fmt:formatDate value="${shopcar.createtime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>

            <td>
                    <input class="layui-input" readonly name="sum" id="sum" value="${shopcar.num*shopcar.price}">
            </td>
            <td>
            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"
               href="/goodsShopcar/del?id=${shopcar.id}&uid=${shopcar.uid}"><i class="layui-icon layui-icon-delete"></i>删除</a>
            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="jie" href="/order/add?cid=${shopcar.id}&uid=${shopcar.uid}"
               ><i class="layui-icon layui-icon-delete" ></i>结算</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
<script src="${pageContext.request.contextPath}/layuiadmin/layui/layui.js"></script>

<script>
    function add() {
        var x = document.getElementById("num");
        var s =document.getElementById("sum")
        var p =document.getElementById("price")
        var a = x.value;
        a++;
        x.value = a;
        s.value = a*p.value;
    }

    function sub() {
        var x = document.getElementById("num");
        var s =document.getElementById("sum")
        var p =document.getElementById("price")
        var a = x.value;
        if (a <= 1) {
            layer.msg("最少购买一个")
        } else {
            a--;
        }

        x.value = a;
        s.value = a*p.value;
    }


    layui.define(['table', 'form'], function (exports) {
        var $ = layui.$
            , table = layui.table
            , form = layui.form;


    })
</script>
</html>
