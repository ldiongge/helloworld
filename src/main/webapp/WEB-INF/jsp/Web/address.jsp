<%--
  Created by IntelliJ IDEA.
  User: lidongge
  Date: 2021/4/9
  Time: 13:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web/css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web/css/header.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web/css/account.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web/css/address.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web/css/address-pop.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layuiadmin/layui/css/modules/layer/default/layer.css"/>
    <script src="${pageContext.request.contextPath}/layuiadmin/layui/layui.js"></script>

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
                        <img src="/web/img/user-avatar.png">
                    </div>
                    <div class="box-inner">
                        <ul class="account-nav">
                            <li class=""><a id="order1">我的订单</a></li>
                            <li class="current"><a id="address1">收货地址</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="account-content">
                <div class="account-address">
                    <div class="gray-box clear">
                        <div class="title pre-title">
                            <h2 class="fn-left">收货信息</h2>
                            <span class="gray-blue-btn js-add-address"><a class="add" onclick="openAdd()">添加新地址</a></span>
                        </div>
                        <div class="box-inner clear">
                            <c:forEach items="${addresslist}" var="address" varStatus="stat">
                            <div class="address-list-item default-item" data-id="765532">
                                <div class="name fn-left">
                                    <div class="name-cell">${address.name}</div>
                                </div>
                                <div class="detail fn-left">
                                    <div class="detail-cell">${address.address}</div>
                                </div>
                                <div class="operation fn-right">
                                    <div class="operation-cell">
                                        <a class="gray-edit-btn js-edit-address" id="edit" onclick="openAdd(${address})">修改</a>
                                        <span class="red-del-btn js-del-address"> <a href="/address/del?id=${address.id}&uid=${address.userId}">删除</a><em>删除</em> </span>
                                    </div>
                                </div>
                                <div class="default fn-right">    </div>
                                <div class="telephone fn-right">${address.telephone}</div>
                            </div>
                            </c:forEach>
                            <div class="address-form clear" style="display: none;">
                                <div class="module-form-row">
                                    <div class="form-item-v3">
                                        <i>收货人姓名</i>
                                        <input type="text" class="js-verify">
                                        <div class="verify-error"></div>
                                    </div>
                                </div>
                                <div class="module-form-row">
                                    <div class="form-item-v3">
                                        <i>手机号</i>
                                        <input type="text" class="js-verify">
                                        <div class="verify-error"></div>
                                    </div>
                                </div>
                                <div class="module-form-row clear">
                                    <div class="form-item-v3 area-code-w fn-left form-valid-item">
                                        <i>区号（可选）</i>
                                        <input type="text" class="js-verify js-address-area-code">
                                        <div class="verify-error"></div>
                                    </div>
                                    <div class="form-item-v3 telephone-w fn-right form-valid-item">
                                        <i>固定电话（可选）</i>
                                        <input type="text" class="js-verify js-address-telephone">
                                        <div class="verify-error"></div>
                                    </div>
                                </div>
                                <div class="module-form-row clear">
                                    <div class="form-item-v3 select-item province-wrapper">
                                        <select name="province_code" class="province select-province js-form-province js-verify">
                                            <option value="0">请选择省份</option>  <option value="110000">北京市</option>
                                            <option value="440000">广东省</option>  <option value="310000">上海市</option>
                                            <option value="320000">江苏省</option>  <option value="330000">浙江省</option>
                                            <option value="370000">山东省</option>  <option value="410000">河南省</option>
                                            <option value="510000">四川省</option>  <option value="130000">河北省</option>
                                            <option value="420000">湖北省</option>  <option value="340000">安徽省</option>
                                            <option value="350000">福建省</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="module-form-row clear">
                                    <div class="form-item-v3 select-item city-wrapper fn-left form-focus-item">
                                        <select class="city select-city js-form-city js-verify">
                                            <option value="0">请选择城市</option>
                                        </select>
                                    </div>
                                    <div class="form-item-v3 select-item district-wrapper fn-right form-focus-item">
                                        <select class="city select-city js-form-city js-verify">
                                            <option value="0">请选择区县</option>
                                            <option value="0">请选择区县</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="module-form-row">
                                    <div class="form-item-v3">
                                        <i>详细地址，如街道名称，楼层，门牌号码等</i>
                                        <input type="text" class="js-verify">
                                        <div class="verify-error"></div>
                                    </div>
                                </div>
                                <div class="module-form-row clear">
                                    <input type="checkbox" name="default" class="hide" value="1" data-id="1">
                                    <span class="blue-checkbox" data-checkbox-name="default"></span>设为默认
                                </div>
                                <div class="dialog-blue-btn big-main-btn disabled-btn js-verify-address"><a>保存</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="module-dialog-layer" style="display: block;"></div>
<div class="module-dialog clear module-dialog-address module-dialog-show" >
    <div class="dialog-panel">
        <div class="topbar">
            <div class="dialog-tit clear">
            </div>
        </div>
        <div class="dialog-con js-dialog-container" id="saveOrUpdate" hidden>
            <form action="/address/addaddress" method="post" id="addaddress">
            <div class="animate-layer">
                <div class="dialog-inner js-address-add">
                    <div class="save-address-box">
                        <div class="address-form">
                            <input name="userId" hidden value="${userId}">
                            <div class="module-form-row">
                                <div class="form-item-v3">
                                    <i></i>
                                    <input type="text" class="js-verify" placeholder="收货人姓名" name="name">
                                    <div class="verify-error"></div>
                                </div>
                            </div>
                            <div class="module-form-row">
                                <div class="form-item-v3">
                                    <input type="text" class="js-verify" name="telephone" placeholder="手机号">
                                    <div class="verify-error"></div>
                                </div>
                            </div>
                            <div class="module-form-row clear">
                                <div class="form-item-v3 select-item province-wrapper">
                                    <select  class="province select-province js-form-province js-verify">
                                        <option value="0">请选择省份</option>
                                        <option value="110000">北京市</option>
                                        <option value="440000">广东省</option>
                                        <option value="310000">上海市</option>
                                        <option value="320000">江苏省</option>
                                        <option value="330000">浙江省</option>
                                        <option value="370000">山东省</option>
                                        <option value="410000">河南省</option>
                                        <option value="510000">四川省</option>
                                        <option value="130000">河北省</option>
                                        <option value="420000">湖北省</option>
                                        <option value="340000">安徽省</option>
                                        <option value="350000">福建省</option>
                                    </select>
                                </div>
                            </div>
                            <div class="module-form-row">
                                <div class="form-item-v3">

                                    <input type="text" class="js-verify" name="address" placeholder="详细地址，如街道名称，楼层，门牌号码等">
                                    <div class="verify-error"></div>
                                </div>
                            </div>
                            <div class="module-form-row fn-clear">
                                <input type="checkbox" name="default" class="hide" value="1" data-id="1">
                                <span class="blue-checkbox" data-checkbox-name="default"></span>设为默认
                            </div>
                            <div class="dialog-blue-btn big-main-btn  js-verify-address">
                                <button type="submit">保存</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </form>
        </div>



    </div>
</div>
</body>
<script src="${pageContext.request.contextPath}/layuiadmin/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/layuiadmin/layui/lay/modules/layer.js"></script>
<script type="text/javascript">
    var users=  JSON.parse(window.localStorage.getItem('users'))
    document.getElementById("username").innerHTML=users.username;
    //document.getElementById("shopcar").setAttribute("href","/web/cart?uid="+users.id)
    document.getElementById("address").setAttribute("href","/web/address?id="+users.id)
    document.getElementById("order").setAttribute("href","/order/ispay?id="+users.id)
    document.getElementById("shopcar").setAttribute("href","/web/cart?uid="+users.id)
    document.getElementById("address1").setAttribute("href","/web/address?id="+users.id)
    document.getElementById("order1").setAttribute("href","/order/ispay?id="+users.id)

        function openAdd() {
            alert("==========================")
            layer.open({
                type: 1,

               // content:   ['${pageContext.request.contextPath}/web/addresspop', 'no'],
                content:layui.jquery("#saveOrUpdate"),
                scrollbar: false,
                area:'auto',
                success: function (index) {

                }
            });
        }

    function exit(){

        localStorage.setItem("users",null);
        window.location.href="/to/userslogin"
    }




</script>
</html>
