<%--
  Created by IntelliJ IDEA.
  User: lidongge
  Date: 2021/4/11
  Time: 0:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="css/header.css"/>
    <link rel="stylesheet" type="text/css" href="css/checkout.css"/>
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
    <div class="content page-order-checkout checkout">
        <div class="js-checkout-address-box">
            <div class="gray-box clear">
                <div class="title columns-title pre-title">
                    <h2>收货信息</h2>
                </div>
                <div class="box-inner js-checkout-address-panel ">
                    <div class="address-common-table js-multiple-address-panel">
                        <ul class="address-item-list clear js-address-item-list">
                          <c:forEach items="${addresslist}" var="address" varStatus="stat">

                            <li class="js-choose-address  selected-address-item">
                                <div class="address-item">
                                    <div class="name-section">  ${address.name}  </div>
                                    <div class="mobile-section">${address.telephone}</div>
                                    <div class="detail-section"> ${address.address} </div>
                                </div>
                                <div class="operation-section">
                                    <span class="update-btn js-edit-address">修改</span>
                                    <span class="delete-btn js-delete-address">删除</span>
                                </div>
                            </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="gray-box">
            <div class="title">
                <h2>发票信息</h2>
            </div>
            <div class="box-inner invoice-box js-invoice-box">
                <p class="invoice-detail"> 发票类型：电子发票 </p>
                <div class="invoice-detail"> 发票抬头：
                    <div class="radio-box">
                        <label>
                            <input type="radio" class="hide">
                            <span class="blue-radio blue-radio-on"><a></a></span>  个人
                        </label>
                    </div>

                </div>
                <p class="invoice-detail">发票内容：购买商品明细</p> <p class="invoice-label"> 电子发票是税务局认可的有效收付款凭证，可作为售后服务凭据。电子发票打印后可以用于企业报销。 </p>
            </div>
        </div>
        <div class="gray-box">
            <div class="title pre-title">
                <h2>购物清单</h2>
            </div>
            <div class="box-inner ui-goods-cart">
                <div class="gray-sub-title cart-table-title">
                    <span class="name">商品名称</span>
                    <span class="subtotal">小计</span>
                    <span class="num">数量</span>
                    <span class="price">单价</span>
                </div>
                <div class="cart-table">
                    <div class="cart-group js-cart-group">
                        <c:forEach items="${order}" var="order" varStatus="stat">
                        <div class="cart-items">
                            <div class="items-thumb">
                                <a href="${pageContext.request.contextPath }/web/item?id=${order.id}" target="_blank"><img src="${pageContext.request.contextPath }/files/${order.image}"></a>
                            </div>
                            <div class="name hide-row">
                                <div class="name-cell">
                                    <a href="${pageContext.request.contextPath }/web/item?id=${order.id}"  target="_blank">${order.goodsname}</a>
                                </div>
                            </div>
                            <div class="subtotal">
                                <div class="subtotal-cell">¥ ${order.sum} </div>
                            </div>
                            <div class="goods-num">${order.num}</div>
                            <div class="price">¥ ${order.price}</div>
                        </div>
                        </c:forEach>
                    </div>
                </div>

            </div>
            <div class="box-inner">
                <div class="order-discount-line">
                    <p> 商品总计： <span>${ordersum}</span> </p>
                    <p> 运费： <span>+ ¥ 0.00</span> </p>
                    <p class="discount-line js-discount-cash"> <em>现金券</em>： <span> - 0 </span> </p>
                </div>
            </div>
            <div class="box-inner">
                <div class="last-payment clear">
                    <span class="jianguo-blue-main-btn big-main-btn payment-blue-bt fn-right js-checkout"> <a onclick="pay()">提交订单</a> </span> <span class="prices fn-right">应付金额： <em>¥ ${ordersum}</em></span>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="../web/js/jquery-3.6.0.min.js"></script>

<script>
    var users=  JSON.parse(window.localStorage.getItem('users'))
    document.getElementById("username").innerHTML=users.username;
    document.getElementById("shopcar").setAttribute("href","/web/cart?uid="+users.id)
    document.getElementById("address").setAttribute("href","/web/address?id="+users.id)
    document.getElementById("order").setAttribute("href","/order/ispay?id="+users.id)
    var uid=users.id
    function pay(){
                window.location.href="/order/pay?id="+uid;
    }
    function exit(){

        localStorage.setItem("users",null);
        window.location.href="/to/userslogin"
    }
</script>
</html>
