<%--
  Created by IntelliJ IDEA.
  User: lidongge
  Date: 2021/4/8
  Time: 22:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>中药交易平台</title>
    <link rel="stylesheet" type="text/css" media="all" href="${pageContext.request.contextPath }/web/css/reset.css"/>
    <link rel="stylesheet" type="text/css" media="all" href="${pageContext.request.contextPath }/web/css/header.css"/>
    <link rel="stylesheet" type="text/css" media="all" href="${pageContext.request.contextPath }/web/css/goodsList.css"/>
    <script type="text/javascript" href="${pageContext.request.contextPath }/layuiadmin/layui/lay/modules/jquery.js"></script>

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
    <div class="sku-box store-content">
        <div class="sort-option">
            <ul class="line clear">
                <li><a href="javascript:;" class="active">优质</a></li>
                <li><a href="javascript:;" class="">安全</a></li>
                <li><a href="javascript:;" class="">高效</a></li>
                <li><a href="javascript:;" class="">中药电商领先者</a></li>
            </ul>
        </div>
        <div class="gray-box">
            <div class="item-box">
            <c:forEach items="${goodslist}" var="goods" varStatus="stat">

                <div class="item">
                    <div>
                        <div class="item-img"><img alt="" src="${pageContext.request.contextPath }/files/${goods.image}" style="opacity: 1;">
                        </div>
                        <h6>${goods.zyname}</h6>
                        <h3 >${goods.description}</h3>

                        <div class="item-btns clearfix">
                            <span class="item-gray-btn"><a href="${pageContext.request.contextPath }/web/item?id=${goods.id}" target="_blank">查看详情</a> </span><span class="item-blue-btn" onclick="addcar(${goods.id})">加入购物车 </span>
                        </div>
                        <div class="item-price clearfix">
                            <i>¥</i><span>${goods.price}</span>
                        </div>
                        <div class="discount-icon">false</div>
                        <div class="item-cover">
                            <a href="${pageContext.request.contextPath }/web/item?id=${goods.id}" target="_blank"></a>
                        </div>
                    </div>
                </div>
            </c:forEach>


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
    function addcar(id){
        $.ajax({
            type: "post",
            dataType: "json",
            async:true,
            traditional:true,
            url: "/goodsShopcar/addcar",
            data: {id:id,uid:uid},
            success: function (data) {
                if(data.msg!=""){
                    alert(data.msg);
                }

                location.reload();
            }
        });
    }
    function exit(){

        localStorage.setItem("users",null);
        window.location.href="/to/userslogin"
    }

</script>
</html>
