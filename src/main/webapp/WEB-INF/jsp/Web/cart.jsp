<%--
  Created by IntelliJ IDEA.
  User: lidongge
  Date: 2021/4/9
  Time: 11:14
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
    <link rel="stylesheet" type="text/css" href="css/cart.css"/>


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

<div id="main" class="hander-car">
    <div class="store-content">
        <div class="cart-box">
            <div class="title">
                <h2>购物清单</h2>
            </div>
            <div class="cart-inner">
                <div class="empty-label hide">
                    <h3>您的购物车中还没有商品</h3>
                    <a class="link" href="javascript:;">现在选购</a>
                </div>
                <div>
                    <div class="cart-table-title">
                        <span class="name">商品信息</span>
                        <span class="operation">操作</span>
                        <span class="subtotal">小计</span>
                        <span class="num">数量</span>
                        <span class="price">单价</span>
                    </div>
                    <div class="cart-table">
                        <form  action="">

                        <div class="cart-group">
                            <!--购物列表-->
                            <c:forEach items="${cartlist}" var="cart" varStatus="stat">
                            <div class="cart-top-items">
                                <div class="cart-items">

                                    <div class="items-choose">
                                        <input type="checkbox" class="check-all" value="${cart.id}">
                                    </div>

                                    <div class="items-thumb">
                                      <img src="${pageContext.request.contextPath }/files/${cart.image}">
                                        <a href="javascript:;" target="_blank"></a>
                                    </div>
                                    <div class="name hide-row" >
                                        <div class="name-table">
                                            <a href="javascript:;" target="_blank">${cart.goodsname}</a>
                                            <ul class="attribute">
                                                <li></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="operation">
                                        <a class="items-delete-btn" onclick="del(${cart.id})"></a>
                                    </div>
                                    <div class="subtotal">¥ ${cart.sum}</div>
                                    <div class="item-cols-num">
                                        <div class="select js-select-quantity">
                                            <span class="down" onclick="down(${cart.id})">-</span>
                                            <span class="num">
														<input onchange="edit(${cart.id})" id="num${cart.id}" type="text" style="display: inline-block;" value="${cart.num}">

													</span>
                                            <span class="up" onclick="add(${cart.id})">+</span>

                                        </div>
                                    </div>

                                    <div class="price">¥${cart.price} </div>
                                </div>
                            </div>
                            </c:forEach>
                        </div>
                        </form>
                    </div>




                </div>
            </div>
            <div class="cart-bottom-bg fix-bottom">
                <div class="cart-bar-operation">
                    <div>
                        <div class="choose-all js-choose-all">
                            <input type="checkbox" id="all" name="all" class="layui-form-checkbox"><a></a></input>
                            全选
                        </div>

                    </div>
                </div>
                <div class="shipping">
                    <div class="shipping-box">
                        <div class="shipping-total shipping-num">
                            <h4 class="">

                            </h4>
                            <h5>

                            </h5>
                        </div>
                        <div class="shipping-total shipping-price">
                            <h4 class="">

                            </h4>
                            <h5 class="shipping-tips">

                            </h5>

                        </div>
                    </div>
                    <span class="jianguo-blue-main-btn big-main-btn js-checkout " ><a type="" onclick="balance()">现在结算</a></span>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="../web/js/jquery-3.6.0.min.js"></script>

<script src="${pageContext.request.contextPath}/layuiadmin/layui/layui.js"></script>

<script type="text/javascript">


    var users=  JSON.parse(window.localStorage.getItem('users'))
    document.getElementById("username").innerHTML=users.username;
    document.getElementById("shopcar").setAttribute("href","/web/cart?uid="+users.id)
    document.getElementById("address").setAttribute("href","/web/address?id="+users.id)
    document.getElementById("order").setAttribute("href","/order/ispay?id="+users.id)
    function add(id){

        $.ajax({
            type: "post",
            dataType: "json",
            async:true,
            traditional:true,
            url: "/goodsShopcar/updown",
            data: {id:id},
            success: function (data) {
               // layer.msg(修改成功);
                location.reload();

            }
        });
    }

    function down(id){

        $.ajax({
            type: "post",
            dataType: "json",
            async:true,
            traditional:true,
            url: "/goodsShopcar/down",
            data: {id:id},
            success: function (data) {
                if(data.msg!=""){
                    alert(data.msg);
                }
                location.reload();
            }
        });
    }

    function edit(id){
      num=document.getElementById("num"+id).value
        $.ajax({
            type: "post",
            dataType: "json",
            async:true,
            traditional:true,
            url: "/goodsShopcar/edit",
            data: {id:id,num:num},
            success: function (data) {
                    if(data.msg!=""){
                        alert.msg(data.msg);
                    }

                location.reload();
            }
        });
    }

    function del(id){
        $.ajax({
            type: "post",
            dataType: "json",
            async:true,
            traditional:true,
            url: "/goodsShopcar/del",
            data: {id:id},
            success: function (data) {
                if(data.msg!=""){
                    alert(data.msg);
                }

                location.reload();
            }
        });
    }
    var ids=new Array()
    $("#all").change(function (){
        if($("#all").prop('checked')){
          $(".check-all").attr("checked",true);

        }else {
            $(".check-all").attr("checked",false);

        }
    })
    // $(".check-all").change(function (){
    //     for (let i = 0; i < $(".check-all").length; i++) {
    //         if ($(".check-all").get(i).checked) {
    //             ids.push($(".check-all")[i].value)
    //         }
    //
    //     }
    // })

    var uid=users.id
        function balance() {
            for (let i = 0; i < $(".check-all").length; i++) {
                if ($(".check-all").get(i).checked) {
                    ids.push($(".check-all")[i].value)
                }

            }
            $.ajax({
                type: "post",
                dataType: "json",
                async:true,
                traditional:true,
                url: "/goodsShopcar/balance",
                data: {ids:ids},
                success: function (data) {
                    window.location.href="/web/checkout?ids="+ids;

                }
            })

        }
    function exit(){

        localStorage.setItem("users",null);
        window.location.href="/to/userslogin"
    }
</script>
</html>
