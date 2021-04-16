<%--
  Created by IntelliJ IDEA.
  Car: YQF
  Date: 2019/10/14
  Time: 18:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>商品管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <%--<link rel="icon" href="favicon.ico">--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/layuiadmin/style/admin.css" media="all">
</head>
<body class="childrenBody">

<!-- 搜索条件开始 -->
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">


<!-- 数据表格开始 -->
<table class="layui-hide" id="carTable" lay-filter="carTable"></table>
<div id="carToolBar" style="display: none;">
    <button type="button" class="layui-btn layui-btn-sm layui-btn-radius" lay-event="add">增加</button>
</div>
<div id="carBar" style="display: none;">
    <a class="layui-btn layui-btn-xs layui-btn-radius" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs layui-btn-radius" lay-event="del">删除</a>
    <a class="layui-btn layui-btn-warm layui-btn-xs layui-btn-radius" lay-event="viewImage">查看大图</a>
</div>

<!-- 添加和修改的弹出层-->
<div style="display: none;padding: 20px" id="saveOrUpdateDiv">
    <form class="layui-form layui-row layui-col-space10" lay-filter="dataFrm" id="dataFrm">
        <div class="layui-col-md12 layui-col-xs12">
            <div class="layui-row layui-col-space10">
                <div class="layui-col-md9 layui-col-xs7">

                    <div class="layui-form-item magt3">
                        <label class="layui-form-label">中药名称:</label>
                        <div class="layui-input-block" style="padding: 5px">
                            <input type="text" name="zyname" id="zyname" autocomplete="off" class="layui-input"
                                   lay-verify="required"
                                   placeholder="请输入中药" style="height: 30px;border-radius: 10px">
                        </div>
                    </div>
                    <div hidden>
                        <input type="text" name="id" lay-verify=""   class="layui-input " >
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">中药类型:</label>
                        <div class="layui-input-block" style="padding: 5px">
                            <input type="text" name="typename" autocomplete="off" class="layui-input"
                                   placeholder="请输入中药类型" style="height: 30px;border-radius: 10px">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">单件价格:</label>
                        <div class="layui-input-block" style="padding: 5px">
                            <input type="text" name="price" autocomplete="off" class="layui-input"
                                   placeholder="请输入价格" style="height: 30px;border-radius: 10px">
                        </div>
                    </div>
                </div>
                <div class="layui-col-md3 layui-col-xs5">
                    <div class="layui-upload-list thumbBox mag0 magt3" id="imageDiv">
                        <%--显示要上传的图片--%>
                        <img class="layui-upload-img thumbImg" style="width: 100px;right: 100px" id="showimage">
                        <%--保存当前显示图片的地址--%>
                        <input type="hidden" name="image" id="image">
                    </div>
                </div>
            </div>
            <div class="layui-form-item magb0">
                <label class="layui-form-label">描述:</label>
                <div class="layui-input-block" style="padding: 5px">
                    <input type="text" name="description" autocomplete="off" class="layui-input"
                           placeholder="请输入描述" style="height: 30px;border-radius: 10px">
                </div>
            </div>
            <div class="layui-form-item magb0">
                <div class="layui-inline">
                    <label class="layui-form-label">库存:</label>
                    <div class="layui-input-block" style="padding: 5px">
                        <input type="text" name="stock" class="layui-input" lay-verify="required|number"
                               placeholder="请输入库存数量" style="height: 30px;border-radius: 10px">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">产地:</label>
                    <div class="layui-input-block" style="padding: 5px">
                        <input type="text" name="address" class="layui-input" lay-verify="required"
                               placeholder="请输入中药产地" style="height: 30px;border-radius: 10px">
                    </div>
                </div>
            </div>
            <div class="layui-form-item magb0">
                <div class="layui-inline">
                    <label class="layui-form-label">计量单位:</label>
                    <div class="layui-input-block" style="padding: 5px">
                        <input type="text" name="spec" class="layui-input" lay-verify="required"
                               placeholder="请输入计量单位" style="height: 30px;border-radius: 10px">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">是否上架:</label>
                    <div class="layui-input-inline">
                        <input type="radio" name="valid" value="1" title="上架">
                        <input type="radio" name="valid" value="0" checked="checked" title="不上架">
                    </div>
                </div>
            </div>
            <div class="layui-form-item magb0">
                <div class="layui-input-block" style="text-align: center;padding-right: 120px">
                    <button type="button"
                            class="layui-btn layui-btn-normal layui-btn-md layui-icon layui-icon-release layui-btn-radius"
                            lay-filter="doSubmit" lay-submit="">提交
                    </button>
                    <button type="reset"
                            class="layui-btn layui-btn-warm layui-btn-md layui-icon layui-icon-refresh layui-btn-radius">
                        重置
                    </button>
                </div>
            </div>
        </div>
    </form>
</div>

<%--查看大图弹出的层开始--%>
<div id="viewCarImageDiv" style="display: none;text-align: center">
    <img alt="商品图片" width="700px" height="450px" id="view_image">
</div>

<script src="${pageContext.request.contextPath}/layuiadmin/layui/layui.js"></script>
<script type="text/javascript">
    var tableIns;
    layui.use(['jquery', 'layer', 'form', 'table', 'upload'], function () {
        var $ = layui.jquery;
        var layer = layui.layer;
        var form = layui.form;
        var table = layui.table;
        var dtree = layui.dtree;
        var upload = layui.upload;
        //渲染数据表格
        tableIns = table.render({
            elem: '#carTable'   //渲染的目标对象
            , url: '/goods/goodslist' //数据接口
            , title: '商品数据表'//数据导出来的标题
            , toolbar: "#carToolBar"   //表格的工具条
            , page: true  //是否启用分页
            , cols: [[   //列表数据
                {type: 'checkbox', fixed: 'left'}
                , {field: 'id', title: 'id', align: 'center'}
                , {field: 'zyname', title: '中药名称', align: 'center' ,width: 90}
                , {field: 'typename', title: '中药类型', align: 'center', width: 90}
                , {field: 'price', title: '单件价格', align: 'center', width: 90}
                , {field: 'spec', title: '单位', align: 'center', width: 90}
                , {field: 'stock', title: '库存', align: 'center', width: 60}
                , {
                    field: 'valid', title: '上架状态', align: 'center', width: 90,templet: function (d) {
                        return d.valid == '1' ? '<font color=blue>已上架</font>' : '<font color=red>未上架</font>';
                    }
                }
                , {field: 'description', title: '产品描述', align: 'center', width: '90'}
                , {
                    field: 'image', title: '缩略图', align: 'center',  width: 90, emplet: function (d) {
                        return "<img width=40 height=40 src=${pageContext.request.contextPath }/file/downloadShowFile?path=" + d.image + "/>";
                    }
                }
                , {field: 'createtime', title: '录入时间', align: 'center'  ,width: 90}
                , {fixed: 'right',  title: '操作', toolbar: '#carBar', align: 'center', width: 300}
            ]],
            done: function (data, curr, count) {
                //不是第一页时，如果当前返回的数据为0那么就返回上一页
                if (data.data.length == 0 && curr != 1) {
                    tableIns.reload({
                        page: {
                            curr: curr - 1
                        }
                    })
                }
            }
        });

        //模糊查询
        $("#doSearch").click(function () {
            var params = $("#searchFrm").serialize();
            alert(params);
            tableIns.reload({
                url: "/goods/goodsliat?params="+params,
                page: {curr: 1}
            })
        });

        form.on('submit(LAY-user-front-search)', function(data){
            var field = data.field;

            //执行重载
            table.reload('carTable', {
                where: field
            });
        });
        //监听头部工具栏事件
        table.on("toolbar(carTable)", function (obj) {
            switch (obj.event) {
                case 'add':
                    openAddCar();
                    break;
                case 'deleteBatch':
                    deleteBatch();
                    break;
            }
        });

        //监听行工具事件
        table.on('tool(carTable)', function (obj) {
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            if (layEvent === 'del') { //删除
                layer.confirm('真的删除么？', function (index) {
                    //向服务端发送删除指令
                    $.post("${pageContext.request.contextPath }/goods/delete", {id: data.id}, function (res) {
                        layer.msg(res.msg);
                        //刷新数据表格
                        tableIns.reload();
                    })
                });
            } else if (layEvent === 'edit') { //编辑
                //编辑，打开修改界面
                openUpdateCar(data);
            }else if (layEvent === 'viewImage'){ //查看大图
                showCarImage(data);
            }
        });

        var url;
        var mainIndex;

        //打开添加页面
        function openAddCar() {
            mainIndex = layer.open({
                type: 1,
                title: '添加商品',
                content: $("#saveOrUpdateDiv"),
                area: ['700px', '480px'],
                success: function (index) {
                    //清空表单数据
                    $("#dataFrm")[0].reset();
                    //设置默认图片
                    $("#showimage").attr("src", "${pageContext.request.contextPath }/files/def.jpg");
                    $("#image").val("images/defaultcarimage.jpg");
                    url = "${pageContext.request.contextPath }/goods/addGoods";
                    $("#carnumber").removeAttr("readonly","readonly");
                }
            });
        }

        //打开修改页面
        function openUpdateCar(data) {
            mainIndex = layer.open({
                type: 1,
                title: '修改商品',
                content: $("#saveOrUpdateDiv"),
                area: ['700px', '480px'],
                success: function (index) {
                    form.val("dataFrm", data);
                    $("#showimage").attr("src", "${pageContext.request.contextPath }/files/"+data.image);
                    url = "${pageContext.request.contextPath }/goods/addGoods";
                    $("#carnumber").attr("readonly","readonly");
                }
            });
        }

        //保存
        form.on("submit(doSubmit)", function (obj) {
            //序列化表单数据
            var params = $("#dataFrm").serialize();
            $.post(url, params, function (obj) {
                layer.msg(obj.msg);
                //关闭弹出层
                layer.close(mainIndex)
                //刷新数据 表格
                tableIns.reload();
            })
        });

        //批量删除
        function deleteBatch() {
            //得到选中的数据行
            var checkStatus = table.checkStatus('carTable');
            var data = checkStatus.data;
            var params = "";
            $.each(data, function (i, item) {
                if (i == 0) {
                    params += "ids=" + item.carnumber;
                } else {
                    params += "&ids=" + item.carnumber;
                }
            });
            layer.confirm('？', function (index) {
                //向服务端发送删除指令
                $.post("${pageContext.request.contextPath }/car/deleteBatchCar.action", params, function (res) {
                    layer.msg(res.msg);
                    //刷新数据表格
                    tableIns.reload();
                })
            });
        }

        //上传缩略图
        upload.render({
            elem: '#imageDiv',
            url: '${pageContext.request.contextPath }/file/uploadFile',
            method: "post",  //此处是为了演示之用，实际使用中请将此删除，默认用post方式提交
            acceptMime: 'images/*',
            field: "mf",
            done: function (res, index, upload) {
                $('#showimage').attr('src', "${pageContext.request.contextPath }/files/" +res.data.src);
                $('#image').val(res.data.src);
                $('#imageDiv').css("background", "#fff");
            }
        });

        //查看大图
        function showCarImage(data) {
            mainIndex = layer.open({
                type: 1,
                content: $("#viewCarImageDiv"),
                area: ['750px', '500px'],
                success: function (index) {
                    $("#view_image").attr("src","${pageContext.request.contextPath }/files/"+data.image);
                }
            });
        }

    });

</script>
</body>
</html>

