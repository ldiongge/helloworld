<%--
  Created by IntelliJ IDEA.
  User: lidongge
  Date: 2021/4/9
  Time: 14:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="css/address-pop.css"/>
</head>
<body>
<div id="pop">
    <div class="module-dialog-layer" style="display: block;"></div>
    <div class="module-dialog clear module-dialog-address module-dialog-show">
        <div class="dialog-panel">
            <div class="topbar">
                <div class="dialog-tit clear">
                    <h4 class="js-dialog-title">管理收货地址</h4>
                </div>
                <span class="dialog-close">x</span>
            </div>
            <div class="dialog-con js-dialog-container">
                <div class="animate-layer">
                    <div class="dialog-inner js-address-add">
                        <div class="save-address-box">
                            <div class="address-form">
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
                                <div class="module-form-row fn-clear">
                                    <input type="checkbox" class="hide">
                                    <span class="blue-checkbox"></span>设为默认
                                </div>
                                <div class="dialog-blue-btn big-main-btn disabled-btn js-verify-address">
                                    <a>保存</a>
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
</html>
