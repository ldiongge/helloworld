<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>中药交易 后台管理员</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/layuiadmin/style/admin.css" media="all">
</head>
<body>

<div class="layui-fluid "  >
    <div class="layui-card" >
        <div class="layui-form layui-card-header layuiadmin-card-header-auto">
            <div class="layui-form-item layui-row layui-col-md-offset3"  >
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <div class="layui-input-block layui-col-md10" >
                            <input type="text" name="content" placeholder="输入登录名,姓名,邮箱,电话均可查询" autocomplete="off" class="layui-input">

                        </div>
                    </div>
                    <div class="layui-inline layui-col-sm-offset1">
                        <button class="layui-btn layuiadmin-btn-admin" lay-submit lay-filter="LAY-user-back-search">
                            <i class="layui-icon layui-icon-search layuiadmin-button-btn"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <div class="layui-card-body">

            <table id="LAY-user-back-manage" lay-filter="LAY-user-back-manage"></table>

            <div style="display: none;" id="menuToolBar">
                <button type="button" class="layui-btn layui-btn-sm layui-icon layui-icon-add-1" lay-event="add">添加</button>

            </div>



            <script type="text/html" id="buttonTpl">
                {{#  if(d.check == true){ }}
                <button class="layui-btn layui-btn-xs">已审核</button>
                {{#  } else { }}
                <button class="layui-btn layui-btn-primary layui-btn-xs">未审核</button>
                {{#  } }}
            </script>
            <script type="text/html" id="table-useradmin-admin">
                <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>编辑</a>
                {{#  if(d.role == '超级管理员'){ }}
                <a class="layui-btn layui-btn-disabled layui-btn-xs"><i class="layui-icon layui-icon-delete"></i>删除</a>
                {{#  } else { }}
                <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i class="layui-icon layui-icon-delete"></i>删除</a>
                {{#  } }}
            </script>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath }/layuiadmin/layui/layui.js"></script>
<script>
    layui.config({
        base: '${pageContext.request.contextPath }/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'useradmin', 'table'], function(){
        var $ = layui.$
            ,form = layui.form
            ,table = layui.table;

        //监听搜索
        form.on('submit(LAY-user-back-search)', function(data){
            var field = data.field;

            //执行重载
            table.reload('LAY-user-back-manage', {
                where: field
            });
        });


    });
</script>
</body>
</html>

