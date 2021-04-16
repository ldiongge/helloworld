<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>layuiAdmin 控制台主页一</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <link rel="stylesheet" href="../layuiadmin/layui/css/layui.css" media="all">
  <link rel="stylesheet" href="../layuiadmin/style/admin.css" media="all">
</head>
<body>

<table class="layui-table">
  <colgroup>
    <col width="150">
    <col width="200">
    <col>
  </colgroup>
  <thead>

  </thead>
  <tbody>

  <tr>
    <th>系统版本</th>
    <td>2021.4.12</td></tr>
  <tr>
    <th>服务器地址</th>
    <td>本机服务:http://localhost:8084/</td></tr>
  <tr>
    <th>操作系统</th>
    <td>WINDOWS10</td></tr>
  <tr>
    <th>运行环境</th>
    <td>Apache Tomcat/9.0.44 JDK1.8.0_181</td></tr>

  <tr>
    <th>MYSQL版本</th>
    <td>5.6</td></tr>

  <tr>
    <th>上传附件限制</th>
    <td>100M</td></tr>

  </tbody>
</table>

  <script src="../layuiadmin/layui/layui.js?t=1"></script>  
  <script>
  layui.config({
    base: '../layuiadmin/' //静态资源所在路径
  }).extend({
    index: 'lib/index' //主入口模块
  }).use(['index', 'console']);
  </script>
</body>
</html>

