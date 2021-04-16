<%--
  Created by IntelliJ IDEA.
  User: lidongge
  Date: 2021/4/6
  Time: 11:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>商品列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/layuiadmin/style/admin.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/layuiadmin/style/template.css" media="all">
</head>
<body>


<div class="layui-fluid layadmin-cmdlist-fluid">
    <div class="layui-row layui-col-space30">
        <c:forEach items="${goodslist}" var="goods" varStatus="stat">
            <div class="layui-col-md2 layui-col-sm4">
                <div class="cmdlist-container">
                    <a href="/to/togoodsinfo?id=${goods.id}">
                        <img src="${pageContext.request.contextPath }/files/${goods.image}">
                    </a>
                    <a href="javascript:;">
                        <div class="cmdlist-text">
                            <p class="info">${goods.zyname}</p>
                            <div class="price">
                                <b>${goods.price}</b>
                                <p>
                                    ¥
                                    <del>100</del>
                                </p>
                                <span class="flow">
                      <i class="layui-icon layui-icon-rate"></i>
                      433
                    </span>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </c:forEach>
        <div class="layui-col-md2 layui-col-sm4">
            <div class="cmdlist-container">
                <a href="javascript:;">
                    <img src="${pageContext.request.contextPath }/layuiadmin/style/res/template/portrait.png">
                </a>
                <a href="javascript:;">
                    <div class="cmdlist-text">
                        <p class="info">2018春夏季新款港味短款白色T恤+网纱中长款chic半身裙套装两件套</p>
                        <div class="price">
                            <b>￥79</b>
                            <p>
                                ¥
                                <del>130</del>
                            </p>
                            <span class="flow">
                      <i class="layui-icon layui-icon-rate"></i>
                      433
                    </span>
                        </div>
                    </div>
                </a>
            </div>
        </div>

        <div class="layui-col-md12 layui-col-sm12">
            <div id="demo0"></div>
        </div>
    </div>
</div>


<script src="${pageContext.request.contextPath }/layuiadmin/layui/layui.js"></script>
<script>
    layui.config({
        base: '${pageContext.request.contextPath }/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index']);
    layui.use(['laypage', 'layer'], function(){
        var laypage = layui.laypage
            ,layer = layui.layer;

        //总页数低于页码总数
        laypage.render({
            elem: 'demo0'
            ,count: 50 //数据总数
        });
    });
</script>
</body>
</html>