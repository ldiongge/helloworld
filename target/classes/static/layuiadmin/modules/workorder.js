/**

 @Name：layuiAdmin 工单系统
 @Author：star1029
 @Site：http://www.layui.com/admin/
 @License：GPL-2
    
 */


layui.define(['table', 'form', 'element'], function(exports){
  var $ = layui.$
  ,table = layui.table
  ,form = layui.form
  ,element = layui.element;

  table.render({
    elem: '#LAY-app-system-order'
    ,url: '/order/orderlist' //模拟接口
    ,cols: [[
      {type: 'numbers', fixed: 'left'}
      ,{field: 'id', width: 100, title: '订单号', sort: true}
      ,{field: 'uid', width: 100, title: '用户id'}
      ,{field: 'gooddname', width: 100, title: '商品名称'}
      ,{field: 'price', width: 100, title: '单价'}
      ,{field: 'num', width: 100, title: '数量'}
      ,{field: 'sum', width: 100, title: '订单总额', width: 100}
      ,{field: 'ispay', title: '支付状态', width: 100,templet: function (d) {
          return d.ispay == 1 ? '<font color=blue>已支付</font>' : '<font color=red>未支付</font>';
        }}
      ,{field: 'number', width: 100, title: '快递单号',templet: function (d) {
          return d.number == null ? '<font color=red>未发货</font>': d.number;
        }}
      ,{field: 'createtime', width: 100, title: '创建时间'}

      ,{title: '操作', align: 'center', fixed: 'right', toolbar: '#table-system-order'}
    ]]
    ,page: true
    ,limit: 10
    ,limits: [10, 15, 20, 25, 30]
    ,text: '对不起，加载出现异常！'
    ,done: function(){
      element.render('progress')
    }
  });

  //监听工具条
  table.on('tool(LAY-app-system-order)', function(obj){
    var data = obj.data;
    if(obj.event === 'edit'){
      var tr = $(obj.tr);
      layer.open({
        type: 2
        ,title: '编辑工单'
        ,content: '/to/toorderform?id='+data.id
        ,area: ['450px', '450px']
        ,btn: ['确定', '取消']
        ,yes: function(index, layero){
          var iframeWindow = window['layui-layer-iframe'+ index]
          ,submitID = 'LAY-app-order-submit'
          ,submit = layero.find('iframe').contents().find('#'+ submitID);

          //监听提交
          iframeWindow.layui.form.on('submit('+ submitID +')', function(data){
            var field = data.field; //获取提交的字段
            //提交 Ajax 成功后，静态更新表格中的数据
            $.ajax({
              type: "POST",
              dataType: "json",
              url: "/order/editform",
              data: field,
              success: function (data) {

                layer.msg(修改成功);
              }
            });
            table.reload('LAY-app-system-order'); //数据刷新
            layer.close(index); //关闭弹层
          });  
          
          submit.trigger('click');
        }
        ,success: function(layero, index){

        }
      });
    }else if (obj.event === 'del') {
        layer.confirm('确定删除此角色？', function (index) {
          $.ajax({
            type: "POST",
            dataType: "json",
            url: "/order/del",
            data: {"id": data.id},
            success: function (data) {
              if (data.code == 0) {
                obj.del();
                table.reload("LAY-app-system-order"

                );
              }
              layer.msg(data.msg);
            }
          });
          obj.del();
          layer.close(index);
        });
      }

  });

  exports('workorder', {})
});