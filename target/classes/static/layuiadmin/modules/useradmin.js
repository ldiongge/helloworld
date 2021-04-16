/**

 @Name：layuiAdmin 用户管理 管理员管理 角色管理
 @Author：star1029
 @Site：http://www.layui.com/admin/
 @License：LPPL

 */


layui.define(['table', 'form'], function (exports) {
    var $ = layui.$
        , table = layui.table
        , form = layui.form;

    //用户管理
    table.render({
        elem: '#LAY-user-manage'
        , url:  '/users/userlist' //模拟接口
        , cols: [[
            {type: 'checkbox', fixed: 'left'}
            , {field: 'id', width: 100, title: 'ID', sort: true}
            , {field: 'username', title: '用户名', minWidth: 100}
            , {field: 'phone', title: '手机'}
            , {field: 'sex', title: '性别'}
            , {field: 'email', title: '邮箱'}
            , {field: 'jointime', title: '加入时间', sort: true}
            , {title: '操作', width: 150, align: 'center', fixed: 'right', toolbar: '#table-useradmin-webuser'}
        ]]
        ,toolbar:'#menuToolBar'
        , page: true
        , text: '对不起，加载出现异常！'
    });

    //监听工具条
    table.on('tool(LAY-user-manage)', function (obj) {
        var data = obj.data;
        if (obj.event === 'del') {
            layer.confirm('真的删除此行数据么', function (index) {
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        url: "/users/del",
                        data: {"id": data.id},
                        success: function (data) {
                            if (data.code == 0) {
                                obj.del();
                                table.reload('LAY-user-manage');
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

    table.on('toolbar(LAY-user-manage)', function (obj) {
        var checkStatus = table.checkStatus(obj.config.id)
            , data = checkStatus.data; //获取选中的数据
        switch (obj.event) {
            case 'add':
                layer.open({
                    type: 2
                    ,title: '添加用户'
                    ,content: '/to/touserform'
                    ,maxmin: true
                    ,area: ['420px', '420px']
                    ,btn: ['确定', '取消']
                    ,yes: function(index, layero){
                        var iframeWindow = window['layui-layer-iframe'+ index]
                            ,submitID = 'LAY-user-front-submit'
                            ,submit = layero.find('iframe').contents().find('#'+ submitID);
                        //监听提交
                        iframeWindow.layui.form.on('submit('+ submitID +')', function(data){
                            var field = data.field; //获取提交的字段
                            //提交 Ajax 成功后，静态更新表格中的数据
                            //$.ajax({});
                            $.ajax({
                                type: "POST",
                                dataType: "json",
                                url: "/users/add",
                                data: field,
                                success: function (data) {

                                    layer.msg(data.msg);
                                }
                            });
                            //  table.reload('LAY-user-back-submit'); //数据刷新
                            table.reload('LAY-user-manage'); //数据刷新
                            layer.close(index); //关闭弹层
                        });
                        submit.trigger('click');
                    } , success: function (layero, index) {

                    }
                });

                layer.msg('添加');

        }
    });



    //管理员管理
    table.render({
        elem: '#LAY-user-back-manage'
        , url: '/admin/Adminlist' //模拟接口
        , cols: [[
          //  {type: 'checkbox', fixed: 'left'}
             {field: 'id', width: 80, title: 'ID', sort: true}
            , {field: 'username', title: '登录名'}
            , {field: 'nickname', title: '姓名'}
            , {field: 'phone', title: '手机'}
            , {field: 'email', title: '邮箱'}
            , {field: 'rolename', title: '角色'}
            , {field: 'createtime', title: '加入时间', sort: true}
            , {field: 'check', title: '审核状态', templet: '#buttonTpl', minWidth: 80, align: 'center'}
            , {title: '操作', width: 150, align: 'center', fixed: 'right', toolbar: '#table-useradmin-admin'}
        ]]
        , toolbar: '#menuToolBar'
        , page: true
        , text: '对不起，加载出现异常！'
    });

    //监听工具条
    table.on('tool(LAY-user-back-manage)', function (obj) {
        var data = obj.data;
        alert(data.id);
        if (obj.event === 'del') {
            layer.confirm('真的删除此行数据么', function (index) {
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        url: "/admin/delAll",
                        data: {"isStr": data.id},
                        success: function (data) {
                            if (data.code == 0) {
                                obj.del();
                                table.reload('hah'

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
                , title: '编辑管理员'
                , content: '/to/toadminform?id='+data.id
                , area: ['420px', '420px']
                , btn: ['确定', '取消']
                , yes: function (index, layero) {
                    var iframeWindow = window['layui-layer-iframe' + index]
                        , submitID = 'LAY-user-back-submit'
                        , submit = layero.find('iframe').contents().find('#' + submitID);

                    //监听提交
                    iframeWindow.layui.form.on('submit(' + submitID + ')', function (data) {
                        var field = data.field; //获取提交的字段

                        //提交 Ajax 成功后，静态更新表格中的数据
                        $.ajax({
                            type: "POST",
                            dataType: "json",
                            url: "/admin/add",
                            data: field,
                            success: function (data) {
                                layui.msg("修改成功")

                            }
                        });
                          table.reload('LAY-user-back-manage'); //数据刷新

                        layer.close(index); //关闭弹层
                    });

                    submit.trigger('click');
                }
                , success: function (layero, index) {

                }
            })
        }
    });











    table.on('toolbar(LAY-user-back-manage)', function (obj) {
        var checkStatus = table.checkStatus(obj.config.id)
            , data = checkStatus.data; //获取选中的数据
        switch (obj.event) {
            case 'add':
                layer.open({
                    type: 2
                    ,title: '添加管理员'
                    ,content: '/to/toadminform'
                    ,maxmin: true
                    ,area: ['420px', '420px']
                    ,btn: ['确定', '取消']
                    ,yes: function(index, layero){
                        var iframeWindow = window['layui-layer-iframe'+ index]
                            ,submitID = 'LAY-user-back-submit'
                            ,submit = layero.find('iframe').contents().find('#'+ submitID);

                        //监听提交
                        iframeWindow.layui.form.on('submit('+ submitID +')', function(data){
                            var field = data.field; //获取提交的字段

                            //提交 Ajax 成功后，静态更新表格中的数据
                            //$.ajax({});
                            $.ajax({
                                type: "POST",
                                dataType: "json",
                                url: "/admin/add",
                                data: field,
                                success: function (data) {

                                    layer.msg(data.msg);
                                }
                            });
                          //  table.reload('LAY-user-back-submit'); //数据刷新
                            table.reload('LAY-user-back-manage'); //数据刷新
                            layer.close(index); //关闭弹层
                        });

                        submit.trigger('click');
                    }
                });

                layer.msg('添加');
                break;

        }
    });

    //角色管理
    table.render({
        elem: '#LAY-user-back-role'
        , url:  '/admintype/torolelist' //模拟接口
        , cols: [[
            {type: 'checkbox', fixed: 'left'}
            , {field: 'id', width: 80, title: 'ID', sort: true}
            , {field: 'typename', title: '角色名'}
            , {field: 'descr', title: '具体描述'}
            , {title: '操作', width: 150, align: 'center', fixed: 'right', toolbar: '#table-useradmin-admin'}
        ]]
        ,page:false
        , text: '对不起，加载出现异常！'
    });

    //监听工具条
    table.on('tool(LAY-user-back-role)', function (obj) {
        var data = obj.data;
        if (obj.event === 'del') {
            layer.confirm('确定删除此角色？', function (index) {
                $.ajax({
                    type: "POST",
                    dataType: "json",
                    url: "/admintype/del",
                    data: {"id": data.id},
                    success: function (data) {
                        if (data.code == 0) {
                            obj.del();
                            table.reload("LAY-user-back-role"

                            );
                        }
                        layer.msg(data.msg);
                    }
                });
                obj.del();
                layer.close(index);
            });
        } else if (obj.event === 'edit') {
            var tr = $(obj.tr);

            layer.open({
                type: 2
                , title: '编辑角色'
                , content: '/to/torolefrom?id='+data.id
                , area: ['300px', '380px']
                , btn: ['确定', '取消']
                , yes: function (index, layero) {
                    var iframeWindow = window['layui-layer-iframe' + index]
                        , submit = layero.find('iframe').contents().find("#LAY-user-role-submit");

                    //监听提交
                    iframeWindow.layui.form.on('submit(LAY-user-role-submit)', function (data) {
                        var field = data.field; //获取提交的字段

                        //提交 Ajax 成功后，静态更新表格中的数据
                        $.ajax({
                            type: "POST",
                            dataType: "json",
                            url: "/admintype/add",
                            data: field,
                            success: function (data) {
                                layui.msg(data.msg)

                            }
                        });
                        table.reload('LAY-user-back-role'); //数据刷新
                        layer.close(index); //关闭弹层
                    });

                    submit.trigger('click');
                }
                , success: function (layero, index) {

                }
            })
        }
    });

    exports('useradmin', {})
});