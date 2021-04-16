<%--
  Created by IntelliJ IDEA.
  User: lidongge
  Date: 2021/4/6
  Time: 14:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>layuiAdmin 管理员 iframe 框</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/layuiadmin/layui/css/layui.css" media="all">
</head>
<body >
<form action="/goodsShopcar/add" type="Post">
<div class="layui-form" lay-filter="layuiadmin-form-shopcar " id="layuiadmin-form-shopcar" style="padding: 20px 30px 0 0; margin: auto " >
    <div class="layui-form-item">
        <label class="layui-form-label">图片</label>

            <img src="${pageContext.request.contextPath }/files/${goods.image}" width="100" height="100">

    </div>

    <div hidden>
        <input type="text" name="goodsid"    class="layui-input " value="${goods.id}">
        <input type="text" id="uid" name="uid" >
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">中药名称</label>
        <div class="layui-input-inline">
            <input type="text" name="goodsname" value="${goods.zyname}"  autocomplete="off" class="layui-input" readonly>
        </div>

    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">类别</label>
        <div class="layui-input-inline">
            <input type="text" name="typename"  value="${goods.typename}" readonly autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">产地</label>
        <div class="layui-input-inline">
            <input type="text" name="address" value="${goods.address}" readonly autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">详情</label>
        <div style="width: 300px ;right: 300px">
            <p >
                ${goods.description}
            </p>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">规格</label>
        <div class="layui-input-inline">
            <input type="text"  value="1/${goods.spec}" readonly class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">¥</label>
        <div class="layui-input-inline">
            <input type="text"  value="${goods.price}" name="price" readonly class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">购买数量</label>
        <div class="layui-input-inline">
            <input type="text" name="num" id="num" value="1" class="layui-input">
            <button class="layui-icon layui-icon-addition layui-btn" onclick="add()"></button>
            <button class="layui-icon layui-icon-subtraction layui-btn" onclick="sub()"></button>
        </div>
    </div>
    <div class="layui-form-item ">
        <input type="submit" class="layui-btn" lay-submit lay-filter="LAY-shopcar-front-submit" id="LAY-shopcar-back-submit" value="加入购物车">
    </div>
</div>
</form>
<script src="${pageContext.request.contextPath }/layuiadmin/layui/layui.js"></script>
<script>
    function add(){
        var  x=document.getElementById("num");
        var  a= x.value;
        a++;
        x.value=a;
    }
    function sub(){
        var  x=document.getElementById("num");
        var  a= x.value;
        if(a<=1){
            layer.msg("最少购买一个")
        }else{
            a--;
        }

        x.value=a;
    }
    var users=  JSON.parse(window.localStorage.getItem('users'))
    document.getElementById("uid").value=users.id;
    layui.config({
        base: '${pageContext.request.contextPath }/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'form','layer'], function(){
        var $ = layui.$
            ,form = layui.form ;

    })

</script>
</body>
</html>