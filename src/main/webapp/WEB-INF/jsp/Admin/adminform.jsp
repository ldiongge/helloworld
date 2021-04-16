<%--
  Created by IntelliJ IDEA.
  User: lidongge
  Date: 2021/4/1
  Time: 22:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>中药交易平台 管理员 </title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/layui/css/layui.css" media="all">
</head>
<body >

<div class="layui-form" lay-filter="layuiadmin-form-admin" id="layuiadmin-form-admin" style="padding: 20px 30px 0 0;">
    <form >

        <div hidden>
                <input type="text" name="id" lay-verify=""   class="layui-input " value="${admin.id}">
        </div>

    <div class="layui-form-item">
        <label class="layui-form-label">登录名</label>
        <div class="layui-input-inline">
            <input type="text" name="username" lay-verify="" placeholder="请输入用户名" autocomplete="off" class="layui-input" value="${admin.username}">
        </div>
    </div>
        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-inline">
                <input type="text" name="nickname" lay-verify="" placeholder="请输入用户名" autocomplete="off" class="layui-input" value="${admin.nickname}">
            </div>
        </div>
    <div class="layui-form-item">
        <label class="layui-form-label">手机</label>
        <div class="layui-input-inline">
            <input type="text" name="phone" lay-verify="" placeholder="请输入号码" autocomplete="off" class="layui-input" value="${admin.phone}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">邮箱</label>
        <div class="layui-input-inline">
            <input type="text" name="email" lay-verify="" placeholder="请输入邮箱" autocomplete="off" class="layui-input" value="${admin.email}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">角色</label>
        <div class="layui-input-inline">
            <select id="role" name="role" class="valid">
                <c:forEach items="${role}" var="role">
                    <c:choose>
                        <c:when test="${admin.role == role.id }">
                            <option value="${role.id }" selected="selected">${role.typename }</option>
                        </c:when>
                        <c:otherwise>
                            <option value="${role.id }">${role.typename}</option>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">审核状态</label>
        <div class="layui-input-inline">
            <input type="checkbox" lay-filter="switch" name="check"  lay-skin="switch" lay-text="通过|待审核">
        </div>
    </div>
    <div class="layui-form-item layui-hide">
        <input type="buuton" lay-submit lay-filter="LAY-user-back-submit" id="LAY-user-back-submit" value="确认">
    </div>
    </form>
</div>

<script src="${pageContext.request.contextPath}/layuiadmin/layui/layui.js"></script>
<script>
    layui.config({
        base: '${pageContext.request.contextPath}/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'form'], function(){
        var $ = layui.$
            ,form = layui.form ;
    })

</script>
</body>
</html>