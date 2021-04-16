<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>





<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>登入 - 中药交易网</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/layuiadmin/layui/css/layui.css" media="all">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/layuiadmin/style/admin.css" media="all">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/layuiadmin/style/login.css" media="all">
</head>
<body>

  <div class="layadmin-user-login layadmin-user-display-show" id="LAY-user-login" style="display: none;">

    <div class="layadmin-user-login-main">
      <div class="layadmin-user-login-box layadmin-user-login-header">
        <h2>中药交易网</h2>
        <p></p>
      </div>
      <div class="layadmin-user-login-box layadmin-user-login-body layui-form">
        <div class="layui-form-item">
          <label class="layadmin-user-login-icon layui-icon layui-icon-username" for="LAY-user-login-username"></label>
          <input type="text" name="username" id="LAY-user-login-username" lay-verify="required" placeholder="用户名" class="layui-input">
        </div>
        <div class="layui-form-item">
          <label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-password"></label>
          <input type="password" name="password" id="LAY-user-login-password" lay-verify="required" placeholder="密码" class="layui-input">
        </div>
        <div class="layui-form-item">


            <div id="slider"></div>

        </div>
        <div class="layui-form-item" style="margin-bottom: 20px;">
          <input type="checkbox" name="remember" lay-skin="primary" title="记住密码">
          <a href="forget.html" class="layadmin-user-jump-change layadmin-link" style="margin-top: 7px;">忘记密码？</a>
        </div>
        <div class="layui-form-item">
          <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="LAY-user-login-submit">登 入</button>
        </div>
        <div class="layui-trans layui-form-item layadmin-user-login-other">
          <label>社交账号登入</label>
          <a href="javascript:;"><i class="layui-icon layui-icon-login-qq"></i></a>
          <a href="javascript:;"><i class="layui-icon layui-icon-login-wechat"></i></a>
          <a href="javascript:;"><i class="layui-icon layui-icon-login-weibo"></i></a>
          
          <a href="${pageContext.request.contextPath }/to/Tousersreg" class="layadmin-user-jump-change layadmin-link">注册帐号</a>
        </div>
      </div>
    </div>
    
    <div class="layui-trans layadmin-user-login-footer">
      

    </div>

    
  </div>

 <script src="${pageContext.request.contextPath }/layuiadmin/layui/layui.js"></script>



  <script>

    // 解决登录页面可能会在iframe标签中显示的问题
    if(window.top !== window){
      window.top.location = window.location;
    }
 layui.config({
    base: '${pageContext.request.contextPath }/layuiadmin/' //静态资源所在路径
  }).extend({
    index: 'lib/index' //主入口模块
  }).use(['index', 'user','sliderVerify'], function(){
    var $ = layui.$
    ,setter = layui.setter
    ,admin = layui.admin
    ,form = layui.form
    ,router = layui.router()
    ,search = router.search
    ,sliderVerify=layui.sliderVerify;

   var slider = sliderVerify.render({
     elem: '#slider',
     onOk: function(){//当验证通过回调
       layer.msg("滑块验证通过");
     }
   })
   //监听提交
   form.on('submit(formDemo)', function(data) {
     if(slider.isOk()){//用于表单验证是否已经滑动成功
       layer.msg(JSON.stringify(data.field));
     }else{
       layer.msg("请先通过滑块验证");
     }
     return false;
   });

    form.render();

    //提交
    form.on('submit(LAY-user-login-submit)', function(obj){
    
      //请求登入接口
      admin.req({
      //  url: layui.setter.base + 'doAdmin/login' //实际使用请改成服务端真实接口
       url:  '${pageContext.request.contextPath }/users/login'
        ,data: obj.field
        ,done: function(res){


          var users=JSON.stringify(res.data);
          localStorage.setItem("users",users);
          
          //登入成功的提示与跳转
          if(res.data!=null){
            layer.msg('登入成功', {
              offset: '15px'
              ,icon: 1
              ,time: 1000
            }, function(){
              location.href = '${pageContext.request.contextPath }/to/index'; //后台主页
            });
          }else {
            layer.msg('登入失败', {
              offset: '15px'
              ,icon: 2
              ,time: 1000
            }, function(){

            });
          }

        }
      });
      
    });

 });
  </script>
</body>
</html>