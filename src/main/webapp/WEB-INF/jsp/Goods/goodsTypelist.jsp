<%--
  Created by IntelliJ IDEA.
  User: lidongge
  Date: 2021/4/2
  Time: 9:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>layuiAdmin 网站用户</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/style/admin.css" media="all">
</head>
<body>

<div class="layui-fluid">
    <div class="layui-card">
        <div style="display: none;" id="menuToolBar">
            <button type="button" class="layui-btn layui-btn-sm layui-icon layui-icon-add-1" lay-event="add">添加</button>

        </div>
        <div class="layui-card-body">


            <table id="LAY-goods-typelist" lay-filter="LAY-goods-typelist"></table>

            <script type="text/html" id="table-useradmin-webuser">
                <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>编辑</a>
                <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i class="layui-icon layui-icon-delete"></i>删除</a>
            </script>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/layuiadmin/layui/layui.js"></script>
<script>
    layui.config({
        base: '${pageContext.request.contextPath}/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'useradmin', 'table'], function(){
        var $ = layui.$
            ,form = layui.form
            ,table = layui.table;

        table.render({
            elem: '#LAY-goods-typelist'
            , url:  '/goodstype/typelist' //模拟接口
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'typeid', width: 100, title: 'ID', sort: true}
                , {field: 'typename', title: '中药类别', minWidth: 100}
                , {title: '操作', width: 150, align: 'center', fixed: 'right', toolbar: '#table-useradmin-webuser'}
            ]]
            ,toolbar:'#menuToolBar'
            , text: '对不起，加载出现异常！'
        });
    });

    table.on('tool(LAY-goods-typelist)', function (obj) {
        var data = obj.data;
        if (obj.event === 'del') {
            layer.confirm('真的删除此行数据么', function (index) {
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        url: "/goods/del",
                        data: {"id": data.id},
                        success: function (data) {
                            if (data.code == 0) {
                                obj.del();
                                table.reload('LAY-goods-typelist'

                                );
                            }
                            layer.msg(data.msg);
                        }
                    });
                }
            )
        } else if (obj.event === 'edit') {
            var tr = $(obj.tr);

            layer.open({
                type: 2
                , title: '编辑用户'
                , content: '/to/touserform?id='+data.id
                , area: ['500px', '450px']
                , btn: ['确定', '取消']
                , yes: function (index, layero) {
                    var iframeWindow = window['layui-layer-iframe' + index]
                        , submitID = 'LAY-user-front-submit'
                        , submit = layero.find('iframe').contents().find('#' + submitID);

                    //监听提交
                    iframeWindow.layui.form.on('submit(' + submitID + ')', function (data) {
                        var field = data.field; //获取提交的字段

                        //提交 Ajax 成功后，静态更新表格中的数据
                        $.ajax({
                            type: "POST",
                            dataType: "json",
                            url: "/users/add",
                            data: field,
                            success: function (data) {

                                layer.msg(修改成功);
                            }
                        });
                        table.reload('LAY-user-manage'); //数据刷新
                        layer.close(index); //关闭弹层
                    });

                    submit.trigger('click');
                }
                , success: function (layero, index) {

                }
            });
        }
    });

</script>
</body>
</html>
