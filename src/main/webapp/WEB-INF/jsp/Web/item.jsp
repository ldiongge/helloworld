<%--
  Created by IntelliJ IDEA.
  User: lidongge
  Date: 2021/4/9
  Time: 10:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="css/header.css"/>
    <link rel="stylesheet" type="text/css" href="css/item.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/style/admin.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/style/template.css" media="all">
</head>
<body>
<div id="header">
    <div class="nav-global">
        <div class="container">
            <h1 class="nav-logo">
                <a href="javascript:;"></a>
            </h1>
            <ul class="nav-aside">
                <li class="nav-user">
                    <a href="javascript:;">个人中心</a>
                    <!--active-->
                    <div class="nav-user-wrapper">
                        <div class="nav-user-list">
                            <dl class="nav-user-avatar">
                                <dd><span class="ng-scope"></span></dd>
                                <dt class="ng-binding" id="username"></dt>
                            </dl>
                            <ul>
                                <li class="order"><a id="order" href="javascript:;">我的订单</a></li>
                                <li class="information"><a id="userinfo" href="/to/touserinfo">账户资料</a></li>
                                <li class="address"><a id="address" >收货地址</a></li>
                                <li class="address"><a id="password" href="/to/userpassword" >修改密码</a></li>
                                <li class="logout"><a onclick="exit()">退出</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
                <!--active-->
                <li class="nav-cart">
                    <a id="shopcar" >购物车</a>
                    <!--根据class改变颜色-->

            </ul>
            <ul class="nav-list">
                <li><a href="/index">在线商城</a></li>
                <li><a href="http://luntan.sjznet.net/">官方论坛</a></li>
                <li><a href="/to/userslogin">登录</a></li>
            </ul>
        </div>
    </div>

</div>

<div id="main">
    <div class="store-content item">
        <div class="item-box">
            <div class="gallery-wrapper">
                <div class="gallery">

                    <div class="thumb">
                        <ul>
                            <li class="on"><img width="400" height="400" src="${pageContext.request.contextPath }/files/${goods.image}"></li>

                        </ul>
                    </div>
                </div>
            </div>
            <p>
                &nbsp;
            </p>
            <p>
                &nbsp;
            </p>
            <p>
                &nbsp;
            </p>
            <p>
                &nbsp;
            </p>
            <form id="form" method="post" action="">
            <div class="banner">

                <div class="sku-custom-title">
                    <div class="params-price">
                        <span><em>¥</em><i>${goods.price}</i></span>
                    </div>

                    <input name="goodsid" value="${goods.id}" hidden>
                    <div class="params-info">
                        <h4>${goods.zyname}</h4>
                        <h6>${goods.description}</h6>
                    </div>
                </div>
                <div class="sku-dynamic-params-panel">
                    <div class="sku-dynamic-params clear">
                        <div class="params-name">数量</div>
                        <div class="params-detail clear">
                            <div class="item-num js-select-quantity">
                                <span class="down " onclick="down()">-</span>
                                <span class="num"><input id="num" name="num" value="1"></span>
                                <span class="up " onclick="add()">+</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="sku-status">
                    <div class="cart-operation-wrapper clearfix">
                        <span class="blue-title-btn js-add-cart"><input type="submit" style="color: beige" value="加入购物车"></span>
                        <span class="gray-title-btn"><a>现在购买</a></span>
                    </div>
                </div>
            </div>
                </form>

        </div>
        <div class="layui-fluid layadmin-message-fluid" id="msg">
            <div class="layui-row">
                <div class="layui-col-md12">
                    <form class="layui-form">
                        <div class="layui-form-item layui-form-text">
                            <div class="layui-input-block">
                                <textarea name="text"  placeholder="请输入内容" class="layui-textarea"></textarea>
                            </div>
                        </div>

                        <div class="layui-form-item" style="overflow: hidden;">
                            <div class="layui-input-block layui-input-right">
                                <button class="layui-btn" lay-submit lay-filter="formDemo">发表</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="layui-col-md12 layadmin-homepage-list-imgtxt message-content">
                    <c:forEach var="comment" items="${list}" varStatus="stat">
                    <div class="media-body">
                        <a href="javascript:;" class="media-left" style="float: left;">
                            <img src="${pageContext.request.contextPath}/web/img/tou.jpg" height="46px" width="46px">
                        </a>
                        <div class="pad-btm">
                            <p class="fontColor"><a href="javascript:;">${comment.username}</a></p>
                            <p class="min-font">
              <span class="layui-breadcrumb" lay-separator="-">
                <a href="javascript:;" class="layui-icon layui-icon-cellphone"></a>
                <a href="javascript:;">
                    <fmt:formatDate value="${comment.createtime}" pattern="yyyy-MM-dd"/>
</a>
              </span>
                            </p>
                        </div>
                        <p class="message-text">${comment.content}</p>
                    </div>
                    </c:forEach>

                </div>

            </div>
        </div>
    </div>
    </div>

</div>
<script src="${pageContext.request.contextPath}/layuiadmin/layui/layui.js"></script>
<script>
    var users=  JSON.parse(window.localStorage.getItem('users'))
    layui.config({
        base: '${pageContext.request.contextPath}/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index']);
    layui.use(['layer','form','jquery'],function(){
        var form = layui.form;
        var  $ =layui.jquery;
        form.on('submit(formDemo)', function(data){
            $.ajax({
                type: "post",
                dataType: "json",
                async:true,
                traditional:true,
                url: "/comment/add",
                data: {text:data.field.text,goodsid:${goods.id},uid:users.id},
                success: function (data) {
                    layer.msg(data.msg)


                }
            })
            location.reload();
            return false;
        });
    })
</script>
<script>
    var users=  JSON.parse(window.localStorage.getItem('users'))
    document.getElementById("form").setAttribute("action","${pageContext.request.contextPath }/goodsShopcar/itemadd?uid="+users.id)
    document.getElementById("username").innerHTML=users.username;
    document.getElementById("shopcar").setAttribute("href","/web/cart?uid="+users.id)
    document.getElementById("address").setAttribute("href","/web/address?id="+users.id)
    document.getElementById("order").setAttribute("href","/order/ispay?id="+users.id)
    function add(){
        var num= document.getElementById("num")
        var  a=num.value;
        a++
        num.value=a;


    }
    function down(){
        var a
        var num= document.getElementById("num")
        a=num.value;
        if(a<=1){
            alert("最少购买一个")
        }else {

            a--
            num.value=a;
        }



    }
    function exit(){

        localStorage.setItem("users",null);
        window.location.href="/to/userslogin"
    }
</script>
</body>
</html>
