<%--
  Created by IntelliJ IDEA.
  User: lidongge
  Date: 2021/4/2
  Time: 22:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title> 角色管理 </title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/layui/css/layui.css" media="all">
</head>
<body>

<div class="layui-form" lay-filter="layuiadmin-form-role" id="layuiadmin-form-role" style="padding: 20px 30px 0 0;">
    <div class="layui-form-item">
        <label class="layui-form-label">角色</label>
        <div class="layui-input-inline">
            <input type="text" role="${role.typename}" name="typename" placeholder="请输入角色名" autocomplete="off" class="layui-input" >
        </div>
    </div>
    <div class="layui-form-item" >
        <div class="layui-input-inline">
            <input type="hidden" name="id" id="id" hidden class="layui-input" value="${role.id}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">具体描述</label>
        <div class="layui-input-block">
            <input value="${role.descr}" type="text"  name="descr" lay-verify="required"  autocomplete="off" class="layui-textarea"></input>
        </div>
    </div>
    <div class="layui-form-item layui-hide">
        <button class="layui-btn" lay-submit lay-filter="LAY-user-role-submit" id="LAY-user-role-submit">提交</button>
    </div>
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