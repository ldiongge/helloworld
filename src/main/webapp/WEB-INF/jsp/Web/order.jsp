<%--
  Created by IntelliJ IDEA.
  User: lidongge
  Date: 2021/4/11
  Time: 18:37
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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web/css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web/css/header.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web/css/account.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web/css/order.css"/>
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
    <div class="content clear">
        <div class="account-wrapper">
            <div class="account-sidebar">
                <div class="avatar gray-box clear">
                    <div class="js-account-sidebar-info">
                        <img src="http://static.smartisanos.cn/account/asset/img/default-user-avatar.png">
                    </div>
                    <div class="box-inner">
                        <ul class="account-nav">
                            <li class="current"><a id="order1" >我的订单</a></li>
                            <li class=""><a id="address1">收货地址</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="account-content">
                <div class="account-order">
                    <div class="gray-box">
                        <div class="title columns-title pre-title">
                            <h2>我的订单</h2>


                        </div>
                        <div class="js-list-inner">
                            <div class="box-inner order-cart order-list-cart clear">
                                <div class="gray-sub-title cart-title">
                                    <span class="date">
                                        <fmt:formatDate value="${orderlist[0].createtime}" pattern="yyyy-MM-dd"/>
                                    </span>
                                    <span class="order-id"> 运单号: <a href="javascript:;">${orderlist[0].number}</a> </span>
                                    <span class="order-detail"><a href="javascript:;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a> </span> <span class="sub-total">小计</span>
                                    <span class="num">数量</span>
                                    <span class="price">单价</span>
                                </div>
                                <div class="cart">
                                    <c:forEach varStatus="stat" items="${orderlist}" var="order">
                                    <div class="cart-items clear">
                                        <div class="prod-info clear">
                                            <div class="items-thumb">
                                                <a href="javascript:;" target="_blank"><img src="${pageContext.request.contextPath }/files/${order.image}"></a>
                                            </div>
                                            <div class="items-params clear">
                                                <div class="name vh-center">
                                                    <a href="javascript:;" target="_blank" >${order.gooddname}</a>
                                                </div>

                                            </div>

                                            <div class="num">${order.num}</div>
                                            <div class="price">${order.price}</div>
                                        </div>

                                    </div>
                                    </c:forEach>
                                </div>
                                <div class="prod-operation">
                                    <div class="total">${ordersum}</div>
                                    <div class="status"><a class="blue-small-btn js-payment-order">已付款</a></div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    var users=  JSON.parse(window.localStorage.getItem('users'))
    document.getElementById("username").innerHTML=users.username;
    document.getElementById("shopcar").setAttribute("href","/web/cart?uid="+users.id)
    document.getElementById("address").setAttribute("href","/web/address?id="+users.id)
    document.getElementById("order").setAttribute("href","/order/ispay?id="+users.id)
    document.getElementById("address1").setAttribute("href","/web/address?id="+users.id)
    document.getElementById("order1").setAttribute("href","/order/ispay?id="+users.id)
    function exit(){

        localStorage.setItem("users",null);
        window.location.href="/to/userslogin"
    }
</script>
</html>
