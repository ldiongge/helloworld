<%--
  Created by IntelliJ IDEA.
  User: lidongge
  Date: 2021/4/11
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web/css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web/css/payment.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layuiadmin/layui/css/modules/layer/default/layer.css"/>

</head>
<body>
<div id="main">
    <div class="content page-order-payment">
        <div class="gray-box clear">
            <div class="title">
                <h2>支付订单</h2>
            </div>
            <div class="box-inner order-info">
                <h3>提交订单成功</h3>
                <p class="payment-detail">请在 <span>24 小时内</span>完成支付，超时订单将自动取消。</p>
                <p class="payment-detail">我们将在您完成支付后的 72 小时内发货</p>
            </div>
            <div class="box-inner payment-checkout-panel clear">
	    	            <span class="jianguo-blue-main-btn big-main-btn js-payment-order">
	    	                <a onclick="pay()">现在支付</a>
	    	            </span>
                <span class="prices"> 应付金额：   <em><span>¥ </span>${ordersum}</em>   </span>
            </div>
        </div>
<div id="sqm" hidden>
    <img width="236" height="354" src="${pageContext.request.contextPath}/web/img/sqm.PNG">
</div>
    </div>
</div>
</body>
<script src="${pageContext.request.contextPath}/layuiadmin/layui/layui.js"></script>

<script src="${pageContext.request.contextPath}/layuiadmin/layui/lay/modules/layer.js"></script>
<script type="text/javascript" src="../web/js/jquery-3.6.0.min.js"></script>

<script>
    var users=  JSON.parse(window.localStorage.getItem('users'))
 var uid=users.id
    function pay(){

        layer.open({
            type: 1,
            content:layui.jquery("#sqm"),
            scrollbar: false,
            area:['236','354'],
            end: function (index) {
                alert("支付${ordersum}成功")
                window.location.href="/order/ispay?id="+uid;
            }
        });

    }

</script>
</html>
