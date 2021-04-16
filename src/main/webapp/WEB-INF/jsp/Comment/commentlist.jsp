<%--
  Created by IntelliJ IDEA.
  User: lidongge
  Date: 2021/4/12
  Time: 14:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>layuiAdmin 内容系统 - 评论管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/layuiadmin/style/admin.css" media="all">
</head>
<body>

<div class="layui-fluid">
    <div class="layui-card">
        <div class="layui-form layui-card-header layuiadmin-card-header-auto">
            <div class="layui-form-item layui-row layui-col-md-offset3"  >
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <div class="layui-input-block layui-col-md10" >
                            <input type="text" name="content" placeholder="输入用户名,内容均可查询" autocomplete="off" class="layui-input">

                        </div>
                    </div>
                    <div class="layui-inline layui-col-sm-offset1">
                        <button class="layui-btn layuiadmin-btn-admin" lay-submit lay-filter="LAY-app-contcomm-search">
                            <i class="layui-icon layui-icon-search layuiadmin-button-btn"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-card-body">
            <table id="LAY-app-content-comm" lay-filter="LAY-app-content-comm"></table>
            <script type="text/html" id="table-content-com">
                <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i class="layui-icon layui-icon-delete"></i>删除</a>
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
    }).use(['index', 'contlist', 'table'], function(){
        var $ = layui.$
            ,form = layui.form
            ,table = layui.table;


        //监听搜索
        form.on('submit(LAY-app-contcomm-search)', function(data){
            var field = data.field;

            //执行重载
            table.reload('LAY-app-content-comm', {
                where: field
            });
        });

        //点击事件
        var active = {
            batchdel: function(){
                var checkStatus = table.checkStatus('LAY-app-content-comm')
                    ,checkData = checkStatus.data; //得到选中的数据

                if(checkData.length === 0){
                    return layer.msg('请选择数据');
                }

                layer.confirm('确定删除吗？', function(index) {

                    //执行 Ajax 后重载
                    /*
                    admin.req({
                      url: 'xxx'
                      //,……
                    });
                    */
                    table.reload('LAY-app-content-comm');
                    layer.msg('已删除');
                });
            }
        }

        $('.layui-btn.layuiadmin-btn-comm').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
    });
</script>
</body>
</html>

